//
//  ViewItem.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import Foundation

class ViewItem: Decodable {
    
    let viewType: String?
    var viewObject: ViewObject?
    
    enum CodingKeys: String, CodingKey {
        case viewType, viewObject
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        viewType = try container.decode(String.self, forKey: .viewType)
        viewObject = nil
        
        switch viewType {
        case ViewType.oneTextLine.rawValue:
            viewObject = try container.decode(OneTextLineViewObject.self, forKey: .viewObject)
            
        case ViewType.twoTextLine.rawValue:
            viewObject = try container.decode(TwoTextLineViewObject.self, forKey: .viewObject)
            
        case ViewType.oneImage.rawValue:
            viewObject = try container.decode(OneImageViewObject.self, forKey: .viewObject)
            
        default:
            return
        }
    }
    
}
