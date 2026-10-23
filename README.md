<p align="center">
  <img width="480" alt="Braze Logo" src=".github/assets/logo-light.png#gh-light-mode-only" />
  <img width="480" alt="Braze Logo" src=".github/assets/logo-dark.png#gh-dark-mode-only" />
</p>

# Braze Roku SDK

Successful marketing automation is essential to the future of your mobile app. Braze helps you engage your users beyond the download. To learn more, see the following resource:

- [Developer Guide](https://www.braze.com/docs/developer_guide/home/ "Braze Developer Guide")

## Initial SDK integration

The Braze Roku SDK provides you with an API to report information you can use for analytics, segmentation, and engagement.

## Step 1: Add Files

1. Add `BrazeSDK.brs` to your app in the `source` directory.
2. Add `BrazeTask.brs` and `BrazeTask.xml` to your app in the `components` directory.
3. To use the default in-app message UI, also add `BrazeDefaultInAppMessage.brs`, `BrazeDefaultInAppMessage.xml`, and `BrazeDefaultInAppMessageStyles.brs` to the `components` directory. These three files can go in a subfolder of `components`, as long as they stay together.

## Step 2: Add References

Add a reference to `BrazeSDK.brs` in your main scene using the following `script` element:

```
<script type="text/brightscript" uri="pkg:/source/BrazeSDK.brs"/>
```

## Step 3: Configure

In `main.brs`, set the Braze configuration on the global node **before** `CreateScene()` so it is available during Scene `init()`:

```
screen = CreateObject("roSGScreen")
globalNode = screen.getGlobalNode()
config = {}
config_fields = BrazeConstants().BRAZE_CONFIG_FIELDS
config[config_fields.API_KEY] = "YOUR_API_KEY_HERE"
config[config_fields.ENDPOINT] = "YOUR_ENDPOINT_HERE (e.g. https://sdk.iad-01.braze.com/)"
config[config_fields.HEARTBEAT_FREQ_IN_SECONDS] = 5
globalNode.addFields({brazeConfig: config})
screen.CreateScene("MainScene")
```

## Step 4: Initialize Braze

Initialize the Braze instance:

```
m.BrazeTask = createObject("roSGNode", "BrazeTask")
m.Braze = getBrazeInstance(m.BrazeTask)
```

## In-app message setup

If you already render in-app messages with your own UI and are upgrading to 2.3.0 or later, see the [in-app messages guide](IN_APP_MESSAGES.md).

The SDK can display **modal** in-app messages (`MODAL`) with its default UI. It is off by default. To turn it on, add the `BrazeDefaultInAppMessage` files (Step 1) and set:

```
config[config_fields.AUTOMATIC_IAM_DISPLAY] = true
```

Call `getBrazeInstance(m.BrazeTask)` from your main Scene so the SDK can attach the dialog on the render thread. You do not need to observe `BrazeInAppMessage` or create UI for the default dialog.

Slideup, full, styled modal, and HTML in-app messages are not displayed by the default UI. The SDK logs an error for those types. HTML rendering is not supported on Roku.

If you render in-app messages yourself, leave `automatic_iam_display` unset and observe `BrazeTask.BrazeInAppMessage`:

```
m.BrazeTask.observeField("BrazeInAppMessage", "onInAppMessageReceived")
```

To intercept a specific message and show custom UI while keeping automatic display for everything else, implement this function on your Scene (and declare it in the Scene XML `<interface>`):

```
function brazeHandleCustomInAppMessage(in_app_message as object) as boolean
  ' Return true if your app displayed the message, false to use the default SDK dialog.
  return false
end function
```

To handle a custom click while still using the default IAM UI, implement this on your Scene (and declare it in the Scene XML `<interface>`). The SDK logs the click, closes the message, then calls this so any navigation can keep focus. Back dismisses without calling it.

```
function brazeHandleInAppMessageClick(event as object) as void
  in_app_message = event.in_app_message
  button = event.button
  if button <> invalid
    ' Button click. Use button.click_action and button.uri.
    return
  end if
  ' Body click (no buttons). Use in_app_message.click_action and in_app_message.uri.
end function
```

When you handle UI yourself, your handler has access to the highest in-app message triggered by your campaigns:

```
in_app_message = m.BrazeTask.BrazeInAppMessage
```

Available fields include:

- `in_app_message.message` - The body text of the in-app message
- `in_app_message.buttons` - List of buttons (could be an empty list).
- `in_app_message.id` - ID to use when logging impressions or clicks
- `in_app_message.extras` - Key/value pairs
- `in_app_message.image_url` - Image URL
- `in_app_message.click_action` - When there are no buttons, this is what should happen when the user clicks "OK" when the IAM is displayed. Can be "URI" or "NONE".
- `in_app_message.dismiss_type` - Can be "AUTO_DISMISS" or "SWIPE"
- `in_app_message.display_delay` - How long (in seconds) to wait until displaying the in-app message
- `in_app_message.duration` - How long (in milliseconds), the message should be displayed when `dismiss_type` is "AUTO_DISMISS"
- `in_app_message.header` - The header text of the in-app message
- `in_app_message.uri` - When `click_action` is "URI", this should be displayed

You can also use styling fields from the dashboard. Alternatively, you can implement the in-app message and style it in your Roku application using a standard palette.
- `in_app_message.bg_color` - Background color
- `in_app_message.close_button_color` - Close button color
- `in_app_message.frame_color` - The color of the background screen overlay
- `in_app_message.header_text_color` - Header text color
- `in_app_message.message_text_color` - Message text color
- `in_app_message.text_align` - Can be "START", "CENTER", or "END"

Button fields include:
- `buttons[0].click_action` - Can be "URI" to indicate to open the `uri` field.  Can be "NONE" to indicate this button should close the in-app message.
- `buttons[0].id` - The ID value of the button itself
- `buttons[0].text` - The text to display on the button
- `buttons[0].uri` - When `click_action` is "URI", this should be displayed
- `buttons[0].bg_color` - Button background color
- `buttons[0].border_color` - Button border color
- `buttons[0].text_color` - Button text color

The default `BrazeDefaultInAppMessage` UI logs impressions and clicks for you.

If you implement your own UI, log an impression when the message is shown:

```
LogInAppMessageImpression(in_app_message.id, brazetask)
```

When a user clicks the message, log a click:
```
LogInAppMessageClick(in_app_message.id, brazetask)
```
Then process `in_app_message.click_action`.

If the user clicks on a button, log the button click:

```
LogInAppMessageButtonClick(inappmessage.id, inappmessage.buttons[selected].id, brazetask)
```
Then process `inappmessage.buttons[selected].click_action`.

After you process the in-app message, clear the field:

```
m.BrazeTask.BrazeInAppMessage = invalid
```

## Basic SDK integration complete

Braze now collects data from your application. For more information about logging attributes, events, and purchases, see the [Braze documentation](https://www.braze.com/docs). The sample app scene `MainScene.brs` also contains API examples.

`BrazeDefaultInAppMessage` is the SDK's default in-app message UI. `CustomSideBySideInAppMessage.brs` in the sample app shows a custom layout via `brazeHandleCustomInAppMessage()`.

## Additional reference

The directory `torchietv` contains a sample app with the Braze SDK integrated.
