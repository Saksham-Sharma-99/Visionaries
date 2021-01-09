//
//  HomeViewController.swift
//  Pokemon Detection
//
//  Created by Saksham Sharma on 09/01/21.
//  Copyright © 2021 sharma. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var objectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        objectImage.layer.cornerRadius = objectImage.frame.height/2
    }

}



class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var picsCollection: UICollectionView!
    var object = String()
    
    var images : [UIImage] = [#imageLiteral(resourceName: "squirtle1"),#imageLiteral(resourceName: "pikachu1"),#imageLiteral(resourceName: "bulbasaur1"),#imageLiteral(resourceName: "spaceship"),#imageLiteral(resourceName: "chair"),#imageLiteral(resourceName: "gramophone"),#imageLiteral(resourceName: "tv"),#imageLiteral(resourceName: "kisspng-fender-jazzmaster-squier-deluxe-hot-rails-stratoca-5afe14c8796646.1121173215266009044973"),#imageLiteral(resourceName: "wb")]
    var constants = Constants()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = constants.title
        picsCollection.delegate = self
        picsCollection.dataSource = self
        picsCollection.layer.cornerRadius = 10
//        picsCollection.register(UINib(nibName: constants.NibName, bundle: nil), forCellWithReuseIdentifier: constants.picsCell)
    }
    

}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = 200
//        let cellHeight = 200
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = picsCollection.dequeueReusableCell(withReuseIdentifier: constants.picsCell, for: indexPath) as! CollectionViewCell
        cell.objectImage.image = images[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.object = constants.squirtle
        case 1:
            self.object = constants.pikachu
        case 2:
            self.object = constants.bulbasaur
        case 3:
            self.object = constants.ship
        case 4:
            self.object = constants.chair
        case 5:
            self.object = constants.gramophone
        case 6:
            self.object = constants.tv
        case 7:
            self.object = constants.fender
        case 8:
            self.object = constants.wheelbarrow
        default:
            break;
        }
        
        self.performSegue(withIdentifier: constants.segue, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == constants.segue{
            let vc = segue.destination as! SampleViewController
            vc.object = object
        }
    }
}
