import UIKit

// 버튼 클릭 및 계산 로직 관련 확장
extension ViewController {
    
    // 버튼이 눌렸을 때 실행되는 메서드
    @objc func didTapButton(_ sender: UIButton) {
        guard let input = sender.title(for: .normal) else { return }
        
        // 초기화 처리
        if input == "AC" {
            formulaLabel.text = "0"
            return
        }
        
        // "=" 버튼 클릭 시 수식 계산
        if input == "=" {
            guard let expression = formulaLabel.text,
                  let result = calculate(expression: expression) else {
                formulaLabel.text = "Error"
                return
            }
            formulaLabel.text = "\(result)"
            return
        }
        
        // 일반 숫자 및 연산자 처리
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
    
    // NSExpression을 이용한 수식 계산 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        return expression.expressionValue(with: nil, context: nil) as? Int
    }
}
