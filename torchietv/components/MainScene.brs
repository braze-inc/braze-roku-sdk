' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' entry point of  MainScene
' Note that we need to import this file in MainScene.xml using relative path.
sub Init()
    m.BrazeTask = CreateObject("roSGNode", "BrazeTask")
    m.Braze = getBrazeInstance(m.BrazeTask)
    m.BrazeTask.ObserveField("BrazeInAppMessage", "onInAppMessageTriggered")
    m.BrazeTask.ObserveField("BrazeFeatureFlags", "onFeatureFlagChanges")

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
    m.oldfocus.setFocus(true)
  end sub

sub onInAppMessageTriggered()
    in_app_message = m.BrazeTask.BrazeInAppMessage
    if in_app_message <> invalid and in_app_message.message <> invalid
      ' If we have a KVP of "msgtype" with a value of "sidebyside", that means we want to render this
      ' using the "CustomSideBySideInAppMessage" object. We could have multiple types of custom
      ' In App Messages supported
      if in_app_message.extras <> invalid and in_app_message.extras.msgtype = "sidebyside"
        m.customMsg = CreateObject("roSGNode", "CustomSideBySideInAppMessage")
        ' Hack for now
        m.oldfocus = m.top.focusedChild
        while (m.oldfocus.focusedChild <> invalid and not(m.oldfocus.isSameNode(m.oldfocus.focusedChild)))
            m.oldfocus = m.oldfocus.focusedChild
        end while

        m.top.appendChild(m.customMsg)
        m.customMsg.BrazeTask = m.Braze.BrazeTask
        m.customMsg.inappmessage = in_app_message
        m.customMsg.setFocus(true)
        m.customMsg.ObserveField("isClosed", "reclaimFocus")
      else
        ' Our default In App Message. This happens to be based on a Roku Dialog
        dialog = createObject("roSGNode", "BrazeInAppMessage")
        dialog.BrazeTask = m.Braze.BrazeTask
        dialog.inappmessage = in_app_message
        m.oldfocus = m.top.focusedChild
        while (m.oldfocus.focusedChild <> invalid and not(m.oldfocus.isSameNode(m.oldfocus.focusedChild)))
            m.oldfocus = m.oldfocus.focusedChild
        end while
        m.top.dialog = dialog
      end if
      m.BrazeTask.BrazeInAppMessage = invalid
    end if
  end sub
  
sub onFeatureFlagChanges()
  print "On FeatureFlag Changes()"
  ff = m.braze.getFeatureFlag("theme")
  if ff.enabled 
    bgcolor = ff.getStringProperty("bgcolor")
    if bgcolor <> invalid
      m.top.backgroundColor = bgcolor
      m.braze.logFeatureFlagImpression(ff.id)
    end if
  end if
  ff = m.braze.getFeatureFlag("banner")
  if ff.enabled
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
  