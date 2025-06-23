import UIKit
import SnapKit

extension ViewController {
    
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
        
        let orangeButtons: Set<String> = ["+", "-", "*", "/", "AC", "="]
        
        for row in buttonRows {
            let buttons = row.map { title -> UIButton in
                let bgColor: UIColor = orangeButtons.contains(title) ? .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                return makeButton(title: title, backgroundColor: bgColor)
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
}
