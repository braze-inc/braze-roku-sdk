sub init()
    m.buttonArea = m.top.findNode("buttonArea")
    m.top.observeFieldScoped("inappmessage", "OnNewInAppMessage")
    m.top.observeFieldScoped("buttonSelected", "buttonHandler")
    m.top.setFocus(true)
end sub

sub buttonHandler()
    selected = m.top.buttonSelected
    if m.top.inappmessage.buttons <> invalid
        if m.top.inappmessage.buttons.Count() > selected
            LogInAppMessageButtonClick(m.top.inappmessage.id, m.top.inappmessage.buttons[selected].id, m.top.brazetask)
        end if
    end if
    closeInAppMessage()
end sub

function closeInAppMessage() 
    if m.timer <> invalid
        m.timer.control = "stop"
    end if
    m.top.visible = false
    m.top.close = true
end function

function onKeyEvent(_key_ as String, _press_ as Boolean) as Boolean
    ' If there are no buttons, then use this to manage closing the message
    if _key_ = "OK" and _press_ = true and m.top.inappmessage.buttons <> invalid and m.top.inappmessage.buttons.Count() = 0
        LogInAppMessageClick(m.top.inappmessage.id, m.top.brazetask)
        closeInAppMessage()
        return true
    end if
    return false
end function

function OnNewInAppMessage()
    inappmessage = m.top.inappmessage
    titleArea = m.top.findNode("inappmessageheader")
    titleArea.primaryTitle = inappmessage.header
    ' If we wanted to use the colors, we could set them here using
    ' m.top.palette = createObject("roSGNode", "RSGPalette")
    ' m.top.palette.colors = { DialogBackgroundColor: inappmessage.bg_color }
    imageArea = m.top.findNode("inappmessageimage")
    if inappmessage.image_url <> invalid
        imageArea.graphicUri = inappmessage.image_url
    else
        imageArea.visible = false
    end if
    bodyArea = m.top.findNode("inappmessagebody")
    bodyArea.text = inappmessage.message

    buttonsArea = m.top.findNode("inappmessagebuttonArea")
    button1 = m.top.findNode("inappmessagebutton1")
    button2 = m.top.findNode("inappmessagebutton2")
    if inappmessage.buttons <> invalid and inappmessage.buttons.Count() > 0
        buttonsArea.visible = true
        button1.visible = true
        button1.text = inappmessage.buttons[0].text
        if inappmessage.buttons.Count() > 1
            button2.visible = true
            button2.text = inappmessage.buttons[1].text
        else
            buttonsArea.removeChild(button2)
        end if
    else
        m.top.removeChild(buttonsArea)
    end if

    if inappmessage.dismiss_type = "AUTO_DISMISS"
        m.timer = createObject("roSGNode", "Timer")
        m.timer.duration = inappmessage.duration / 1000.0
        m.timer.ObserveField("fire","closeInAppMessage")
        m.timer.control = "start"
    end if

    LogInAppMessageImpression(m.top.inappmessage.id, m.top.brazetask)
end function
