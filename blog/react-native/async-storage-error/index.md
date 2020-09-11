---
layout: post
title: "Error: Entries must be arrays of the form [key: string, value: string]"
subtitle: "Error: Entries must be arrays of the form [key: string, value: string]"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# ❎ 에러 발생

react-native에서 AsyncStorage를 쓰다가 다음과 같은 에러를 만났다.
> Error: Entries must be arrays of the form [key: string, value: string]

# 🌟 해결

AsyncStorage는 key-value 모두 string만 지원을 하는데, value에 Number type 변수를 넣어 문제가 생겼다. key-value 모두 string으로 사용해 해결할 수 있었다.
