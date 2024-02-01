//
//  OneImageViewData.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import Foundation

class OneImageViewData: ViewData {
    
    let imageString: String
    
    enum CodingKeys: String, CodingKey {
        case imageString = "image_string"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageString = try container.decode(String.self, forKey: .imageString)
        try super.init(from: decoder)
    }
    
}
