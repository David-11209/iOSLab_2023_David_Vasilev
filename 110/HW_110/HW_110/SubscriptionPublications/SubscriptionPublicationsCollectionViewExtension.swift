import UIKit
extension SubscriptionPublicationsDataManager: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let photo = photosModels[indexPath.row]
            guard let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: SubsPublicationsCollectionViewCell.reuseIdentifier,
                    for: indexPath) as? SubsPublicationsCollectionViewCell
            else {
                return UICollectionViewCell()
            }

//            let count = dataManager.getCountLike(photoId: photo.id ?? "")
            cell.configure(with: photo, count: 0)
            cell.delegate = self
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 500)
    }
}
