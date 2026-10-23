# In-app messages on Roku — upgrade guide

This guide is for customers who render in-app messages (IAM) with their own UI and are upgrading to Braze Roku SDK 2.3.0 or later. Version 2.3.0 adds an optional default modal UI. It's off by default, so upgrading doesn't change how your IAMs are shown.

To keep your custom UI, go to [Appendix 2](#appendix-2--keeping-your-custom-ui). To switch to the default UI, follow the steps below.

---

## Upgrade steps

### 1. Replace the SDK files

This is the regular SDK upgrade: copy the files from the new release's `sdk_files/` into your channel. Make sure the three new `BrazeDefaultInAppMessage*` files come along too. If they're missing, the SDK skips the default UI, logs `BrazeDefaultInAppMessage component not found`, and nothing shows.

| File | Destination | |
| --- | --- | --- |
| `BrazeSDK.brs` | `source/BrazeSDK.brs` | replace |
| `BrazeTask.brs`, `BrazeTask.xml` | `components/` | replace |
| `BrazeDefaultInAppMessage.brs`, `BrazeDefaultInAppMessage.xml` | `components/` | new |
| `BrazeDefaultInAppMessageStyles.brs` | `components/` | new |

If you have the old sample `BrazeInAppMessage`, it isn't touched. You can delete it once you've moved to the default UI.

### 2. Turn on the default UI

In `main.brs`, add this line before `AddFields`:

```brightscript
config[config_fields.AUTOMATIC_IAM_DISPLAY] = true
screen.GetGlobalNode().AddFields({ brazeConfig: config })
```

### 3. Check `getBrazeInstance()` is called from the Scene

`getBrazeInstance()` must be called from the Scene component:

```brightscript
sub init()
    m.BrazeTask = CreateObject("roSGNode", "BrazeTask")
    m.Braze = getBrazeInstance(m.BrazeTask)
end sub
```

If you call it from a child Group or a Task, the SDK clears each message but can't attach the overlay, so the message is lost.

### 4. Remove your IAM handling

Delete your observer and its handler:

```brightscript
m.BrazeTask.observeField("BrazeInAppMessage", "onInAppMessageTriggered")
```

That means removing:

- creating and appending your IAM node
- `LogInAppMessageImpression` / `LogInAppMessageClick` / `LogInAppMessageButtonClick`
- `m.BrazeTask.BrazeInAppMessage = invalid`

If you skip this, messages can show twice and impressions and clicks get logged twice.

### 5. Move click handling to `brazeHandleInAppMessageClick`

The SDK doesn't open URIs. Put your deeplink logic in this Scene function:

```xml
<component name="MainScene" extends="Scene">
    <interface>
        <function name="brazeHandleInAppMessageClick" />
    </interface>
    ...
</component>
```

```brightscript
function brazeHandleInAppMessageClick(event as object) as boolean
    target = event.button                         ' invalid for body clicks
    if target = invalid then target = event.in_app_message
    if target.click_action = "URI" and target.uri <> invalid
        ' route to the right screen
        return true
    end if
    return false
end function
```

`event`:

```brightscript
{
    in_app_message: <message AA>,
    button:         <button AA, or invalid for a body click>,
    button_index:   <0 or 1, or -1 for a body click>
}
```

- It has to be declared in the Scene's `<interface>`, or it isn't called.
- It runs after the overlay is removed and focus is restored, so you can push a screen.
- NONE buttons also call it. Check `click_action`.
- Back doesn't call it.
- The return value is ignored.

---

## Default UI

For each message, the SDK:

1. Drops anything that isn't `MODAL` and logs `Only MODAL in-app messages are displayed`.
2. Waits `display_delay` seconds, if set.
3. Adds a full-screen `BrazeDefaultInAppMessage` overlay to the Scene, sized to your Scene's coordinate space (from `ui_resolutions` in your manifest), focuses it, and logs the impression.
4. Clears `BrazeTask.BrazeInAppMessage`.
5. On close, removes the overlay and restores the previous focus.

If your app calls `setFocus` while the overlay is up (content load, screen changes, video), the overlay takes focus back. On close, focus goes to the last node your app focused. If your app removed that node while the overlay was up, focus goes to the Scene. A Scene `dialog` you open on top keeps focus while it's open.

Remote:

| Key | Result |
| --- | --- |
| Left / Right | Switch button (max 2) |
| Up / Down | Move to and from the × close button |
| OK on a button | Log button click, close, call the click hook |
| OK, no buttons | Log body click, close, call the click hook |
| OK on × | Close. No click is logged and the hook isn't called |
| Back | Close. No click is logged and the hook isn't called |
| Other keys | Swallowed |

With `AUTO_DISMISS`, the message closes after `duration` ms and no click is logged.

The card is 720 wide and centered. The header shows one line and the body up to 6 lines. Longer text is cut off with an ellipsis, so keep message copy short. If the image fails to load, it's hidden and the card closes the gap.

Only one message is shown at a time, and nothing is queued. A newer message replaces one that's on screen or still waiting out its delay. Messages the SDK drops (not `MODAL`, or no `message`) don't replace or cancel anything. The default overlay is also removed when your custom hook takes the newer message. The SDK can't remove your custom layout, so that's up to you.

---

## Deeplinks

1. In the dashboard, set the button's (or message's) on-click behavior to a deep link with a URI your app understands, for example `myapp://details/123`. It arrives as `click_action = "URI"` with the URI in `uri`.
2. In `brazeHandleInAppMessageClick` (see [step 5](#5-move-click-handling-to-brazehandleinappmessageclick)), parse the URI and route:

```brightscript
function brazeHandleInAppMessageClick(event as object) as boolean
    target = event.button
    if target = invalid then target = event.in_app_message
    if target.click_action <> "URI" or target.uri = invalid then return false

    uri = target.uri.ToStr()
    prefix = "myapp://details/"
    if Left(uri, Len(prefix)) = prefix
        ShowDetailsScreen(Mid(uri, Len(prefix) + 1))
        return true
    end if
    return false
end function
```

- The overlay is already gone when this runs, so the new screen keeps focus.
- Close-only buttons arrive as `click_action = "NONE"`. Ignore them.
- `uri` can come through as a number if the dashboard value is numeric, so convert it with `ToStr()` before parsing.

---

## Appendix 1 — Keeping some of your custom layouts

Do the upgrade steps, then move the rendering code from your old handler into `brazeHandleCustomInAppMessage`. The SDK calls it for each `MODAL` message, after `display_delay`. Return `true` if you rendered the message, or `false` to get the default UI.

```xml
<interface>
    <function name="brazeHandleCustomInAppMessage" />
    <function name="brazeHandleInAppMessageClick" />
</interface>
```

```brightscript
function brazeHandleCustomInAppMessage(in_app_message as object) as boolean
    if in_app_message.extras <> invalid and in_app_message.extras.msgtype = "sidebyside"
        m.oldFocus = getDeepestFocusedNode(m.top)
        m.customMsg = CreateObject("roSGNode", "MyCustomIam")
        m.customMsg.BrazeTask = m.BrazeTask
        m.top.appendChild(m.customMsg)
        m.customMsg.inappmessage = in_app_message
        m.customMsg.setFocus(true)
        return true
    end if
    return false
end function
```

Compared to your old handler:

- Keep your impression and click logging.
- Keep removing your own node and restoring focus.
- Remove `m.BrazeTask.BrazeInAppMessage = invalid`. The SDK already clears it.
- Remove your own `display_delay` handling.
- Only `MODAL` messages reach this hook. If you render other types, keep your custom UI ([Appendix 2](#appendix-2--keeping-your-custom-ui)).
- `brazeHandleInAppMessageClick` isn't called for messages you render.

Example: `torchietv/components/CustomSideBySideInAppMessage.*`.

---

## Appendix 2 — Keeping your custom UI

Replace the SDK files (step 1) and don't set `automatic_iam_display`. Nothing else changes. Your observer, UI and logging work as before, for every message type.

The `BrazeDefaultInAppMessage` files are only used when the flag is `true`, so it's fine to copy them along with the rest of `sdk_files/`.
