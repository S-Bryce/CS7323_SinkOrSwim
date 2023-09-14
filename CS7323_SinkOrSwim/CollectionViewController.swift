//
//  CollectionViewController.swift
//  CS7323_SinkOrSwim
//
//  Created by Jaime Garza on 9/13/23.
//

import UIKit

private let reuseID = "CollectionViewID"

class CollectionViewController: UICollectionViewController {
    
    lazy var imageModel = {
        return ImageModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageModel.numberOfImages()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath as IndexPath) as! CollectionViewCell
        cell.imageView.image = imageModel.getImageWith(indexPath.row)
        
        return cell
    }
}
