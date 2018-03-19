import Cocoa

protocol ColorViewDelegate : NSObjectProtocol {
  func viewDidGetNewColor(_ color: NSColor)
}

class SolidColorView: NSView {
  
  weak var delegate: ColorViewDelegate?
  var animationEnabled = false
  private let boxLayer = CALayer()
  private let colorFadeAnimation = CATransition()
  
  private func conditionallyPerformAnimation(_ oldValue: NSColor) {
    if animationEnabled {
      colorFadeAnimation.duration = 0.5
      colorFadeAnimation.type = kCATransitionFade
      boxLayer.backgroundColor = drawingFill.cgColor
      boxLayer.add(colorFadeAnimation, forKey: "transition")
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
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    CATransaction.setDisableActions(true)
    boxLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    boxLayer.backgroundColor = drawingFill.cgColor
    layer?.addSublayer(boxLayer)
    CATransaction.commit()
    
  }
  
}
