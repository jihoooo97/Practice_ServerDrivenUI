//
//  OneLineTextViewObject.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/30/24.
//

import Foundation

class OneTextLineViewObject: ViewObject {
    
    var titleText: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.titleText = try container.decode(String.self, forKey: .titleText)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case titleText
    }
    
}
