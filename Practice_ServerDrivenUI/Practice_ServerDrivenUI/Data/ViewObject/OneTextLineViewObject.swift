//
//  OneTextLineViewObject.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import Foundation

class OneTextLineViewObject: ViewObject {
    
    let titleText: String
    
    enum CodingKeys: String, CodingKey {
        case titleText = "title_text"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.titleText = try container.decode(String.self, forKey: .titleText)
        try super.init(from: decoder)
    }
    
}
