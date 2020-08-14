---
layout: post
title: "http란?"
subtitle: "http란?"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

http가 무엇인지 누군가에게 설명 해주려니 막막한 느낌이 들면서 어떤 규칙(프로토콜)을 지켜야 하는게 http인지 잘 모르고 있구나 라는 생각이 들었다.

그래서 이번 기회에 http가 무엇인지 간략히 정리해보려고 한다. (http 문서 참고)

## 🔥 HTTP

http는 hyper text transfer protocol로 인터넷에서 데이터를 주고 받을때 사용하는 프로토콜이다. 처음에서는 HTML문서만 가능했었지만, 지금은 오디오, 이미지, 영상, 텍스트문서 등 모든 데이터가 가능하다.

그리고 "http로 통신한다"라고 하는 서버들은 GET, POST, PUT 등의 http method를 마음대로 작성하면 안된다. 각 method별로 해야하는 일들이 정해져 있고, 수행한 작업에 따라 return해줘야하는 status code들도 다 규칙이 정해져 있기 때문이다.

해당 내용은 http/1.1 rfc문서에 나와있으며, Internet Standard rfc로도 출간이 되었다.

> [ https://tools.ietf.org/html/rfc7230 ](https://tools.ietf.org/html/rfc7230)

이 문서에는 http가 지켜야하는 규칙들이 명시되어 있고, http method들이 지켜야 하는 규칙들도 명시가 되어있다.

POST로 예를 들자면, POST는 캐시가 불가능하고, POST는 body의 request message에 있는 데이터로 새로운 식별자에 자원을 만드는데 사용을 하고, 생성했을 때는 201, 자원을 생성하지 않았을 경우에는 200, 204 status code를 return해야 한다는 등의 많은 규칙들이 명시되어 있다.

이처럼 기본적으로 HTTP Method가 해야하는 일들이 모두 적혀있다. 따라서 Create를 할 때, GET Method로 서버 api를 짠다면 이건 HTTP를 지키지 않는 것이라고 생각할 수 있다.
