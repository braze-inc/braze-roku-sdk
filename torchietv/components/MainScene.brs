' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' entry point of  MainScene
' Note that we need to import this file in MainScene.xml using relative path.
sub Init()
    m.BrazeTask = CreateObject("roSGNode", "BrazeTask")
    m.Braze = getBrazeInstance(m.BrazeTask)
    m.BrazeTask.ObserveField("BrazeFeatureFlagsUpdated", "onFeatureFlagChanges")

    ' set background color for scene. Applied only if backgroundUri has empty value
    m.top.backgroundColor = "0x363648"
    m.top.backgroundURI = ""
    m.loadingIndicator = m.top.FindNode("loadingIndicator") ' store loadingIndicator node to m
    InitScreenStack()
    ShowGridScreen()
    RunContentTask() ' retrieving content

    ' Set the userID if we have it (this is from the sample app level, not Braze level)
    userId = getStoredUserId()
    if userId <> "" 
        m.Braze.setUserId(userId)
    endif
    updateOverhangUser(userId)
end sub

' The OnKeyEvent() function receives remote control key events
function OnkeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ' handle "back" key press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if
    ' The OnKeyEvent() function must return true if the component handled the event,
    ' or false if it did not handle the event.
    return result
end function

sub reclaimFocus()
    m.top.removeChild(m.customMsg)
    m.customMsg = invalid
    if m.oldfocus <> invalid then m.oldfocus.setFocus(true)
end sub

function getDeepestFocusedNode(node as object) as object
    if node = invalid then return invalid
    child = node.focusedChild
    if child = invalid or child.isSameNode(node) then return node
    return getDeepestFocusedNode(child)
end function

' Optional SDK hook: return true to display a custom IAM layout instead of the default dialog.
function brazeHandleCustomInAppMessage(in_app_message as object) as boolean
    if in_app_message.extras <> invalid and in_app_message.extras.msgtype = "sidebyside"
        m.customMsg = CreateObject("roSGNode", "CustomSideBySideInAppMessage")
        m.oldfocus = getDeepestFocusedNode(m.top.focusedChild)

        m.top.appendChild(m.customMsg)
        m.customMsg.BrazeTask = m.Braze.BrazeTask
        m.customMsg.inappmessage = in_app_message
        m.customMsg.setFocus(true)
        m.customMsg.ObserveField("isClosed", "reclaimFocus")
        return true
    end if
    return false
end function

' Optional SDK hook: process click_action / uri after the default IAM closes.
' event.button is invalid when the message has no buttons (body click). Back does not call this.
' Sample: dashboard URI containing "details" (e.g. torchie://details) opens the details screen.
function brazeHandleInAppMessageClick(event as object) as boolean
    print "brazeHandleInAppMessageClick"
    if event = invalid then return false
    target = event.button
    if target = invalid then target = event.in_app_message
    if target = invalid then return false

    uri = iamUriToString(target.uri)
    print "IAM click action="; target.click_action; " uri="; uri
    if uri = "" then return false
    if Instr(1, LCase(uri), "details") = 0 then return false

    OpenIamTestDetails()
    return true
end function

sub OpenIamTestDetails()
    if m.GridScreen = invalid or m.GridScreen.content = invalid then return
    rows = m.GridScreen.content
    for r = 0 to rows.GetChildCount() - 1
        row = rows.GetChild(r)
        if row <> invalid
            for c = 0 to row.GetChildCount() - 1
                item = row.GetChild(c)
                if item <> invalid and item.braze = invalid
                    m.selectedIndex = [r, c]
                    ShowDetailsScreen(row, c)
                    return
                end if
            end for
        end if
    end for
end sub

function iamUriToString(uri as dynamic) as string
    if uri = invalid then return ""
    uriType = Type(uri)
    if uriType = "String" or uriType = "roString" then return uri
    if uriType = "Integer" or uriType = "roInt" or uriType = "Float" or uriType = "roFloat" or uriType = "Double"
        return StrI(CInt(uri)).Trim()
    end if
    return ""
end function
  
sub onFeatureFlagChanges()
  print "On FeatureFlag Changes()"
  ff = m.braze.getFeatureFlag("theme")
  if ff <> invalid and ff.enabled 
    bgcolor = ff.getStringProperty("bgcolor")
    if bgcolor <> invalid
      m.top.backgroundColor = bgcolor
      m.braze.logFeatureFlagImpression(ff.id)
    end if
  end if
  ff = m.braze.getFeatureFlag("banner")
  if ff <> invalid and ff.enabled
    ' If it's already set, don't set it again
    if m.GridScreen.bannerData = invalid
      m.GridScreen.bannerData = { 
        "cta": ff.getStringProperty("cta"),
        "longDescription": ff.getStringProperty("longDescription"),
        "thumbnail": ff.getStringProperty("thumbnail"),
        "shortDescription": ff.getStringProperty("shortDescription"),
        "title": ff.getStringProperty("title"),
        "bannerImg": ff.getStringProperty("bannerImg"),
        "episodeId": ff.getStringProperty("episodeId"),
    }
    end if
  else 
    m.GridScreen.bannerData = invalid
  end if
end sub
  