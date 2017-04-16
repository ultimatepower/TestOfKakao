//
//  ScreenShotsCollectionViewCell.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ScreenShotsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var screenShotImageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var urlOfScreenShot: String!
    
    func loadScreenShotImage() {
        indicator.startAnimating()
        Alamofire.request(urlOfScreenShot).responseImage { image in
            self.screenShotImageView.image = UIImage(data: image.data!)
            self.indicator.stopAnimating()
        }
    }
}
