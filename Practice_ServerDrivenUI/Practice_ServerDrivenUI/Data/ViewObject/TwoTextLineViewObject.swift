//
//  TwoTextLineViewObject.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import Foundation

class TwoTextLineViewObject: ViewObject {
    
    var titleText: String
    var contentText: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.titleText = try container.decode(String.self, forKey: .titleText)
        self.contentText = try container.decode(String.self, forKey: .contentText)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case titleText
        case contentText
    }
    
}
