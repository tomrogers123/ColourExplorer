import Cocoa

class MainViewController: NSViewController {
  
  @IBOutlet weak var solidColor: SolidColorView!
  
  @IBAction func showRed(_ sender: NSButton) {
    solidColor.drawingFill = NSColor.red
  }
  
  @IBAction func showRandomColor(sender: NSButton) {
    solidColor.drawingFill = NSColor.random()
  }
  
  @IBAction func DisplayModeSelected(_ sender: NSSegmentedControl) {
    if sender.selectedSegment == 1 {
      solidColor.animationEnabled = true
    } else {
      solidColor.animationEnabled = false
    }
  }
  
  @IBAction func showPreviousColor(sender: NSButton) {
    solidColor.drawingFill = solidColor.oldColor ?? NSColor.clear
  }

}
