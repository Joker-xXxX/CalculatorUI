import UIKit

extension ViewController {
    
    @objc func didTapButton(_ sender: UIButton) {
        guard let input = sender.title(for: .normal) else { return }

        if input == "AC" {
            formulaLabel.text = "0"
            return
        }

        if input == "=" {
            guard let expression = formulaLabel.text else {
                formulaLabel.text = "Error"
                return
            }

            // 연산자로 끝나는 수식은 계산하지 않음
            if let last = expression.last, "+-*/".contains(last) {
                formulaLabel.text = "Error"
                return
            }

            guard let result = calculate(expression: expression) else {
                formulaLabel.text = "Error"
                return
            }

            formulaLabel.text = result
            return
        }

        var current = formulaLabel.text ?? "0"

        if current == "0" && !"÷×+-*/=".contains(input) {
            current = ""
        }

        // 연속된 연산자 방지
        if let last = current.last,
           "+-*/".contains(last),
           "+-*/".contains(Character(input)) {
            return
        }

        current += input
        formulaLabel.text = current
    }

    func calculate(expression: String) -> String? {
        let cleaned = expression
            .replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")

        let exp = NSExpression(format: cleaned)

        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            let value = result.doubleValue

            // 0으로 나누거나 무한대, NaN 예외처리
            if value.isNaN || value.isInfinite || value == .infinity || value == -.infinity {
                return nil
            }

            // 정수인지 실수인지 구분 출력
            if floor(value) == value {
                return String(Int(value))
            } else {
                return String(format: "%.2f", value)
            }
        }

        return nil
    }
}
