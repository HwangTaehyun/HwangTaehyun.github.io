---
layout: post
title: "Execution failed for task ':app:processDebugResources'."
subtitle: "Execution failed for task ':app:processDebugResources'."
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# ❎ 에러 발생

react-native에서 react-native-image-crop-picker 모듈을 적용하고 빌드를 해보니 다음과 같은 에러를 만났다.

{% highlight js %}
* What went wrong:
Execution failed for task ':app:processDebugResources'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.Workers$ActionFacade
   > Android resource linking failed
{% endhighlight %}

# 🌟 해결

android/build.gradle 파일에서 //Change this 문구와 같이 gradle의 버전을 3.5.x에서 4 버전대로 올리니 해결되었다!
* classpath 'com.android.tools.build:gradle:4.0.1'
{% highlight js %}
buildscript {
    ext {
        buildToolsVersion = "29.0.2"
        minSdkVersion = 16
        compileSdkVersion = 29
        targetSdkVersion = 29
    }
    repositories {
        google()
        jcenter()
    }
    dependencies {
        // Change this
        classpath 'com.android.tools.build:gradle:4.0.1'
        // NOTE: Do not place your application dependencies here; they belong
        // in the individual module build.gradle files
    }
}
{% endhighlight %}
