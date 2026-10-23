function TestSuite__Main() as object
  ' Inherit test suite from BaseTestSuite
  this = BaseTestSuite()

  ' Test suite name for log statistics
  this.Name = "MainTestSuite"
  this.SetUp = MainTestSuite__SetUp

  ' Add tests to suite's tests collection
  this.addTest("InstanceMethodLogCustomEvent", TestCase__Instance_Method_Log_Custom_Event)
  this.addTest("InstanceMethodLogCustomEventProperties", TestCase__Instance_Method_Log_Custom_Event_Properties)
  this.addTest("InstanceMethodLogPurchase", TestCase__Instance_Method_Log_Purchase)
  this.addTest("InstanceMethodLogPurchaseProperties", TestCase__Instance_Method_Log_Purchase_Properties)
  this.addTest("InstanceMethodSetsLocationCustomAttribute", TestCase__Instance_Method_Sets_Location_Custom_Attribute)
  this.addTest("InstanceMethodDoesntSetInvalidLocationCustomAttribute", TestCase__Instance_Method_Doesnt_Set_Invalid_Location_Custom_Attribute)
  this.addTest("InstanceMethodIncrementsCustomUserAttribute", TestCase__Instance_Method_Increments_Custom_User_Attribute)
  this.addTest("InstanceMethodDoesntIncrementInvalidCustomUserAttribute", TestCase__Instance_Method_Doesnt_Increment_Invalid_Custom_User_Attribute)
  this.addTest("InstanceMethodAddsToCustomAttributeArray", TestCase__Instance_Method_Adds_To_Custom_Attribute_Array)
  this.addTest("InstanceMethodDoesntAddInvalidCustomAttributeArray", TestCase__Instance_Method_Doesnt_Add_Invalid_Custom_Attribute_Array)
  this.addTest("InstanceMethodRemovesFromCustomAttributeArray", TestCase__Instance_Method_Removes_From_Custom_Attribute_Array)
  this.addTest("InstanceMethodDoesntRemoveInvalidCustomAttributeArray", TestCase__Instance_Method_Doesnt_Remove_Invalid_Custom_Attribute_Array)
  this.addTest("InstanceMethodSetsCustomIntegerAttribute", TestCase__Instance_Method_Sets_Custom_Integer_Attribute)
  this.addTest("InstanceMethodSetsCustomInvalidAttribute", TestCase__Instance_Method_Sets_Custom_Invalid_Attribute)
  this.addTest("InstanceMethodSetsCustomStringAttribute", TestCase__Instance_Method_Sets_Custom_String_Attribute)
  this.addTest("InstanceMethodSetsCustomBooleanAttribute", TestCase__Instance_Method_Sets_Custom_Boolean_Attribute)
  this.addTest("InstanceMethodSetsCustomArrayOfStringsAttribute", TestCase__Instance_Method_Sets_Custom_Array_Of_Strings_Attribute)
  this.addTest("InstanceMethodDoesntSetInvalidCustomAttribute", TestCase__Instance_Method_Doesnt_Set_Invalid_Custom_Attribute)
  this.addTest("InstanceMethodSetsStringAttribute", TestCase__Instance_Method_Sets_String_Attribute)
  this.addTest("InstanceMethodDoesntSetInvalidStringAttribute", TestCase__Instance_Method_Doesnt_Set_Invalid_String_Attribute)
  this.addTest("InstanceMethodLogsIAMImpression", TestCase__Instance_Method_Logs_IAM_Impression)
  this.addTest("InstanceMethodLogsIAMControlImpression", TestCase__Instance_Method_Logs_IAM_ControlImpression)
  this.addTest("InstanceMethodDoesntLogInvalidIAMImpression", TestCase__Instance_Method_Doesnt_Log_Invalid_IAM_Impression)
  this.addTest("InstanceMethodLogsIAMClick", TestCase__Instance_Method_Logs_IAM_Click)
  this.addTest("InstanceMethodDoesntLogInvalidIAMClick", TestCase__Instance_Method_Doesnt_Log_Invalid_IAM_Click)
  this.addTest("InstanceMethodStartsSessionWithCachedId", TestCase__Instance_Method_Starts_Session_With_Cached_ID)
  this.addTest("InstanceMethodStartsSessionWithFreshId", TestCase__Instance_Method_Starts_Session_With_Fresh_ID)
  this.addTest("InstanceMethodSessionHeartBeatSavesSessionTime", TestCase__Instance_Method_Session_Heart_Beat_Saves_Session_Time)
  this.addTest("InstanceMethodEndsSession", TestCase__Instance_Method_Ends_Session)
  this.addTest("InstanceMethodDoesntEndNonexistentSession", TestCase__Instance_Method_Doesnt_End_Non_Existent_Session)
  this.addTest("InstanceMethodSetsUserId", TestCase__Instance_Method_Sets_User_ID)
  this.addTest("RefreshFeatureFlagsCallsNetwork", TestCase__RefreshFeatureFlags_calls_network)
  this.addTest("RefreshFeatureFlagsTooSoonDoesNotCallNetwork", TestCase__RefreshFeatureFlags_tooSoon_does_not_call_network)
  this.addTest("RefreshFeatureFlagsTooSoonTriggersUpdate", TestCase__RefreshFeatureFlags_tooSoon_triggers_update)
  this.addTest("RefreshFeatureFlagsWhenDisabledTriggersUpdate", TestCase__RefreshFeatureFlags_whenDisabled_triggers_update)
  this.addTest("RefreshFeatureFlagsWhenDisabledDoesNotCallNetwork", TestCase__RefreshFeatureFlags_whenDisabled_does_not_call_network)
  this.addTest("GetFeatureFlag", TestCase__GetFeatureFlag)
  this.addTest("GetFeatureFlagDoesntExist", TestCase__GetFeatureFlag_flagDoesntExist)
  this.addTest("FeatureFlag_PropertyGetters", TestCase__FeatureFlag_PropertyGetters)
  this.addTest("FeatureFlag_PropertyGettersWrongType", TestCase__FeatureFlag_PropertyGetters_wrongType)
  this.addTest("LogFeatureFlagImpression", TestCase__logFeatureFlagImpression)
  this.addTest("LogFeatureFlagImpressionWhenNoFtsSendsNothing", TestCase__logFeatureFlagImpression_whenNoFts_SendsNothing)
  this.addTest("LogFeatureFlagImpressionOnlyOncePerSession", TestCase__logFeatureFlagImpression_onlyOncePerSession)
  this.addTest("BrazeUtils.isBlankOrEmpty", TestCase__isBlankOrEmpty)
  this.addTest("AddUserAlias", TestCase__addUserAlias)
  this.addTest("UpdateTriggerWithTemplate_EmptyStringResponse_ReturnsInvalid", TestCase__UpdateTriggerWithTemplate_EmptyStringResponse_ReturnsInvalid)
  this.addTest("UpdateTriggerWithTemplate_InvalidResponse_ReturnsInvalid", TestCase__UpdateTriggerWithTemplate_InvalidResponse_ReturnsInvalid)
  this.addTest("UpdateTriggerWithTemplate_NonTemplateTrigger_ReturnsTrigger", TestCase__UpdateTriggerWithTemplate_NonTemplateTrigger_ReturnsTrigger)
  this.addTest("UpdateTriggerWithTemplate_ValidResponse_AppendsTrigger", TestCase__UpdateTriggerWithTemplate_ValidResponse_AppendsTrigger)
  this.addTest("AutomaticIamDisplayDefaultsFalse", TestCase__AutomaticIamDisplay_DefaultsFalse)
  this.addTest("AutomaticIamDisplayCanBeEnabled", TestCase__AutomaticIamDisplay_CanBeEnabled)
  this.addTest("AutomaticIamDisplayCanBeDisabled", TestCase__AutomaticIamDisplay_CanBeDisabled)
  this.addTest("DefaultIamUiAvailableUsesCachedValue", TestCase__DefaultIamUiAvailable_UsesCachedValue)
  this.addTest("SdkInAppMessageUiRejectsOldSampleComponent", TestCase__SdkInAppMessageUi_RejectsOldSampleComponent)
  this.addTest("SdkInAppMessageUiRequiresOverlayFields", TestCase__SdkInAppMessageUi_RequiresOverlayFields)
  this.addTest("OnInAppMessageReceivedLeavesFieldWhenDefaultUiMissing", TestCase__OnInAppMessageReceived_LeavesFieldWhenDefaultUiMissing)
  this.addTest("RejectedInAppMessageKeepsPendingMessage", TestCase__RejectedInAppMessage_KeepsPendingMessage)
  this.addTest("ModalInAppMessageReplacesPendingMessage", TestCase__ModalInAppMessage_ReplacesPendingMessage)
  this.addTest("RegisterInAppMessageObserverSafeWithInvalidTask", TestCase__RegisterInAppMessageObserver_SafeWithInvalidTask)
  this.addTest("BuildInAppMessageClickEvent", TestCase__BuildInAppMessageClickEvent)
  this.addTest("InAppMessageDisplayableRequiresMessage", TestCase__InAppMessageDisplayable_RequiresMessage)
  this.addTest("InAppMessageDisplayDelayIgnoresMissingAndNonPositive", TestCase__InAppMessageDisplayDelay_IgnoresMissingAndNonPositive)
  this.addTest("InAppMessageDisplayDelayReturnsPositiveSeconds", TestCase__InAppMessageDisplayDelay_ReturnsPositiveSeconds)
  this.addTest("SupportedAutomaticIamTypes", TestCase__SupportedAutomaticIamTypes)
  this.addTest("UnsupportedAutomaticIamTypes", TestCase__UnsupportedAutomaticIamTypes)
  this.addTest("UnsupportedIamTypeLogMessage", TestCase__UnsupportedIamTypeLogMessage)
  this.addTest("MissingDefaultIamUiLogMessage", TestCase__MissingDefaultIamUiLogMessage)
  this.addTest("ToColorMovesAlphaToEnd", TestCase__ToColor_MovesAlphaToEnd)
  'TODO
  ' truncate function
  ' triggers
  ' blocklist
  return this
end function


sub MainTestSuite__SetUp()
  ' Target testing object. To avoid the object creation in each test
  ' we create instance of target object here and use it in tests as m.targetTestObject.
  config = {}
  config_fields = BrazeConstants().BRAZE_CONFIG_FIELDS
  config[config_fields.API_KEY] = "SOME_API_KEY"
  config[config_fields.ENDPOINT] = "SOME_ENDPOINT"
  config[config_fields.HEARTBEAT_FREQ_IN_SECONDS] = 5
  m.port = createObject("roMessagePort")
  BrazeInit(config, m.port)
  m.brazetask = {}
  m.braze = Braze()
  m.BrazeInstance = getBrazeInstance(m.BrazeTask)
  GetGlobalAA().brazetask = m.brazetask

  'mock POST
  m.braze._privateapi.networkutil.test_network_call = []
  m.braze._privateapi.networkutil.posttourl = function(url as string, postJson as object, headers = [] as object)
    m.test_network_call.push({
      url: url,
      postJson: postJson,
      headers: headers
    })
  end function
  m.get_test_network_call = function()
    return m.braze._privateapi.networkutil.test_network_call
  end function
  m.reset_network_call = function()
    m.braze._privateapi.networkutil.test_network_call = []
  end function
end sub

' @Test
function TestCase__Instance_Method_Sets_User_ID() as string
  test_user_id = ItemGenerator("string")
  m.Braze.setUserId({ user_id: test_user_id })
  stored_user_id = m.braze._privateapi.storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.USER_ID_KEY, BrazeConstants().BRAZE_STORAGE.USER_ID_SECTION)
  return m.assertEqual(test_user_id, stored_user_id)
end function

' @Test
function TestCase__Instance_Method_Log_Custom_Event() as string
  test_event_name = ItemGenerator("string")
  args = {}
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME] = test_event_name
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES] = invalid
  m.reset_network_call()
  m.Braze.logEvent(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if

    sent_event = network_call.postjson.events[0]
    'check that we are sending a custom event, "ce"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.CUSTOM_EVENT, sent_event.name)
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME
    'check that the event name ("n") sent is test_event_name
    result += m.assertEqual(sent_event.data[field_name], test_event_name)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Log_Custom_Event_Properties() as string
  test_event_name = ItemGenerator("string")
  test_event_properties = ItemGenerator({
    some_int: "integer",
    some_string: "string",
    some_bool: "boolean"
  })
  args = {}
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME] = test_event_name
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES] = test_event_properties
  m.reset_network_call()
  m.Braze.logEvent(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a custom event, "ce"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.CUSTOM_EVENT, sent_event.name)
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME
    'check that the event name ("n") sent is test_event_name
    result += m.assertEqual(sent_event.data[field_name], test_event_name)
    'check that the event properties ("p") sent are test_event_properties
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES
    result += m.assertEqual(sent_event.data[field_name], test_event_properties)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Log_Purchase() as string
  args = {}
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID] = ItemGenerator("string")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE] = "USD"
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE] = ItemGenerator("float")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY] = ItemGenerator("integer")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES] = invalid
  m.reset_network_call()
  m.Braze.logPurchase(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a purchase, "p"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.PURCHASE, sent_event.name)
    'check that the product id ("pid") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID
    result += m.assertEqual(sent_event.data[field_name], args[field_name])
    'check that the currency code ("c") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE
    result += m.assertEqual(sent_event.data[field_name], args[field_name])
    'check that the price ("p") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE
    result += m.assertTrue(sent_event.data[field_name] = args[field_name])
    'check that the quantity ("q") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY
    result += m.assertEqual(sent_event.data[field_name], args[field_name])
    'check that the properties ("pr") are not sent
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES
    result += m.assertEqual(sent_event.data[field_name], invalid)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Log_Purchase_Properties() as string
  test_purchase_properties = ItemGenerator({
    some_int: "integer",
    some_string: "string",
    some_bool: "boolean"
  })
  args = {}
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID] = ItemGenerator("string")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE] = "USD"
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE] = ItemGenerator("float")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY] = ItemGenerator("integer")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES] = test_purchase_properties
  m.reset_network_call()
  m.Braze.logPurchase(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a purchase, "p"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.PURCHASE, sent_event.name)
    'check that the product id ("pid") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID
    result += m.assertEqual(sent_event.data[field_name], args[field_name])
    'check that the currency code ("c") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE
    result += m.assertEqual(sent_event.data[field_name], args[field_name])
    'check that the price ("p") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE
    result += m.assertTrue(sent_event.data[field_name] = args[field_name])
    'check that the quantity ("q") sent is set correctly
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY
    result += m.assertEqual(sent_event.data[field_name], args[field_name])
    'check that the properties ("pr") are not sent
    field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES
    result += m.assertEqual(sent_event.data[field_name], test_purchase_properties)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Sets_Location_Custom_Attribute() as string
  test_key = ItemGenerator("string")
  test_lat = 40.7128
  test_lon = -74.0060
  args = {
    key: test_key,
    lat: test_lat,
    lon: test_lon
  }
  m.reset_network_call()
  m.Braze.setLocationCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a location custom attribute, "lcaa"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.LOCATION_CUSTOM_ATTRIBUTE_ADD, sent_event.name)
    'check that the key sent is test_key
    result += m.assertEqual(sent_event.data["key"], test_key)
    'check that the lat sent is test_lat
    result += m.assertTrue(sent_event.data["latitude"] = test_lat)
    'check that the lon sent is test_lon
    result += m.assertTrue(sent_event.data["longitude"] = test_lon)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Set_Invalid_Location_Custom_Attribute() as string
  test_key = ItemGenerator("string")
  test_lat = 200.1234
  test_lon = -74.0060
  args = {
    key: test_key,
    lat: test_lat,
    lon: test_lon
  }
  m.reset_network_call()
  m.Braze.setLocationCustomAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Increments_Custom_User_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.incrementCustomUserAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending an increment custom attribute, "inc"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.INCREMENT_CUSTOM_ATTRIBUTE, sent_event.name)
    'check that the key sent is test_key
    result += m.assertEqual(sent_event.data["key"], test_key)
    'check that the value sent is test_value
    result += m.assertEqual(sent_event.data["value"], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Increment_Invalid_Custom_User_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.incrementCustomUserAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Adds_To_Custom_Attribute_Array() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.addToCustomAttributeArray(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending an increment custom attribute, "add"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.ADD_CUSTOM_ATTRIBUTE_ARRAY, sent_event.name)
    'check that the key sent is test_key
    result += m.assertEqual(sent_event.data["key"], test_key)
    'check that the value sent is test_value
    result += m.assertEqual(sent_event.data["value"], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Add_Invalid_Custom_Attribute_Array() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.addToCustomAttributeArray(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Removes_From_Custom_Attribute_Array() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.removeFromCustomAttributeArray(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending an increment custom attribute, "rem"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.REMOVE_CUSTOM_ATTRIBUTE_ARRAY, sent_event.name)
    'check that the key sent is test_key
    result += m.assertEqual(sent_event.data["key"], test_key)
    'check that the value sent is test_value
    result += m.assertEqual(sent_event.data["value"], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Remove_Invalid_Custom_Attribute_Array() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.removeFromCustomAttributeArray(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Integer_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0].custom
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Invalid_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0].custom
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_String_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0].custom
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Float_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("float")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0].custom
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Boolean_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("boolean")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0].custom
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Array_Of_Strings_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = [ItemGenerator("string"), ItemGenerator("string"), ItemGenerator("string"), ItemGenerator("string")]
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0].custom
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Set_Invalid_Custom_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = [ItemGenerator("boolean"), ItemGenerator("integer"), ItemGenerator("string"), ItemGenerator("string")]
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setCustomAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_String_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setStringAttribute(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.attributes = invalid
      continue for
    end if

    sent_attribute = network_call.postjson.attributes[0]
    'check that the key and value are set correctly
    result = m.assertEqual(sent_attribute[test_key], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Set_Invalid_String_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.setStringAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Logs_IAM_Impression() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.logIAMImpression(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending an iam impression, "si"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.IAM_IMPRESSION, sent_event.name)
    'check that the trigger id sent is set correctly
    result += m.assertEqual(sent_event.data["trigger_ids"][0], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Log_Invalid_IAM_Impression() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.logIAMImpression(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Logs_IAM_ControlImpression() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.logIAMControlImpression(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending an iam impression, "iec"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.IAM_CONTROL_IMPRESSION, sent_event.name)
    'check that the trigger id sent is set correctly
    result += m.assertEqual(sent_event.data["trigger_ids"][0], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Logs_IAM_Click() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.logIAMClick(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending an iam click, "sc"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.IAM_CLICK, sent_event.name)
    'check that the trigger id sent is set correctly
    result += m.assertEqual(sent_event.data["trigger_ids"][0], test_value)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_Log_Invalid_IAM_Click() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.reset_network_call()
  m.Braze.logIAMClick(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Starts_Session_With_Cached_ID() as string
  args = {}
  test_session_id = "422f636b-fdf2-48c4-8d0f-63ecc9b44ce7"
  m.Braze._privateapi.dataprovider.cachedsessionid = test_session_id
  m.reset_network_call()
  m.Braze.sessionStart(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a session start, "ss"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.SESSION_START, sent_event.name)
    'check that the session id sent is set correctly
    result += m.assertEqual(sent_event.session_id, test_session_id)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Starts_Session_With_Fresh_ID() as string
  args = {}
  m.Braze._privateapi.dataprovider.cachedsessionid = invalid
  m.reset_network_call()
  m.Braze.sessionStart(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a session start, "ss"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.SESSION_START, sent_event.name)
    'check that the session id is a string and 36 char long (UUID)
    result += m.assertEqual(sent_event.session_id.len(), 36)
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Session_Heart_Beat_Saves_Session_Time() as string
  args = {}
  ' get previous timestamp
  sec = CreateObject("roRegistrySection", "braze.section.session")
  previous_timestamp = sec.Read("end")
  m.Braze.sessionHeartBeat(args)
  new_timestamp = sec.Read("end")
  'check that timestamp was updated
  result = m.assertTrue(new_timestamp > previous_timestamp)
  return result
end function

' @Test
function TestCase__Instance_Method_Ends_Session() as string
  args = {}
  test_session_id = "422f636b-fdf2-48c4-8d0f-63ecc9b44ce7"
  sec = CreateObject("roRegistrySection", "braze.section.session")
  sec.Write("uuid", test_session_id)
  sec.Write("start", "0")
  sec.Write("end", "1000")
  sec.Flush()
  m.reset_network_call()
  m.Braze.sessionEnd(args)
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if
    sent_event = network_call.postjson.events[0]
    'check that we are sending a session start, "ss"
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.SESSION_END, sent_event.name)
    'check that the session id sent is set correctly
    result += m.assertEqual(sent_event.session_id, test_session_id)
    'check previous session data is cleared
    result += m.assertEqual(sec.Read("uuid"), "")
    result += m.assertEqual(sec.Read("start"), "")
    result += m.assertEqual(sec.Read("end"), "")
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__Instance_Method_Doesnt_End_Non_Existent_Session() as string
  args = {}
  sec = CreateObject("roRegistrySection", "braze.section.session")
  sec.Delete("uuid")
  sec.Delete("start")
  sec.Delete("end")
  sec.Flush()
  m.reset_network_call()
  m.Braze.sessionEnd(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertEqual(test_network_call.count(), 0)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__RefreshFeatureFlags_calls_network() as string
  m.reset_network_call()
  m.Braze.refreshFeatureFlags({})
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.url = "SOME_ENDPOINTapi/v3/feature_flags/sync"
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__RefreshFeatureFlags_tooSoon_does_not_call_network() as string
  m.braze._privateapi.dataprovider.cachedconfig.feature_flags_last_update = Braze()._privateApi.timeUtils.getCurrentTimeSeconds() - 1
  m.braze._privateapi.dataprovider.cachedconfig.feature_flags_rate_limit = 300
  m.reset_network_call()
  m.Braze.refreshFeatureFlags({})
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.url = "SOME_ENDPOINTapi/v3/feature_flags/sync"
      return "failure"
    end if
  end for
  m.reset_network_call()
  return ""
end function

' @Test
function TestCase__RefreshFeatureFlags_whenDisabled_does_not_call_network() as string
  m.braze._privateapi.dataprovider.cachedconfig.feature_flags_enabled = false
  m.reset_network_call()
  m.Braze.refreshFeatureFlags({})
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.url = "SOME_ENDPOINTapi/v3/feature_flags/sync"
      return "failure"
    end if
  end for
  m.reset_network_call()
  return ""
end function

' @Test
function TestCase__RefreshFeatureFlags_tooSoon_triggers_update() as string
  m.braze._privateapi.dataprovider.cachedconfig.feature_flags_last_update = Braze()._privateApi.timeUtils.getCurrentTimeSeconds() - 1
  m.braze._privateapi.dataprovider.cachedconfig.feature_flags_rate_limit = 300
  GetGlobalAA().brazetask.BrazeFeatureFlagsUpdated = false
  m.Braze.refreshFeatureFlags({})
  if GetGlobalAA().brazetask.BrazeFeatureFlagsUpdated <> true
    return "failure"
  end if
  return ""
end function

' @Test
function TestCase__RefreshFeatureFlags_whenDisabled_triggers_update() as string
  m.braze._privateapi.dataprovider.cachedconfig.feature_flags_enabled = false
  GetGlobalAA().brazetask.BrazeFeatureFlagsUpdated = false
  m.Braze.refreshFeatureFlags({})
  if GetGlobalAA().brazetask.BrazeFeatureFlagsUpdated <> true
    return "failure"
  end if
  return ""
end function

' @Test
function TestCase__GetFeatureFlag() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "testProps",
      enabled: true,
      properties: {
        "booleanProp": {
          type: "boolean",
          value: true
        },
        "stringProp": {
          type: "string",
          value: "imastring"
        },
        "intProp": {
          type: "number",
          value: 129
        },
        "floatProp": {
          type: "number",
          value: 1.29
        }
      }
    }
  ]

  ff = m.Brazeinstance.getFeatureFlag("testProps")
  result = m.AssertTrue(ff.enabled)
  return result
end function

' @Test
function TestCase__GetFeatureFlag_flagDoesntExist() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "testProps",
      enabled: true,
      properties: {
        "booleanProp": {
          type: "boolean",
          value: true
        },
        "stringProp": {
          type: "string",
          value: "imastring"
        },
        "intProp": {
          type: "number",
          value: 129
        },
        "floatProp": {
          type: "number",
          value: 1.29
        }
      }
    }
  ]

  ff = m.Brazeinstance.getFeatureFlag("flagDoesntExist")
  result = m.assertInvalid(ff)
  return result
end function

' @Test
function TestCase__FeatureFlag_PropertyGetters() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "testProps",
      enabled: true,
      properties: {
        "booleanProp": {
          type: "boolean",
          value: true
        },
        "stringProp": {
          type: "string",
          value: "imastring"
        },
        "intProp": {
          type: "number",
          value: 129
        },
        "floatProp": {
          type: "number",
          value: 1.29
        },
        "timeProp": {
          type: "datetime",
          value: "1716608700000"
        },
        "imageProp": {
          type: "image",
          value: "https://www.braze.com/braze.png"
        },
        "jsonProp": {
          type: "jsonobject",
          value: {
            a: "aye",
            b: 2,
            c: {
              c1: "c1",
              c2: "c2"
            }
          }
        }
      }
    }
  ]

  ff = m.Brazeinstance.getFeatureFlag("testProps")
  stringVal = ff.getStringProperty("stringProp")
  booleanVal = ff.getBooleanProperty("booleanProp")
  intVal = ff.getNumberProperty("intProp")
  floatVal = ff.getNumberProperty("floatProp")
  imageVal = ff.getImageProperty("imageProp")
  timeVal = ff.getTimestampProperty("timeProp")
  jsonVal = ff.getJSONProperty("jsonProp")

  result = m.AssertEqual(stringVal, "imastring")
  result += m.AssertTrue(booleanVal)
  result += m.AssertEqual(intVal, 129)
  result += m.AssertEqual(floatVal, 1.29)
  result += m.AssertEqual(imageVal, "https://www.braze.com/braze.png")
  result += m.AssertEqual(timeVal, "1716608700000")
  result += m.AssertEqual(jsonVal.a, "aye")
  result += m.AssertEqual(jsonVal.b, 2)
  result += m.AssertEqual(jsonVal.c.c1, "c1")
  result += m.AssertEqual(jsonVal.c.c2, "c2")
  return result
end function

' @Test
function TestCase__FeatureFlag_PropertyGetters_wrongType() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "testProps",
      enabled: true,
      properties: {
        "booleanProp": {
          type: "boolean",
          value: true
        },
        "stringProp": {
          type: "string",
          value: "imastring"
        },
        "intProp": {
          type: "number",
          value: 129
        },
        "floatProp": {
          type: "number",
          value: 1.29
        }
      }
    }
  ]

  ff = m.Brazeinstance.getFeatureFlag("testProps")
  result = m.assertInvalid(ff.getStringProperty("booleanProp"))
  result += m.assertInvalid(ff.getBooleanProperty("intProp"))
  result += m.assertInvalid(ff.getNumberProperty("stringProp"))
  result += m.assertInvalid(ff.getImageProperty("booleanProp"))
  result += m.assertInvalid(ff.getTimestampProperty("booleanProp"))
  result += m.assertInvalid(ff.getJSONProperty("booleanProp"))
  return result
end function

' @Test
function TestCase__logFeatureFlagImpression() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "hasFts",
      enabled: true,
      properties: {},
      fts: "myFts"
    }
  ]

  m.reset_network_call()
  m.Braze.logFeatureFlagImpression({ ffId: "hasFts" })
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if

    sent_event = network_call.postjson.events[0]
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.FF_IMPRESSION, sent_event.name)
    result += m.assertEqual(sent_event.data[BrazeConstants().FF_IMPRESSION_EVENT_FIELDS.FID], "hasFts")
    result += m.assertEqual(sent_event.data[BrazeConstants().FF_IMPRESSION_EVENT_FIELDS.FTS], "myFts")
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__logFeatureFlagImpression_whenNoFts_SendsNothing() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "hasFts",
      enabled: true,
      properties: {},
      fts: "myFts"
    },
    {
      id: "noFts",
      enabled: true,
      properties: {}
    }
  ]

  m.reset_network_call()
  m.Braze.logFeatureFlagImpression({ ffId: "noFts" })
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if

    sent_event = network_call.postjson.events[0]
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.FF_IMPRESSION, sent_event.name)
    if result = ""
      m.reset_network_call()
      return "failure"
    end if
  end for
  m.reset_network_call()
  return ""
end function

' @Test
function TestCase__logFeatureFlagImpression_onlyOncePerSession() as string
  m.brazeTask.BrazeFeatureFlags = [
    {
      id: "hasFts",
      enabled: true,
      properties: {},
      fts: "myFts"
    }
  ]

  m.Braze.logFeatureFlagImpression({ ffId: "hasFts" })
  m.reset_network_call()
  m.Braze.logFeatureFlagImpression({ ffId: "hasFts" })
  test_network_call = m.get_test_network_call()
  result = ""
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if

    sent_event = network_call.postjson.events[0]
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.FF_IMPRESSION, sent_event.name)
    result += m.assertEqual(sent_event.data[BrazeConstants().FF_IMPRESSION_EVENT_FIELDS.FID], "hasFts")
    result += m.assertEqual(sent_event.data[BrazeConstants().FF_IMPRESSION_EVENT_FIELDS.FTS], "myFts")
    if result = ""
      m.reset_network_call()
      return "failure"
    end if
  end for
  m.reset_network_call()
  return ""
end function

' @Test
function TestCase__isBlankOrEmpty() as string
  utils = Braze()._privateApi.brazeUtils
  result = m.AssertTrue(utils.isBlankOrEmpty(""))
  result += m.AssertTrue(utils.isBlankOrEmpty(" "))
  result += m.AssertTrue(utils.isBlankOrEmpty("  "))
  result += m.AssertFalse(utils.isBlankOrEmpty("a "))
  result += m.AssertFalse(utils.isBlankOrEmpty(" a"))
  result += m.AssertFalse(utils.isBlankOrEmpty(" a "))
  result += m.AssertFalse(utils.isBlankOrEmpty("  a "))
  result += m.AssertFalse(utils.isBlankOrEmpty("   a"))
  result += m.AssertFalse(utils.isBlankOrEmpty("abcdef"))
  result += m.AssertTrue(utils.isBlankOrEmpty(invalid))
  return result
end function

' @Test
function TestCase__addUserAlias() as string
  m.reset_network_call()
  m.Braze.addUserAlias({ alias: "myAlias", label: "myLabel" })
  test_network_call = m.get_test_network_call()
  for each network_call in test_network_call
    if network_call.postjson = invalid or network_call.postjson.events = invalid
      continue for
    end if

    sent_event = network_call.postjson.events[0]
    result = m.assertEqual(BrazeConstants().EVENT_TYPES.USER_ALIAS, sent_event.name)
    result += m.assertEqual(sent_event.data[BrazeConstants().USER_ALIAS_EVENT_FIELDS.ALIAS_ID], "myAlias")
    result += m.assertEqual(sent_event.data[BrazeConstants().USER_ALIAS_EVENT_FIELDS.LABEL_ID], "myLabel")
    if result = ""
      m.reset_network_call()
      return ""
    end if
  end for
  m.reset_network_call()
  return "failure"
end function

' @Test
function TestCase__UpdateTriggerWithTemplate_EmptyStringResponse_ReturnsInvalid() as string
  trigger = { template_only: true, trigger_id: "test_trigger_id" }
  original_request_template = Braze()._privateapi.eventhandler.requestTemplate

  Braze()._privateapi.eventhandler.requestTemplate = function(trigger_id as string, trigger_event_type as string, data = invalid as dynamic)
    return ""
  end function

  result_trigger = Braze()._privateapi.brazeutils.updateTriggerWithTemplate(trigger, "custom_event", {})
  Braze()._privateapi.eventhandler.requestTemplate = original_request_template
  return m.assertInvalid(result_trigger)
end function

' @Test
function TestCase__UpdateTriggerWithTemplate_InvalidResponse_ReturnsInvalid() as string
  trigger = { template_only: true, trigger_id: "test_trigger_id" }
  original_request_template = Braze()._privateapi.eventhandler.requestTemplate

  Braze()._privateapi.eventhandler.requestTemplate = function(trigger_id as string, trigger_event_type as string, data = invalid as dynamic)
    return invalid
  end function

  result_trigger = Braze()._privateapi.brazeutils.updateTriggerWithTemplate(trigger, "custom_event", {})
  Braze()._privateapi.eventhandler.requestTemplate = original_request_template
  return m.assertInvalid(result_trigger)
end function

' @Test
function TestCase__UpdateTriggerWithTemplate_NonTemplateTrigger_ReturnsTrigger() as string
  trigger = { template_only: false, trigger_id: "test_trigger_id" }
  result_trigger = Braze()._privateapi.brazeutils.updateTriggerWithTemplate(trigger, "custom_event", {})
  result = m.assertNotInvalid(result_trigger)
  result += m.assertEqual(result_trigger.trigger_id, "test_trigger_id")
  return result
end function

' @Test
function TestCase__UpdateTriggerWithTemplate_ValidResponse_AppendsTrigger() as string
  trigger = { template_only: true, trigger_id: "test_trigger_id" }
  original_request_template = Braze()._privateapi.eventhandler.requestTemplate

  template_data = {
    templated_message: {
      data: {
        message: "hello",
        type: "SLIDEUP",
        trigger_id: "test_trigger_id",
        extras: {},
        header: "",
        image_url: "",
        is_control: false,
        uri: "",
        duration: 5000,
        click_action: "NONE",
        message_close: "AUTO_DISMISS"
      },
      type: "inapp"
    }
  }
  mock_response = FormatJson(template_data)

  Braze()._privateapi.eventhandler.mock_response = mock_response
  Braze()._privateapi.eventhandler.requestTemplate = function(trigger_id as string, trigger_event_type as string, data = invalid as dynamic)
    return m.mock_response
  end function

  result_trigger = Braze()._privateapi.brazeutils.updateTriggerWithTemplate(trigger, "custom_event", {})
  Braze()._privateapi.eventhandler.requestTemplate = original_request_template

  result = m.assertNotInvalid(result_trigger)
  result += m.assertEqual(result_trigger.message, "hello")
  result += m.assertEqual(result_trigger.message_type, "SLIDEUP")
  return result
end function

' @Test
function TestCase__AutomaticIamDisplay_DefaultsFalse() as string
  aa = GetGlobalAA()
  original_global = aa.global
  aa.global = invalid
  result = m.assertFalse(BrazeIsAutomaticInAppMessageDisplayEnabled())
  aa.global = { brazeConfig: {} }
  result += m.assertFalse(BrazeIsAutomaticInAppMessageDisplayEnabled())
  aa.global = original_global
  return result
end function

' @Test
function TestCase__AutomaticIamDisplay_CanBeEnabled() as string
  aa = GetGlobalAA()
  original_global = aa.global
  config = {}
  config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = true
  aa.global = { brazeConfig: config }
  result = m.assertTrue(BrazeIsAutomaticInAppMessageDisplayEnabled())
  aa.global = original_global
  return result
end function

' @Test
function TestCase__AutomaticIamDisplay_CanBeDisabled() as string
  aa = GetGlobalAA()
  original_global = aa.global
  config = {}
  config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = false
  aa.global = { brazeConfig: config }
  result = m.assertFalse(BrazeIsAutomaticInAppMessageDisplayEnabled())
  aa.global = original_global
  return result
end function

' @Test
function TestCase__DefaultIamUiAvailable_UsesCachedValue() as string
  aa = GetGlobalAA()
  original = aa.brazeDefaultIamUiAvailable
  aa.brazeDefaultIamUiAvailable = false
  result = m.assertFalse(BrazeIsDefaultInAppMessageUiAvailable())
  aa.brazeDefaultIamUiAvailable = true
  result += m.assertTrue(BrazeIsDefaultInAppMessageUiAvailable())
  aa.brazeDefaultIamUiAvailable = original
  return result
end function

function iamUiStub(hasOverlayFields as boolean) as object
  return {
    hasOverlay: hasOverlayFields
    hasField: function(name as string) as boolean
      if name = "isClosed" or name = "pendingClickEvent" then return m.hasOverlay
      return name = "inappmessage" or name = "BrazeTask"
    end function
  }
end function

' @Test
function TestCase__SdkInAppMessageUi_RejectsOldSampleComponent() as string
  result = m.assertFalse(BrazeIsSdkInAppMessageUi(invalid))
  result += m.assertFalse(BrazeIsSdkInAppMessageUi({}))
  result += m.assertFalse(BrazeIsSdkInAppMessageUi(iamUiStub(false)))
  return result
end function

' @Test
function TestCase__SdkInAppMessageUi_RequiresOverlayFields() as string
  return m.assertTrue(BrazeIsSdkInAppMessageUi(iamUiStub(true)))
end function

' @Test
function TestCase__OnInAppMessageReceived_LeavesFieldWhenDefaultUiMissing() as string
  aa = GetGlobalAA()
  original_global = aa.global
  original_available = aa.brazeDefaultIamUiAvailable
  original_task = aa.brazeTaskForInAppMessage
  config = {}
  config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = true
  aa.global = { brazeConfig: config }
  aa.brazeDefaultIamUiAvailable = false
  message = { message: "hello", message_type: "MODAL" }
  aa.brazeTaskForInAppMessage = { BrazeInAppMessage: message }
  BrazeOnInAppMessageReceived()
  result = m.assertEqual(aa.brazeTaskForInAppMessage.BrazeInAppMessage.message, "hello")
  aa.global = original_global
  aa.brazeDefaultIamUiAvailable = original_available
  aa.brazeTaskForInAppMessage = original_task
  return result
end function

function receiveWithPendingInAppMessage(incoming as object) as object
  aa = GetGlobalAA()
  original_global = aa.global
  original_available = aa.brazeDefaultIamUiAvailable
  original_task = aa.brazeTaskForInAppMessage
  config = {}
  config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = true
  config[BrazeConstants().BRAZE_CONFIG_FIELDS.LOGGING_ENABLED] = false
  aa.global = { brazeConfig: config }
  aa.brazeDefaultIamUiAvailable = true
  timer = { control: "start" }
  aa.brazePendingInAppMessage = { message: "waiting", message_type: "MODAL", display_delay: 5 }
  aa.brazeInAppMessageDelayTimer = timer
  aa.brazeTaskForInAppMessage = { BrazeInAppMessage: incoming }
  BrazeOnInAppMessageReceived()
  received = { pending: aa.brazePendingInAppMessage, timer_control: timer.control }
  BrazeCancelPendingInAppMessage()
  aa.global = original_global
  aa.brazeDefaultIamUiAvailable = original_available
  aa.brazeTaskForInAppMessage = original_task
  return received
end function

' @Test
function TestCase__RejectedInAppMessage_KeepsPendingMessage() as string
  unsupported = receiveWithPendingInAppMessage({ message: "slideup", message_type: "SLIDEUP" })
  result = m.assertNotInvalid(unsupported.pending)
  result += m.assertEqual(unsupported.timer_control, "start")
  empty = receiveWithPendingInAppMessage({ message_type: "MODAL" })
  result += m.assertNotInvalid(empty.pending)
  result += m.assertEqual(empty.timer_control, "start")
  return result
end function

' @Test
function TestCase__ModalInAppMessage_ReplacesPendingMessage() as string
  replaced = receiveWithPendingInAppMessage({ message: "later", message_type: "MODAL" })
  result = m.assertInvalid(replaced.pending)
  result += m.assertEqual(replaced.timer_control, "stop")
  return result
end function

' @Test
function TestCase__RegisterInAppMessageObserver_SafeWithInvalidTask() as string
  result = m.assertFalse(BrazeRegisterInAppMessageObserver(invalid))
  result += m.assertFalse(BrazeRegisterInAppMessageObserver({}))
  return result
end function

' @Test
function TestCase__BuildInAppMessageClickEvent() as string
  bodyEvent = BrazeBuildInAppMessageClickEvent({ message: "hi", click_action: "URI", uri: "roku://home" }, -1)
  result = m.assertInvalid(bodyEvent.button)
  result += m.assertEqual(bodyEvent.button_index, -1)
  result += m.assertEqual(bodyEvent.in_app_message.uri, "roku://home")

  button = { text: "Go", click_action: "URI", uri: "roku://details", id: 0 }
  buttonEvent = BrazeBuildInAppMessageClickEvent({ message: "hi", buttons: [button] }, 0)
  result += m.assertEqual(buttonEvent.button.uri, "roku://details")
  result += m.assertEqual(buttonEvent.button_index, 0)

  missingEvent = BrazeBuildInAppMessageClickEvent({ message: "hi", buttons: [button] }, 1)
  result += m.assertInvalid(missingEvent.button)
  return result
end function

' @Test
function TestCase__InAppMessageDisplayable_RequiresMessage() as string
  result = m.assertFalse(BrazeIsInAppMessageDisplayable(invalid))
  result += m.assertFalse(BrazeIsInAppMessageDisplayable({}))
  result += m.assertTrue(BrazeIsInAppMessageDisplayable({ message: "hello" }))
  return result
end function

' @Test
function TestCase__InAppMessageDisplayDelay_IgnoresMissingAndNonPositive() as string
  result = m.assertEqual(BrazeGetInAppMessageDisplayDelay(invalid), 0)
  result += m.assertEqual(BrazeGetInAppMessageDisplayDelay({}), 0)
  result += m.assertEqual(BrazeGetInAppMessageDisplayDelay({ display_delay: 0 }), 0)
  result += m.assertEqual(BrazeGetInAppMessageDisplayDelay({ display_delay: -1 }), 0)
  return result
end function

' @Test
function TestCase__InAppMessageDisplayDelay_ReturnsPositiveSeconds() as string
  result = m.assertEqual(BrazeGetInAppMessageDisplayDelay({ display_delay: 5 }), 5)
  return result
end function

' @Test
function TestCase__SupportedAutomaticIamTypes() as string
  result = m.assertTrue(BrazeIsSupportedAutomaticInAppMessageType("MODAL"))
  return result
end function

' @Test
function TestCase__UnsupportedAutomaticIamTypes() as string
  result = m.assertFalse(BrazeIsSupportedAutomaticInAppMessageType(invalid))
  result += m.assertFalse(BrazeIsSupportedAutomaticInAppMessageType("SLIDEUP"))
  result += m.assertFalse(BrazeIsSupportedAutomaticInAppMessageType("MODAL_STYLED"))
  result += m.assertFalse(BrazeIsSupportedAutomaticInAppMessageType("FULL"))
  result += m.assertFalse(BrazeIsSupportedAutomaticInAppMessageType("HTML"))
  result += m.assertFalse(BrazeIsSupportedAutomaticInAppMessageType("HTML_FULL"))
  return result
end function

' @Test
function TestCase__UnsupportedIamTypeLogMessage() as string
  printed = BrazeGetUnsupportedInAppMessageLogMessage("SLIDEUP")
  result = m.assertTrue(Instr(1, printed, "SLIDEUP") > 0)
  result += m.assertTrue(Instr(1, printed, "not supported") > 0)
  htmlPrinted = BrazeGetUnsupportedInAppMessageLogMessage("HTML_FULL")
  result += m.assertTrue(Instr(1, htmlPrinted, "HTML_FULL") > 0)
  result += m.assertTrue(Instr(1, htmlPrinted, "not supported") > 0)
  return result
end function

' @Test
function TestCase__MissingDefaultIamUiLogMessage() as string
  printed = BrazeGetMissingDefaultInAppMessageUiLogMessage()
  result = m.assertTrue(Instr(1, printed, "BrazeDefaultInAppMessage") > 0)
  result += m.assertTrue(Instr(1, printed, "automatic_iam_display") > 0)
  return result
end function

' @Test
function TestCase__ToColor_MovesAlphaToEnd() as string
  utils = Braze()._privateApi.brazeUtils
  ' Payload colors are ARGB, e.g. dashboard #1B78CF arrives as 0xFF1B78CF.
  colors = ParseJson("[4279990479, 3204448256, 0]")
  result = m.assertInvalid(utils.toColor(invalid))
  result += m.assertEqual(LCase(utils.toColor(colors[0])), "0x1b78cfff")
  result += m.assertEqual(LCase(utils.toColor(colors[1])), "0x000000bf")
  result += m.assertEqual(LCase(utils.toColor(colors[2])), "0x00000000")
  return result
end function