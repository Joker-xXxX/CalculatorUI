import UIKit
import SnapKit

// 버튼 및 스택뷰 생성 관련 확장
extension ViewController {
    
    // 버튼 생성 함수
    func makeButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        
        // 버튼 클릭 이벤트 연결
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        // 버튼 크기 제약
        button.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        return button
    }
    
    // 수평 스택뷰 생성 함수
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
