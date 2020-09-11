---
layout: post
title: "CORS란?"
subtitle: "Simple Origin Policy & Cross Origin Resource Sharing"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

백엔드 서버와 프론트 서버를 같은 호스트에서 서비스하면서 CORS라는 개념을 알게 되었다. 왜 이게 중요한건지 이유를 알고 싶었는데 정말 잘 설명해준 블로그와 유튜브 영상을 알게 되어 마지막에 링크를 달아놓았다. 이 내용들을 이해해보고 혼자 다시 정리해 보았다.

CORS를 이해하기전에 먼저 SOP에 대해 이해해야 한다.

## Single Origin Policy (SOP)

SOP의 정의 MDN에서 보면 다음과 같다.
> 동일 출처 정책(same-origin policy)은 어떤 출처에서 불러온 문서나 스크립트가 다른 출처에서 가져온 리소스와 상호작용하는 것을 제한하는 중요한 보안 방식입니다. 동일 출처 정책은 잠재적으로 해로울 수 있는 문서를 분리함으로써 공격받을 수 있는 경로를 줄여줍니다.

하지만 웹에서 origin이 다르다고, 다른 origin의 자원을 못 쓰게 전부 막는건 너무 엄격한 정책이라고 할 수 있다. 따라서 브라우저가 특정 상황에서는 SOP를 적용하지 않도록 하는 예외 규정이 바로 CORS이다.

## Cross Origin Resource Sharing (CORS)
다음의 key-value쌍을 response 헤더에 명시해주는 서버의 자원은 브라우저가 SOP를 적용하지 않아 문제가 생기지 않는다.
```http
Access-Control-Allow-Origin: www.origin-example.com
```

origin-example.com이라는 origin에서는 내 서버의 자원을 허용해 줄게 라는 의미이다. 여기를 "*"로 바꾸면 모든 origin에서 내 자원을 가져다가 읽어서 쓸 수 있게 된다.

## 왜 중요할까?

사실 이게 가장 궁금했던 내용이였다.

결론적으로 브라우저의 캐시가 여기에 추가되어 심각한 문제를 발생 시킬 수 있었다.

어떤 해커가 만든 사이트에서 google email 계정의 mail 내용을 전부 가져오는 url이 있고, 사용자가 이 사이트에 접속해서 이 url을 누르면 email 내용을 전부 가져와 해커의 서버로 보내는 로직을 심어 놓을 수 있다. 여기서 브라우저는 구글 서버에서 보내준 쿠키를 가지고 있다가 위의 요청을 보낼때, 쿠키를 담아서 보내고 구글 서버는 아무 의심없이 구글 이메일 내용을 보여주게 된다. (만일 구글 서버에 방어 로직이 아무것도 없다면)

그래서 이런 위험들을 1차적으로 막기 위해 브라우저는 SOP라는 보안 규칙을 가지게 되었고, 구글 서버도 CORS에 명시한 origin만 구글의 사용자 정보를 읽을 수 있고, 다른 origin들은 권한이 없게 할 수 있다.

## 정리
SOP는 브라우저의 중요한 보안 정책이다. 이런 보안 정책을 해제하는 크롬 플러그인이나 다른 방법들이 존재하는데, 함부로 적용을 했을 경우 위와 같이 나도 모르게 내 개인적인 데이터들이 해커들의 서버로 전송될 수 있는 위험이 생기게 된다.

## Reference
1. https://evan-moon.github.io/2020/05/21/about-cors/

2. https://www.youtube.com/watch?v=6QV_JpabO7g&t=217s
