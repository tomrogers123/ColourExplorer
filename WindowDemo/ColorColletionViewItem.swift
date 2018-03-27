import Cocoa

class ColorColletionViewItem: NSCollectionViewItem {

  override func viewDidLoad() {
    super.viewDidLoad()
    (view as? ColorColletionViewItemSubview)?.colorToDrawWith = (representedObject as! NSColor)
  }
    
}
