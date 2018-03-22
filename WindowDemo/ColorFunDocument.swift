import Cocoa

class ColorFunDocument: NSDocument {
  
  var storedColors = [NSColor]()
  
  override var windowNibName: NSNib.Name? { return NSNib.Name("Document") }
  
  override func data(ofType typeName: String) throws -> Data {
    let encodedBits = NSKeyedArchiver.archivedData(withRootObject: storedColors)
    return encodedBits
    
  }
  
  override func read(from data: Data, ofType typeName: String) throws {
    let gotData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [NSColor]
    throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)  }

}

extension MainViewController {
  var activeDocument: ColorFunDocument? {
    let rawDoc = NSDocumentController.shared.currentDocument
    return rawDoc as? ColorFunDocument
  }
}
