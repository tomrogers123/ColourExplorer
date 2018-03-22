import Cocoa

extension MainViewController : NSCollectionViewDataSource {

  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return activeDocument?.storedColors.count ?? 0
  }

  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    
    let colorItem = ColorColletionViewItem()
    colorItem.representedObject = activeDocument?.storedColors[indexPath.item]
    return colorItem
    
  }
}
