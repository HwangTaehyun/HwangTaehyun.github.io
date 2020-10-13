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
$ react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res
{% endhighlight %}

android 폴더에 들어가서 아래와 같이 빌드 명령어를 치면 안드로이드 앱을 빌드할 수 있다.

{% highlight js %}
$ ./gradlw assembleRelease
{% endhighlight %}

종종 리소스 중복 에러를 만날 수 있는데, 아래 해결법에서와 같이 중복된 resource를 지워주면 해결된다!

{% highlight js %}
* What went wrong:
Execution failed for task ':app:mergeReleaseResources'.
{% endhighlight %}

# 🌟 해결

에러 문구 그대로 resource가 겹쳐서 생긴 문제인데

/android/app/src/main/res 폴더에 들어가서 drawable 폴더를 삭제하고 다시 실행하면 문제가 해결된다.
