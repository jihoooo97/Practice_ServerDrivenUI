//
//  TwoTextLineCell.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

class TwoTextLineCell: UITableViewCell, SDUCellable {
    
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: ViewObject) {
        guard let twoTextLineData = data as? TwoTextLineViewObject else { return }
        titleLabel.text = twoTextLineData.titleText
        contentLabel.text = twoTextLineData.contentText
    }

    func setLayout() {
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.textColor = .darkGray
        contentLabel.font = UIFont.boldSystemFont(ofSize: 14)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            contentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
