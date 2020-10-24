---
layout: post
title: "Could not get BatchedBridge, make sure your bundle is packaged correctly"
subtitle: "Could not get BatchedBridge, make sure your bundle is packaged correctly"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

가끔 react-native를 사용하다가 android에서 다음과 같은 에러를 만난다.

![](img/2020-10-23-10-49-28.png)

메트로를 재시작해 번들링을 새로 해주면 된다.

{% highlight js %}
react-native start --reset-cache
{% endhighlight %}