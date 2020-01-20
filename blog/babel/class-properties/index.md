---
layout: post
title: "Support for the experimental syntax ‘classProperties’ isn’t currently enabled"
subtitle: "Support for the experimental syntax ‘classProperties’ isn’t currently enabled"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header : true
order: 9
---

# ❎ 에러 발생

babel로 빌드할때 class를 사용하려면 @babel/plugin-proposal-class-properties를 설정해줘야 한다.

그렇지 않으면 위와 같이 에러가 발생한다.

```
@babel/core 바벨 사용필수 라이브러리
@babel/preset-env es5 트랜스파일러
@babel/polyfill es6 의 새로운 객체와 메소드 사용 가능 처리
@babel/preset-react 리액트 jsx를 위한 라이브러리
@babel/plugin-proposal-class-properties class 를 사용 가능처리
```

# 🌟 해결

먼저 설치해주고
```console
yarn add @babel/plugin-proposal-class-properties -D
```

.babelrc나 babel.config.js의 plugin부분에 클래스용 바벨 플러그인을 아래와 같이 추가해준다.
```vim
{
  "presets": [
    "@babel/preset-env"
  ],
  "plugins": [
    "@babel/plugin-proposal-class-properties"
  ]
}
```

그러면 에러가 뜨지 않고 잘 빌드된다.
