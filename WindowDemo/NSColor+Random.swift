import Cocoa

extension NSColor {
  
  static func random() -> NSColor {
    srand48(Int(NSDate.timeIntervalSinceReferenceDate))
    return NSColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
  }
  
}
