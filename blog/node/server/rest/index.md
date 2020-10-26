---
layout: post
title: "REST 간단 정리"
subtitle: "REST Uniform Interface"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

REST는 로이필딩이 이야기하는 네트워크 소프트웨어 아키텍쳐이다.

REST는 다음의 6가지를 만족해야한다.

* Client-Server 구조

* Layered System

* Cacheable

* Uniform Interface
  * Interface constraint 1: identification of resources
    * resource의 식별이 되어야 한다. 웹에서는 URI 규칙을 이용해 resource를 식별한다.
  * Interface constraint 2: manipulation of resources through representations
    * representations 전송을 통해서 resources를 조작해야한다. HTTP에서 representations이란 HTTP 메소드의 POST, PUT, GET, DELTE 등을 말한다.
  * Interface constraint 3: self-descriptive messages
    * 메시지를 해석할 수 있는 명세가 공식적인 관리 기관(IANA)에 등록이 되어 있어, 또 다른 명세 없이 해석할 수 있어야 한다. (ex. html)
  * Interface constraint 4: hypermedia
    * hyper 링크를 통한 상태 전이
        * 클라이언트는 다음 상태가 어떻게 변할지 예측이 가능해진다.
        * Detail 응답을 받기 위한 URL을 저장하지 않고, href값을 얻어와 호출 가능, client는 api 엔드포인트의 변화로부터 자유로워진다. (느슨한 결합, REST가 서버와 클라이언트간의 독립적인 진화를 위해 만들어졌기 때문에 굉장히 중요한 특성)

* Stateless
    * 클라이언트와 서버가 서로의 상태를 기억하고 있을 필요가 없다.

* Code On Demand

https://shoark7.github.io/programming/knowledge/what-is-rest
> 결국 REST가 꿈꾸는 인터페이스는 HTTP와 URI을 통해 웹의 모든 컴포넌트들이 상호작용할 수 있는 generic한 인터페이스다.
