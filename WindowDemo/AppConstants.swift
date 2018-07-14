import Cocoa

extension NSNib.Name {
  static let MainWindow = NSNib.Name("Document")
  static let PrefWindow = NSNib.Name("PreferencesWindow")
}

struct PreferenceKeys {
  static let MainColorSettingName: String = "Default Drawing Color"
  static let AnimateAtStartupSettingName: String = "Animate on Startup"
}

extension NSUserInterfaceItemIdentifier {
  static let ColorItemID = NSUserInterfaceItemIdentifier("ColorItem")
}
