---
layout: post
title: "webgl 분석"
subtitle: "webgl 분석"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

## WebGL이란
  * WebGL은 크로노스 그룹에서 관리하는 오픈소스 라이브러리이다.
  * 크로노스 그룹은 다양한 플랫폼과 장치에서 사용되는 병렬컴퓨팅, 그래픽스, 비전 및 신경망 분야의 저작 및 가속하는데 이용되는 개방형 표준을 제정하는 산업 컨소시엄인데 애플, 구글, 인텔 모두 크로노스 그룹의 프로모터 회원이다. ([Khronos Members - The Khronos Group Inc](https://www.khronos.org/members/list))
  * WebGL은 openGL ES 기반의 3d 그래픽 api이며 자바스크립트로 바인딩 되어있다. 그래픽 결과를 html5 canvas element에 그리도록 구현되어 있어 웹뿐만 아니라 안드로이드나 ios 모바일 웹뷰에서도 사용 가능 (플랫폼 독립적)
    * openGL 역시 api 명세이며, 각 그래픽 제조사(엔비디아 등)는 openGL api 를 완벽 지원하는 드라이버를 제공한다. 각 드라이버에서 해당 api 요청을 받고, 자기 회사의 gpu에 최적화되게 openGL api 명령을 수행한다.
  * js api이므로 해당 api를 wrapping한 유명한 three.js 라이브러리가 있다.

## WebGL vs Flash
  * HTML5나 WebGL과 같은 공개 표준 기술이 빠르게 발전하면서 플래시의 기능을 웹 표준 기술만으로도 구현 가능
  * 애플 구글 등 이미 안티 플래쉬 선언을 했으며 현재 에드센스나 유튜브에서도 플래쉬를 사용하지 않음
  * 카카오도 현재 구현된 flash 기능을 모두 제거하고 webgl로 사이트 개편 진행 중이다.

## Lottie
  * Lottie는 airbnb에서 만든 오픈소스 모바일 라이브러리이며, 웹에서도 실행 가능하다.
  * 사용자의 행동에 반응하는 인터랙션 애니메이션 가능하다.
  * 디자이너들이 에프터이펙트라는 프로그램을 통해 만든 lottie 애니메이션을 개발자들이 사용함으로써 효율적인 협업이 가능하다.

## 마치며

간단하게 three.js의 예제 파일도 돌려보면서 3d webGL을 경험해보았는데, 굉장히 재미있는 기술인 것 같다. 하지만 좀 더 자유자재로 사용을 하기 위해서는 관련 공부를 해야할 것 같다.