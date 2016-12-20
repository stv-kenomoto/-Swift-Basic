//
//  ProgrammingLanguageEntity+Plist.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

extension ProgrammingLanguageEntity {
    
    // MARK: - ClassMethod
    
    static func programmingLanguageEntitiesFromPlist() -> Array<ProgrammingLanguageEntity> {
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("programmingLanguage", ofType: "plist")
        let dic = NSDictionary(contentsOfFile: path!)
        let programmingLanguages: [NSDictionary] = dic!["programmingLanguages"] as! [NSDictionary]
        
        var programmingLanguageEntities: [ProgrammingLanguageEntity] = [];
        for programmingLanguage in programmingLanguages {
            let label: String = programmingLanguage["label"] as! String
            let image = UIImage.init(named: programmingLanguage["icon"] as! String)
            let url: String = programmingLanguage["url"] as! String
            programmingLanguageEntities.append(ProgrammingLanguageEntity.init(label: label, image: image!, url: url, likable: false))
        }
        
        return programmingLanguageEntities
    }
}
