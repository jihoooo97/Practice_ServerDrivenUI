//
//  OneImageView.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import UIKit

class OneImageView: UIImageView, ViewItemable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: ViewData) {
        guard let imageData = data as? OneImageViewData else {
            print("text button parse error")
            return
        }
        
        image = imageData.imageString.getImageFromURL()
    }
    
    func setLayout() {
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension String {
    
    func getImageFromURL() -> UIImage? {
        guard let url = URL(string: self) else { return nil }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        
        return nil
    }
    
}
