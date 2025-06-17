# 🧮 Calculator - iOS 코드베이스 UI 계산기

## 📌 프로젝트 소개

Swift와 UIKit을 활용해 코드베이스로 계산기 UI를 구현한 프로젝트입니다.  
SnapKit을 사용하여 UI 구성과 오토레이아웃을 적용하였고, 버튼 입력에 따라 수식을 입력받고 `=` 버튼 클릭 시 연산을 수행하는 기능까지 단계별로 완성했습니다.

---

## 🔧 기술 스택

- `UIKit` - UI 구성 및 이벤트 처리
- `SnapKit` - 오토레이아웃 코드 작성
- `NSExpression` - 문자열 기반 수식 계산 처리
- `Xcode 15` / `iOS 18.4 (Simulator)`

---

## 🧩 구현 기능 (Lv1~Lv8)

| 레벨 | 기능 설명 | 상태 |
|------|------------|------|
| Lv1  | UILabel에 `"12345"` 대신 `"0"` 초기값 표시 | ✅ |
| Lv2  | 버튼 클릭 시 오른쪽에 입력값 추가 | ✅ |
| Lv3  | 여러 버튼 클릭 시 값 누적 | ✅ |
| Lv4  | 연산자도 텍스트로 누적 표시 | ✅ |
| Lv5  | AC 버튼 클릭 시 `"0"`으로 초기화 | ✅ |
| Lv6  | 앞자리가 0인 숫자는 자동 제거 (ex: `012` → `12`) | ✅ |
| Lv7  | StackView로 버튼 UI 구성 (색상, 폰트, 크기 등) | ✅ |
| Lv8  | = 버튼 클릭 시 NSExpression을 통해 수식 계산 | ✅ |

---

## 🧠 구현 구조

### 📍 `ViewController.swift`

- `formulaLabel`: 계산식 출력 UILabel
- `verticalStackView`: 버튼을 담는 세로 StackView
- `buttonRows`: 버튼 레이아웃 구조 정의
- `configureLabel()`: 레이블 UI 및 제약조건 설정
- `configureButtons()`: 버튼 생성, 이벤트 연결, StackView 배치
- `didTapButton(_:)`: 모든 버튼 입력 처리 (AC / = / 숫자 및 연산자)
- `calculate(expression:)`: NSExpression으로 문자열 수식 계산

---

## 🪄 예외 처리

- 수식이 잘못된 경우 `"Error"` 출력 처리
- `"012"`처럼 앞에 0이 붙은 숫자 자동 제거
- AC 버튼 클릭 시 모든 수식 `"0"`으로 초기화

---

## ✍️ 배운 점

- StackView와 SnapKit을 활용한 UI 구성 방식 이해
- UILabel 및 UIButton 동적 생성과 이벤트 연결
- NSExpression으로 문자열 수식을 계산하는 법
- Swift에서 가독성 있는 코드 분리 방식 적용

---

## 📂 디렉토리 구조

Calculator/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewController.swift
├── Assets.xcassets/
├── Info.plist


---

## ✅ 커밋 기록

Lv1 ~ Lv8 각 단계별로 커밋을 나누어 기록함.  
각 기능 구현 완료 시점마다 커밋하여 전체 커밋 수 10회 이상 유지.

---

## 🔖 향후 개선 아이디어 (도전 과제)

- 소수점 계산 기능 추가
- `()`, `%` 연산자 추가
- 연산자 연속 입력 시 예외 처리 (`1++2` 등)
- 다크모드 대응
- Landscape 모드 대응

