## 0.1.1

##### Added

- Style data on buttons in In-App messages is now available. See `README.md` for more information.

##### Changed

- Get In-App Message triggers at the start of session to match other SDKs.

##### Fixed

- Fix issues with messages that re-evaluate campaign eligibility before displaying.
- Fixed issues with users in the control group

## 0.1.0

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
