sub init()
    m.button = m.top.findNode("brazeActionButton")
    m.button.observeFieldScoped("buttonSelected", "buttonHandler")
    m.top.observeFieldScoped("data", "OnNewData")
end sub

sub buttonHandler()
    print "HANDLER BANNER BUTTON CLICK HERE"
end sub

function OnNewData()
    data = m.top.data
    button = m.top.findNode("brazeActionButton")
    image = m.top.findNode("bannerimage")
    button.text = data.cta
    image.uri = data.bannerImg
end function
