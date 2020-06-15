---
layout: post
title: "redux flow"
subtitle: "redux flow"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# Provider

Provider component의 하위 컴포넌트들은 store에 접근이 가능

# connect

{% highlight js %}
connect([options])(컴포넌트)
{% endhighlight %}

위의 표현식과 같은 모습으로 사용되는데, 연결하는 함수를 만들 때는 인자로 options가 들어간다.
redux store와 연결할 component와의 bridge 역할을 하는 options 함수들은 다음과 같다.

- mapStateToProps - store state를 컴포넌트가 전달받는 props로 매핑
- mapDispatchToProps - action dispatch 함수를 컴포넌트가 전달받는 props로 매핑 <br /><br />

그리고 connect 함수에서 store.subscribe(listener)를 이때 호출해 store를 구독한다.
- [Data flow \| Redux](https://redux.js.org/basics/data-flow) 참고

# flow

1. component에서 event발생시 mapDispatchToProps로 받은 action을 dispatch

2. reducer에서 action을 받아 새로운 state를 return

3. store의 state 변경시, listener 함수들에게 통지

4. Listener함수들은 store.getState()를 호출해 최신 상태를 받아 mapStateToProps로 연결된 component의 props로 전달