import Cocoa

class MainWindowController: NSWindowController {
  static let shared = MainWindowController(windowNibName: NSNib.Name("MainWindow"))
}
