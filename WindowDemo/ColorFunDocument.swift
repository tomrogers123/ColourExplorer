import Cocoa

class ColorFunDocument: NSDocument {
  
  var storedColors = [NSColor]()
  
  override var windowNibName: NSNib.Name? { return NSNib.Name.mainWindow }
  
  override func data(ofType typeName: String) throws -> Data {
    let encodedBits = NSKeyedArchiver.archivedData(withRootObject: storedColors)
    return encodedBits
    
  }
  
  override func read(from data: Data, ofType typeName: String) throws {
    let _ = NSKeyedUnarchiver.unarchiveObject(with: data) as? [NSColor]
    throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)  }

}

extension MainViewController {
  var activeDocument: ColorFunDocument? {
    return view.window?.windowController?.document as? ColorFunDocument
    
  }
}
