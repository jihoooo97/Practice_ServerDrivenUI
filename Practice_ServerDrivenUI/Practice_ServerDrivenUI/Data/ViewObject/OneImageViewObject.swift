//
//  OneImageViewObject.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import Foundation

class OneImageViewObject: ViewObject {
    
    var imageURL: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case imageURL
    }
    
}
