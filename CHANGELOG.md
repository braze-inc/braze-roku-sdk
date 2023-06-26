## 1.0.0

##### Added

- Support for Feature Flags.
   - Get a single feature flag
     ff = m.braze.getFeatureFlag("theme")
     if ff.enabled 
       bgcolor = ff.getStringProperty("bgcolor")
       ...
     end if

   - Get all feature flags.
     allFeatureFlags = m.braze.getAllFeatureFlags()

   - Be notified when Feature Flags are updated. Data values may not always be different.
     m.BrazeTask.ObserveField("BrazeFeatureFlags", "onFeatureFlagChanges")

   - Refresh feature flags.
     m.braze.refreshFeatureFlags()

   - If you want to not cache feature flags, you can put the following in your main.brs
   config[config_fields.FF_CACHE_DISABLED] = true

##### Fixed

- Fixed a circular reference between Braze and BrazeTask.

## 0.1.3

##### Fixed

- Fixed an issue where in-app messages might not filter properly on property criteria.
- Fixed an issue where very low opacity values would cause colors to have the wrong value.

##### Added

- Added a new sample app (TorchieTV) that more closely mimics the common Roku app.

## 0.1.2

##### Fixed

- Reduced the number of superfluous requests to Braze servers

## 0.1.1

##### Added

- Style data on buttons in In-App messages is now available. See `README.md` for more information.

##### Changed

- Get In-App Message triggers at the start of session to match other SDKs.

##### Fixed

- Fixed issues with messages that re-evaluate campaign eligibility before displaying.
- Fixed issues with users in the control group.
- Fixed issue where new session wasn't started when changing users.

## 0.1.0

##### ⚠️ Known Issues
- This release contains a known issue with in-app message syncing. Do not use this version and upgrade to 0.1.1+ instead.

##### Added

- Added support for receiving In-App Messaging model data.
- Added field `BrazeTask.BrazeInAppMessage` for In-App Messages.
- Added `LogInAppMessageImpression`, `LogInAppMessageButtonClick`, and `LogInAppMessageClick` to `BrazeSDK`.

## 0.0.4

##### Changed

- Replaced the `GetModel` method with the more precise `GetModelDetails().ModelNumber`.

##### Fixed

- Replaced the deprecated `GetVersion` Roku API method with `GetOSVersion`.

## 0.0.3

##### Fixed

- Fixed the polarity on `ad_tracking_enabled` sent to Braze via device info.

## 0.0.2

##### Fixed

- Fixed an issue with device Id generation.

## 0.0.1

##### Added

- Initial release.
- Supports logging custom events, purchases, setting default and custom user attributes, session tracking, and user identity management.
