import UIKit
import SnapKit

// UI 레이아웃 설정 관련 확장
extension ViewController {
    
    // 수식 레이블 UI 설정
    func configureLabel() {
        view.addSubview(formulaLabel)
        formulaLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
    }
    
    // 버튼들을 생성하고 스택뷰에 배치
    func configureButtons() {
        view.addSubview(verticalStackView)
        
        // 주황색으로 표시할 기능 버튼들
        let orangeButtons: Set<String> = ["+", "-", "*", "/", "AC", "="]
        
        // 각 줄의 버튼 생성
        for row in buttonRows {
            let buttons = row.map { title -> UIButton in
                let bgColor: UIColor = orangeButtons.contains(title) ? .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                return makeButton(title: title, backgroundColor: bgColor)
            }
            let horizontalStack = makeHorizontalStackView(buttons)
            verticalStackView.addArrangedSubview(horizontalStack)
        }
        
        // 스택뷰 레이아웃 제약
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(formulaLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
        }
    }
}
