//
//  ViewController.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .orange
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let viewRender = ViewRender()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemBackground
        setLayout()
    }
    
    private func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        ])
        
        viewRender.rendering().forEach {
            stackView.addArrangedSubview($0)
            
            switch $0 {
            case is TextButton:
                NSLayoutConstraint.activate([
                    $0.widthAnchor.constraint(equalToConstant: 100),
                    $0.heightAnchor.constraint(equalToConstant: 50)
                ])
            default:
                break
            }
        }
    }

}


#Preview(traits: .defaultLayout) {
    ViewController()
}
