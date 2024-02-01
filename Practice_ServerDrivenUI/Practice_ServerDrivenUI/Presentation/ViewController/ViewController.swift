//
//  ViewController.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let scollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .orange
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let viewRender = ViewRender()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemBackground
        setLayout()
    }
    
    private func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(scollView)
        scollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scollView.bottomAnchor)
        ])
        
        viewRender.rendering().forEach {
            stackView.addArrangedSubview($0)
            
            switch $0 {
            case is TextButton:
                let button = $0 as! UIButton
                button.addTarget(self, action: #selector(tapButtonAction(_:)), for: .touchUpInside)
                
                NSLayoutConstraint.activate([
                    button.widthAnchor.constraint(equalToConstant: 100),
                    button.heightAnchor.constraint(equalToConstant: 50)
                ])
            case is OneImageView:
                let imageView = $0 as! UIImageView
                NSLayoutConstraint.activate([
                    imageView.widthAnchor.constraint(equalToConstant: 300),
                    imageView.heightAnchor.constraint(equalToConstant: 300)
                ])
            default:
                break
            }
        }
    }
    
    @objc func tapButtonAction(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        print("\(title)")
    }

}


#Preview(traits: .defaultLayout) {
    ViewController()
}
