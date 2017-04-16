//
//  HeaderOfLookUpTableViewCell.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import UIKit
import SwiftyStarRatingView
import Alamofire

class HeaderOfLookUpTableViewCell: UITableViewCell {

    @IBOutlet weak var iconOfApp: UIImageView!
    @IBOutlet weak var titleOfApp: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var ratingView: SwiftyStarRatingView!
//    @IBOutlet weak var ratingView: AARatingBar!
    
    var urlOfIcon: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadIconImage() {
        indicator.startAnimating()
        Alamofire.request(urlOfIcon).responseImage { image in
            self.iconOfApp.image = UIImage(data: image.data!)
            self.indicator.stopAnimating()
        }
    }
    
}
