import Cocoa

class MainViewController: NSViewController, ColorViewDelegate, NSCollectionViewDelegate {
  
  @IBOutlet weak var solidColor: SolidColorView!
  @IBOutlet weak var previousColorChart: NSCollectionView!
  private(set) var previousColors = [NSColor]()
  private var goingBack = false
  private var backwardSteps = 0
  
  
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
    
    if desiredIndex < previousColors.count && desiredIndex >= 0 {
      solidColor.drawingFill = previousColors[desiredIndex]
    }
    
  }
  
  func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
    
    guard let selectedColor = collectionView.item(at: indexPaths.first!)?.representedObject as? NSColor else { return }
    
    goingBack = true
    solidColor.drawingFill = selectedColor
    
  }
  
}
