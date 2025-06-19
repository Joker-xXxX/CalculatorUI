import UIKit
import SnapKit

extension ViewController {
    
    func makeButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        return button
    }
    
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        stackView.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        return stackView
    }
}
