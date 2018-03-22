import Foundation

extension CGRect {
  
  /// Like iOS, not sure why not there by default
  var center : CGPoint {
    return CGPoint(x: midX, y: midY)
  }
  
  
}
