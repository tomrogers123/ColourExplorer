import Cocoa

protocol ColorViewDelegate : NSObjectProtocol {
  func viewDidGetNewColor(_ color: NSColor)
}

class SolidColorView: NSView {
  
  private func conditionallyPerformAnimation(_ oldValue: NSColor) {
    if animationEnabled {
      colorFadeAnimation.fromValue = oldValue.cgColor
      colorFadeAnimation.toValue = drawingFill.cgColor
      colorFadeAnimation.duration = 5
      boxLayer.backgroundColor = drawingFill.cgColor
      boxLayer.add(colorFadeAnimation, forKey: "baclgroundColor")
    } else {
      layer?.setNeedsDisplay()
    }
  }
  
  var drawingFill = NSColor.green {
    didSet {
      delegate?.viewDidGetNewColor(oldValue)
      conditionallyPerformAnimation(oldValue)
    }
  }
  
  weak var delegate: ColorViewDelegate?
  var animationEnabled = false
  let boxLayer = CALayer()
  let colorFadeAnimation = CABasicAnimation()
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    CATransaction.setDisableActions(true)
    boxLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    boxLayer.backgroundColor = drawingFill.cgColor
    layer?.addSublayer(boxLayer)
    CATransaction.commit()
    
  }
  
}
