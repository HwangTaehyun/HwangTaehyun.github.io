---
layout: post
title: "rfc (request for comment)"
subtitle: "rfc 완벽 분석"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

가끔 web과 관련된 지식들을 찾다보면 "http/1.1에 대해 설명된 rfc7230 문서를 보면..." 과 같은 블로그 글들을 많이 볼텐데, 항상 궁금했었다. 대략 어떤 인터넷 표준문서인 것 같네.. 라고 생각을 했었는데 이번 기회에 rfc가 무엇인지에 대해 확실히 짚고 넘어가려고 한다.

## 🍏 request for comment (rfc)

rfc에 관해 많은 블로그 글들을 읽어보았지만, 이글루 블로그를 운영하시는 블로거님의 글이 가장 잘 이해가 되었다. rfc의 역사와 함께..

> [http://egloos.zum.com/gunsystems/v/10254902](http://egloos.zum.com/gunsystems/v/10254902)

추가로 조사한 배경지식을 덧붙여 이야기하자면, 소련에서 미사일을 쏘고 이에 기술적으로 뒤처진다고 생각했던 미국은 소련의 약진에 대비해 첨단 과학 기술을 단기간에 군사 기술로 전용하기 위한 조직인 고등연구계획국 ARPA(Advanced Research Projects Agency)을 설립했다고 한다. 그리고 여기서 1966년 ARPA의 국장으로 취임한 로버트 테일러가 탄도미사일 연구 자금의 일부로 현재 인터넷의 시초가 되는 알파넷을 개발했다고 한다. (파괴 불가능한 네트워크라는 명목으로..) 여기서 알파넷은 원격지의 컴퓨터와 자료를 주고 받을 수 있는 네트워크 언어나 프로토콜을 의미한다. (이 당시에는 다른 대학과 통신하기 위한 전용 컴퓨터가 있었고, 데이터를 주고받기 위해서는 항상 이 컴퓨터 앞에 앉아서 로그인하고 이용을 해야 했는데 이런 부분에서 굉장히 큰 불편함을 느끼고, 컴퓨터간 상호 연결 및 데이터 공유를 쉽게 하기 위해 이런 연구를 진행했던 것 같다.)

그리고 여기 ARPANET을 개발하는 연구원중에 [Steve_Crocker](https://en.wikipedia.org/wiki/Steve_Crocker)가 알파넷 연구와 관련된 미팅 자료들을 남기고, 이 문서들의 제목을 (한번 읽어보시고 코멘트 부탁드립니다.) request for commnet (rfc)로 남긴데서 유래했다고 한다. rfc의 시초가 여기서 시작했다.

그리고 나중에 인터넷도 생기고, 인터넷과 관련된 위원회들 IAB, IETF, IRTF이 생기고 여기서 인터넷과 관련된 통신 프로토콜이나 기타 관련된 정보 제공의 글까지들도 IETF에 요청해 검수를 받고 이 내용이 rfc로 출간이 되고 있는 것이다.

> 모든 rfc문서는 여기서 확인이 가능하다. (https://tools.ietf.org/rfc/index)

rfc란 인터넷에 관한 조사, 제안, 기술, 소견 등을 공표한 온라인 공개 문서 시리즈. 네트워크 프로토콜 또는 서비스를 구현할 때 필요한 절차와 형식 등 인터넷에 관한 정보를 알리기 위한 주요한 수단이 된 것이다.
> [Tech Recipe 블로그 참고](https://m.blog.naver.com/PostView.nhn?blogId=yeojh1&logNo=220326701812&proxyReferer=https:%2F%2Fwww.google.com%2F)

rfc의 모든 문서에는 특정 번호가 붙고, 한 번 출간되면 절대 수정이 불가능하고 새로운 rfc문서로 발급을 해야 한다고 한다.

그리고 여기서 진짜 중요한 인터넷 기술 또는 정보라고 판단이 되면 조금 더 검수를 거쳐서 internet standard 문서로 등록이 된다. 여기서 새로 문서가 나오면 위에서 말했던 것처럼 수정이 되지 않기 때문에 새로운 rfc 번호를 부여받아 문서가 나오게 된다.
> 인터넷 표준이 된 rfc 문서들은 여기서 확인이 가능하다. (https://www.rfc-editor.org/standards)

rfc문서에는 tcp/ip, http/1.1, http/2.0 과 같은 인터넷 통신 규약에 대한 문서들도 당연히 존재한다. 한번 시간이 날 때 꼭 읽어보면 좋을 것 같다. tcp는 너무 길어서 간단하게.. ㅎㅎ

* tcp  (https://www.ietf.org/rfc/rfc793.txt)

* http/1.1 (https://www.rfc-editor.org/info/rfc7230)

* http/2 (https://www.rfc-editor.org/info/rfc7540)

## 마치며

이제 rfc를 거부감 없이 받아들일 수 있게 되었다.