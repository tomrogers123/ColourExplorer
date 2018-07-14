import Cocoa

@objc protocol ColorViewDelegate : NSObjectProtocol {
  func viewDidGetNewColor(_ color: NSColor)
}

class SolidColorView: NSView {
  
  @IBOutlet weak var delegate: ColorViewDelegate?
  var animationEnabled = GlobalSettings.animatedByDefault
  private let boxLayer = CALayer()
  private let colorFadeAnimation = CATransition()
  
  var drawingFill = GlobalSettings.defaultColor {
    didSet {
      conditionallyPerformAnimation(oldValue)
      delegate?.viewDidGetNewColor(oldValue)
    }
  }
  
  override var intrinsicContentSize: NSSize {
    return CGSize(width: bounds.width, height: bounds.height)
  }
  
  private func conditionallyPerformAnimation(_ oldValue: NSColor) {
    if animationEnabled {
      colorFadeAnimation.duration = 0.2
      colorFadeAnimation.type = kCATransitionFade
      boxLayer.backgroundColor = drawingFill.cgColor
      boxLayer.add(colorFadeAnimation, forKey: "transition")
    } else {
      layer?.setNeedsDisplay()
    }
  }
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    CATransaction.setDisableActions(true)
    boxLayer.frame = bounds
    boxLayer.backgroundColor = drawingFill.cgColor
    layer?.addSublayer(boxLayer)
    CATransaction.commit()
    
  }
  
}
