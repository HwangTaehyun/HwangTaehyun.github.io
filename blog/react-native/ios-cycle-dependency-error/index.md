---
layout: post
title: "Cycle in dependencies between targets ..."
subtitle: "Cycle in dependencies between targets ..."
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# ❎ 에러 발생

react-native project에서 ios프로젝트를 빌드 하다가 다음과 같은 에러를 만나게 되었다.

> Cycle in dependencies between targets ...

왜 갑자기..? (나중에 생각해보니, 나도 모르게 뭔가 안되는 상황에서 react-native link 명령어를 쳤던게 문제의 원인이 였다. 0.60 버전 이상에서는 자동 링크를 해줘서 안해줘도 되는 거를 아는데도 너무 답답할 때 혹시나? 하며 꼭 한번 치게 된다 ㅠ)

역시나 찾아보니 나와 같은 문제를 가진 사람들이 있었다.
[ https://github.com/react-native-community/lottie-react-native/issues/619 ](https://github.com/react-native-community/lottie-react-native/issues/619)

# 🌟 해결

ios에서 꼬인 디펜던시를 푸는 방법은 2가지가 있다.

1. ios 프로젝트에서 Pods, Podfile.lock 날리고 pod install 다시 하기
2. Xcode열고 Product -> 'Clean Build Folder' (cmd + Shift + K)

링크에서 추천해주는 2번 방법으로 적용해보니 바로 해결되었다!