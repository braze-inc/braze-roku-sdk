' Offline-only unit tests (brs-node). Loaded after source/BrazeSDK.brs; must not use SceneGraph or device APIs.
' Lives under offline/ (not source/) so BrighterScript does not merge this file into the channel source scope
' (would duplicate Main/main with main.brs). Excluded from the channel zip (see torchietv/Makefile ZIP_EXCLUDE).

sub main()
    assertConstantsBasics()
    assertLoggingDisabled()
    assertLoggingEnabledByDefault()
    assertLoggingEnabledWhenTrue()
    assertAutomaticIamDisplayDefaultsFalse()
    assertAutomaticIamDisplayCanBeEnabled()
    assertAutomaticIamDisplayCanBeDisabled()
    assertDefaultIamUiAvailableUsesCachedValue()
    assertSdkInAppMessageUiRejectsOldSampleComponent()
    assertSdkInAppMessageUiRequiresOverlayFields()
    assertOnInAppMessageReceivedLeavesFieldWhenDefaultUiMissing()
    assertRejectedInAppMessageKeepsPendingMessage()
    assertModalInAppMessageReplacesPendingMessage()
    assertRegisterInAppMessageObserverSafeWithInvalidTask()
    assertBuildInAppMessageClickEvent()
    assertFocusRestoreTargetKeepsAttachedNode()
    assertFocusRestoreTargetFallsBackWhenNodeWasRemoved()
    assertInAppMessageDisplayableRequiresMessage()
    assertInAppMessageDisplayDelayIgnoresMissingAndNonPositive()
    assertInAppMessageDisplayDelayReturnsPositiveSeconds()
    assertSupportedAutomaticIamTypes()
    assertUnsupportedAutomaticIamTypes()
    assertUnsupportedIamTypeLogsError()
    assertUnsupportedIamTypeLogDoesNotRequireBrazeInstance()
    assertMissingDefaultIamUiLogMessage()
    assertScreenSizeUsesSceneDesignResolution()
    assertScreenSizeFallsBackToDefaults()
    print "offline_unit_tests: all passed"
end sub

sub assertConstantsBasics()
    c = BrazeConstants()
    assertSdkVersionShape(c.SDK_DATA.SDK_VERSION)
    if c.BRAZE_CONFIG_FIELDS.API_KEY <> "api-key" then testFail("BRAZE_CONFIG_FIELDS.API_KEY")
    if c.BRAZE_CONFIG_FIELDS.LOGGING_ENABLED <> "logging_enabled" then testFail("BRAZE_CONFIG_FIELDS.LOGGING_ENABLED")
    if c.BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY <> "automatic_iam_display" then testFail("BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY")
    if c.IAM_AUTOMATIC_DISPLAY_TYPES.Count() <> 1 then testFail("IAM_AUTOMATIC_DISPLAY_TYPES count")
    if c.IAM_AUTOMATIC_DISPLAY_TYPES[0] <> "MODAL" then testFail("IAM_AUTOMATIC_DISPLAY_TYPES MODAL")
end sub

sub assertLoggingDisabled()
    initBrazeForOfflineTest(false)
    logger = Braze()._privateApi.brazeLogger
    originalDoPrint = logger._doPrint
    logger._offlineTestPrinted = false
    logger._doPrint = function(tag as string, message as string)
        m._offlineTestPrinted = true
    end function
    logger.logMessage("offline-test", "suppressed")
    logger._doPrint = originalDoPrint
    if logger._offlineTestPrinted then testFail("logging_disabled")
end sub

sub assertLoggingEnabledByDefault()
    initBrazeForOfflineTest()
    logger = Braze()._privateApi.brazeLogger
    originalDoPrint = logger._doPrint
    logger._offlineTestPrinted = false
    logger._doPrint = function(tag as string, message as string)
        m._offlineTestPrinted = true
    end function
    logger.logMessage("offline-test", "enabled-default")
    logger._doPrint = originalDoPrint
    if not logger._offlineTestPrinted then testFail("logging_enabled_default")
end sub

sub assertLoggingEnabledWhenTrue()
    initBrazeForOfflineTest(true)
    logger = Braze()._privateApi.brazeLogger
    originalDoPrint = logger._doPrint
    logger._offlineTestPrinted = false
    logger._doPrint = function(tag as string, message as string)
        m._offlineTestPrinted = true
    end function
    logger.logMessage("offline-test", "enabled-explicit")
    logger._doPrint = originalDoPrint
    if not logger._offlineTestPrinted then testFail("logging_enabled_explicit")
end sub

sub assertAutomaticIamDisplayDefaultsFalse()
    originalGlobal = m.global
    m.global = invalid
    if BrazeIsAutomaticInAppMessageDisplayEnabled() <> false then testFail("automatic_iam_display default without global")
    m.global = { brazeConfig: {} }
    if BrazeIsAutomaticInAppMessageDisplayEnabled() <> false then testFail("automatic_iam_display default without key")
    m.global = originalGlobal
end sub

sub assertAutomaticIamDisplayCanBeEnabled()
    originalGlobal = m.global
    config = {}
    config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = true
    m.global = { brazeConfig: config }
    if BrazeIsAutomaticInAppMessageDisplayEnabled() <> true then testFail("automatic_iam_display enabled")
    m.global = originalGlobal
end sub

sub assertAutomaticIamDisplayCanBeDisabled()
    originalGlobal = m.global
    config = {}
    config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = false
    m.global = { brazeConfig: config }
    if BrazeIsAutomaticInAppMessageDisplayEnabled() <> false then testFail("automatic_iam_display disabled")
    m.global = originalGlobal
end sub

sub assertDefaultIamUiAvailableUsesCachedValue()
    aa = GetGlobalAA()
    original = aa.brazeDefaultIamUiAvailable
    aa.brazeDefaultIamUiAvailable = false
    if BrazeIsDefaultInAppMessageUiAvailable() <> false then testFail("default iam ui cached false")
    aa.brazeDefaultIamUiAvailable = true
    if BrazeIsDefaultInAppMessageUiAvailable() <> true then testFail("default iam ui cached true")
    aa.brazeDefaultIamUiAvailable = original
end sub

sub iamUiStub(hasOverlayFields as boolean) as object
    return {
        hasOverlay: hasOverlayFields
        hasField: function(name as string) as boolean
            if name = "isClosed" or name = "pendingClickEvent" then return m.hasOverlay
            return name = "inappmessage" or name = "BrazeTask"
        end function
    }
end sub

sub assertSdkInAppMessageUiRejectsOldSampleComponent()
    if BrazeIsSdkInAppMessageUi(invalid) <> false then testFail("sdk iam ui invalid")
    if BrazeIsSdkInAppMessageUi({}) <> false then testFail("sdk iam ui empty")
    if BrazeIsSdkInAppMessageUi(iamUiStub(false)) <> false then testFail("sdk iam ui old sample")
end sub

sub assertSdkInAppMessageUiRequiresOverlayFields()
    if BrazeIsSdkInAppMessageUi(iamUiStub(true)) <> true then testFail("sdk iam ui overlay fields")
end sub

sub assertOnInAppMessageReceivedLeavesFieldWhenDefaultUiMissing()
    aa = GetGlobalAA()
    originalGlobal = aa.global
    originalAvailable = aa.brazeDefaultIamUiAvailable
    originalTask = aa.brazeTaskForInAppMessage
    config = {}
    config[BrazeConstants().BRAZE_CONFIG_FIELDS.AUTOMATIC_IAM_DISPLAY] = true
    aa.global = { brazeConfig: config }
    aa.brazeDefaultIamUiAvailable = false
    aa.brazeTaskForInAppMessage = { BrazeInAppMessage: { message: "hello", message_type: "MODAL" } }
    BrazeOnInAppMessageReceived()
    if aa.brazeTaskForInAppMessage.BrazeInAppMessage.message <> "hello" then testFail("leave field when default iam ui missing")
    aa.global = originalGlobal
    aa.brazeDefaultIamUiAvailable = originalAvailable
    aa.brazeTaskForInAppMessage = originalTask
end sub

function receiveWithPendingInAppMessage(incoming as object) as object
    aa = GetGlobalAA()
    originalGlobal = aa.global
    originalAvailable = aa.brazeDefaultIamUiAvailable
    originalTask = aa.brazeTaskForInAppMessage
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
    result = { pending: aa.brazePendingInAppMessage, timerControl: timer.control }
    BrazeCancelPendingInAppMessage()
    aa.global = originalGlobal
    aa.brazeDefaultIamUiAvailable = originalAvailable
    aa.brazeTaskForInAppMessage = originalTask
    return result
end function

sub assertRejectedInAppMessageKeepsPendingMessage()
    unsupported = receiveWithPendingInAppMessage({ message: "slideup", message_type: "SLIDEUP" })
    if unsupported.pending = invalid or unsupported.pending.message <> "waiting" then testFail("unsupported type keeps pending message")
    if unsupported.timerControl <> "start" then testFail("unsupported type keeps pending timer")

    empty = receiveWithPendingInAppMessage({ message_type: "MODAL" })
    if empty.pending = invalid or empty.pending.message <> "waiting" then testFail("undisplayable message keeps pending message")
    if empty.timerControl <> "start" then testFail("undisplayable message keeps pending timer")
end sub

sub assertModalInAppMessageReplacesPendingMessage()
    replaced = receiveWithPendingInAppMessage({ message: "later", message_type: "MODAL" })
    if replaced.pending <> invalid then testFail("modal replaces pending message")
    if replaced.timerControl <> "stop" then testFail("modal stops pending timer")
end sub

sub assertRegisterInAppMessageObserverSafeWithInvalidTask()
    if BrazeRegisterInAppMessageObserver(invalid) <> false then testFail("register observer invalid")
    if BrazeRegisterInAppMessageObserver({}) <> false then testFail("register observer empty")
end sub

sub assertBuildInAppMessageClickEvent()
    bodyEvent = BrazeBuildInAppMessageClickEvent({ message: "hi", click_action: "URI", uri: "roku://home" }, -1)
    if bodyEvent.button <> invalid then testFail("click event body button")
    if bodyEvent.button_index <> -1 then testFail("click event body index")
    if bodyEvent.in_app_message.uri <> "roku://home" then testFail("click event body uri")

    button = { text: "Go", click_action: "URI", uri: "roku://details", id: 0 }
    buttonEvent = BrazeBuildInAppMessageClickEvent({ message: "hi", buttons: [button] }, 0)
    if buttonEvent.button.uri <> "roku://details" then testFail("click event button uri")
    if buttonEvent.button_index <> 0 then testFail("click event button index")

    missingEvent = BrazeBuildInAppMessageClickEvent({ message: "hi", buttons: [button] }, 1)
    if missingEvent.button <> invalid then testFail("click event missing button")
end sub

sub assertFocusRestoreTargetKeepsAttachedNode()
    scene = { id: "scene" }
    attached = { id: "attached", getScene: function() as dynamic
        return { id: "scene" }
    end function }
    target = BrazeGetFocusRestoreTarget(attached, scene)
    if target.id <> "attached" then testFail("focus restore keeps attached node")
    if BrazeGetFocusRestoreTarget(invalid, scene) <> invalid then testFail("focus restore ignores missing node")
end sub

sub assertFocusRestoreTargetFallsBackWhenNodeWasRemoved()
    scene = { id: "scene" }
    removed = { id: "removed", getScene: function() as dynamic
        return invalid
    end function }
    target = BrazeGetFocusRestoreTarget(removed, scene)
    if target.id <> "scene" then testFail("focus restore falls back for removed node")
end sub

sub assertInAppMessageDisplayableRequiresMessage()
    if BrazeIsInAppMessageDisplayable(invalid) <> false then testFail("displayable invalid")
    if BrazeIsInAppMessageDisplayable({}) <> false then testFail("displayable empty")
    if BrazeIsInAppMessageDisplayable({ message: "hello" }) <> true then testFail("displayable message")
end sub

sub assertInAppMessageDisplayDelayIgnoresMissingAndNonPositive()
    if BrazeGetInAppMessageDisplayDelay(invalid) <> 0 then testFail("delay invalid")
    if BrazeGetInAppMessageDisplayDelay({}) <> 0 then testFail("delay missing")
    if BrazeGetInAppMessageDisplayDelay({ display_delay: 0 }) <> 0 then testFail("delay zero")
    if BrazeGetInAppMessageDisplayDelay({ display_delay: -1 }) <> 0 then testFail("delay negative")
end sub

sub assertInAppMessageDisplayDelayReturnsPositiveSeconds()
    if BrazeGetInAppMessageDisplayDelay({ display_delay: 5 }) <> 5 then testFail("delay positive")
end sub

sub assertSupportedAutomaticIamTypes()
    if BrazeIsSupportedAutomaticInAppMessageType("MODAL") <> true then testFail("supported MODAL")
end sub

sub assertUnsupportedAutomaticIamTypes()
    if BrazeIsSupportedAutomaticInAppMessageType(invalid) <> false then testFail("supported invalid")
    if BrazeIsSupportedAutomaticInAppMessageType("SLIDEUP") <> false then testFail("supported SLIDEUP")
    if BrazeIsSupportedAutomaticInAppMessageType("MODAL_STYLED") <> false then testFail("supported MODAL_STYLED")
    if BrazeIsSupportedAutomaticInAppMessageType("FULL") <> false then testFail("supported FULL")
    if BrazeIsSupportedAutomaticInAppMessageType("HTML") <> false then testFail("supported HTML")
    if BrazeIsSupportedAutomaticInAppMessageType("HTML_FULL") <> false then testFail("supported HTML_FULL")
end sub

sub assertUnsupportedIamTypeLogsError()
    printed = BrazeGetUnsupportedInAppMessageLogMessage("SLIDEUP")
    if Instr(1, printed, "SLIDEUP") = 0 then testFail("unsupported type logs SLIDEUP")
    if Instr(1, printed, "not supported") = 0 then testFail("unsupported type logs not supported")
    htmlPrinted = BrazeGetUnsupportedInAppMessageLogMessage("HTML_FULL")
    if Instr(1, htmlPrinted, "HTML_FULL") = 0 then testFail("unsupported type logs HTML_FULL")
end sub

sub assertUnsupportedIamTypeLogDoesNotRequireBrazeInstance()
    originalInstance = GetGlobalAA().brazeInstance
    GetGlobalAA().brazeInstance = invalid
    BrazeLogUnsupportedInAppMessageType("SLIDEUP")
    GetGlobalAA().brazeInstance = originalInstance
end sub

sub assertMissingDefaultIamUiLogMessage()
    printed = BrazeGetMissingDefaultInAppMessageUiLogMessage()
    if Instr(1, printed, "BrazeDefaultInAppMessage") = 0 then testFail("missing default iam ui logs component name")
    if Instr(1, printed, "automatic_iam_display") = 0 then testFail("missing default iam ui logs config flag")
end sub

sub assertScreenSizeUsesSceneDesignResolution()
    hd = BrazeGetScreenSize({ currentDesignResolution: { width: 1280, height: 720, resolution: "HD" } }, 1, 2)
    if hd.width <> 1280 or hd.height <> 720 then testFail("screen size HD design resolution")
    fhd = BrazeGetScreenSize({ currentDesignResolution: { width: 1920, height: 1080, resolution: "FHD" } }, 1280, 720)
    if fhd.width <> 1920 or fhd.height <> 1080 then testFail("screen size FHD design resolution")
end sub

sub assertScreenSizeFallsBackToDefaults()
    cases = {
        noScene: invalid
        noField: {}
        noWidth: { currentDesignResolution: { height: 720 } }
        noHeight: { currentDesignResolution: { width: 1280 } }
        zeroWidth: { currentDesignResolution: { width: 0, height: 720 } }
        negativeHeight: { currentDesignResolution: { width: 1280, height: -1 } }
    }
    for each name in cases
        size = BrazeGetScreenSize(cases[name], 1280, 720)
        if size.width <> 1280 or size.height <> 720 then testFail("screen size default for " + name)
    end for
end sub

sub initBrazeForOfflineTest(loggingEnabled = invalid as dynamic)
    GetGlobalAA().brazeInstance = invalid
    config = {}
    configFields = BrazeConstants().BRAZE_CONFIG_FIELDS
    config[configFields.API_KEY] = "offline-test-key"
    config[configFields.ENDPOINT] = "https://offline.test/"
    config[configFields.HEARTBEAT_FREQ_IN_SECONDS] = 60
    if loggingEnabled <> invalid then
        config[configFields.LOGGING_ENABLED] = loggingEnabled
    end if
    port = CreateObject("roMessagePort")
    BrazeInit(config, port)
end sub

' Expect major.minor.patch with digits only (no hard-coded version so releases do not break CI).
sub assertSdkVersionShape(version as dynamic)
    if version = invalid or GetInterface(version, "ifString") = invalid then testFail("SDK_DATA.SDK_VERSION not a string")
    s = version
    if Len(s) < 5 then testFail("SDK_DATA.SDK_VERSION too short (expected semver-like x.y.z)")
    if Left(s, 1) = "." or Right(s, 1) = "." then testFail("SDK_DATA.SDK_VERSION must not start or end with '.'")
    if Instr(1, s, "..") > 0 then testFail("SDK_DATA.SDK_VERSION must not contain '..'")
    if not looksLikeSdkVersionSemver(s) then testFail("SDK_DATA.SDK_VERSION format (digits and '.' only, at least two dots)")
end sub

function looksLikeSdkVersionSemver(s as string) as boolean
    dotCount = 0
    for i = 1 to Len(s)
        ch = Mid(s, i, 1)
        if ch = "." then
            dotCount = dotCount + 1
        else
            if ch < "0" or ch > "9" then
                return false
            end if
        end if
    end for
    return dotCount >= 2
end function

sub testFail(label as string)
    print "offline_unit_tests FAILED: " + label
    x = invalid
    print x.foo
end sub
