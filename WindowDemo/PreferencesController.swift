import Cocoa

class globalSettings {
  
  static var defaultColor: NSColor {
    guard let objOrig  = UserDefaults.standard.data(forKey: PreferenceKeys.mainColorSettingName) else { return NSColor.gray }
    let extractedObj = NSKeyedUnarchiver.unarchiveObject(with: objOrig)
    return (extractedObj as? NSColor) ?? NSColor.yellow
    
  }
  
  static var animatedByDefault: Bool {
    return UserDefaults.standard.bool(forKey: PreferenceKeys.AnimateAtStartupSettingName)
  }

}

class PreferencesController: NSWindowController, NSWindowDelegate {
  
  @IBOutlet weak var picker: NSColorWell!
  @IBOutlet weak var animateOnStartup: NSButton!
  var animatedByDefault: Bool? = globalSettings.animatedByDefault
  
  override var windowNibName: NSNib.Name? { return NSNib.Name.PrefWindow }
  
  @IBOutlet weak var animationOffButton: NSButton!
  @IBOutlet weak var animationOnButton: NSButton!
  
  override func windowDidLoad() {
    
    if animatedByDefault == true {
      animationOnButton.state = .on
    } else {
      animationOffButton.state = .on
    }
    
    picker.color = globalSettings.defaultColor
    
  }

  
  private func grabAndSaveDefaults() {
    
    if animatedByDefault != globalSettings.animatedByDefault {
      UserDefaults.standard.set(animatedByDefault, forKey: PreferenceKeys.AnimateAtStartupSettingName)
      print("saved")
    }
      
      let colorToSendToSettings = NSKeyedArchiver.archivedData(withRootObject: picker.color)
      UserDefaults.standard.set(colorToSendToSettings, forKey: PreferenceKeys.mainColorSettingName)

  }
  
  @IBAction func changedAnimationDefault(_ sender: NSButton) {
    if sender.title == "Enabled" {
      animatedByDefault = true
    } else {
      animatedByDefault = false
    }
  }
  
  deinit {
    print("removed")
  }
  
  override init(window: NSWindow?) {
    super.init(window: window)
    print("new instaance of \(className)")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @IBAction func newDefaultsSelected(_ sender: NSButton) {
    grabAndSaveDefaults()
    self.close()
  }
  
  @IBAction func cancelPreferences(_ sender: NSButton) {
    self.close()
  }
  
}

