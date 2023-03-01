function BrazeConstants() as object
  SDK_DATA = {
    SDK_VERSION: "0.1.3"
  }

  SCENE_GRAPH_EVENTS = {
    BRAZE_API_INVOCATION: "BrazeApiInvocation"
  }

  BRAZE_CONFIG_FIELDS = {
    API_KEY: "api-key",
    ENDPOINT: "endpoint",
    HEARTBEAT_FREQ_IN_SECONDS: "hbfreq"
  }

  BRAZE_STORAGE = {
    CONFIG_SECTION: "braze.section.config",
    CONFIG_TIME_KEY: "config_time",
    CONFIG_ATTRIBUTES_BLOCKLIST_KEY: "attributes_blacklist",
    CONFIG_EVENTS_BLOCKLIST_KEY: "events_blacklist",
    CONFIG_PURCHASES_BLOCKLIST_KEY: "purchases_blacklist",
    CONFIG_MESSAGING_SESSION_TIMEOUT_KEY: "messaging_session_timeout",
    DEVICE_ID_SECTION: "braze.section.device_id",
    DEVICE_ID_KEY: "device_id"
    USER_ID_SECTION: "braze.section.user_id",
    USER_ID_KEY: "user_id"
    SESSION_SECTION: "braze.section.session",
    SESSION_UUID_KEY: "uuid"
    SESSION_START_KEY: "start"
    SESSION_END_KEY: "end"
  }

  BRAZE_EVENT_API_FIELDS = {
    CUSTOM_EVENT_NAME: "n",
    SESSION_DURATION: "d",
    CUSTOM_EVENT_PROPERTIES: "p",
    PURCHASE_EVENT_PROPERTIES: "pr",
    PRODUCT_ID: "pid",
    CURRENCY_CODE: "c",
    PRICE: "p",
    QUANTITY: "q"
  }

  SUBSCRIPTION_STATES = {
    OPTED_IN: "opted_in",
    SUBSCRIBED: "subscribed",
    UNSUBSCRIBED: "unsubscribed"
  }

  EVENT_TYPES = {
    CUSTOM_EVENT: "ce",
    PURCHASE: "p",
    SESSION_START: "ss",
    SESSION_END: "se",
    ADD_CUSTOM_ATTRIBUTE_ARRAY: "add",
    REMOVE_CUSTOM_ATTRIBUTE_ARRAY: "rem",
    INCREMENT_CUSTOM_ATTRIBUTE: "inc",
    LOCATION_CUSTOM_ATTRIBUTE_ADD: "lcaa",
    IAM_IMPRESSION: "si",
    IAM_CONTROL_IMPRESSION: "iec",
    IAM_CLICK: "sc",
    IAM_BUTTON_CLICK: "sbc"
  }

  TRIGGER_FIELDS = {
    DATA: "data",
    TRIGGER_CONDITION: "trigger_condition",
    TYPE: "type"
  }

  TRIGGER_DATA_FIELDS = {
    BTNS: "btns",
    BG_COLOR: "bg_color",
    CLOSE_BTN_COLOR: "close_btn_color",
    FRAME_COLOR: "frame_color",
    HEADER_TEXT_COLOR: "header_text_color",
    TEXT_ALIGN: "text_align_message",
    MESSAGE_TEXT_COLOR: "text_color",
    DISPLAY_DELAY: "delay",
    CLICK_ACTION: "click_action",
    DURATION: "duration",
    EXTRAS: "extras",
    HEADER: "header",
    IMAGE_URL: "image_url",
    IS_CONTROL: "is_control",
    MESSAGE: "message",
    MESSAGE_CLOSE: "message_close",
    RE_ELIGIBILITY: "re_eligibility",
    TRIGGER_ID: "trigger_id",
    TYPE: "type",
    URI: "uri"
  }

  TRIGGER_DATA_BTN_FIELDS = {
    CLICK_ACTION: "click_action",
    ID: "id",
    TEXT: "text",
    URI: "uri",
    BG_COLOR: "bg_color",
    BORDER_COLOR: "border_color",
    TEXT_COLOR: "text_color"
  }

  TRIGGER_CONDITION_FIELDS = {
    TYPE: "type",
    DATA: "data"
  }

  TRIGGER_CONDITION_DATA_FIELDS = {
    EVENT_NAME: "event_name",
    PRODUCT_ID: "product_id",
    PROPERTY_FILTERS: "property_filters"
  }

  TRIGGER_TYPES = {
    OPEN: "open",
    CUSTOM_EVENT: "custom_event",
    CUSTOM_EVENT_PROPERTY: "custom_event_property",
    PURCHASE: "purchase",
    PURCHASE_PROPERTY: "purchase_property",
    TEMPLATED_IAM: "templated_iam",
    INAPP: "inapp"
  }

  TRIGGER_FILTER_FIELDS = {
    COMPARATOR: "comparator",
    PROPERTY_KEY: "property_key",
    PROPERTY_TYPE: "property_type",
    PROPERTY_VALUE: "property_value"
  }

  TRIGGER_FILTER_PROPERTY_TYPES = {
    BOOLEAN_TYPE: "boolean",
    NUMBER_TYPE: "number",
    STRING_TYPE: "string"
  }

  TRIGGER_FILTER_ALLOWED_TYPES = [
    "SLIDEUP",
    "MODAL",
    "FULL",
    "HTML_FULL",
    "MODAL_STYLED",
    "HTML"
  ]

  TRIGGER_COMPARATORS = {
    EQUALS: 1,
    NOT_EQUAL: 2,
    GREATER_THAN: 3,
    GREATER_THAN_EQUAL: 4,
    LESS_THAN: 5,
    LESS_THAN_EQUAL: 6,
    IN: 7,
    NOT_IN: 8,
    ALL: 9,
    MATCHES: 10,
    EXISTS: 11,
    DOES_NOT_EXIST: 12,
    LOCATION_WITHIN_CIRCLE: 13,
    LOCATION_WITHIN_POLYGON: 14,
    DATE_IN_LESS_THAN_X_TIMEFRAME: 15,
    DATE_IN_MORE_THAN_X_TIMEFRAME: 16,
    NOT_MATCHES: 17,
    LOCATION_NOT_WITHIN_CIRCLE: 18,
    LOCATION_NOT_WITHIN_POLYGON: 19
  }

  IAM_IMPRESSION_EVENT_FIELDS = {
    TRIGGER_IDS: "trigger_ids"
  }

  IAM_CONTROL_IMPRESSION_EVENT_FIELDS = {
    TRIGGER_IDS: "trigger_ids"
  }

  IAM_CLICK_EVENT_FIELDS = {
    TRIGGER_IDS: "trigger_ids"
  }

  IAM_BUTTON_CLICK_EVENT_FIELDS = {
    TRIGGER_IDS: "trigger_ids",
    BUTTON_ID: "bid"
  }

  return {
    SCENE_GRAPH_EVENTS: SCENE_GRAPH_EVENTS
    SDK_DATA: SDK_DATA
    BRAZE_CONFIG_FIELDS: BRAZE_CONFIG_FIELDS
    BRAZE_STORAGE: BRAZE_STORAGE
    BRAZE_EVENT_API_FIELDS: BRAZE_EVENT_API_FIELDS
    EVENT_TYPES: EVENT_TYPES
    SUBSCRIPTION_STATES: SUBSCRIPTION_STATES
    TRIGGER_FIELDS: TRIGGER_FIELDS
    TRIGGER_DATA_FIELDS: TRIGGER_DATA_FIELDS
    TRIGGER_DATA_BTN_FIELDS: TRIGGER_DATA_BTN_FIELDS
    TRIGGER_COMPARATORS: TRIGGER_COMPARATORS
    TRIGGER_CONDITION_FIELDS: TRIGGER_CONDITION_FIELDS
    TRIGGER_CONDITION_DATA_FIELDS: TRIGGER_CONDITION_DATA_FIELDS
    TRIGGER_FILTER_ALLOWED_TYPES: TRIGGER_FILTER_ALLOWED_TYPES
    TRIGGER_FILTER_FIELDS: TRIGGER_FILTER_FIELDS
    TRIGGER_FILTER_PROPERTY_TYPES: TRIGGER_FILTER_PROPERTY_TYPES
    TRIGGER_TYPES: TRIGGER_TYPES
    IAM_IMPRESSION_EVENT_FIELDS: IAM_IMPRESSION_EVENT_FIELDS
    IAM_CONTROL_IMPRESSION_EVENT_FIELDS: IAM_CONTROL_IMPRESSION_EVENT_FIELDS
    IAM_CLICK_EVENT_FIELDS: IAM_CLICK_EVENT_FIELDS
    IAM_BUTTON_CLICK_EVENT_FIELDS: IAM_BUTTON_CLICK_EVENT_FIELDS
  }
end function

function BrazeInit(config as object, messagePort as object)
  StorageManager = {
    brazeSaveData: function(key as string, section as string, value as dynamic, flush = true as boolean) as void
      sec = CreateObject("roRegistrySection", section)
      sec.Write(key, value.ToStr())
      if flush then
        sec.Flush()
      end if
    end function,

    brazeDeleteData: function(key as string, section as string, flush = true as boolean) as void
      sec = CreateObject("roRegistrySection", section)
      sec.Delete(key)
      if flush then
        sec.Flush()
      end if
    end function,

    brazeReadData: function(key as string, section as string, default = invalid as dynamic) as dynamic
      sec = CreateObject("roRegistrySection", section)
      if sec.Exists(key) then
        return sec.Read(key)
      end if
      return default
    end function,

    brazeReadDataInt: function(key as string, section as string, default = 0 as integer) as integer
      result = m.brazeReadData(key, section, default)
      if Type(result) <> "Integer"
        result = result.ToInt()
      end if
      return result
    end function,

    brazeReadDataBoolean: function(key as string, section as string, default = false as boolean) as boolean
      return m.brazeReadData(key, section, default) = true.ToStr()
    end function
  }

  DataProvider = {
    DeviceDataProvider: function() as object
      if m.cachedDeviceInfo = invalid then
        di = CreateObject("roDeviceInfo")
        version = di.GetOsVersion()
        version = version.major + "." + version.minor + "." + version.revision + "." + version.build
        m.cachedDeviceInfo = {
          model : di.GetModelDetails().ModelNumber,
          ad_tracking_enabled : not di.IsRIDADisabled(),
          roku_ad_id : di.GetRIDA(),
          ' roku_channel_client_id : di.GetChannelClientId(),
          time_zone : di.GetTimeZone(),
          locale : di.GetCurrentLocale(),
          os_version : version
        }

        ' Add the resolution
        display_size = di.GetDisplaySize()
        if display_size <> invalid then
          heightByWidth = display_size.w.ToStr() + "x" + display_size.h.ToStr()
          m.cachedDeviceInfo["resolution"] = heightByWidth
        end if
      end if
      return m.cachedDeviceInfo
    end function,

    AppDataProvider: function() as object
      if m.cachedAppInfo = invalid then
        m.cachedAppInfo = {
          sdk_version: BrazeConstants().SDK_DATA.SDK_VERSION
          api_key: Braze()._privateApi.config[BrazeConstants().BRAZE_CONFIG_FIELDS.API_KEY]
        }
      end if
      return m.cachedAppInfo
    end function,

    DeviceIdProvider: function() as object
      if m.cachedDeviceId = invalid then
        storage = Braze()._privateApi.storage
        stored_device_id = storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.DEVICE_ID_KEY, BrazeConstants().BRAZE_STORAGE.DEVICE_ID_SECTION)
        if stored_device_id = invalid then
          di = CreateObject("roDeviceInfo")
          stored_device_id = di.GetRandomUUID()
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.DEVICE_ID_KEY, BrazeConstants().BRAZE_STORAGE.DEVICE_ID_SECTION, stored_device_id)
          logger = Braze()._privateApi.brazeLogger
          logger.debug("Generated Device ID", stored_device_id)
        else
          logger = Braze()._privateApi.brazeLogger
          logger.debug("Saved Device ID", stored_device_id)
        end if
        m.cachedDeviceId = stored_device_id
      end if
      return m.cachedDeviceId
    end function,

    UserIdProvider: function() as object
      if m.cachedUserId = invalid then
        storage = Braze()._privateApi.storage
        stored_user_id = storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.USER_ID_KEY, BrazeConstants().BRAZE_STORAGE.USER_ID_SECTION)
        if stored_user_id = invalid then
          stored_user_id = ""
        end if
        m.cachedUserId = stored_user_id
      end if
      return m.cachedUserId
    end function,

    SessionIdProvider: function() as object
      if m.cachedSessionId = invalid then
        di = CreateObject("roDeviceInfo")
        session_id = di.GetRandomUUID()
        m.cachedSessionId = session_id
      end if
      return m.cachedSessionId
    end function,

    ConfigProvider: function() as object
      if m.cachedConfig = invalid then
        eventHandler = Braze()._privateApi.eventHandler
        storage = Braze()._privateApi.storage
        utils = Braze()._privateApi.brazeUtils
        m.cachedConfig = {}
        stored_config_time = storage.brazeReadDataInt(BrazeConstants().BRAZE_STORAGE.CONFIG_TIME_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
        config_object = eventHandler.createConfigObject(stored_config_time, true)
        config_response = invalid
        raw_response = eventHandler.requestConfigAndTriggers(config_object)
        if raw_response <> invalid
          config_response = ParseJson(raw_response)
        end if
        if config_response = invalid or config_response.config = invalid or config_response.config.time = invalid
          m.cachedConfig.config_time = stored_config_time
          stored_attributes_blocklist = storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.CONFIG_ATTRIBUTES_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
          stored_attributes_blocklist = utils.setToEmptyJSONArrayIfInvalid(stored_attributes_blocklist)
          stored_events_blocklist = storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.CONFIG_EVENTS_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
          stored_events_blocklist = utils.setToEmptyJSONArrayIfInvalid(stored_events_blocklist)
          stored_purchases_blocklist = storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.CONFIG_PURCHASES_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
          stored_purchases_blocklist = utils.setToEmptyJSONArrayIfInvalid(stored_purchases_blocklist)
          m.cachedConfig.attributes_blocklist = ParseJson(stored_attributes_blocklist)
          m.cachedConfig.events_blocklist = ParseJson(stored_events_blocklist)
          m.cachedConfig.purchases_blocklist = ParseJson(stored_purchases_blocklist)
          m.cachedConfig.messaging_session_timeout = storage.brazeReadDataInt(BrazeConstants().BRAZE_STORAGE.CONFIG_MESSAGING_SESSION_TIMEOUT_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
        else
          config_time = config_response.config.time
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_TIME_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, config_time)
          config_attributes_blocklist = utils.ifInvalidSetToDefault(config_response.config.attributes_blocklist, [])
          config_events_blocklist = utils.ifInvalidSetToDefault(config_response.config.events_blocklist, [])
          config_purchases_blocklist = utils.ifInvalidSetToDefault(config_response.config.purchases_blocklist, [])
          if config_response.config.messaging_session_timeout <> invalid
            config_messaging_session_timeout = config_response.config.messaging_session_timeout
          else
            config_messaging_session_timeout = 0
          end if
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_ATTRIBUTES_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_attributes_blocklist))
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_EVENTS_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_events_blocklist))
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_PURCHASES_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_purchases_blocklist))
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_MESSAGING_SESSION_TIMEOUT_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_messaging_session_timeout))
          m.cachedConfig.config_time = config_time
          m.cachedConfig.attributes_blocklist = config_attributes_blocklist
          m.cachedConfig.events_blocklist = config_events_blocklist
          m.cachedConfig.purchases_blocklist = config_purchases_blocklist
          m.cachedConfig.messaging_session_timeout = config_messaging_session_timeout
        end if
        if config_response <> invalid and config_response.triggers <> invalid
          m.cachedConfig.triggers = config_response.triggers
        end if
      end if
      return m.cachedConfig
    end function
    
    syncForNewUser: function()
      config = m.ConfigProvider()
      if config <> invalid then
        eventHandler = Braze()._privateApi.eventHandler
        storage = Braze()._privateApi.storage
        utils = Braze()._privateApi.brazeUtils
        stored_config_time = storage.brazeReadDataInt(BrazeConstants().BRAZE_STORAGE.CONFIG_TIME_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
        config_object = eventHandler.createConfigObject(stored_config_time, true)
        config_response = invalid
        raw_response = eventHandler.requestConfigAndTriggers(config_object)
        if raw_response <> invalid
          config_response = ParseJson(raw_response)
        end if
        if config_response <> invalid and config_response.config <> invalid and config_response.config.time <> invalid
          config_time = config_response.config.time
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_TIME_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, config_time)
          config_attributes_blocklist = utils.ifInvalidSetToDefault(config_response.config.attributes_blocklist, [])
          config_events_blocklist = utils.ifInvalidSetToDefault(config_response.config.events_blocklist, [])
          config_purchases_blocklist = utils.ifInvalidSetToDefault(config_response.config.purchases_blocklist, [])
          if config_response.config.messaging_session_timeout <> invalid
            config_messaging_session_timeout = config_response.config.messaging_session_timeout
          else
            config_messaging_session_timeout = 0
          end if
          ' TODO: Check to see if things actually changed before writing to storage
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_ATTRIBUTES_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_attributes_blocklist))
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_EVENTS_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_events_blocklist))
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_PURCHASES_BLOCKLIST_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_purchases_blocklist))
          storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.CONFIG_MESSAGING_SESSION_TIMEOUT_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION, FormatJson(config_messaging_session_timeout))
          m.cachedConfig.config_time = config_time
          m.cachedConfig.attributes_blocklist = config_attributes_blocklist
          m.cachedConfig.events_blocklist = config_events_blocklist
          m.cachedConfig.purchases_blocklist = config_purchases_blocklist
          m.cachedConfig.messaging_session_timeout = config_messaging_session_timeout
        end if
        if config_response <> invalid and config_response.triggers <> invalid
          m.cachedConfig.triggers = config_response.triggers
        end if
      end if
      return m.cachedConfig
    end function
  }

  TimeUtils = {
    getCurrentTimeSeconds: function() as object
      date = CreateObject("roDateTime")
      return date.AsSeconds()
    end function
  }

  BrazeUtils = {
    inArray: function(needle as dynamic, haystack as object) as boolean
      for each thing in haystack
        if thing = needle
          return true
        end if
      end for
      return false
    end function,

    isString: function(input as object) as boolean
      return input <> invalid and GetInterface(input, "ifString") <> invalid
    end function,

    truncateBrazeField: function(input as dynamic) as dynamic
      if not m.isString(input) then
        return invalid
      end if
      if Len(input) > 255 then
        return Left(input, 255)
      end if
      return input
    end function,

    isBool: function(input as object) as boolean
      return input <> invalid and GetInterface(input, "ifBoolean") <> invalid
    end function,

    isFloat: function(input as object) as boolean
      return input <> invalid and (GetInterface(input, "ifFloat") <> invalid or (Type(input) = "roFloat" or Type(input) = "Float"))
    end function,

    isArrayOfStrings: function(input as object) as boolean
      isArray = input <> invalid and (GetInterface(input, "ifArray") <> invalid or Type(input) = "roArray")
      if not isArray then
        return false
      end if
      for each item in input
        if not m.isString(item) then
          return false
        end if
      end for
      return true
    end function,

    isInt: function(input as object) as boolean
      return input <> invalid and (GetInterface(input, "ifInt") <> invalid or Type(input) = "roInt")
    end function,

    isLongInt: function(input as object) as boolean
      return input <> invalid and (GetInterface(input, "ifLongInt") <> invalid or Type(input) = "roLongInteger")
    end function,

    isNumeric: function(input as object) as boolean
      return m.isFloat(input) or m.isInt(input) or m.isLongInt(input)
    end function,

    setToEmptyJSONArrayIfInvalid: function(input as dynamic) as string
      if input = invalid
        return "[]"
      else
        return input
      end if
    end function,

    ifInvalidSetToDefault: function(input as dynamic, defaultVal as dynamic) as dynamic
      if input = invalid
        return defaultVal
      else
        return input
      end if
    end function,

    processTriggers: function(action_type as string, triggers as dynamic, trigger_task as dynamic, data as dynamic) as void
      active_trigger = m.checkAgainstTriggers(action_type, triggers, { event_name: data.event_name, product_id: data.product_id, event_properties: data.event_properties })
      if active_trigger <> invalid
        if active_trigger.is_control = true
          LogInAppMessageControlImpression(active_trigger.trigger_id, trigger_task)
          return
        end if
        active_trigger = m.updateTriggerWithTemplate(active_trigger, action_type, data.event_object)
        if active_trigger = invalid
          ' TODO: If this is invalid, grab the next one
          return
        end if
        active_trigger.delete("template_only")
        active_trigger.id = active_trigger.trigger_id
        active_trigger.delete("trigger_id")
        previous_trigger = trigger_task.BrazeInAppMessage
        if previous_trigger = invalid
          trigger_task.BrazeInAppMessage = active_trigger
        else
          ' Something else is already there, so we can't display
        end if
      end if
    end function,

    checkAgainstTriggers: function(trigger_type as string, triggers as dynamic, data = invalid as dynamic) as dynamic
      raw_result = []
      result = invalid
      if triggers <> invalid
        triggers = m.filterTriggersByAllowedTypes(triggers)
        triggers = m.filterTriggersByExpiry(triggers)
        triggers = m.filterTriggersByReEligibility(triggers)
        for each trigger in triggers
          for each condition in trigger[BrazeConstants().TRIGGER_FIELDS.TRIGGER_CONDITION]
            if condition[BrazeConstants().TRIGGER_CONDITION_FIELDS.TYPE] = trigger_type or condition[BrazeConstants().TRIGGER_CONDITION_FIELDS.TYPE] = trigger_type + "_property"
              if trigger_type = BrazeConstants().TRIGGER_TYPES.OPEN
                raw_result.Push(trigger)
                exit for
              else if trigger_type = BrazeConstants().TRIGGER_TYPES.CUSTOM_EVENT
                condition_data = condition[BrazeConstants().TRIGGER_CONDITION_FIELDS.DATA]
                if condition_data[BrazeConstants().TRIGGER_CONDITION_DATA_FIELDS.EVENT_NAME] = data.event_name
                  if condition_data[BrazeConstants().TRIGGER_CONDITION_DATA_FIELDS.PROPERTY_FILTERS] <> invalid
                    if data.event_properties <> invalid
                      condition_property_filters = condition_data[BrazeConstants().TRIGGER_CONDITION_DATA_FIELDS.PROPERTY_FILTERS]
                      if m.propertyFiltersMetByEvent(condition_property_filters, data.event_properties)
                        raw_result.Push(trigger)
                        exit for
                      end if
                    end if
                  else
                    ' No property filters are in the condition data and we've matched on the name, so return this trigger
                    raw_result.Push(trigger)
                    exit for
                  end if
                end if
              else if trigger_type = BrazeConstants().TRIGGER_TYPES.PURCHASE
                condition_data = condition[BrazeConstants().TRIGGER_CONDITION_FIELDS.DATA]
                condition_product_id = invalid
                if condition_data <> invalid
                  condition_product_id = condition_data[BrazeConstants().TRIGGER_CONDITION_DATA_FIELDS.PRODUCT_ID]
                end if
                if condition_product_id <> invalid and condition_product_id = data.product_id
                  condition_property_filters = condition_data[BrazeConstants().TRIGGER_CONDITION_DATA_FIELDS.PROPERTY_FILTERS]
                  if data.event_properties <> invalid and condition_property_filters <> invalid
                    if m.propertyFiltersMetByEvent(condition_property_filters, data.event_properties)
                      raw_result.Push(trigger)
                      exit for
                    end if
                  end if
                  if condition_property_filters = invalid
                    ' No property filters are in the condition data and we've matched on the product ID, so return this trigger
                    raw_result.Push(trigger)
                    exit for
                  end if
                end if
                if condition_product_id = invalid
                  ' This is "Make Any Purchase"
                  raw_result.Push(trigger)
                  exit for
                end if
              end if
            end if
          end for
        end for
      end if
      if raw_result.count() > 0
        raw_result.SortBy("priority", "r")
        result = m.transformTrigger(raw_result[0])
        raw_result[0].roku_sdk_last_sent = CreateObject("roTimeSpan")
      end if
      return result
    end function,

    ' Convert the trigger to an In-App Message object that the users will use to create the In-App Message UI
    transformTrigger: function(trigger as object) as object
      transformed_trigger = {}
      transformed_trigger.message = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.MESSAGE]
      transformed_trigger.extras = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.EXTRAS]
      transformed_trigger.trigger_id = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.TRIGGER_ID]
      transformed_trigger.header = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.HEADER]
      transformed_trigger.image_url = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.IMAGE_URL]
      transformed_trigger.is_control = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.IS_CONTROL]
      transformed_trigger.uri = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.URI]
      transformed_trigger.duration = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.DURATION]
      transformed_trigger.click_action = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.CLICK_ACTION]
      transformed_trigger.dismiss_type = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.MESSAGE_CLOSE]
      transformed_trigger.message_type = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.TYPE]

      transformed_trigger.bg_color = m.toColor(trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.BG_COLOR])
      transformed_trigger.close_button_color = m.toColor(trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.CLOSE_BTN_COLOR])
      transformed_trigger.frame_color = m.toColor(trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.FRAME_COLOR])
      transformed_trigger.header_text_color = m.toColor(trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.HEADER_TEXT_COLOR])
      transformed_trigger.text_align = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.TEXT_ALIGN]
      transformed_trigger.message_text_color = m.toColor(trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.MESSAGE_TEXT_COLOR])
      transformed_trigger.display_delay = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.DISPLAY_DELAY]

      raw_buttons = trigger[BrazeConstants().TRIGGER_FIELDS.DATA][BrazeConstants().TRIGGER_DATA_FIELDS.BTNS]
      transformed_trigger.buttons = []
      if raw_buttons <> invalid
        for each button in raw_buttons
          transformed_button = {}
          transformed_button.text = button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.TEXT]
          transformed_button.click_action = button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.CLICK_ACTION]
          transformed_button.uri = button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.URI]
          transformed_button.id = button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.ID]
          transformed_button.bg_color = m.toColor(button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.BG_COLOR])
          transformed_button.border_color = m.toColor(button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.BORDER_COLOR])
          transformed_button.text_color = m.toColor(button[BrazeConstants().TRIGGER_DATA_BTN_FIELDS.TEXT_COLOR])
          transformed_trigger.buttons.Push(transformed_button)
        end for
      end if
      if transformed_trigger.display_delay = invalid
        transformed_trigger.display_delay = 0
      end if
      if transformed_trigger.duration = invalid
        transformed_trigger.duration = 0
      end if
      if transformed_trigger.buttons = invalid
        transformed_trigger.buttons = []
      end if
      if trigger[BrazeConstants().TRIGGER_FIELDS.TYPE] = BrazeConstants().TRIGGER_TYPES.TEMPLATED_IAM
        transformed_trigger.template_only = true
      else
        transformed_trigger.template_only = false
      end if
      if transformed_trigger.is_control = invalid
        transformed_trigger.is_control = false
      end if
      return transformed_trigger
    end function,

    filterTriggersByAllowedTypes: function(triggers as object) as object
      filtered_triggers = []
      for each trigger in triggers
        if trigger.type = BrazeConstants().TRIGGER_TYPES.TEMPLATED_IAM
          filtered_triggers.Push(trigger)
        else if trigger.type = BrazeConstants().TRIGGER_TYPES.INAPP
          if (trigger.data.is_control <> invalid and trigger.data.is_control) or Braze()._privateapi.brazeutils.inArray(trigger.data.type, BrazeConstants().TRIGGER_FILTER_ALLOWED_TYPES)
            filtered_triggers.Push(trigger)
          end if
        end if
      end for
      return filtered_triggers
    end function,

    filterTriggersByExpiry: function(triggers as object) as object
      filtered_triggers = []
      current_timestamp = CreateObject("roDateTime").AsSeconds()
      for each trigger in triggers
        if trigger.start_time < current_timestamp and (trigger.end_time = invalid or trigger.end_time > current_timestamp)
          filtered_triggers.Push(trigger)
        end if
      end for
      return filtered_triggers
    end function,

    filterTriggersByReEligibility: function(triggers as object) as object
      filtered_triggers = []
      for each trigger in triggers
        if trigger[BrazeConstants().TRIGGER_DATA_FIELDS.RE_ELIGIBILITY] = 0 or trigger.roku_sdk_last_sent = invalid
          filtered_triggers.Push(trigger)
        else if trigger[BrazeConstants().TRIGGER_DATA_FIELDS.RE_ELIGIBILITY] > 0 and trigger.roku_sdk_last_sent.TotalSeconds() > trigger[BrazeConstants().TRIGGER_DATA_FIELDS.RE_ELIGIBILITY]
          filtered_triggers.Push(trigger)
        end if
      end for
      return filtered_triggers
    end function,

    propertyFiltersMetByEvent: function(filters as object, properties as object) as boolean
      for each filter in filters
        met = false
        for each or_filter in filter
          property_key = or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.PROPERTY_KEY]
          value = properties[property_key]
          property_type = or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.PROPERTY_TYPE]
          if property_type = BrazeConstants().TRIGGER_FILTER_PROPERTY_TYPES.NUMBER_TYPE
            met = m.compareNumbers(value, or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.COMPARATOR], or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.PROPERTY_VALUE])
          else if property_type = BrazeConstants().TRIGGER_FILTER_PROPERTY_TYPES.BOOLEAN_TYPE
            met = m.compareBooleans(value, or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.COMPARATOR], or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.PROPERTY_VALUE])
          else if property_type = BrazeConstants().TRIGGER_FILTER_PROPERTY_TYPES.STRING_TYPE
            met = m.compareStrings(value, or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.COMPARATOR], or_filter[BrazeConstants().TRIGGER_FILTER_FIELDS.PROPERTY_VALUE])
          end if
          if met
            exit for
          end if
        end for
        if not met
          return false
        end if
      end for
      return true
    end function,

    updateTriggerWithTemplate: function(trigger as object, event_type as string, data = invalid as dynamic)
      if trigger.template_only
        template_response_raw = Braze()._privateapi.eventhandler.requestTemplate(trigger.trigger_id, event_type, data)
        remove_trigger = true
        if template_response_raw <> invalid
          template_response = ParseJson(template_response_raw)
          if template_response.templated_message <> invalid
            updated_trigger = Braze()._privateapi.brazeutils.transformTrigger(template_response.templated_message)
            if Braze()._privateapi.brazeutils.inArray(updated_trigger.message_type, BrazeConstants().TRIGGER_FILTER_ALLOWED_TYPES)
              trigger.Append(updated_trigger)
              remove_trigger = false
            end if
          end if
        end if
        if remove_trigger
          trigger = invalid
        end if
      end if
      return trigger
    end function,

    compareNumbers: function(value, comparator, comparison_value) as boolean
      if comparator = BrazeConstants().TRIGGER_COMPARATORS.EQUALS
        return m.isnumeric(value) and value = comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.NOT_EQUAL
        return m.isnumeric(value) and value <> comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.GREATER_THAN
        return m.isnumeric(value) and value > comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.GREATER_THAN_EQUAL
        return m.isnumeric(value) and value >= comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.LESS_THAN
        return m.isnumeric(value) and value < comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.LESS_THAN_EQUAL
        return m.isnumeric(value) and value <= comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.EXISTS
        return value <> invalid and m.isnumeric(value)
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.DOES_NOT_EXIST
        return value = invalid
      end if
      return false
    end function,

    compareBooleans: function(value, comparator, comparison_value) as boolean
      if comparator = BrazeConstants().TRIGGER_COMPARATORS.EQUALS
        return m.isBool(value) and value = comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.EXISTS
        return value <> invalid and m.isBool(value)
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.DOES_NOT_EXIST
        return value = invalid
      end if
      return false
    end function,

    compareStrings: function(value, comparator, comparison_value) as boolean
      if comparator = BrazeConstants().TRIGGER_COMPARATORS.EQUALS
        return m.isString(value) and value = comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.NOT_EQUAL
        return m.isString(value) and value <> comparison_value
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.MATCHES
        if m.isString(value)
          r = CreateObject("roRegex", comparison_value, "i")
          return r.IsMatch(value)
        else
          return false
        end if
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.EXISTS
        return value <> invalid and m.isString(value)
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.DOES_NOT_EXIST
        return value = invalid
      else if comparator = BrazeConstants().TRIGGER_COMPARATORS.NOT_MATCHES
        if m.isString(value)
          r = CreateObject("roRegex", comparison_value, "i")
          return not r.IsMatch(value)
        else
          return false
        end if
      end if
      return false
    end function,

    toColor: function(s as object) as dynamic
      if s = invalid 
        return invalid
      end if
      hex = stri(s, 16)
      ' 0 pad if needed
      if hex.Len() < 8 then hex = String(8-hex.Len(), "0") + hex
      ' Swap the alpha to the end
      return "0x" + Right(hex, 6) + Left(hex, 2)
    end function,
  }

  Logger = {
    debug: function(tag as string, message as dynamic) as void
      m.logMessage(tag, message.ToStr())
    end function,

    logMessage: function(tag as string, message as string) as void
      print "Braze Roku SDK v" + BrazeConstants().SDK_DATA.SDK_VERSION + " - " + tag + " - " + message
    end function
  }

  EventHandler = {
    createEventObject: function(name as string, data = {} as object)
      event_payload = {
        "name": name,
        "data": data,
        "time": Braze()._privateApi.timeUtils.getCurrentTimeSeconds(),
        "session_id": Braze()._privateApi.dataProvider.SessionIdProvider()
      }
      user_id = Braze()._privateApi.dataProvider.UserIdProvider()
      if user_id <> "" then
        event_payload["user_id"] = user_id
      end if
      return event_payload
    end function,

    createCustomEventEvent: function(name as string, properties as object) as object
      event_data = {}
      event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME] = name
      if properties <> invalid then
        event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES] = properties
      end if
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.CUSTOM_EVENT, event_data)
      return event_object
    end function,

    createPurchaseEvent: function(product_id as string, currency_code as string, price as double, quantity as integer, properties as object) as object
      event_data = {}
      event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID] = product_id
      event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE] = currency_code
      event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE] = price
      event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY] = quantity
      if properties <> invalid then
        event_data[BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES] = properties
      end if
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.PURCHASE, event_data)
      return event_object
    end function,

    createIAMImpressionEvent: function(trigger_id as string) as object
      event_data = {}
      event_data[BrazeConstants().IAM_IMPRESSION_EVENT_FIELDS.TRIGGER_IDS] = [trigger_id]
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.IAM_IMPRESSION, event_data)
      return event_object
    end function,

    createIAMControlImpressionEvent: function(trigger_id as string) as object
      event_data = {}
      event_data[BrazeConstants().IAM_CONTROL_IMPRESSION_EVENT_FIELDS.TRIGGER_IDS] = [trigger_id]
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.IAM_CONTROL_IMPRESSION, event_data)
      return event_object
    end function,

    createIAMClickEvent: function(trigger_id as string) as object
      event_data = {}
      event_data[BrazeConstants().IAM_CLICK_EVENT_FIELDS.TRIGGER_IDS] = [trigger_id]
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.IAM_CLICK, event_data)
      return event_object
    end function,

    createIAMButtonClickEvent: function(trigger_id as string, button_id as integer) as object
      event_data = {}
      event_data[BrazeConstants().IAM_BUTTON_CLICK_EVENT_FIELDS.TRIGGER_IDS] = [trigger_id]
      event_data[BrazeConstants().IAM_BUTTON_CLICK_EVENT_FIELDS.BUTTON_ID] = button_id
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.IAM_BUTTON_CLICK, event_data)
      return event_object
    end function,

    createAttributeObject: function(name as string, properties) as object
      attribute_object = {}
      attribute_object[name] = properties
      user_id = Braze()._privateApi.dataProvider.UserIdProvider()
      if user_id <> "" then
        attribute_object["user_id"] = user_id
      end if
      return attribute_object
    end function,

    createConfigObject: function(config_time as integer, request_triggers as boolean) as object
      config_object = {}
      user_id = Braze()._privateApi.dataProvider.UserIdProvider()
      if user_id <> "" then
        config_object["user_id"] = user_id
      end if
      config_object["config"] = { config_time: config_time }
      config_object["triggers"] = request_triggers
      return config_object
    end function,

    createIncrementCustomAttributeEvent: function(key as string, value as integer) as object
      event_data = {}
      event_data.key = key
      event_data.value = value
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.INCREMENT_CUSTOM_ATTRIBUTE, event_data)
      return event_object
    end function,

    createSetLocationCustomAttributeEvent: function(key as string, lat as double, lon as double) as object
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.LOCATION_CUSTOM_ATTRIBUTE_ADD, { key: key, latitude: lat, longitude: lon })
      return event_object
    end function,

    createAddToCustomAttributeArrayEvent: function(key as string, value as string) as object
      event_data = {}
      event_data.key = key
      event_data.value = value
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.ADD_CUSTOM_ATTRIBUTE_ARRAY, event_data)
      return event_object
    end function,

    createRemoveFromCustomAttributeArrayEvent: function(key as string, value as string) as object
      event_data = {}
      event_data.key = key
      event_data.value = value
      event_object = m.createEventObject(BrazeConstants().EVENT_TYPES.REMOVE_CUSTOM_ATTRIBUTE_ARRAY, event_data)
      return event_object
    end function,

    logEvent: function(event_object as object) as void
      json = {
        "events": [event_object]
      }
      required_fields = Braze()._privateApi.networkUtil.generateRequiredRequestFields()
      json.Append(required_fields)
      endpoint = Braze()._privateApi.config[BrazeConstants().BRAZE_CONFIG_FIELDS.ENDPOINT] + "api/v3/data"
      server_response = Braze()._privateApi.networkUtil.postToUrl(endpoint, json)
    end function,

    logAttribute: function(attribute_object as object) as void
      json = {
        "attributes": [attribute_object]
      }
      required_fields = Braze()._privateApi.networkUtil.generateRequiredRequestFields()
      json.Append(required_fields)
      endpoint = Braze()._privateApi.config[BrazeConstants().BRAZE_CONFIG_FIELDS.ENDPOINT] + "api/v3/data"
      server_response = Braze()._privateApi.networkUtil.postToUrl(endpoint, json)
    end function,

    requestConfigAndTriggers: function(config_object as object)
      json = {
        "respond_with": config_object
      }
      required_fields = Braze()._privateApi.networkUtil.generateRequiredRequestFields(true)
      json.Append(required_fields)
      endpoint = Braze()._privateApi.config[BrazeConstants().BRAZE_CONFIG_FIELDS.ENDPOINT] + "api/v3/data"
      headers = [
        { key: "X-Braze-DataRequest", value: "true" },
        { key: "X-Braze-TriggersRequest", value: "true" }
      ]

      server_response = Braze()._privateApi.networkUtil.postToUrl(endpoint, json, headers)
      return server_response
    end function,

    requestTemplate: function(trigger_id as string, trigger_event_type as string, data = invalid as dynamic)
      if data = invalid
        data = {}
      end if
      stored_config_time = Braze()._privateApi.storage.brazeReadDataInt(BrazeConstants().BRAZE_STORAGE.CONFIG_TIME_KEY, BrazeConstants().BRAZE_STORAGE.CONFIG_SECTION)
      config_object = Braze()._privateApi.eventHandler.createConfigObject(stored_config_time, false)
      json = {
        "template": {
          "trigger_id": trigger_id,
          "trigger_event_type": trigger_event_type,
          "data": data
        },
        "respond_with": config_object
      }
      required_fields = Braze()._privateApi.networkUtil.generateRequiredRequestFields()
      json.Append(required_fields)
      endpoint = Braze()._privateApi.config[BrazeConstants().BRAZE_CONFIG_FIELDS.ENDPOINT] + "api/v3/template"
      headers = []
      server_response = Braze()._privateApi.networkUtil.postToUrl(endpoint, json, headers)
      return server_response
    end function
  }

  NetworkUtil = {
    postToUrl: function(url as string, postJson as object, headers = [] as object) as object
      request = CreateObject("roUrlTransfer")
      port = CreateObject("roMessagePort")
      request.SetPort(port)
      request.SetCertificatesFile("common:/certs/ca-bundle.crt")
      request.InitClientCertificates()
      request.SetUrl(url)
      request.AddHeader("Content-Type", "application/json")
      request.AddHeader("Accept-Encoding", "deflate/gzip")
      for each header in headers
        request.AddHeader(header.key, header.value)
      end for
      request.EnableEncodings(true)
      request.AddHeader("X-Braze-Api-Key", Braze()._privateApi.config[BrazeConstants().BRAZE_CONFIG_FIELDS.API_KEY])
      if (request.AsyncPostFromString(FormatJson(postJson)))
        while (true)
          msg = wait(0, port)
          if (type(msg) = "roUrlEvent")
            code = msg.GetResponseCode()
            return msg.getString()
          end if
          if (msg = invalid)
            request.AsyncCancel()
            return invalid
          end if
        end while
      end if
      return invalid
    end function,


    generateRequiredRequestFields: function(include_device = false as boolean) as object
      request_fields = {}
      app_object = Braze()._privateApi.dataProvider.AppDataProvider()
      current_time = Braze()._privateApi.timeUtils.getCurrentTimeSeconds()
      device_id = Braze()._privateApi.dataProvider.DeviceIdProvider()
      request_fields.Append(app_object)
      request_fields.Append({
        "time": current_time,
        "device_id": device_id
      })

      if (include_device)
        device_object = Braze()._privateApi.dataProvider.DeviceDataProvider()
        request_fields.Append({
          "device": device_object
        })
      end if

      return request_fields
    end function
  }

  brazePublicApi = {
    logEvent: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args", FormatJson(args))
      event_name = m._privateApi.brazeUtils.truncateBrazeField(args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME])
      events_blocklist = m._privateApi.dataProvider.ConfigProvider().events_blocklist
      if m._privateApi.brazeUtils.inArray(event_name, events_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", event_name)
        return
      end if
      event_properties = args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES]
      event_object = m._privateApi.eventHandler.createCustomEventEvent(event_name, event_properties)
      m._privateApi.brazeUtils.processTriggers(BrazeConstants().TRIGGER_TYPES.CUSTOM_EVENT, m._privateapi.dataprovider.ConfigProvider().triggers, m.task, { event_name: event_name, event_properties: event_properties, event_object: event_object })
      m._privateApi.eventHandler.logEvent(event_object)
    end function,

    logPurchase: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for purchase", FormatJson(args))
      product_id = Braze()._privateApi.brazeUtils.truncateBrazeField(args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID])
      purchases_blocklist = m._privateApi.dataProvider.ConfigProvider().purchases_blocklist
      if m._privateApi.brazeUtils.inArray(product_id, purchases_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", product_id)
        return
      end if
      currency_code = args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE]
      price = args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE]
      quantity = args[BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY]
      event_properties = args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES]
      event_object = m._privateApi.eventHandler.createPurchaseEvent(product_id, currency_code, price, quantity, event_properties)
      m._privateApi.brazeUtils.processTriggers(BrazeConstants().TRIGGER_TYPES.PURCHASE, m._privateapi.dataprovider.ConfigProvider().triggers, m.task, { product_id: product_id, event_properties: event_properties, event_object: event_object })
      m._privateApi.eventHandler.logEvent(event_object)
    end function,

    setLocationCustomAttribute: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for location custom attribute", FormatJson(args))
      key = Braze()._privateApi.brazeUtils.truncateBrazeField(args.key)
      if m._privateApi.brazeUtils.inArray(key, m._privateApi.dataProvider.ConfigProvider().attributes_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", key)
        return
      end if
      lat = args.lat
      lon = args.lon
      if key <> invalid and lat <> invalid and lon <> invalid and lat >= -90 and lat <= 90 and lon >= -180 and lon <= 180
        event_object = m._privateApi.eventHandler.createSetLocationCustomAttributeEvent(key, lat, lon)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for location custom attribute", FormatJson(args))
      end if
    end function,

    incrementCustomUserAttribute: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for incrementing custom user attribute", FormatJson(args))
      key = Braze()._privateApi.brazeUtils.truncateBrazeField(args.key)
      if m._privateApi.brazeUtils.inArray(key, m._privateApi.dataProvider.ConfigProvider().attributes_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", key)
        return
      end if
      value = args.value
      if key <> invalid and value <> invalid
        event_object = m._privateApi.eventHandler.createIncrementCustomAttributeEvent(key, value)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for incrementing custom user attribute", FormatJson(args))
      end if
    end function,

    addToCustomAttributeArray: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for adding to custom attribute array", FormatJson(args))
      key = Braze()._privateApi.brazeUtils.truncateBrazeField(args.key)
      if m._privateApi.brazeUtils.inArray(key, m._privateApi.dataProvider.ConfigProvider().attributes_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", key)
        return
      end if
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      if key <> invalid and value <> invalid
        event_object = m._privateApi.eventHandler.createAddToCustomAttributeArrayEvent(key, value)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for adding to custom attribute array", FormatJson(args))
      end if
    end function,

    removeFromCustomAttributeArray: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for remove from custom attribute array", FormatJson(args))
      key = Braze()._privateApi.brazeUtils.truncateBrazeField(args.key)
      if m._privateApi.brazeUtils.inArray(key, m._privateApi.dataProvider.ConfigProvider().attributes_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", key)
        return
      end if
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      if key <> invalid and value <> invalid
        event_object = m._privateApi.eventHandler.createRemoveFromCustomAttributeArrayEvent(key, value)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for remove from custom attribute array", FormatJson(args))
      end if
    end function,

    setCustomAttribute: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for setting custom attribute", FormatJson(args))
      key = Braze()._privateApi.brazeUtils.truncateBrazeField(args.key)
      if m._privateApi.brazeUtils.inArray(key, m._privateApi.dataProvider.ConfigProvider().attributes_blocklist)
        m._privateApi.brazeLogger.debug("blocklist", key)
        return
      end if
      value = args.value
      if key <> invalid and (value = invalid or Braze()._privateApi.brazeUtils.isString(value) or Braze()._privateApi.brazeUtils.isInt(value) or Braze()._privateApi.brazeUtils.isFloat(value) or Braze()._privateApi.brazeUtils.isBool(value) or Braze()._privateApi.brazeUtils.isArrayOfStrings(value))
        properties = {}
        if Braze()._privateApi.brazeUtils.isString(value) then
          value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
        end if
        if Braze()._privateApi.brazeUtils.isArrayOfStrings(value) then
          stringArray = createObject("roArray", value.Count(), true)
          for each item in value
            stringArray.Push(Braze()._privateApi.brazeUtils.truncateBrazeField(item))
          end for
          value = stringArray
        end if
        properties[key] = value
        attribute_object = m._privateApi.eventHandler.createAttributeObject("custom", properties)
        m._privateApi.eventHandler.logAttribute(attribute_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for setting custom attribute", FormatJson(args))
      end if
    end function,

    setStringAttribute: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for string attribute", FormatJson(args))
      key = args.key
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      if value <> invalid
        attribute_object = m._privateApi.eventHandler.createAttributeObject(key, value)
        m._privateApi.eventHandler.logAttribute(attribute_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for string attribute", FormatJson(args))
      end if
    end function,

    logIAMImpression: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for IAM impression", FormatJson(args))
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      if value <> invalid
        event_object = m._privateApi.eventHandler.createIAMImpressionEvent(value)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for IAM impression", FormatJson(args))
      end if
    end function,

    logIAMControlImpression: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for IAM control impression", FormatJson(args))
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      if value <> invalid
        event_object = m._privateApi.eventHandler.createIAMControlImpressionEvent(value)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for IAM control impression", FormatJson(args))
      end if
    end function,

    logIAMClick: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for IAM click", FormatJson(args))
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      if value <> invalid
        event_object = m._privateApi.eventHandler.createIAMClickEvent(value)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for IAM click", FormatJson(args))
      end if
    end function,

    logIAMButtonClick: function(args as object) as void
      m._privateApi.brazeLogger.debug("logging args for IAM Button click", FormatJson(args))
      value = Braze()._privateApi.brazeUtils.truncateBrazeField(args.value)
      value2 = args.value2
      if value <> invalid
        event_object = m._privateApi.eventHandler.createIAMButtonClickEvent(value, value2)
        m._privateApi.eventHandler.logEvent(event_object)
      else
        m._privateApi.brazeLogger.debug("invalid args for IAM Button click", FormatJson(args))
      end if
    end function,

    sessionStart: function(args as object) as void
      session_uuid = m._privateapi.dataprovider.SessionIdProvider()
      m._privateApi.brazeLogger.debug("session starting", session_uuid)
      storage = Braze()._privateApi.storage
      storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.SESSION_UUID_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION, session_uuid)
      storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.SESSION_START_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION, m._privateapi.timeutils.getCurrentTimeSeconds())
      event_object = m._privateApi.eventHandler.createEventObject(BrazeConstants().EVENT_TYPES.SESSION_START)
      m._privateApi.eventHandler.logEvent(event_object)
      m._privateapi.dataprovider.ConfigProvider()
      active_trigger = m._privateApi.brazeUtils.checkAgainstTriggers("open", m._privateapi.dataprovider.ConfigProvider().triggers)
      if active_trigger <> invalid
        if active_trigger.is_control = true
          m.logIAMControlImpression({ key: "trigger_id", value: active_trigger.trigger_id })
          return
        end if
        active_trigger = m._privateapi.brazeutils.updateTriggerWithTemplate(active_trigger, "open", { user_id: m._privateapi.dataprovider.cachedUserId })
        if active_trigger = invalid
          ' TODO: If this is invalid, grab the next one
          return
        end if
        active_trigger.delete("template_only")
        active_trigger.id = active_trigger.trigger_id
        active_trigger.delete("trigger_id")
        m.task.BrazeInAppMessage = active_trigger
      end if
    end function,

    sessionHeartBeat: function(args as object) as void
      m._privateApi.brazeLogger.debug("session heart beat", FormatJson(args))
      storage = Braze()._privateApi.storage
      storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.SESSION_END_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION, m._privateapi.timeutils.getCurrentTimeSeconds())
    end function,

    sessionEnd: function(args as object) as void
      storage = m._privateApi.storage
      previous_session = storage.brazeReadData(BrazeConstants().BRAZE_STORAGE.SESSION_UUID_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION)
      if previous_session <> invalid
        m._privateApi.brazeLogger.debug("ending session", previous_session)
        start_time = storage.brazeReadDataInt(BrazeConstants().BRAZE_STORAGE.SESSION_START_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION)
        end_time = storage.brazeReadDataInt(BrazeConstants().BRAZE_STORAGE.SESSION_END_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION)
        duration = 0
        if start_time <> invalid and end_time <> invalid
          duration = end_time - start_time
        end if
        data = {}
        data[BrazeConstants().BRAZE_EVENT_API_FIELDS.SESSION_DURATION] = duration
        event_object = m._privateApi.eventHandler.createEventObject(BrazeConstants().EVENT_TYPES.SESSION_END, data)
        event_object["session_id"] = previous_session
        m._privateApi.eventHandler.logEvent(event_object)
        'delete UUID key and times
        storage.brazeDeleteData(BrazeConstants().BRAZE_STORAGE.SESSION_UUID_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION)
        storage.brazeDeleteData(BrazeConstants().BRAZE_STORAGE.SESSION_START_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION)
        storage.brazeDeleteData(BrazeConstants().BRAZE_STORAGE.SESSION_END_KEY, BrazeConstants().BRAZE_STORAGE.SESSION_SECTION)
      else
        m._privateApi.brazeLogger.debug("no previous session to end", FormatJson(args))
      end if
    end function,

    setUserId: function(args as object) as void
      m._privateApi.brazeLogger.debug("setting user id", FormatJson(args))
      user_id = args["user_id"]
      if user_id <> m._privateapi.dataprovider.cachedUserId then
        m._privateApi.brazeLogger.debug("userid changed", "")
        m.sessionEnd({})
        storage = m._privateApi.storage
        storage.brazeSaveData(BrazeConstants().BRAZE_STORAGE.USER_ID_KEY, BrazeConstants().BRAZE_STORAGE.USER_ID_SECTION, user_id)
        m._privateapi.dataprovider.cachedUserId = user_id
        m._privateapi.dataprovider.cachedconfig.triggers = invalid
        m._privateApi.dataProvider.syncForNewUser()
        m.sessionStart({})
      else
        m._privateApi.brazeLogger.debug("userid not changed", "")
      end if  
    end function
  }

  brazePrivateApi = {
    config: config
    storage: StorageManager
    dataProvider: DataProvider
    timeUtils: TimeUtils
    networkUtil: NetworkUtil
    brazeLogger: Logger
    eventHandler: eventHandler
    brazeUtils: BrazeUtils
  }

  brazePublicApi.append({ _privateApi: brazePrivateApi })
  GetGlobalAA().brazeInstance = brazePublicApi
end function

' Construct a braze SDK object
function Braze() as object
  if GetGlobalAA().brazeInstance = invalid then
    print "BrazeInit not called beforehand"
  end if
  return GetGlobalAA().brazeInstance
end function

function getBrazeInstance(task as object) as object
  brazeInstance = {
    brazeTask: task,

    logEvent: function(event_name as string, event_properties = invalid as object) as void
      args = {}
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_NAME] = event_name
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CUSTOM_EVENT_PROPERTIES] = event_properties
      m.callInstanceMethod("logEvent", args)
    end function,

    logPurchase: function(product_id as string, currency_code as string, price as double, quantity as integer, event_properties = invalid as object) as void
      args = {}
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRODUCT_ID] = product_id
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.CURRENCY_CODE] = currency_code
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PRICE] = price
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.QUANTITY] = quantity
      args[BrazeConstants().BRAZE_EVENT_API_FIELDS.PURCHASE_EVENT_PROPERTIES] = event_properties
      m.callInstanceMethod("logPurchase", args)
    end function,

    setCustomAttribute: function(key as string, value as object) as void
      if value <> invalid and (GetInterface(value, "ifDateTime") <> invalid or Type(value) = "roDateTime") then
        m.callInstanceMethod("setCustomAttribute", { key: key, value: value.ToISOString() })
      else
        m.callInstanceMethod("setCustomAttribute", { key: key, value: value })
      end if
    end function,

    unsetCustomAttribute: function(key as string) as void
      m.callInstanceMethod("setCustomAttribute", { key: key, value: invalid })
    end function,

    setLocationCustomAttribute: function(key as string, lat as double, lon as double) as void
      m.callInstanceMethod("setLocationCustomAttribute", { key: key, lat: lat, lon: lon })
    end function,

    incrementCustomUserAttribute: function(key as string, value as integer) as void
      m.callInstanceMethod("incrementCustomUserAttribute", { key: key, value: value })
    end function,

    addToCustomAttributeArray: function(key as string, value as string) as void
      m.callInstanceMethod("addToCustomAttributeArray", { key: key, value: value })
    end function,

    removeFromCustomAttributeArray: function(key as string, value as string) as void
      m.callInstanceMethod("removeFromCustomAttributeArray", { key: key, value: value })
    end function,

    setUserId: function(userId as string) as void
      m.callInstanceMethod("setUserId", { user_id: userId })
    end function,

    setFirstName: function(name as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "first_name", value: name })
    end function,

    setLastName: function(name as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "last_name", value: name })
    end function,

    setEmail: function(email as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "email", value: email })
    end function,

    setDateOfBirth: function(dob as object) as void
      if dob <> invalid and (GetInterface(dob, "ifDateTime") <> invalid or Type(dob) = "roDateTime") then
        m.callInstanceMethod("setStringAttribute", { key: "dob", value: dob.ToISOString() })
      end if
    end function,

    setCountry: function(country as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "country", value: country })
    end function,

    setLanguage: function(language as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "language", value: language })
    end function,

    setHomeCity: function(homeCity as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "home_city", value: homeCity })
    end function,

    setGender: function(gender as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "gender", value: gender })
    end function,

    setPhoneNumber: function(number as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "phone", value: number })
    end function,

    setEmailSubscriptionState: function(subscriptionState = BrazeConstants().SUBSCRIPTION_STATES.UNSUBSCRIBED) as void
      m.callInstanceMethod("setStringAttribute", { key: "email_subscribe", value: subscriptionState })
    end function,

    setPushNotificationSubscriptionState: function(subscriptionState = BrazeConstants().SUBSCRIPTION_STATES.UNSUBSCRIBED) as void
      m.callInstanceMethod("setStringAttribute", { key: "push_subscribe", value: subscriptionState })
    end function,

    setAvatarImageUrl: function(avatarImageUrl as string) as void
      m.callInstanceMethod("setStringAttribute", { key: "image_url", value: avatarImageUrl })
    end function,

    logIAMImpression: function(trigger_id as string) as void
      m.callInstanceMethod("logIAMImpression", { key: "trigger_id", value: trigger_id })
    end function,

    logIAMClick: function(trigger_id as string) as void
      m.callInstanceMethod("logIAMClick", { key: "trigger_id", value: trigger_id })
    end function,

    logIAMButtonClick: function(trigger_id as string, button_id as integer) as void
      m.callInstanceMethod("logIAMButtonClick", { key: "trigger_id", value: trigger_id, value2: button_id })
    end function,

    callInstanceMethod: function(methodName as string, args as object) as void
      payload = {}
      payload.methodName = methodName
      payload.arguments = args
      m.brazeTask[BrazeConstants().SCENE_GRAPH_EVENTS.BRAZE_API_INVOCATION] = payload
    end function,
  }

  brazeInstance.callInstanceMethod("sessionEnd", {})
  brazeInstance.callInstanceMethod("sessionStart", {})
  return brazeInstance
end function

function LogInAppMessageImpression(id as string, brazetask) as void
  payload = {}
  payload.methodName = "logIAMImpression"
  payload.arguments = { key: "trigger_id", value: id }
  brazetask["BrazeApiInvocation"] = payload
end function

function LogInAppMessageControlImpression(id as string, brazetask) as void
  payload = {}
  payload.methodName = "logIAMControlImpression"
  payload.arguments = { key: "trigger_id", value: id }
  brazetask["BrazeApiInvocation"] = payload
end function

function LogInAppMessageButtonClick(triggerid as string, buttonid as integer, brazetask) as void
  payload = {}
  payload.methodName = "logIAMButtonClick"
  payload.arguments = { key: "trigger_id", value: triggerid, value2: buttonid }
  brazetask["BrazeApiInvocation"] = payload
end function

function LogInAppMessageClick(triggerid as string, brazetask) as void
  payload = {}
  payload.methodName = "logIAMClick"
  payload.arguments = { key: "trigger_id", value: triggerid }
  brazetask["BrazeApiInvocation"] = payload
end function
