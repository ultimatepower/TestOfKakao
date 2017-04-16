//
//  LookUpInformationFactory.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import Foundation

class LookUpInformationFactory {
    class func CreateLookUpInformation(originalSource: [String:Any]) -> LookUpInformation? {
        
        if let resultNodes = originalSource[JSONNodesNames.Results.rawValue] as? [[String:Any]] {
            var newLookUpInformation = LookUpInformation()
            
            let defaultResultNode = resultNodes[0]
            print("\(defaultResultNode)")
            if let averageUserRating = defaultResultNode[JSONNodesNames.AverageUserRatingForCurrentVersion.rawValue] as? Float {
                newLookUpInformation.rating = averageUserRating
            }
            
            if let description = defaultResultNode[JSONNodesNames.Description.rawValue] as? String {
                newLookUpInformation.description = description
            }
            
            if let screenShotsURLs = defaultResultNode[JSONNodesNames.ScreenShotsUrls.rawValue] as? [String] {
                newLookUpInformation.screenShotsURLs = screenShotsURLs
            }
            
            if let artworkURL = defaultResultNode[JSONNodesNames.ArtworkURL100.rawValue] as? String {
                newLookUpInformation.artworkURL = artworkURL
            }
            
            return newLookUpInformation
        }
        
        return nil
    }
}
