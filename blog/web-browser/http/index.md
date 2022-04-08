---
layout: post
title: "http란?"
subtitle: "http란?"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

http가 무엇인지 누군가에게 설명 해주려니 막막한 느낌이 들면서 어떤 규칙(프로토콜)을 지켜야 하는게 http인지 잘 모르고 있구나 라는 생각이 들었다.

그래서 이번 기회에 http가 무엇인지 간략히 정리해보려고 한다. (http 문서 참고)

## 🔥 HTTP

http는 hyper text transfer protocol로 인터넷에서 데이터를 주고 받을때 사용하는 프로토콜이다. 처음에서는 HTML문서만 가능했었지만, 지금은 오디오, 이미지, 영상, 텍스트문서 등 모든 데이터가 가능하다.

그리고 "http로 통신한다"라고 하는 서버들은 GET, POST, PUT 등의 http method를 마음대로 작성하면 안된다. 각 method별로 해야하는 일들이 정해져 있고, 수행한 작업에 따라 return 해야하는 status code들도 다 규칙이 정해져 있기 때문이다.

해당 내용은 http/1.1 rfc문서에 나와있으며, Internet Standard rfc로도 출간이 되었다.

> [ https://tools.ietf.org/html/rfc7230 ](https://tools.ietf.org/html/rfc7230)

이 문서에는 http가 지켜야하는 규칙들이 명시되어 있고, http method들이 지켜야 하는 규칙들도 명시가 되어있다.

POST로 예를 들자면, POST는 캐시가 불가능하고, POST는 body의 request message에 있는 데이터로 새로운 식별자에 자원을 만드는데 사용을 하고, 생성했을 때는 201, 자원을 생성하지 않았을 경우에는 200, 204 status code를 return해야 한다는 등의 많은 규칙들이 명시되어 있다.

이처럼 기본적으로 HTTP Method가 해야하는 일들이 모두 적혀있다. 따라서 Create를 할 때, GET Method로 서버 api를 짠다면 이건 HTTP를 지키지 않는 것이라고 생각할 수 있다.

상세한 내용은 rfc 문서를 보면 더 자세히 알 수 있고, 공부를 하면서 알게 된 내용은 http/1.1은 http/1.0에서 REST 디자인이 적용된 프로토콜이라는 것이다.

# HTTP 1.1

RFC 2068에 정의된 HTTP/1.1 표준은 공식적으로 1997년 1월에 출시되었다. HTTP/1.1 표준에 대한 개선과 업데이트는 1999년 6월 RFC 2616으로 출시되었다.

HTTP 1.1에서는 HTTP1.0의 차이는 다음과 같다.

* METHOD

1.0에서는 GET, POST, HEAD만 있었지만 1.1에서는 OPTIONS, PUT, DELETE, TRACE가 추가 되었다.

* 조건부 요청 기능

1.0에서는 LAST-MODIFIED라는 키를 응답 헤더에 담아 서버의 리소스가 언제 마지막으로 수정되었는지를 알려주었다. 1.1에서는 이것을 더 구체화 했는데, 브라우저가 최초 응답시 받은 Last-Modified값을 IF-MODIFIED-SINCE라는 요청 헤더에 담아서 보내면 서버는 요청 파일의 수정 시간을 If-Modified-Since값과 비교해 동일하면 304 Not Modified로 응답하고 다르면 200 OK와 함께 리소스와 Last-Modified값을 응답 헤더에 담아 전송합니다.
브라우저는 응답 코드가 304일 경우 캐쉬에서 리소스를 로드하고, 200이라면 새로 다운받고 Last-Modified값을 갱신합니다.

추가적으로 파일 해쉬값으로 캐시 여부를 판단하는 로직이 1.1에 추가되었는데 바로 ETag입니다.

브라우저는 최초 응답시 받은 Etag값을 If-None-Match라는 요청 헤더에 포함시켜 리소스를 요청합니다.

서버는 요청 파일의 Etag값을 If-None-Match값과 비교해 동일하면 304 Not Modified로 응답하고 다르면 200 OK와 함께 리소스와 새 Etag값을 응답 헤더에 담아 전송합니다.

브라우저는 응답 코드가 304일 경우 캐쉬에 리소스를 로드하고 200이면 새로 다운받고 Etag값을 갱신합니다.