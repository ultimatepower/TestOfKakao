//
//  TopRankListFactory.swift
//  TestOfKakao
//
//  Created by 창원 조 on 2017. 4. 15..
//  Copyright © 2017년 Seeds. All rights reserved.
//

import Foundation

class TopRankListFactory {
    class func CreateTopRankList(originalSource: [String: Any]) -> Array<AppInformation>! {
        
        if let feed = originalSource[JSONNodesNames.Feed.rawValue] as? [String:Any] {
            
            if let entry = feed[JSONNodesNames.Entry.rawValue] as? [[String:Any]] {
                var resultArray = Array<AppInformation>()
                
                for index in 0..<entry.count {
                    
                    let entryUnit = entry[index]
                    var newAppInformation = AppInformation()
                    newAppInformation.rank = index + 1
                    
                    if let idInformationInEntryUnit = entryUnit[JSONNodesNames.Id.rawValue] as? [String:Any] {
                        if let attributesInIDInformation = idInformationInEntryUnit[JSONNodesNames.Attributes.rawValue] as? [String:Any] {
                            if let id = attributesInIDInformation[JSONNodesNames.TaggingID.rawValue] as? String {
                                newAppInformation.id = id
                            }
                        }
                    }
                    
                    if let nameInformationInEntryUnit = entryUnit[JSONNodesNames.TaggingName.rawValue] as? [String:Any] {
                        if let appName = nameInformationInEntryUnit[JSONNodesNames.Label.rawValue] as? String {
                            newAppInformation.title = appName
                        }
                    }
                
                    
                    if let iconInformationInEntryUnit = entryUnit[JSONNodesNames.TaggingImages.rawValue] as? [[String:Any]] {
                        
                        let defaultIconInformation = iconInformationInEntryUnit[1]
                        if let urlOfIcon = defaultIconInformation[JSONNodesNames.Label.rawValue] as? String {
                            newAppInformation.iconUrl = urlOfIcon
                        }
                        
                        let defaultIconOfLookupInformation = iconInformationInEntryUnit[2]
                        if let urlOfIcon = defaultIconOfLookupInformation[JSONNodesNames.Label.rawValue] as? String {
                            newAppInformation.iconOfLookupUrl = urlOfIcon
                        }
                    }
                    
                    resultArray.append(newAppInformation)
                }
                return resultArray
            }
        }
        return nil
    }
    
}
