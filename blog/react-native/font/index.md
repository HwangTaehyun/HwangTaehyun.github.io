---
layout: post
title: "react-native custom font 설정하기"
subtitle: "react-native custom font 설정하기"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---
# 🔥 react-native font 설정

먼저 react-native-config.js를 다음과 같이 작성한다.

{% highlight js %}
module.exports = {
  project: {
    ios: {},
    android: {},
  },
  assets: ['./src/assets/fonts/'],
};
{% endhighlight %}

그리고, src/assets/fonts 폴더 아래에 쓰고 싶은 font 파일들을 모두 가져다 놓는다.

![](img/2020-10-13-16-02-59.png)

마지막으로 다음 명령어를 치면 android와 ios의 assets에 font들이 모두 추가된다!

{% highlight js %}
$ react-native link
{% endhighlight %}

react-native-vector-icons의 font뿐만 아니라 모든 font들에 대해 똑같이 적용이 가능하다.