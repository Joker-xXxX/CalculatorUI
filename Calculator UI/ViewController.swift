import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let formulaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
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
        
        for row in buttonRows {
            let buttons = row.map { title -> UIButton in
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                button.layer.cornerRadius = 40
                button.clipsToBounds = true
                button.snp.makeConstraints { make in
                    make.size.equalTo(CGSize(width: 80, height: 80))
                }
                return button
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
