import Cocoa

extension NSNib.Name {
  static let mainWindow = NSNib.Name("Document")
  static let PrefWindow = NSNib.Name("PreferencesWindow")
}

struct PreferenceKeys {
  static let mainColorSettingName: String = "Default Drawing Color"
  static let AnimateAtStartupSettingName: String = "Animate on Startup"
}
