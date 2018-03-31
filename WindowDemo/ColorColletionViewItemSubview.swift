import Cocoa

class ColorColletionViewItemSubview: NSView {
  
  var colorToDrawWith: NSColor!
  var isSelected = false { didSet { layer?.setNeedsDisplay() } }
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    CATransaction.disableActions()
    let box = CALayer()
    box.frame = bounds
    box.backgroundColor = colorToDrawWith.cgColor
    if isSelected { box.borderWidth = 2 }
    layer?.addSublayer(box)
  }
    
}
