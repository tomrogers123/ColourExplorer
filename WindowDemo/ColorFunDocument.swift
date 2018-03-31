import Cocoa

class ColorFunDocument: NSDocument {
  
  var storedColors = [NSColor]()
  
  override var windowNibName: NSNib.Name? { return NSNib.Name.MainWindow }
  
  override func data(ofType typeName: String) throws -> Data {
    let encodedBits = NSKeyedArchiver.archivedData(withRootObject: storedColors)
    return encodedBits
    
  }
  
  override func read(from data: Data, ofType typeName: String) throws {
    guard let rawColors = NSKeyedUnarchiver.unarchiveObject(with: data) as? [NSColor] else {
      throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    storedColors = rawColors
    
  }

}

extension MainViewController {
  var activeDocument: ColorFunDocument? {
    return view.window?.windowController?.document as? ColorFunDocument
    
  }
}
