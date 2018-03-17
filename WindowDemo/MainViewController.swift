import Cocoa

class MainViewController: NSViewController, ColorViewDelegate {
  
  @IBOutlet weak var solidColor: SolidColorView!
  var previousColors = [NSColor]()
  
  override func awakeFromNib() {
    solidColor.delegate = self
  }
  
  func viewDidGetNewColor(_ oldColor: NSColor) {
    previousColors.append(oldColor)
    print("color added to array in controller")
  }
  
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
    solidColor.drawingFill = NSColor.clear
  }

}
