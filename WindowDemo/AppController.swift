import Cocoa

@NSApplicationMain class AppController: NSObject, NSApplicationDelegate {
  
  var prefs : PreferencesController!
  
  @IBAction func openPreferences(_ sender: NSMenuItem) {
    prefs = PreferencesController()
    prefs.showWindow(self)
  }
  
  
}

