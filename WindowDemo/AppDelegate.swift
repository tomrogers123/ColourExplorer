import Cocoa

@NSApplicationMain class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var window: NSWindow!
  
  override init() {
    super.init()
    MainWindowController.shared.showWindow(nil)
  }
  func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    if !flag {
      MainWindowController.shared.showWindow(nil)
    }
    return true
  }
  
}

