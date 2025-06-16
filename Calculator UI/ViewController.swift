import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @objc func didTapButton(_ sender: UIButton) {
        guard let input = sender.title(for: .normal) else { return }
        var current = formulaLabel.text ?? "0"
        
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
    
    let formulaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        return label
    }()
    
    let buttonRows: [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureLabel()
        configureButtons()
    }
    
    func configureLabel() {
        view.addSubview(formulaLabel)
        formulaLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
    }
    
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
        for row in buttonRows {
            let buttons = row.map { title -> UIButton in
                let bgColor: UIColor = orangeButton.contains(title) ? . orange :UIColor (red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
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


