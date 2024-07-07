# Practice_ServerDrivenUI
Server에서 UI 정보를 담은 JSON Data를 보내주면 이를 디코딩해 화면에 보여주는 개념

<br>

## Server Driven UI 개념
화면의 디자인 스펙이 자주 변동될 때, 매번 코드를 수정하고, 앱스토어에 배포하고 심사를 기다리는 것은 서비스의 운영에 있어 부담이 될 수 있다.  
이러한 비효율적인 절차를 해소하기 위해 UI요소를 고정적으로 개발하는 것이 아니라, 서버에서 내려준 json 값을 디코딩해서 UI요소를 유동적으로 변경시킬 수 있도록 개발하는 것이다.

Server Driven UI는 앱에서 특정 UI의 타입을 지정해둔 뒤 (ex: oneTextLine, twoTextLine, oneImage)  
서버에서 UI의 타입, UI의 타입에 담길 값들(ex: text, image, color 등)이 담긴 json을 내려주면, 앱에서 이를 디코딩하여 View에 띄워주는 방식이다.


<br>


### JSON data
```swift
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
        "view_type" : "one_image",
        "view_data" : {
            "image_string" : "https://m.칠갑마루.com/web/product/big/202111/5856292d849cabb2b3fe91e0e6b40c23.jpg"
        }
    },
}
```
<br>

### Decoding class
View에 뿌려줄 data를 type에 맞게 decoding 하기 위한 class
```swift
class ViewData: Decodable { }

class TwoTextLineViewData: ViewData {
    
    let titleText: String
    let contentText: String
    
    enum CodingKeys: String, CodingKey {
        case titleText = "title_text"
        case contentText = "content_text"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.titleText = try container.decode(String.self, forKey: .titleText)
        self.contentText = try container.decode(String.self, forKey: .contentText)
        try super.init(from: decoder)
    }
    
}
```
<br>

### View Type, View Item
JSON data를 decoding 하기 위한 class
```swift
enum ViewType: String {
    case textButton = "text_button"
    case oneTextLine = "one_text_line"
    case twoTextLine = "two_text_line"
    case oneImage = "one_image"
}

class ViewItem: Decodable {
    
    let viewType: String
    let viewData: ViewData?
    
    enum CodingKeys: String, CodingKey {
        case viewType = "view_type"
        case viewData = "view_data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.viewType = try container.decode(String.self, forKey: .viewType)
        
        switch viewType {
        case ViewType.textButton.rawValue:
            self.viewData = try container.decode(TextButtonViewData.self, forKey: .viewData)
        case ViewType.oneTextLine.rawValue:
            self.viewData = try container.decode(OneTextLineViewData.self, forKey: .viewData)
        case ViewType.twoTextLine.rawValue:
            self.viewData = try container.decode(TwoTextLineViewData.self, forKey: .viewData)
        case ViewType.oneImage.rawValue:
            self.viewData = try container.decode(OneImageViewData.self, forKey: .viewData)
        default:
            self.viewData = nil
        }
    }
    
}
```
<br>

### View 구현 class
Factory에 의해 생성될 UI 타입을 구현한 class  
공통적으로 사용해야할 기능들을 ViewItemable 프로토콜로 추상화 함으로써 모든 UI에 대해 공통 기능을 활용할 수 있음.  
bind 메서드를 통해 서버에서 받은 JSON data를 위의 decoding class로 타입캐스팅해서 view에 binding할 수 있음

```swift
import UIKit

protocol ViewItemable: UIView {
    func bind(data: ViewData)
    func setLayout()
}

class TwoTextLineView: UIView, ViewItemable {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // ...
    
    func bind(data: ViewData) {
        guard let twoTextLineData = data as? TwoTextLineViewData else { return }
        titleLabel.text = twoTextLineData.titleText
        contentLabel.text = twoTextLineData.contentText
    }
    
}
```
<br>

### View Factory
전달받은 ViewItem에 따라 ViewType과 ViewData에 맞게 View를 생성함

```swift
class ViewItemFactory {
    
    public static func makeView(viewItem: ViewItem) -> UIView? {
        let viewType = viewItem.viewType
        
        guard let viewData = viewItem.viewData else { return nil }
        
        switch viewType {
        case ViewType.textButton.rawValue:
            let textButton = TextButton()
            textButton.bind(data: viewData)
            return textButton
        case ViewType.oneTextLine.rawValue:
            let oneTextLineView = OneTextLineView()
            oneTextLineView.bind(data: viewData)
            return oneTextLineView
        case ViewType.twoTextLine.rawValue:
            let twoTextLineView = TwoTextLineView()
            twoTextLineView.bind(data: viewData)
            return twoTextLineView
        case ViewType.oneImage.rawValue:
            let oneImageView = OneImageView(frame: .zero)
            oneImageView.bind(data: viewData)
            return oneImageView
        default:
            return nil
        }
    }
    
}
```
<br>

### View Render
서버에서 JSON data를 받아서 Factory를 통해 View를 생성하는 class

```swift
class ViewRender {
    
    func rendering() -> [UIView] {
        let data = Data(jsonData.utf8)
        guard let parsedData = try? JSONDecoder().decode(SDUEntity.self, from: data) else {
            return []
        }
        
        return parsedData.viewItems.map {
            return ViewItemFactory.makeView(viewItem: $0) ?? .init()
        }
    }
    
}
```
<br>

### ViewController에서 활용
> ViewRender에서 생성된 View를 각각 UIStackView에 담아주면 된다.
버튼의 경우 클릭 이벤트를 추가할 수 있다.

```swift
class ViewController: UIViewController {
    
    private let scollView: UIScrollView = {
        // ...
    }()
    
    private let stackView: UIStackView = {
        // ...
    }()
    
    private let viewRender = ViewRender()
    
    // ...
    
    private func setLayout() { 
        view.addSubview(scollView)
        scollView.addSubview(stackView)
        
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
            default: break
            }
        }
    }
    
    @objc func tapButtonAction(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        print("\(title)")
    }

}
```
<br>

### 실행 화면


<img src="https://github.com/jihoooo97/Practice_ServerDrivenUI/assets/49361214/3ca21dc8-cc0e-4140-b230-e106279fe27b" width=40%>


<br><br>
