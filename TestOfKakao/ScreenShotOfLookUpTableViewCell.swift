//
//  ScreenShotOfLookUpTableViewCell.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import UIKit

class ScreenShotOfLookUpTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    let defaultSectionCount = 1
    
    @IBOutlet weak var ScreenShotsCollectionView: UICollectionView!
    var screenShotsURL: Array<String>? {
        didSet {
            if screenShotsURL != nil {
                ScreenShotsCollectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if screenShotsURL != nil {
            return defaultSectionCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenShotsURL?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsableCellIdentifier.ScreenShot.rawValue, for: indexPath) as! ScreenShotsCollectionViewCell
        cell.urlOfScreenShot = screenShotsURL![indexPath.row]
        cell.loadScreenShotImage()
        return cell;
    }
}
