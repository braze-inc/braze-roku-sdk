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
  m.braze = Braze()
  'mock POST
  m.braze._privateapi.networkutil.posttourl = function(url as string, postJson as object, headers = [] as object)
    m.test_network_call = {
      url: url,
      postJson: postJson,
      headers: headers
    }
  end function
  m.get_test_network_call = function()
    return m.braze._privateapi.networkutil.test_network_call
  end function
  m.reset_network_call = function()
    m.braze._privateapi.networkutil.test_network_call = invalid
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
  m.Braze.logEvent(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending a custom event, "ce"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.CUSTOM_EVENT, sent_event.name)
  field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME
  'check that the event name ("n") sent is test_event_name
  result += m.assertEqual(sent_event.data[field_name], test_event_name)
  m.reset_network_call()
  return result
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
  m.Braze.logEvent(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending a custom event, "ce"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.CUSTOM_EVENT, sent_event.name)
  field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME
  'check that the event name ("n") sent is test_event_name
  result += m.assertEqual(sent_event.data[field_name], test_event_name)
  'check that the event properties ("p") sent are test_event_properties
  field_name = BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES
  result += m.assertEqual(sent_event.data[field_name], test_event_properties)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Log_Purchase() as string
  args = {}
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID] = ItemGenerator("string")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE] = "USD"
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE] = ItemGenerator("float")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY] = ItemGenerator("integer")
  args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES] = invalid
  m.Braze.logPurchase(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
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
  m.reset_network_call()
  return result
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
  m.Braze.logPurchase(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
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
  m.reset_network_call()
  return result
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
  m.Braze.setLocationCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending a location custom attribute, "lcaa"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.LOCATION_CUSTOM_ATTRIBUTE_ADD, sent_event.name)
  'check that the key sent is test_key
  result += m.assertEqual(sent_event.data["key"], test_key)
  'check that the lat sent is test_lat
  result += m.assertTrue(sent_event.data["latitude"] = test_lat)
  'check that the lon sent is test_lon
  result += m.assertTrue(sent_event.data["longitude"] = test_lon)
  m.reset_network_call()
  return result
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
  m.Braze.setLocationCustomAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.incrementCustomUserAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending an increment custom attribute, "inc"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.INCREMENT_CUSTOM_ATTRIBUTE, sent_event.name)
  'check that the key sent is test_key
  result += m.assertEqual(sent_event.data["key"], test_key)
  'check that the value sent is test_value
  result += m.assertEqual(sent_event.data["value"], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Increment_Invalid_Custom_User_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.incrementCustomUserAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.addToCustomAttributeArray(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending an increment custom attribute, "add"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.ADD_CUSTOM_ATTRIBUTE_ARRAY, sent_event.name)
  'check that the key sent is test_key
  result += m.assertEqual(sent_event.data["key"], test_key)
  'check that the value sent is test_value
  result += m.assertEqual(sent_event.data["value"], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Add_Invalid_Custom_Attribute_Array() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.addToCustomAttributeArray(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.removeFromCustomAttributeArray(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending an increment custom attribute, "rem"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.REMOVE_CUSTOM_ATTRIBUTE_ARRAY, sent_event.name)
  'check that the key sent is test_key
  result += m.assertEqual(sent_event.data["key"], test_key)
  'check that the value sent is test_value
  result += m.assertEqual(sent_event.data["value"], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Remove_Invalid_Custom_Attribute_Array() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.removeFromCustomAttributeArray(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attribute = test_network_call.postjson.attributes[0].custom
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attribute[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Invalid_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = invalid
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attribute = test_network_call.postjson.attributes[0].custom
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attribute[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_String_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attribute = test_network_call.postjson.attributes[0].custom
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attribute[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Float_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("float")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attribute = test_network_call.postjson.attributes[0].custom
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attribute[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Boolean_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("boolean")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attribute = test_network_call.postjson.attributes[0].custom
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attribute[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Sets_Custom_Array_Of_Strings_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = [ItemGenerator("string"), ItemGenerator("string"), ItemGenerator("string"), ItemGenerator("string")]
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setCustomAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attribute = test_network_call.postjson.attributes[0].custom
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attribute[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Set_Invalid_Custom_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = [ItemGenerator("boolean"), ItemGenerator("integer"), ItemGenerator("string"), ItemGenerator("string")]
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setCustomAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.setStringAttribute(args)
  test_network_call = m.get_test_network_call()
  sent_attributes = test_network_call.postjson.attributes[0]
  'check that the key and value are set correctly
  result = m.assertEqual(sent_attributes[test_key], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Set_Invalid_String_Attribute() as string
  test_key = ItemGenerator("string")
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.setStringAttribute(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.logIAMImpression(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending an iam impression, "si"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.IAM_IMPRESSION, sent_event.name)
  'check that the trigger id sent is set correctly
  result += m.assertEqual(sent_event.data["trigger_ids"][0], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Log_Invalid_IAM_Impression() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.logIAMImpression(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
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
  m.Braze.logIAMControlImpression(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending an iam impression, "iec"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.IAM_CONTROL_IMPRESSION, sent_event.name)
  'check that the trigger id sent is set correctly
  result += m.assertEqual(sent_event.data["trigger_ids"][0], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Logs_IAM_Click() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("string")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.logIAMClick(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending an iam click, "sc"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.IAM_CLICK, sent_event.name)
  'check that the trigger id sent is set correctly
  result += m.assertEqual(sent_event.data["trigger_ids"][0], test_value)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_Log_Invalid_IAM_Click() as string
  test_key = "trigger_id"
  test_value = ItemGenerator("integer")
  args = {
    key: test_key,
    value: test_value
  }
  m.Braze.logIAMClick(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Starts_Session_With_Cached_ID() as string
  args = {}
  test_session_id = "422f636b-fdf2-48c4-8d0f-63ecc9b44ce7"
  m.Braze._privateapi.dataprovider.cachedsessionid = test_session_id
  m.Braze.sessionStart(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending a session start, "ss"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.SESSION_START, sent_event.name)
  'check that the session id sent is set correctly
  result += m.assertEqual(sent_event.session_id, test_session_id)
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Starts_Session_With_Fresh_ID() as string
  args = {}
  m.Braze._privateapi.dataprovider.cachedsessionid = invalid
  m.Braze.sessionStart(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending a session start, "ss"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.SESSION_START, sent_event.name)
  'check that the session id is a string and 36 char long (UUID)
  result += m.assertEqual(sent_event.session_id.len(), 36)
  m.reset_network_call()
  return result
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
  m.Braze.sessionEnd(args)
  test_network_call = m.get_test_network_call()
  sent_event = test_network_call.postjson.events[0]
  'check that we are sending a session start, "ss"
  result = m.assertEqual(BrazeConstants().EVENT_TYPES.SESSION_END, sent_event.name)
  'check that the session id sent is set correctly
  result += m.assertEqual(sent_event.session_id, test_session_id)
  'check previous session data is cleared
  result += m.assertEqual(sec.Read("uuid"), "")
  result += m.assertEqual(sec.Read("start"), "")
  result += m.assertEqual(sec.Read("end"), "")
  m.reset_network_call()
  return result
end function

' @Test
function TestCase__Instance_Method_Doesnt_End_Non_Existent_Session() as string
  args = {}
  test_session_id = "422f636b-fdf2-48c4-8d0f-63ecc9b44ce7"
  sec = CreateObject("roRegistrySection", "braze.section.session")
  sec.Delete("uuid")
  sec.Delete("start")
  sec.Delete("end")
  sec.Flush()
  m.Braze.sessionEnd(args)
  'check that no network call was made
  test_network_call = m.get_test_network_call()
  result = m.AssertInvalid(test_network_call)
  m.reset_network_call()
  return result
end function