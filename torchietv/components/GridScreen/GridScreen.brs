' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' entry point of GridScreen
' Note that we need to import this file in GridScreen.xml using relative path.
sub Init()
    m.rowList = m.top.FindNode("rowList")
    m.rowList.SetFocus(true)
    ' label with item description
    m.descriptionLabel = m.top.FindNode("descriptionLabel")
    m.top.ObserveField("visible", "onVisibleChange")
    ' label with item title
    m.titleLabel = m.top.FindNode("titleLabel")
    ' observe rowItemFocused so we can know when another item of rowList will be focused
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")

    m.button = m.top.FindNode("brazeActionButton")
    m.top.ObserveField("bannerData", "OnShowBannerChanged")
    m.bannerShown = false
end sub

sub OnShowBannerChanged(event)
    banner = m.top.FindNode("brazeBanner")

    if m.top.bannerData <> invalid
        banner.data = m.top.bannerData
        animateBannerIn = m.top.findNode("animateBannerIn")
        animateBannerIn.repeat = false
        animateBannerIn.control = "start"
        m.bannerShown = true
    else if m.bannerShown = true
        animateBannerOut = m.top.findNode("animateBannerOut")
        animateBannerOut.repeat = false
        animateBannerOut.control = "start"
        m.bannerShown = false
    end if
end sub

function OnKeyEvent(key, press) as boolean
    result = false
    if press then
        if key = "up" and m.button.hasFocus() = false and m.bannerShown
            m.button.setfocus(true)
            result = true
        else if key = "down" and m.button.hasFocus() = true
            m.rowlist.setfocus(true)
            result = true
        end if
    end if
    return result
end function

sub OnVisibleChange() ' invoked when GridScreen change visibility
    if m.top.visible = true
        m.rowList.SetFocus(true) ' set focus to rowList if GridScreen visible
    end if
end sub

sub OnItemFocused() ' invoked when another item is focused
    focusedIndex = m.rowList.rowItemFocused ' get position of focused item
    row = m.rowList.content.GetChild(focusedIndex[0]) ' get all items of row
    item = row.GetChild(focusedIndex[1]) ' get focused item
    ' update description label with description of focused item
    m.descriptionLabel.text = item.description
    ' update title label with title of focused item
    m.titleLabel.text = item.title
    ' adding length of playback to the title if item length field was populated
    if item.length <> invalid and item.length <> 0
        m.titleLabel.text += " | " + GetTime(item.length)
    end if
end sub
