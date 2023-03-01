' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainLoaderTask.xml using relative path.
sub Init()
    ' set the name of the function in the Task node component to be executed when the state field changes to RUN
    ' in our case this method executed after the following cmd: m.contentTask.control = "run"(see Init method in MainScene)
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' request the content feed from the API
    rsp = ReadAsciiFile("pkg://roku-sample-feed.json")
    rootChildren = []
    rows = {}

    ' parse the feed and build a tree of ContentNodes to populate the GridView
    json = ParseJson(rsp)
    if json <> invalid
        for each category in json
            catJson = json.Lookup(category)
            value = catJson.data
            if Type(value) = "roArray" ' if parsed key value having other objects in it
                row = {}
                print "Processing category " + category 
                row.order = catJson.order
                row.title = category
                row.children = []
                for each item in value ' parse items and push them to row
                    itemData = GetItemData(item)
                    seasons = GetSeasonData(item.seasons)
                    if seasons <> invalid and seasons.Count() > 0
                        itemData.children = seasons
                        itemData.mediaType = "series"
                    else 
                        itemData.mediaType = "show"
                    end if
                    row.children.Push(itemData)
                end for
                rootChildren.Push(row)
            end if
        end for

        rootChildren.sortBy("order")
        ' set up a root ContentNode to represent rowList on the GridScreen
        contentNode = CreateObject("roSGNode", "ContentNode")
        contentNode.Update({
            children: rootChildren
        }, true)
        ' populate content field with root content node.
        ' Observer(see OnMainContentLoaded in MainScene.brs) is invoked at that moment
        m.top.content = contentNode
    end if
end sub

function GetItemData(video as Object) as Object
    item = {}
    ' populate some standard content metadata fields to be displayed on the GridScreen
    ' https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md
    if video.longDescription <> invalid
        item.description = video.longDescription
    else
        item.description = video.shortDescription
    end if
    item.hdPosterURL = video.thumbnail
    item.title = video.title
    item.releaseDate = video.releaseDate
    item.id = video.id
    if video.episodeNumber <> invalid
        item.episodePosition = video.episodeNumber.ToStr()
    end if
    if video.content <> invalid
        ' populate length of content to be displayed on the GridScreen
        item.length = video.content.duration
        ' populate meta-data for playback
        item.url = video.content.videos[0].url
        item.streamFormat = video.content.videos[0].videoType
    end if
    if video.braze <> invalid
        item.braze = video.braze
    end if
    return item
end function

function GetSeasonData(seasons as Object) as Object
    seasonsArray = []
    if seasons <> invalid
        episodeCounter = 0
        for each season in seasons 
            if season.episodes <> invalid
                episodes = []
                for each episode in season.episodes
                    episodeData = GetItemData(episode)
                    ' save season title for element to represent it on the episodes screen
                    episodeData.titleSeason = season.title
                    episodeData.numEpisodes = episodeCounter
                    episodeData.mediaType = "episode"
                    episodes.Push(episodeData)
                    episodeCounter ++
                end for
                seasonData = GetItemData(season)
                ' populate season's children field with its episodes
                ' as a result season's ContentNode will contain episode's nodes
                seasonData.children = episodes
                ' set content type for season object to represent it on the screen as section with episodes
                seasonData.contentType = "section"
                seasonsArray.Push(seasonData)
            end if
        end for
    end if
    return seasonsArray
end function