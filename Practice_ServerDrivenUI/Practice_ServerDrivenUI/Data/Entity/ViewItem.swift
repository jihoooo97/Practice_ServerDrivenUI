//
//  ViewItem.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

class ViewItem: Decodable {
    
    let viewType: String
    let viewData: ViewData?
    
    enum CodingKeys: String, CodingKey {
        case viewType = "view_type"
        case viewData = "view_data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.viewType = try container.decode(String.self, forKey: .viewType)
        
        switch viewType {
        case ViewType.textButton.rawValue:
            self.viewData = try container.decode(TextButtonViewData.self, forKey: .viewData)
        case ViewType.oneTextLine.rawValue:
            self.viewData = try container.decode(OneTextLineViewData.self, forKey: .viewData)
        case ViewType.twoTextLine.rawValue:
            self.viewData = try container.decode(TwoTextLineViewData.self, forKey: .viewData)
        case ViewType.oneImage.rawValue:
            self.viewData = try container.decode(OneImageViewData.self, forKey: .viewData)
        default:
            self.viewData = nil
        }
    }
    
}
