//
//  TopRankUnitTableViewCell.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TopRankUnitTableViewCell: UITableViewCell {

    @IBOutlet var labelOfRank: UILabel!
    @IBOutlet var icon: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var urlOfIcon: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadIconImage() {
        indicator.startAnimating()
        Alamofire.request(urlOfIcon).responseImage { image in
            self.icon.image = UIImage(data: image.data!)
            self.indicator.stopAnimating()
        }
    }
}
