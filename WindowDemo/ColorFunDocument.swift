import Cocoa

class ColorFunDocument: NSDocument {
  
  var storedColors = [NSColor]()
  
  override var windowNibName: NSNib.Name? { return NSNib.Name("Document") }

}
