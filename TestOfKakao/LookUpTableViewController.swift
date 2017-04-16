//
//  LookUpTableViewController.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import UIKit
import Alamofire

class LookUpTableViewController: UITableViewController {
    
    // MARK: - Default Constants
    private let defaultValueOfTableSectionCount = 1
    private let defaultValueOfTableRowCount = 3
    private let defaultHeaderHeight: CGFloat = 116.0
    private let defaultScreenShots: CGFloat = 500.0
    private let defaultSummaryHeight: CGFloat = 1000
    
    var information: LookUpInformation?
    var idOfApp: String!
    var titleOfApp: String = "" {
        didSet {
           self.title = titleOfApp
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = defaultSummaryHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        loadOriginalSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return defaultValueOfTableSectionCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultValueOfTableRowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = IndexOfLookUpTables(rawValue: indexPath.row)!
        switch index {
        case .Header:
            let cell = tableView.dequeueReusableCell(withIdentifier: UsableCellIdentifier.HeaderOfLookUp.rawValue, for: indexPath) as! HeaderOfLookUpTableViewCell
            if let forcedAppInformation = information {
                cell.titleOfApp.text = titleOfApp
                cell.ratingView.value = CGFloat(forcedAppInformation.rating)
                cell.urlOfIcon = forcedAppInformation.artworkURL
                cell.loadIconImage()
            }
            return cell
        case .ScreenShots:
            let cell = tableView.dequeueReusableCell(withIdentifier: UsableCellIdentifier.ScreenShotsOfLookUp.rawValue, for: indexPath) as! ScreenShotOfLookUpTableViewCell
            if let forcedAppInformation = information {
                cell.screenShotsURL = forcedAppInformation.screenShotsURLs
            }
            return cell
        case .Summary:
            let cell = tableView.dequeueReusableCell(withIdentifier: UsableCellIdentifier.SummaryOfLookUp.rawValue, for: indexPath) as! SummaryOfLookUpTableViewCell
            if let forcedAppInformation = information {
                cell.summaryLabel.text = forcedAppInformation.description
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = IndexOfLookUpTables(rawValue: indexPath.row)!
        switch index {
        case .Header:
            return defaultHeaderHeight
        case .ScreenShots:
            return defaultScreenShots
        case .Summary:
            return UITableViewAutomaticDimension
        }
    }
    
    private func loadOriginalSource() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameters: [String:Any] = [
            "id":idOfApp,
            "country":"KR"
        ]
        
        Alamofire.request(UsableUrls.LookUpURL.rawValue, parameters: parameters).responseData { response in
            if let data = response.data {
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                self.information = LookUpInformationFactory.CreateLookUpInformation(originalSource: json as! [String : Any])
                self.tableView.reloadData()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

