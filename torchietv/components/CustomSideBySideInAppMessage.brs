sub init()
    m.buttonArea = m.top.findNode("buttonArea")
    m.buttonArea.observeFieldScoped("buttonSelected", "buttonHandler")
    m.top.observeFieldScoped("inappmessage", "OnNewInAppMessage")
    m.buttonArea.setFocus(true)
    m.font_registry = CreateObject("roFontRegistry")
end sub

sub buttonHandler()
    selected = m.buttonArea.buttonSelected
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
    m.top.isClosed = true
end function

function onKeyEvent(_key_ as String, _press_ as Boolean) as Boolean
    ' If there are no buttons, then use this to manage closing the message
    if _key_ = "OK" and _press_ = true
        LogInAppMessageClick(m.top.inappmessage.id, m.top.brazetask)
        closeInAppMessage()
        return true
    else if _key_ = "back" and _press_ = true
        closeInAppMessage()
        return true
    end if
    return false
end function

function OnNewInAppMessage()
    inappmessage = m.top.inappmessage
    titleArea = m.top.findNode("inappmessageheader")
    titleArea.text = inappmessage.header
    imageArea = m.top.findNode("inappmessageimage")
    if inappmessage.image_url <> invalid
        imageArea.uri = inappmessage.image_url
    else
        imageArea.visible = false
    end if
    bodyArea = m.top.findNode("inappmessagebody")
    bodyArea.text = inappmessage.message

    button1 = m.top.findNode("inappmessagebutton1")
    button2 = m.top.findNode("inappmessagebutton2")
    if inappmessage.buttons <> invalid and inappmessage.buttons.Count() > 0
        button1.visible = true
        button1.text = inappmessage.buttons[0].text
        if inappmessage.buttons.Count() > 1
            button2.visible = true
            button2.text = inappmessage.buttons[1].text
        end if
    end if

    releasedate = m.top.findNode("releasedate")
    releasedate.text = inappmessage.extras.releasedate

    if m.font_registry <> invalid
       font = m.font_registry.GetDefaultFont(24, true, false)
       w = font.GetOneLineWidth(releasedate.text, 350)
       m.top.findNode("releasedatebackground").width = w + 20
    end if

    if inappmessage.dismiss_type = "AUTO_DISMISS"
        m.timer = createObject("roSGNode", "Timer")
        m.timer.duration = inappmessage.duration / 1000.0
        m.timer.ObserveField("fire","closeInAppMessage")
        m.timer.control = "start"
    end if

    m.top.visible = true
    m.top.isClosed = false

    LogInAppMessageImpression(m.top.inappmessage.id, m.top.brazetask)
end function
