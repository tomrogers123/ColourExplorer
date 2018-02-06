import Cocoa

class MainViewController: NSViewController {
  
  @IBOutlet weak var solidColor: SolidColorView!
  var oldColor: NSColor?
  
  @IBAction func showRed(_ sender: NSButton) {
    solidColor.drawingFill = NSColor.red
  }
  
  @IBAction func showRandomColor(sender: NSButton) {
    solidColor.drawingFill = NSColor.random()
  }
  
  @IBAction func showPreviousColor(sender: NSButton) {
    solidColor.drawingFill = solidColor.oldColor ?? NSColor.clear
    }
  }



