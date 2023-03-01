sub Main(args)
    if args.RunTests = "true" and Type(TestRunner) = "Function"
        Runner = TestRunner()
        Runner.SetFunctions([
          TestSuite__Main
        ])
        Runner.Run()
    end if
    ShowChannelRSGScreen()
end sub

sub ShowChannelRSGScreen()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.SetMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    ConfigureBrazeSdk(screen.getGlobalNode())
    screen.Show() 

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.IsScreenClosed() then return
        end if
    end while
end sub

sub ConfigureBrazeSdk(globalNode as object)
    config = {}
    config_fields = BrazeConstants().BRAZE_CONFIG_FIELDS

    config[config_fields.API_KEY] = "5c636baa-dfa4-453a-9484-cb6dc7727988"
    config[config_fields.ENDPOINT] = "https://sondheim.appboy.com/"
    config[config_fields.HEARTBEAT_FREQ_IN_SECONDS] = 30

    sec = CreateObject("roRegistrySection", "user")
    if sec.Exists("apikey")
        apikey = sec.Read("apikey")
        if apikey <> ""
            config[config_fields.API_KEY] = sec.Read("apikey")
        end if
    end if

    if sec.Exists("endpoint")
        endpoint = sec.Read("endpoint")
        if endpoint <> ""
            config[config_fields.ENDPOINT] = sec.Read("endpoint")
        end if
    end if

    globalNode.AddFields({ brazeConfig: config })
  end sub
