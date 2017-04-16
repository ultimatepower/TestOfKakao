//
//  CommonConstants.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 14..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import Foundation

enum JSONNodesNames: String {
    case Id = "id"
    case Feed = "feed"
    case Entry = "entry"
    case Title = "title"
    case Summary = "summary"
    case Attributes = "attributes"
    case TaggingImages = "im:image"
    case TaggingID = "im:id"
    case TaggingName = "im:name"
    case Label = "label"
    case Results = "results"
    case AverageUserRatingForCurrentVersion = "averageUserRatingForCurrentVersion"
    case Description = "description"
    case ScreenShotsUrls = "screenshotUrls"
    case ArtworkURL100 = "artworkUrl100"
}

enum UsableUrls: String {
    
    case TopRanksURL = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
    case LookUpURL = "https://itunes.apple.com/lookup"
    
}

enum UsableSegueIdentifiers: String {
    case RankListToLookUp = "RankListToLookUp"
}

enum IndexOfLookUpTables: Int {
    case Header = 0
    case ScreenShots = 1
    case Summary = 2
}

enum UsableCellIdentifier: String {
    case CellOfTopRanks = "CellOfListIdentifier"
    case HeaderOfLookUp = "HeaderOfLookUpIdentifier"
    case ScreenShotsOfLookUp = "ScreenShotsOfLookUpIdentifier"
    case SummaryOfLookUp = "SummaryOfLookUpIdentifier"
    case ScreenShot = "ScreenShotCellIdentifier"
}
