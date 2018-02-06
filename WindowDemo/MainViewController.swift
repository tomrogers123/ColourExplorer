import Cocoa

class MainViewController: NSViewController {
  
  @IBOutlet weak var solidColor: SolidColorView!
  var oldColor: NSColor?
  
  @IBAction func showRed(_ sender: NSButton) {
    oldColor = solidColor.drawingFill
    solidColor.drawingFill = NSColor.red
    solidColor.needsDisplay = true
  }
  
  @IBAction func showRandomColor(sender: NSButton) {
    oldColor = solidColor.drawingFill
    solidColor.drawingFill = NSColor.random()
    solidColor.needsDisplay = true
  }
  
  @IBAction func showPreviousColor(sender: NSButton) {
    if let realOldColor = oldColor {
      solidColor.drawingFill = realOldColor
      solidColor.needsDisplay = true
    }
  }
  
}


