//
//  TwoTextLineViewObject.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import Foundation

class TwoTextLineViewData: ViewData {
    
    let titleText: String
    let contentText: String
    
    enum CodingKeys: String, CodingKey {
        case titleText = "title_text"
        case contentText = "content_text"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.titleText = try container.decode(String.self, forKey: .titleText)
        self.contentText = try container.decode(String.self, forKey: .contentText)
        try super.init(from: decoder)
    }
    
}
