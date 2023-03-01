' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
    m.GridScreen.ObserveField("rowItemSelected", "OnGridScreenItemSelected")
    ShowScreen(m.GridScreen) ' show GridScreen
end sub

sub OnGridScreenItemSelected(event as Object)
    grid = event.GetRoSGNode()
    ' extract the row and column indexes of the item the user selected
    m.selectedIndex = event.GetData()
    ' the entire row from the RowList will be used by the Video node
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    m.selectedRow = m.selectedIndex[0]

    item = rowContent.GetChild(m.selectedIndex[1])
    if item.braze <> invalid
        HandleBrazeItem(item.braze)
    else if item.mediaType = "series"
        ShowEpisodesScreen(rowContent, m.selectedIndex[1])
    else
        ShowDetailsScreen(rowContent, m.selectedIndex[1])
    end if
end sub