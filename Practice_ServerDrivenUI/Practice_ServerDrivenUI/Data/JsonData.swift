//
//  JsonData.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

let jsonData = """
    {
        "viewItems": [

            {
                "viewType": "ONE_TEXT_LINE",
                "viewObject": {
                    "titleText": "국밥 메뉴"
                }
            },

            {
                "viewType": "ONE_IMAGE",
                "viewObject": {
                    "imageURL": "https://www.pigpeople.net/data/photos/20170416/art_14927036061773_f148b7.png"
                }
            },
            


            {
                "viewType": "TWO_TEXT_LINE",
                "viewObject": {
                    "titleText": "돼지 국밥",
                    "contentText": "7000원"
                }
            },

            {
                "viewType": "ONE_IMAGE",
                "viewObject": {
                    "imageURL": "https://m.gdfoodmall.kr/web/product/big/202305/bf192b25c2640c106f2c579de8f3fad7.jpg"
                }
            },

            {
                "viewType": "TWO_TEXT_LINE",
                "viewObject": {
                    "titleText": "맛있는 국밥",
                    "contentText": "8000원"
                }
            },
            
            {
                "viewType": "ONE_TEXT_LINE",
                "viewObject": {
                    "titleText": "국밥 끝"
                }
            },

            {
                "viewType": "ONE_TEXT_LINE",
                "viewObject": {
                    "titleText": "떡볶이 메뉴"
                }
            },

            {
                "viewType": "ONE_IMAGE",
                "viewObject": {
                    "imageURL": "https://m.칠갑마루.com/web/product/big/202111/5856292d849cabb2b3fe91e0e6b40c23.jpg"
                }
            },

            {
                "viewType": "TWO_TEXT_LINE",
                "viewObject": {
                    "titleText": "떡볶이",
                    "contentText": "4000원"
                }
            },

            {
                "viewType": "ONE_TEXT_LINE",
                "viewObject": {
                    "titleText": "떡볶이 맛있겠다...."
                }
            },

            {
                "viewType": "ONE_IMAGE",
                "viewObject": {
                    "imageURL": "https://cdn.imweb.me/upload/S20220826948cbdc34dca3/371da09ec924b.png"
                }
            },

            {
                "viewType": "TWO_TEXT_LINE",
                "viewObject": {
                    "titleText": "로제 떡볶이",
                    "contentText": "4500원"
                }
            },

            {
                "viewType": "ONE_TEXT_LINE",
                "viewObject": {
                    "titleText": "-- 떡볶이 끝 --"
                }
            },

        ]

    }
"""

#Preview(traits: .defaultLayout) {
    ViewController()
}
