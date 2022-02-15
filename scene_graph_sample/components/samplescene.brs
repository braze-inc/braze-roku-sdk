sub Init()
  m.BrazeTask = CreateObject("roSGNode", "BrazeTask")
  m.Braze = getBrazeInstance(m.BrazeTask)
  m.buttonGroup = m.top.FindNode("sampleButtonGroup")
  m.buttonGroup.buttons = ["Set User ID", "Trigger IAM", "Send Custom Events and Purchases", "Set Custom and Default Attributes", "Increment Custom Attribute", "Add To Custom Attribute Array"]
  m.buttonGroup.ObserveField("buttonSelected", "onButtonSelected")
  examplerect = m.buttonGroup.BoundingRect()
  centerx = (1280 - examplerect.width) / 2
  centery = (720 - examplerect.height) / 2
  m.buttonGroup.translation = [centerx, centery]
  m.buttonGroup.SetFocus(true)
  m.userIdLabel = m.top.FindNode("userIdLabel")
  m.BrazeTask.ObserveField("BrazeInAppMessage", "onInAppMessageTriggered")

  m.greenPalette = createObject("roSGNode", "RSGPalette")
  m.greenPalette.colors = { DialogBackgroundColor: "0x004000FF",
  PrimaryTextColor: "0x00EF00FF",
  FocusColor: "0x00EF00FF",
  DialogItemColor: "0x00EF00FF",
  DialogTextColor: "0x00EF00FF",
  DialogFocusColor: "0x00EF00FF",
  DialogFocusItemColor: "0x007E00FF",
  DialogSecondaryTextColor: "0x00EF0066",
  DialogSecondaryItemColor: "0x80FF804D",
  DialogInputFieldColor: "0x80FF8080",
  DialogKeyboardColor: "0x80FF804D",
  DialogFootprintColor: "0x80FF804D" }
  
  ' This is where we could set the whole palette color for the dialogs
  'm.top.palette = m.greenPalette

  ' Set the userID if we have it (this is from the sample app level, not Braze level)
  userId = getStoredUserId()
  if userId <> "" 
    m.Braze.setUserId(userId)
    m.userIdLabel.text = "User ID initialized to: " + userId
  else
    m.userIdLabel.text = "No userID currently set"
  endif
end sub
  
Function getStoredUserId() As Dynamic
  sec = CreateObject("roRegistrySection", "user")
  if sec.Exists("userid")
    return sec.Read("userid")
  endif
  return ""
End Function
  
Function setStoredUserId(userId As String) As Void
  sec = CreateObject("roRegistrySection", "user")
  sec.Write("userid", userId)
  sec.Flush()
End Function
  
sub promptForUserId() 
  m.userdialog = createObject("roSGNode", "StandardKeyboardDialog")
  m.userdialog.title = "Braze UserID"
  m.userdialog.buttons = ["OK"]
  userId = getStoredUserId()
  m.userdialog.text = userId
  m.userdialog.textEditBox.cursorPosition = len(userId)
  m.userdialog.observeFieldScoped("buttonSelected", "userIdPromptDismissed")
  m.top.dialog = m.userdialog
end sub
  
sub userIdPromptDismissed()
  userid = m.userdialog.text
  setStoredUserId(userid)
  m.Braze.setUserId(userId)
  m.userIdLabel.text = "User ID Changed to: " + userId
  m.userdialog.close = true
end sub

sub OnButtonSelected()
  button_selected_string = m.buttonGroup.buttons[m.buttonGroup.buttonSelected]
  if button_selected_string = "Set User ID"
    promptForUserID()
  else if button_selected_string = "Trigger IAM"
    m.Braze.logPurchase("product1", "USD", 5.0, 2, { "stringPropKey1": "stringPropValue1", "intProp": 9001 })
  else if button_selected_string = "Send Custom Events and Purchases"
    m.Braze.logEvent("event1")
    m.Braze.logEvent("event2", { "stringPropKey1": "stringPropValue1", "intProp": 9001, "boolProp": true })
    m.Braze.logEvent("event3", { "stringPropKey1": "stringPropValue1", "intProp": 9001 })
    m.Braze.logPurchase("purchase1", "USD", 5.0, 2)
    m.Braze.logPurchase("purchase2", "USD", 5.0, 2, { "stringPropKey1": "stringPropValue1", "intProp": 9001 })
    m.Braze.logPurchase("purchase3", "USD", 5.0, 2, { "stringPropKey1": "stringPropValue1", "intProp": 9001 })
  else if button_selected_string = "Set Custom and Default Attributes"
    stringArray = CreateObject("roArray", 3, true)
    stringArray.Push("string1")
    stringArray.Push("string2")
    stringArray.Push("string3")
    m.Braze.setCustomAttribute("arrayAttribute", stringArray)
    m.Braze.setCustomAttribute("favoriteFood", "lasagna")
    m.Braze.setCustomAttribute("coolness", "high")
    m.Braze.setCustomAttribute("coolness2", "high")
    m.Braze.setCustomAttribute("intAttribute", 5)
    m.Braze.setCustomAttribute("intAttribute2", 25)
    m.Braze.setCustomAttribute("floatAttribute", 3.5)
    m.Braze.setCustomAttribute("floatAttribute2", 4.5)
    m.Braze.setCustomAttribute("boolAttribute", true)
    m.Braze.setCustomAttribute("boolAttribute2", false)
    dateAttribute = CreateObject("roDateTime")
    dateAttribute.FromISO8601String("1992-11-29 00:00:00.000")
    m.Braze.setCustomAttribute("dateAttribute", dateAttribute)
    m.Braze.unsetCustomAttribute("coolness")
    m.Braze.unsetCustomAttribute("coolness2")
    m.Braze.setLocationCustomAttribute("location", 40.25, 50.22)
    m.Braze.setLocationCustomAttribute("location2", 43.25, 53.22)
    m.Braze.setFirstName("First")
    m.Braze.setLastName("Last")
    m.Braze.setEmail("email@mail.com")
    dob = CreateObject("roDateTime")
    dob.FromISO8601String("1990-04-13 00:00:00.000")
    m.Braze.setDateOfBirth(dob)
    m.Braze.setCountry("Mexico")
    m.Braze.setLanguage("es")
    m.Braze.setHomeCity("Manilla")
    m.Braze.setGender("o")
    m.Braze.setPhoneNumber("123456789")
    m.Braze.setEmailSubscriptionState(BrazeConstants().SUBSCRIPTION_STATES.OPTED_IN)
    m.Braze.setPushNotificationSubscriptionState(BrazeConstants().SUBSCRIPTION_STATES.OPTED_IN)
    m.Braze.setAvatarImageUrl("https://pbs.twimg.com/profile_images/1017436259462139904/LeAx7u5v_400x400.jpg")
  else if button_selected_string = "Increment Custom Attribute"
    m.Braze.incrementCustomUserAttribute("numberOfSocks", 3)
  else if button_selected_string = "Add To Custom Attribute Array"
    m.Braze.addToCustomAttributeArray("favoriteColor", "blue")
    m.Braze.addToCustomAttributeArray("favoriteColor", "yellow")
    m.Braze.addToCustomAttributeArray("favoriteColor", "red")
    m.Braze.addToCustomAttributeArray("favoriteColor2", "red")
    m.Braze.removeFromCustomAttributeArray("favoriteColor", "yellow")
    m.Braze.removeFromCustomAttributeArray("favoriteColor2", "red")
  end if
end sub

sub onInAppMessageTriggered()
  in_app_message = m.BrazeTask.BrazeInAppMessage
  if in_app_message <> invalid and in_app_message.message <> invalid
    ' If in_app_message.display_delay <> 0, then handle the delay (value is in seconds)
    dialog = createObject("roSGNode", "BrazeInAppMessage")
    dialog.BrazeTask = m.Braze.BrazeTask
    dialog.inappmessage = in_app_message
    m.top.dialog = dialog
  end if
  m.BrazeTask.BrazeInAppMessage = invalid
end sub