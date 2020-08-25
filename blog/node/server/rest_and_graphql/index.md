---
layout: post
title: "REST & GRAPHQL"
subtitle: "장단점 비교"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/2020-08-25-23-20-05.png"
order: 9
---

# REST? GraphQL?

서버를 만들면서 항상 REST로 짜오다가 최근에 GRAPHQL을 새로 공부하면서 REST와 어떤 차이가 있는지, 공부를 해보게 되었다. 아래는 그 둘의 차이를 잘 설명한 블로그 글을 찾게 되어서 링크를 남기게 되었다.
[https://stablekernel.com/article/advantages-and-disadvantages-of-graphql/](https://stablekernel.com/article/advantages-and-disadvantages-of-graphql/)
[https://nordicapis.com/is-graphql-the-end-of-rest-style-apis/](https://nordicapis.com/is-graphql-the-end-of-rest-style-apis/)

## 🔥 REST의 장점 (vs GraphQL)

REST는 api 디자인으로써, 우리가 일반적으로 알고있는 REST가 적용된 서버들은 http/1.1 스펙을 기반으로 만들어진 서버들이다. (http/1.1이 REST 디자인을 http 프로토콜에 적용한 구현 스펙이라고 생각하면 된다.)
REST는 굉장히 장점들이 많지만, GraphQL과 비교한 장점들만 기술하면 다음과 같다.

### 1. 정해진 규격의 엄격한 데이터 요청 관리

### 2. api uri 자체에서 의미를 파악 가능해, 따로 api에 대한 메뉴얼이 필요 없다.

## 😥 REST의 단점

### 1. Round Trip and Repeat Trip Times
REST는 resource를 가져오는 특징을 가진다. 그렇기 때문에 resource가 점점 복잡해지고, 클라이언트가 다양한 resource를 가져오기 위해서는 서버와 여러번의 왕복 통신이 필요해진다.

### 2. Over/Under Fetching
클라이언트가 필요한 데이터를 서버로부터 가져올 때, 어떠한 이유로 api가 클라이언트가 필요로 하지 않는 데이터까지 또는, 필요한 데이터를 주지 않는 문제가 있을 수 있다. 이런 문제들을 해결하기 위해서는 백엔드 서버 개발자와 많은 협의가 필요하다.

### 3. Difficulty in Implementing All APIs for Client
페이스북에서 기존의 REST 디자인을 놔두고, GraphQL을 개발한 가장 큰 이유인데, 다양한 기종에서 서로 다른 데이터를 필요로 할 경우, 이에 대한 요청을 처리할 수 있는 api들을 REST로 모두 구현하는데 힘든 점이 있었기 때문이다. (ios, android에서 필요로 하는 데이터가 아주 미묘하게 다르더라도 REST api는 추가적인 구현과 수정이 필요하기 때문이다.) GraphQL은 클라이언트가 원하는 요청만 query에 담아서 보내면 되기 때문에 이 문제를 해결할 수 있다.

### 4. Thin Client/Fat Server
REST는 이미 정해진 endpoint url에서 이미 서버로부터 가공된 데이터를 받을 수 있게 설계된다. 따라서 모든 REST api를 구현한 서버가 그렇지는 않지만, 이 구조를 가지게 되면 클라이언트는 서버에 비해 비교적 로직이 적을 수 밖에 없다. 클라이언트(모바일 단말기)의 프로세싱 파워가 계속 강력해짐에 따라 이런 불균형적인 요소도 단점이라고 생각할 수 있다.

## 🔥 GraphQL의 장점 (vs REST)

### 1. Low Round Trips
REST의 1번 단점을 보완한게 GraphQL의 장점이다. 필요한 데이터들만 모두 모아 한번에 요청해서 받기 때문에 REST에 비해 클라이언트와 서버간의 왕복으로 주고받는 통신이 덜 발생한다.

### 2. Independent Develop Flow in Frontend and Backend
프론트엔드 개발자와 백엔드 개발자간의 의존성 있는 개발을 끊어줄 수 있다. GraphQL로 잘 짜여진 서버가 있다면, 필요한 데이터가 있을때마다 백엔드 개발자분들에게 부탁할 필요 없이 GraphQL 서버로 원하는 데이터를 바로 요청하면 된다.

### 3. Fat Client/Fat Server
정해진 규격의 데이터(서버에서 가공된 데이터)를 덜 필요로 함으로써, REST보다는 Client에 좀 더 중심이 실리게 된다.

## 😥 GraphQL의 단점
### 1. HTTP 캐싱 불가 & HTTP 200 status code
HTTP의 캐싱 전략은 각각의 URL에 저마다의 정책을 설정하는 형식으로 이루어지는데, graphql은 endpoint url이 하나로 cache를 지원하지 않는다. http의 강점인 cache를 이용하지 못하는 것인데, cache기능을 이용하려면 자체 구현을 하거나 cache라이브러리를 따로 이용해야한다. 또한 서버 에러가 터져도 항상 http status code가 200으로 오게 되며, 에러가 발생했는지 여부를 알기 위해서는 response를 parsing해 error 키 존재 여부를 확인해야 한다. 이처럼 http 규격을 지키지 않는 부분들이 존재하는 부분들을 단점으로 들 수 있다.

### 2. 잘못된 요청 필터링의 어려움
REST는 서버에서 만들어준 규격의 api만을 이용하기 때문에, 불필요하게 많은 데이터를 필요로하는 클라이언트의 요청을 사전에 막을 수 있다. 하지만 grapql을 쓰게 되면, 전적으로 필요한 데이터 요청을 클라이언트에게 맡기기 때문에 거대하고 복잡한 데이터 요청을 항상 주시해야 한다.
