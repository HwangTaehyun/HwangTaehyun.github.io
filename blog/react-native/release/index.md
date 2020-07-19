---
layout: post
title: "react native release build error"
subtitle: "Error: Duplicate resources"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# ❎ 에러 발생

아래의 명령어로 react-native js를 bundling 한 다음,

{% highlight js %}
$ react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/ls
{% endhighlight %}

android 폴더에 들어가서 아래와 같이 빌드 명령어를 치면 종종 다음과 같은 에러를 만날 수 있다.

{% highlight js %}
$ ./gradlw assembleRelease
{% endhighlight %}

![](img/2020-07-19-16-51-10.png)

# 🌟 해결

에러 문구 그대로 resource가 겹쳐서 생긴 문제인데

/android/app/src/main/res 폴더에 들어가서 drawable 폴더를 삭제하고 다시 실행하면 문제가 해결된다.
