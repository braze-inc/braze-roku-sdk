# Roku SDK

Successful marketing automation is essential to the future of your mobile app. Braze helps you engage your users beyond the download. Visit the following links for details and we'll have you up and running in no time!

- [Developer Guide](https://www.braze.com/docs/developer_guide/home/ "Braze Developer Guide")

## Initial SDK Integration

The Braze Roku SDK will provide you with an API to report information to be used in analytics, segmentation, and engagement,

## Step 1: Add Files

1. Add `BrazeSDK.brs` to your app in the `source` directory.
2. Add `BrazeTask.brs` and `BrazeTask.xml` to your app in the `components` directory.

## Step 2: Add References

Add a reference to `BrazeSDK.brs` in your main scene using the following `script` element:

```
<script type="text/brightscript" uri="pkg:/source/BrazeSDK.brs"/>
```

## Step 3: Configure

Within `main.brs`, set the Braze configuration on the global node:

```
globalNode = screen.getGlobalNode()
config = {}
config_fields = BrazeConstants().BRAZE_CONFIG_FIELDS
config[config_fields.API_KEY] = "YOUR_API_KEY_HERE"
config[config_fields.ENDPOINT] = "YOUR_ENDPOINT_HERE (e.g. https://sdk.iad-01.braze.com/)"
config[config_fields.HEARTBEAT_FREQ_IN_SECONDS] = 5
globalNode.addFields({brazeConfig: config})
```

## Step 4: Initialize Braze

Initialize the Braze instance:

```
m.BrazeTask = createObject("roSGNode", "BrazeTask")
m.Braze = getBrazeInstance(m.BrazeTask)
```

## In-App Message Setup

To process in-app messages, you can add an observer on `BrazeTask.BrazeInAppMessage`:

```
m.BrazeTask.observeField("BrazeInAppMessage", "onInAppMessageReceived")
```

Then within your handler, you have access to the highest in-app message that has been triggered by your campaigns:

```
in_app_message = m.BrazeTask.BrazeInAppMessage
```

You can then decide what to do with the in-app message. Some of the fields available:

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

There are also various styling fields that you could choose to use from the dashboard.  Alternatively, you could implement the In-App Message and style it within your Roku application using a standard palette.
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

When a message is displayed or seen, log an impression:

```
LogInAppMessageImpression(in_app_message.id, brazetask)
```

Once a user clicks on the message, log a click:
```
LogInAppMessageClick(in_app_message.id, brazetask)
```
and then process `in_app_message.click_action`

If the user clicks on a button, log the button click:

```
LogInAppMessageButtonClick(inappmessage.id, inappmessage.buttons[selected].id, brazetask)
```
and then process `inappmessage.buttons[selected].click_action`

After processing in-app message, you should clear the field:

```
m.BrazeTask.BrazeInAppMessage = invalid
```

## Basic SDK Integration Complete

Braze should now be collecting data from your application. Please see our public documentation on how to log attributes, events, and purchases to our SDK. Our sample app's scene `samplescene.brs` also contains examples of using the API.

`BrazeInAppMessage.brs` shows an example of handling In-App Messages.

## Additional Reference

The directory `SceneGraphTutorial` contains the sample app (SceneGraphTutorial.zip) from [Roku](https://sdkdocs.roku.com/display/sdkdoc/SceneGraph+Samples "Roku Tutorial App"), with the Braze SDK integrated.
