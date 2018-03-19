import Cocoa

extension MainViewController : NSCollectionViewDataSource {

  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return previousColors.count
  }

  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    
    let colorItem = ColorColletionViewItem()
    (colorItem.view as? ColorColletionViewItemSubview)?.colorToDrawWith = previousColors[indexPath.item]
    return colorItem
    
  }
}
