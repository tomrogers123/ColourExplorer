import Cocoa

@objc protocol ColorViewDelegate : NSObjectProtocol {
  func viewDidGetNewColor(_ color: NSColor)
}

class SolidColorView: NSView {
  
  @IBOutlet weak var delegate: ColorViewDelegate?
  var animationEnabled = globalSettings.animatedByDefault
  private let boxLayer = CALayer()
  private let colorFadeAnimation = CATransition()
  
  var drawingFill = globalSettings.defaultColor {
    didSet {
      conditionallyPerformAnimation(oldValue)
      delegate?.viewDidGetNewColor(oldValue)
    }
  }
  
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
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    CATransaction.setDisableActions(true)
    boxLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    boxLayer.backgroundColor = drawingFill.cgColor
    layer?.addSublayer(boxLayer)
    CATransaction.commit()
    
  }
  
}
