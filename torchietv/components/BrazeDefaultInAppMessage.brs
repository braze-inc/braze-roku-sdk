sub init()
    m.top.focusable = true
    m.styles = BrazeDefaultInAppMessageStyles()
    m.card = m.top.findNode("iamCard")
    m.cardContent = m.top.findNode("iamCardContent")
    m.image = m.top.findNode("inappmessageimage")
    m.header = m.top.findNode("inappmessageheader")
    m.body = m.top.findNode("inappmessagebody")
    m.button1 = m.top.findNode("iamButton1")
    m.button2 = m.top.findNode("iamButton2")
    m.buttonWrap = m.top.findNode("iamButtonWrap")
    m.closeButton = m.top.findNode("iamCloseButton")
    m.closeButtonRing = m.top.findNode("iamCloseButtonRing")
    m.closeButtonBg = m.top.findNode("iamCloseButtonBg")
    m.closeButtonLabel = m.top.findNode("iamCloseButtonLabel")
    m.selectedButtonIndex = 0
    m.closeSelected = false
    m.cardWidth = m.styles.cardWidth
    m.buttonWidth = m.styles.buttonWidth
    m.buttonHeight = m.styles.buttonHeight
    m.buttonSpacing = m.styles.buttonSpacing

    ' The node isn't in the Scene yet, so start from the defaults. The real size is applied in
    ' OnNewInAppMessage, once getScene() works.
    applyScreenSize(invalid)
    m.top.color = m.styles.overlayColor
    if m.buttonWrap <> invalid then m.buttonWrap.color = m.styles.buttonRowColor
    bottomPad = m.top.findNode("iamCardBottomPad")
    if bottomPad <> invalid then bottomPad.color = m.styles.cardBottomSpacerColor
    applyStyleSizes()

    ' boundingRect() can be stale before the first frame on some firmware, so measure again after it.
    m.relayoutTimer = createObject("roSGNode", "Timer")
    m.relayoutTimer.duration = m.styles.relayoutDelaySeconds
    m.relayoutTimer.repeat = false
    m.relayoutTimer.observeField("fire", "layoutCard")

    m.image.observeField("loadStatus", "onImageLoadStatus")
    m.top.observeFieldScoped("inappmessage", "OnNewInAppMessage")
end sub

' Size the overlay to the Scene's coordinate space (manifest ui_resolutions), not the device UI resolution.
sub applyScreenSize(scene as dynamic)
    size = BrazeGetScreenSize(scene, m.styles.defaultScreenWidth, m.styles.defaultScreenHeight)
    m.screenWidth = size.width
    m.screenHeight = size.height
    m.top.width = m.screenWidth
    m.top.height = m.screenHeight
end sub

sub setNodeSize(id as string, x as integer, y as integer, width as integer, height as integer)
    node = m.top.findNode(id)
    if node = invalid then return
    node.translation = [x, y]
    node.width = width
    node.height = height
end sub

sub applyStyleSizes()
    s = m.styles
    if m.cardContent <> invalid then m.cardContent.itemSpacings = [s.cardContentSpacing]
    setNodeSize("inappmessageimage", 0, 0, s.cardWidth, s.imageDefaultHeight)
    if m.header <> invalid then m.header.width = s.cardWidth
    if m.body <> invalid then m.body.width = s.cardWidth
    setNodeSize("iamButtonWrap", 0, 0, s.cardWidth, s.buttonHeight)
    setNodeSize("iamCardBottomPad", 0, 0, s.cardWidth, s.cardBottomPadding)

    border = s.buttonBorderWidth
    innerWidth = s.buttonWidth - (2 * border)
    innerHeight = s.buttonHeight - (2 * border)
    for each prefix in ["iamButton1", "iamButton2"]
        setNodeSize(prefix + "Border", 0, 0, s.buttonWidth, s.buttonHeight)
        setNodeSize(prefix + "Bg", border, border, innerWidth, innerHeight)
        setNodeSize(prefix + "Label", border, border, innerWidth, innerHeight)
    end for

    closeSize = s.closeButtonSize
    closeMargin = s.closeButtonMargin
    if m.closeButton <> invalid then m.closeButton.translation = [s.cardWidth - closeSize - closeMargin, closeMargin]
    setNodeSize("iamCloseButtonBg", 0, 0, closeSize, closeSize)
    setNodeSize("iamCloseButtonLabel", 0, 0, closeSize, closeSize)
    ' The ring is four edges so the middle stays see-through.
    setNodeSize("iamCloseButtonRingTop", 0, 0, closeSize, border)
    setNodeSize("iamCloseButtonRingBottom", 0, closeSize - border, closeSize, border)
    setNodeSize("iamCloseButtonRingLeft", 0, 0, border, closeSize)
    setNodeSize("iamCloseButtonRingRight", closeSize - border, 0, border, closeSize)
end sub

sub closeInAppMessage()
    if m.timer <> invalid
        m.timer.control = "stop"
    end if
    if m.relayoutTimer <> invalid then m.relayoutTimer.control = "stop"
    m.top.visible = false
    m.top.isClosed = true
end sub

sub handleButtonClick(index as integer)
    inappmessage = m.top.inappmessage
    if inappmessage.buttons <> invalid and inappmessage.buttons.Count() > index
        LogInAppMessageButtonClick(inappmessage.id, inappmessage.buttons[index].id, m.top.brazetask)
    end if
    m.top.pendingClickEvent = BrazeBuildInAppMessageClickEvent(inappmessage, index)
    closeInAppMessage()
end sub

function visibleButtonCount() as integer
    inappmessage = m.top.inappmessage
    if inappmessage = invalid or inappmessage.buttons = invalid then return 0
    return inappmessage.buttons.Count()
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    ' Swallow all keys so firmware focus search cannot reach UI behind the overlay.
    if press <> true then return true

    if key = "back"
        closeInAppMessage()
        return true
    end if

    buttonCount = visibleButtonCount()
    if key = "OK"
        if m.closeSelected = true
            closeInAppMessage()
            return true
        end if
        if buttonCount = 0
            LogInAppMessageClick(m.top.inappmessage.id, m.top.brazetask)
            m.top.pendingClickEvent = BrazeBuildInAppMessageClickEvent(m.top.inappmessage, -1)
            closeInAppMessage()
            return true
        end if
        handleButtonClick(m.selectedButtonIndex)
        return true
    else if key = "up" and m.closeSelected = false
        m.closeSelected = true
        applyAllButtonStyles()
        return true
    else if key = "down" and m.closeSelected = true
        m.closeSelected = false
        applyAllButtonStyles()
        return true
    else if key = "right" and buttonCount > 1 and m.selectedButtonIndex = 0 and m.closeSelected = false
        m.selectedButtonIndex = 1
        applyAllButtonStyles()
        return true
    else if key = "left" and buttonCount > 1 and m.selectedButtonIndex = 1 and m.closeSelected = false
        m.selectedButtonIndex = 0
        applyAllButtonStyles()
        return true
    end if
    return true
end function

function buttonColorOrDefault(value as dynamic, defaultColor as string) as string
    if value = invalid or value = "" then return defaultColor
    return value
end function

sub styleIamButton(index as integer, buttonNode as object, isSelected as boolean)
    inappmessage = m.top.inappmessage
    if inappmessage = invalid or inappmessage.buttons = invalid or inappmessage.buttons.Count() <= index then return
    if buttonNode = invalid then return

    button = inappmessage.buttons[index]
    bgColor = buttonColorOrDefault(button.bg_color, m.styles.buttonBackgroundColor)
    textColor = buttonColorOrDefault(button.text_color, m.styles.buttonTextColor)
    if isSelected = true
        borderColor = m.styles.buttonSelectedBorderColor
    else
        borderColor = m.styles.buttonUnselectedBorderColor
    end if

    buttonIndex = index + 1
    prefix = "iamButton" + buttonIndex.ToStr()
    bgNode = buttonNode.findNode(prefix + "Bg")
    borderNode = buttonNode.findNode(prefix + "Border")
    labelNode = buttonNode.findNode(prefix + "Label")
    if bgNode <> invalid then bgNode.color = bgColor
    if borderNode <> invalid then borderNode.color = borderColor
    if labelNode <> invalid then labelNode.color = textColor
end sub

sub styleCloseButton()
    if m.closeButtonBg = invalid or m.closeButtonLabel = invalid then return
    ' Selection is shown by the ring only. The fill and text stay the same.
    if m.closeButtonRing <> invalid
        ringColor = m.styles.buttonUnselectedBorderColor
        if m.closeSelected = true then ringColor = m.styles.buttonSelectedBorderColor
        for i = 0 to m.closeButtonRing.getChildCount() - 1
            m.closeButtonRing.getChild(i).color = ringColor
        end for
    end if
    m.closeButtonBg.color = m.styles.closeButtonBackgroundColor
    textColor = m.styles.closeButtonTextColor
    inappmessage = m.top.inappmessage
    if inappmessage <> invalid then textColor = buttonColorOrDefault(inappmessage.close_button_color, textColor)
    m.closeButtonLabel.color = textColor
end sub

sub applyAllButtonStyles()
    styleIamButton(0, m.button1, m.closeSelected = false and m.selectedButtonIndex = 0)
    styleIamButton(1, m.button2, m.closeSelected = false and m.selectedButtonIndex = 1)
    styleCloseButton()
end sub

function buttonRowWidth() as float
    count = 0
    if m.button1 <> invalid and m.button1.visible = true then count = count + 1
    if m.button2 <> invalid and m.button2.visible = true then count = count + 1
    if count <= 0 then return 0
    return (count * m.buttonWidth) + ((count - 1) * m.buttonSpacing)
end function

sub centerButtonRow()
    if m.button1 = invalid then return
    rowWidth = buttonRowWidth()
    if rowWidth <= 0 then return
    x = CInt((m.cardWidth - rowWidth) / 2)
    if x < 0 then x = 0
    m.button1.translation = [x, 0]
    if m.button2 <> invalid and m.button2.visible = true
        m.button2.translation = [x + m.buttonWidth + m.buttonSpacing, 0]
    else if m.button2 <> invalid
        m.button2.translation = [0, 0]
    end if
end sub

sub setButtonAreaVisible(showButtons as boolean)
    if m.buttonWrap = invalid or m.cardContent = invalid then return
    if showButtons = true
        m.buttonWrap.visible = true
        m.buttonWrap.height = m.buttonHeight
        if m.buttonWrap.getParent() = invalid
            insertIndex = m.cardContent.getChildCount() - 1
            if insertIndex < 0 then insertIndex = 0
            m.cardContent.insertChild(m.buttonWrap, insertIndex)
        end if
        return
    end if
    m.buttonWrap.visible = false
    m.buttonWrap.height = 0
    if m.buttonWrap.getParent() <> invalid then m.cardContent.removeChild(m.buttonWrap)
end sub

sub layoutCard()
    if m.card = invalid or m.cardContent = invalid then return
    contentRect = m.cardContent.boundingRect()
    height = m.styles.cardFallbackHeight
    if contentRect <> invalid and contentRect.height <> invalid and contentRect.height > 0
        height = contentRect.height
    end if
    screenMargin = m.styles.cardScreenMargin
    maxHeight = m.screenHeight - (2 * screenMargin)
    if height > maxHeight then height = maxHeight
    m.card.width = m.cardWidth
    m.card.height = height
    centerButtonRow()
    x = (m.screenWidth - m.cardWidth) / 2
    y = (m.screenHeight - height) / 2
    if y < screenMargin then y = screenMargin
    m.card.translation = [x, y]
end sub

sub onImageLoadStatus()
    if m.image = invalid or m.image.visible <> true then return
    if m.image.loadStatus = "failed"
        ' Don't leave an empty image box in the card.
        m.image.visible = false
        m.image.height = 0
        layoutCard()
        return
    end if
    if m.image.loadStatus <> "ready" then return
    loadWidth = m.image.loadWidth
    loadHeight = m.image.loadHeight
    if loadWidth <> invalid and loadWidth > 0 and loadHeight <> invalid and loadHeight > 0
        imageHeight = CInt((m.cardWidth * loadHeight) / loadWidth)
        if imageHeight > m.styles.imageMaxHeight then imageHeight = m.styles.imageMaxHeight
        m.image.height = imageHeight
    end if
    layoutCard()
end sub

sub OnNewInAppMessage()
    inappmessage = m.top.inappmessage
    if inappmessage = invalid then return

    ' The SDK appends this node to the Scene before setting inappmessage, so getScene() works here.
    applyScreenSize(m.top.getScene())

    overlayColor = buttonColorOrDefault(inappmessage.frame_color, m.styles.overlayColor)
    m.top.color = overlayColor
    m.card.color = buttonColorOrDefault(inappmessage.bg_color, m.styles.cardBackgroundColor)

    align = "center"
    if inappmessage.text_align = "START"
        align = "left"
    else if inappmessage.text_align = "END"
        align = "right"
    end if

    if inappmessage.image_url <> invalid and inappmessage.image_url <> ""
        m.image.width = m.cardWidth
        m.image.height = m.styles.imageDefaultHeight
        m.image.visible = true
        m.image.uri = inappmessage.image_url
    else
        m.image.uri = ""
        m.image.visible = false
        m.image.height = 0
    end if

    if inappmessage.header <> invalid and inappmessage.header <> ""
        m.header.text = inappmessage.header
        m.header.visible = true
        m.header.horizAlign = align
        m.header.color = buttonColorOrDefault(inappmessage.header_text_color, m.styles.headerTextColor)
    else
        m.header.text = ""
        m.header.visible = false
    end if

    m.body.text = inappmessage.message
    m.body.horizAlign = align
    m.body.color = buttonColorOrDefault(inappmessage.message_text_color, m.styles.messageTextColor)

    m.selectedButtonIndex = 0
    m.closeSelected = false
    buttonCount = 0
    if inappmessage.buttons <> invalid then buttonCount = inappmessage.buttons.Count()
    if buttonCount > 0
        setButtonAreaVisible(true)
        m.button1.visible = true
        m.top.findNode("iamButton1Label").text = inappmessage.buttons[0].text
        if buttonCount > 1
            m.button2.visible = true
            m.top.findNode("iamButton2Label").text = inappmessage.buttons[1].text
        else
            m.button2.visible = false
        end if
        centerButtonRow()
    else
        m.button1.visible = false
        m.button2.visible = false
        setButtonAreaVisible(false)
    end if
    applyAllButtonStyles()

    layoutCard()
    m.relayoutTimer.control = "start"

    if inappmessage.dismiss_type = "AUTO_DISMISS"
        m.timer = createObject("roSGNode", "Timer")
        m.timer.duration = inappmessage.duration / 1000.0
        m.timer.ObserveField("fire","closeInAppMessage")
        m.timer.control = "start"
    end if

    LogInAppMessageImpression(m.top.inappmessage.id, m.top.brazetask)
    m.top.setFocus(true)
end sub
