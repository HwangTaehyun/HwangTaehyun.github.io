---
layout: post
title: "ios module not found error"
subtitle: "ios YogaKit module not found error"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header : true
order: 9
---

# ❎ 에러 발생

ios archive 중 module not found error가 터졌다.

해당 이슈를 검색해보니 ios deployment 타겟 버전이 Podfile에 명시되어 있는 버전과 달라 생기는 문제였다.

![](img/2021-01-13-11-49-33.png)


# 🌟 해결

* ## Xcode -> Build Setting 에서 Deployment를 검색하고 해당 target과

    ![](img/2021-01-13-11-53-45.png)

* ## Podfile 상단의 ios 플랫폼 버전을 똑같이 맞춘다.

    ![](img/2021-01-13-11-52-15.png)
