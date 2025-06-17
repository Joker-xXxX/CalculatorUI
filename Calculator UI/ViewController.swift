import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // = 버튼 클릭 시 수식을 계산하는 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    // 버튼 클릭 이벤트 처리 함수
    @objc func didTapButton(_ sender: UIButton) {
        guard let input = sender.title(for: .normal) else { return }
        
        // 초기화 버튼 처리
        if input == "AC" {
            formulaLabel.text = "0"
            return
        }
        
        // 연산 실행 버튼 처리
        if input == "=" {
            guard let expression = formulaLabel.text,
                  let result = calculate(expression: expression) else {
                formulaLabel.text = "Error"
                return
            }
            formulaLabel.text = "\(result)"
            return
        }
        
        var current = formulaLabel.text ?? "0"
        
        // 숫자 입력 시 0 제거
        if current == "0" && !"÷×+-*/=".contains(input) {
            current = ""
        }
        
        current += input
        
        if let number = Int(current) {
            formulaLabel.text = String(number)
        } else {
            formulaLabel.text = current
        }
    }
    
    // 수식을 표시할 UILabel
    let formulaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        return label
    }()
    
    // 버튼 텍스트 배열
    let buttonRows: [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]
    
    // 버튼을 묶을 세로 스택 뷰
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 화면 진입 시 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureLabel()
        configureButtons()
    }
    
    // 수식 레이블 설정
    func configureLabel() {
        view.addSubview(formulaLabel)
        formulaLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
    }
    
    // 버튼 생성 및 스택뷰에 배치
    func configureButtons() {
        view.addSubview(verticalStackView)
        
        let orangeButton: Set<String> = ["+", "-", "*", "/", "AC", "="]
        
        func makeButton(titleValue: String, action: Selector? = nil, backgroundColor : UIColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)) -> UIButton {
            let button = UIButton(type: .custom)
            button.setTitle(titleValue, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = backgroundColor
            button.layer.cornerRadius = 40
            button.clipsToBounds = true
            button.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 80, height: 80))
            }
            
            if let action = action {
                button.addTarget(self, action: action, for: .touchUpInside)
            }
            
            return button
        }
        
        // 버튼들을 수평 스택에 담고 수직 스택에 추가
        for row in buttonRows {
            let buttons = row.map { title -> UIButton in
                let bgColor: UIColor = orangeButton.contains(title) ? .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                return makeButton(titleValue: title, action: #selector(didTapButton(_:)), backgroundColor: bgColor)
            }
            let horizontalStack = makeHorizontalStackView(buttons)
            verticalStackView.addArrangedSubview(horizontalStack)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(formulaLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
        }
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
