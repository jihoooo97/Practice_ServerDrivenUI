//
//  OneImageCell.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

class OneImageCell: UITableViewCell, SDUCellable {
    
    var contentImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: ViewObject) {
        guard let imageData = data as? OneImageViewObject,
              let image = getImageFromURL(imageData.imageURL)
        else {
            return
        }
        
        contentImageView.image = image
    }
    
    func setLayout() {
        self.addSubview(contentImageView)

        contentImageView.contentMode = .scaleAspectFit
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            contentImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            contentImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func getImageFromURL(_ urlString: String?) -> UIImage? {
        guard let urlString = urlString,
              let url = URL(string: urlString)
        else { return nil }
        
        if let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            return image
        }
        
        return nil
    }
    
}
