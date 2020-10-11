---
layout: post
title: "Package com.demoapp signatures do not match previously installed version"
subtitle: "com.android.ddmlib.InstallException: INSTALL_FAILED_UPDATE_INCOMPATIBLE"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# ❎ 에러 발생

react-native 프로젝트 빌드중에 갑자기 인스톨이 되지 않으면서 다음과 같은 에러 메시지를 받았다.

> Execution failed for task ':app:installDebug'.
com.android.builder.testing.api.DeviceException: com.android.ddmlib.InstallException: INSTALL_FAILED_UPDATE_INCOMPATIBLE: Package com.demoapp signatures do not match previously installed version; ignoring!

이번에도 바로 구글링

# 🌟 해결

[https://stackoverflow.com/questions/41709102/package-signatures-do-not-match-the-previously-installed-version](https://stackoverflow.com/questions/41709102/package-signatures-do-not-match-the-previously-installed-version)

stack overflow의 답변대로 다음 명령어로 에뮬레이터에서 앱을 삭제 후, 재 빌드를 하니 잘 되었다.

{% highlight js %}
$ adb uninstall com.domain.yourapp
{% endhighlight %}
