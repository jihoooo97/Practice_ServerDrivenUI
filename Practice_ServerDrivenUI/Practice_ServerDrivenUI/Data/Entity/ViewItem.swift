//
//  ViewItem.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

class ViewItem: Decodable {
    
    let viewType: String
    let viewObject: ViewData?
    
    enum CodingKeys: String, CodingKey {
        case viewType = "view_type"
        case viewObject = "view_data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.viewType = try container.decode(String.self, forKey: .viewType)
        
        switch viewType {
        case ViewType.textButton.rawValue:
            self.viewObject = try container.decode(TextButtonViewData.self, forKey: .viewObject)
        case ViewType.oneTextLine.rawValue:
            self.viewObject = try container.decode(OneTextLineViewData.self, forKey: .viewObject)
        case ViewType.twoTextLine.rawValue:
            self.viewObject = try container.decode(TwoTextLineViewData.self, forKey: .viewObject)
        default:
            self.viewObject = nil
        }
    }
    
}
