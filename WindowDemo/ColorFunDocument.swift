import Cocoa

class ColorFunDocument: NSDocument {
  
  @objc(<#prefixed Objective-C class name#>)class DocumentContents: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool
    
    required init?(coder aDecoder: NSCoder) {
      <#code#>
    }
    
    func encode(with aCoder: NSCoder) {
      aCoder.
    }
    
    var storedColors = [NSColor]()
    var lastActiveColor: NSColor?
  }
  
  var contents = DocumentContents()
  
  override var windowNibName: NSNib.Name? { return NSNib.Name.MainWindow }
  
  override func data(ofType typeName: String) throws -> Data {
    let encodedBits = NSKeyedArchiver.archivedData(withRootObject: contents)
    return encodedBits
    
  }
  
  override func read(from data: Data, ofType typeName: String) throws {
    guard let rawDocument = NSKeyedUnarchiver.unarchiveObject(with: data) as? DocumentContents else { throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    contents.storedColors = rawDocument.storedColors
    contents.lastActiveColor = rawDocument.lastActiveColor
    
  }

}

extension MainViewController {
  var activeDocument: ColorFunDocument? {
    return view.window?.windowController?.document as? ColorFunDocument
    
  }
}
