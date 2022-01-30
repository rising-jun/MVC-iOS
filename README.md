# MVC-iOS
## MVC의 개념을 잡기 위해 간단한 카운팅앱을 구현했습니다.

<img width="815" alt="스크린샷 2022-01-30 오후 4 27 33" src="https://user-images.githubusercontent.com/62687919/151690766-f59361f2-7769-4b8b-b2ce-5988ba4c30e8.png">
참고자료

### 고민한 점
    1. Model, View, Controller의 분리
    2. 사용자의 액션을 비동기로 받는 반응형으로 구현하기 ( Rx사용하지 않고 학습해보기 )
    
### 로직
    1. 버튼이 눌린다.
    2. 해당 이벤트가 CountViewAction 프로토콜을 통해 비동기로 CountViewController로 전달된다.
    3. 전달된 이벤트에 맞는 연산을 ViewController에서 실행 후 연산된 값을 업데이트합니다.
    4. 업데이트된 CountValue는 didSet의 countView.updateCountText() 함수를 호출합니다.
    5. 업데이트 된 값이 countText의 값을 바꿔주어 UI를 업데이트 해줍니다.
    6. CountValue의 객체는 Model의 정보에 있습니다.

### 라이브러리
     'SnapKit', 'Then'
