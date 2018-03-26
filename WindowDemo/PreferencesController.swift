import Cocoa

class globalSettings {
  static var defaultColor: NSColor?
  static var animatedByDefault: Bool {
    return UserDefaults.standard.bool(forKey: PreferenceKeys.AnimateAtStartupSettingName)
  }

}

class PreferencesController: NSWindowController, NSWindowDelegate {
  
  @IBOutlet weak var picker: NSColorWell!
  @IBOutlet weak var animateOnStartup: NSButton!
  var animatedByDefault: Bool? = globalSettings.animatedByDefault
  
  override var windowNibName: NSNib.Name? { return NSNib.Name.PrefWindow }
  
  override func windowDidLoad() {
    if animatedByDefault == true {
      animationOnButton.state = .on
    } else {
      animationOffButton.state = .on
    }
  }
  @IBOutlet weak var animationOffButton: NSButton!
  @IBOutlet weak var animationOnButton: NSButton!
  
  private func grabAndSaveDefaults() {
    
      UserDefaults.standard.set(animatedByDefault, forKey: PreferenceKeys.AnimateAtStartupSettingName)
      print("saved")

  }
  
  @IBAction func changedAnimationDefault(_ sender: NSButton) {
    if sender.title == "Enabled" {
      animatedByDefault = true
    } else {
      animatedByDefault = false
    }
  }
  
  @IBAction func newDefaultsSelected(_ sender: NSButton) {
    grabAndSaveDefaults()
    print("j")
    
  }
  
}

