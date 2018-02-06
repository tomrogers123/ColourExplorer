import Cocoa

@NSApplicationMain class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var window: NSWindow!
  
  override init() {
    MainWindowController.shared.showWindow(nil)  }
  
}

