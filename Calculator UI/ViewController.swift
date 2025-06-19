import UIKit
import SnapKit

// 메인 뷰 컨트롤러 클래스
class ViewController: UIViewController {
    
    // 수식을 출력할 레이블 정의
    let formulaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        return label
    }()
    
    // 버튼에 표시될 텍스트 배열
    let buttonRows: [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]
    
    // 버튼들을 담을 세로 스택 뷰
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 뷰가 로드되었을 때 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureLabel()       // 수식 레이블 설정
        configureButtons()     // 버튼 UI 구성
    }
}
