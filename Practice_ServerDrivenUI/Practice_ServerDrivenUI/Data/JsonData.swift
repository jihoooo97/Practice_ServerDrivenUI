//
//  JsonData.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

let jsonData = """
    {
        "view_items" : [
            {
                "view_type" : "one_text_line",
                "view_data" : {
                    "title_text" : "제목"
                }
            },
            {
                "view_type" : "two_text_line",
                "view_data" : {
                    "title_text" : "첫번째 줄",
                    "content_text" : "두번째 줄"
                }
            },
            {
                "view_type" : "text_button",
                "view_data" : {
                    "title_text" : "안녕하세요"
                }
            },
            {
                "view_type" : "two_text_line",
                "view_data" : {
                    "title_text" : "이 줄이 보이시나요",
                    "content_text" : "이 두 줄이 보이시나요"
                }
            },
            {
                "view_type" : "text_button",
                "view_data" : {
                    "title_text" : "안녕히가세요"
                }
            },
        ]
    }
"""

#Preview(traits: .defaultLayout) {
    ViewController()
}
