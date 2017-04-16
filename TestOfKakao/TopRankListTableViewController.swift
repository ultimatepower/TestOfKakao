//
//  TopRankListTableViewController.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import UIKit
import Alamofire

class TopRankListTableViewController: UITableViewController {

    private let defaultValueOfTableSectionCount = 1
    private var topRanks: Array<AppInformation>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOriginalSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return defaultValueOfTableSectionCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let forcedTopRanks = topRanks {
            return forcedTopRanks.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsableCellIdentifier.CellOfTopRanks.rawValue, for: indexPath) as! TopRankUnitTableViewCell
        if let forcedTopRanks = topRanks {
            let appInformation = forcedTopRanks[indexPath.row]
            cell.labelOfRank.text = "\(appInformation.rank)"
            cell.urlOfIcon = appInformation.iconUrl
            cell.title.text = appInformation.title
            cell.loadIconImage()
        }
        return cell
    }

    // MARK: - Navigation Implementation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? TopRankUnitTableViewCell {
            let indexPath = self.tableView.indexPath(for: cell)!
            if let appInformation = topRanks?[indexPath.row] {
                if segue.identifier == UsableSegueIdentifiers.RankListToLookUp.rawValue {
                    if let lookUpViewController = segue.destination as? LookUpTableViewController {
                        lookUpViewController.idOfApp = appInformation.id
                        lookUpViewController.titleOfApp = appInformation.title
                    }
                }
            }
        }
    }

    // MARK: - Private Implementation
    private func loadOriginalSource() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(UsableUrls.TopRanksURL.rawValue).responseJSON { response in
            if let jsonResult = response.result.value as? [String:Any] {
                self.topRanks = TopRankListFactory.CreateTopRankList(originalSource: jsonResult)
                self.tableView.reloadData()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
