' ********** Copyright 2022 Braze Inc.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub HandleBrazeItem(item as Object)
    if item.action = "setuserid"
        promptForUserId()
    else if item.action = "setapikey"
        promptForApiKey()
    else if item.action = "showconfig"
        showConfig()
    else if item.action = "setendpoint"
        promptForEndpoint()
    else if item.action = "logevent"
        logEvent(item.event)
    else if item.action = "logpurchase"
        logPurchase(item.purchase)
    else if item.action = "attribute"
        setAttribute(item.attribute)
    end if
end sub

sub setAttribute(attr) 
    if attr.item = "firstname"
        m.Braze.setFirstName(attr.value)
    else if attr.item = "lastname"
        m.Braze.setLastName(attr.value)
    else if attr.item = "email"
        m.Braze.setEmail(attr.value)
    end if
end sub

sub logEvent(event) 
    if event.eventData <> invalid 
        m.Braze.logEvent(event.eventName, event.eventData)
    else 
        m.Braze.logEvent(event.eventName)
    end if
end sub

sub logPurchase(purchase) 
    if purchase.purchaseData <> invalid 
        m.Braze.logPurchase(purchase.purchaseName, purchase.currency, purchase.price, purchase.quantity, purchase.purchaseData)
    else 
        m.Braze.logPurchase(purchase.purchaseName, purchase.currency, purchase.price, purchase.quantity)
    end if
end sub

sub showConfig()
    m.configdialog = createObject("roSGNode", "StandardMessageDialog")

    user = getStoredUserId()
    apikey = getStoredValue("apikey")
    apikeyRun = m.global.brazeconfig["api-key"]
    if apikey = invalid or apikey = ""
        apikey = apikeyRun
    end if

    endpoint = getStoredValue("endpoint")
    endpointRun = m.global.brazeconfig["endpoint"]

    if endpoint = invalid or endpoint = ""
        endpoint = endpointRun
    end if

    if apikey <> apikeyRun or endpoint <> endpointRun
        m.configdialog.title = "*** REBOOT NEEDED ***"
    else 
        m.configdialog.title = "Current Configuration"
    end if
    m.configdialog.message = ["UserID: " + user, "API Key: " + apikey, "Endpoint: " + endpoint]
    m.configdialog.observeFieldScoped("buttonSelected", "configInfoClosed")
    m.top.dialog = m.configdialog
end sub

sub configInfoClosed()
    m.configdialog.close = true
end sub

Function getStoredUserId() as dynamic
    return getStoredValue("userid")
end Function

Function setStoredUserId(userid as string) as dynamic
    return setStoredValue("userid", userid)
end Function

Function getStoredValue(key as string) As Dynamic
  sec = CreateObject("roRegistrySection", "user")
  if sec.Exists(key)
    return sec.Read(key)
  endif
  return ""
End Function
  
Function setStoredValue(key as String, value As String) As Void
  sec = CreateObject("roRegistrySection", "user")
  sec.Write(key, value)
  sec.Flush()
End Function


sub promptForApiKey()
    m.promptType = "apikey"
    promptForValue()
end sub

sub promptForEndpoint()
    m.promptType = "endpoint"
    promptForValue()
end sub

sub promptForUserId()
    m.promptType = "userid"
    promptForValue()
end sub

sub promptForValue()
    m.promptdialog = createObject("roSGNode", "StandardKeyboardDialog")
    currentVal = ""
    if m.promptType = "userid"
        m.promptdialog.title = "Braze UserID"
        currentVal = getStoredUserId()
    else if m.promptType = "apikey"
        m.promptdialog.title = "Braze API key"
        currentVal = getStoredValue("apikey")
        if currentVal = ""
            currentVal = m.global.brazeconfig["api-key"]
        end if
    else if m.promptType = "endpoint"
        m.promptdialog.title = "Braze Endpoint"
        currentVal = getStoredValue("endpoint")
        if currentVal = ""
            currentVal = m.global.brazeconfig["endpoint"]
        end if
    end if

    m.promptdialog.buttons = ["OK"]
    m.promptdialog.text = currentVal
    m.promptdialog.textEditBox.cursorPosition = len(currentVal)
    m.promptdialog.observeFieldScoped("buttonSelected", "promptForValueDismissed")
    m.top.dialog = m.promptdialog
end sub
    
sub promptForValueDismissed()
    newvalue = m.promptdialog.text
    if m.promptType = "userid"
        setStoredUserId(newvalue)
        m.Braze.setUserId(newvalue)
        updateOverhangUser(newvalue)
    else if m.promptType = "apikey"
        setStoredValue("apikey", newvalue)
    else if m.promptType = "endpoint"
        setStoredValue("endpoint", newvalue)
    end if
    m.promptdialog.close = true
end sub

sub updateOverhangUser(userid as String) 
    overhang = m.top.FindNode("overhang")
    if userId <> "" 
        overhang.optionsText = "User ID: " + userId
      else
        overhang.optionsText = "No userID"
      endif
end sub
