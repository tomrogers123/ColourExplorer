import Cocoa

class MainViewController: NSViewController, ColorViewDelegate {
  
  @IBOutlet weak var solidColor: SolidColorView!
  @IBOutlet weak var previousColorChart: NSCollectionView!
  private(set) var previousColors = [NSColor]()
  private var goingBack = false
  private var backwardSteps = 0
  
  override func awakeFromNib() {
    solidColor.delegate = self
  }
  
  func viewDidGetNewColor(_ oldColor: NSColor) {
    if goingBack == false {
      previousColors.append(oldColor)
      previousColorChart.reloadData()
    }
  }
  
  @IBAction func showRed(_ sender: NSButton) {
    solidColor.drawingFill = NSColor.red
  }
  
  @IBAction func showRandomColor(sender: NSButton) {
    goingBack = false
    backwardSteps = 0
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
    
    goingBack = true
    backwardSteps += 1
    
    let desiredIndex = previousColors.count - backwardSteps
    
    print(desiredIndex)
    
    if desiredIndex < previousColors.count && desiredIndex >= 0 {
      solidColor.drawingFill = previousColors[desiredIndex]
    }
    
  }
  


}
