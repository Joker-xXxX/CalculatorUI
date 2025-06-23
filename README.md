# CalculatorUI

Swift UIKit 기반의 계산기 앱 UI 실습 프로젝트입니다.  
스토리보드를 제거하고 코드만으로 UI를 구성했으며, SnapKit을 활용하여 AutoLayout을 구현했습니다.  

## 주요 목표

- UIKit 코드베이스 UI 구성 학습
- SnapKit을 활용한 제약 조건 설정 연습
- 연산자 버튼 및 숫자 버튼 구성
- 예외 처리 및 연산 기능 연동 (추후 추가 예정)

## 사용 기술

- **Swift**
- **UIKit**
- **SnapKit** (SPM으로 설치)
- MVVM 아키텍처 시도 예정

## 화면 구성

- 상단: 계산식/결과를 보여주는 UILabel (`formulaLabel`)
- 하단: 숫자 및 연산자 버튼이 4x4 형태로 구성된 UIStackView 형태의 버튼 그리드

```swift
let buttonRows: [[String]] = [
    ["7", "8", "9", "+"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "*"],
    ["0", "C", "=", "/"]
]
```

## 실행 방법
이 저장소를 클론합니다.

git clone https://github.com/Joker-xXxX/CalculatorUI.git
CalculatorUI.xcodeproj 또는 .xcworkspace를 엽니다.

시뮬레이터 또는 실제 디바이스에서 실행합니다.

⚠️ SnapKit이 설치되지 않았다면 Xcode의 File > Add Package에서 https://github.com/SnapKit/SnapKit을 추가해주세요.

## 향후 개선 사항
다크모드 대응 및 디자인 리팩토링

MVVM 아키텍처로 리팩토링

## 폴더 구조

CalculatorUI/
├── ViewController.swift       // 메인 계산기 UI 로직
├── Assets.xcassets            // 앱 아이콘 및 이미지 자산
├── Info.plist                 // 앱 설정
├── SceneDelegate.swift        // 앱 시작 설정
└── ...

## 만든 사람
Joker-xXxX (https://github.com/Joker-xXxX)

iOS 개발자가 되기 위한 학습용 프로젝트입니다.

