---
layout: post
title: "ESLint warning; defined but never used for react-native components"
subtitle: "ESLint warning; defined but never used for react-native components "
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# ❎ 에러 발생

![](img/2020-10-16-16-42-56.png)

eslint를 사용하면서 react 관련 컴포넌트들이 사용이 됐음에도 불구하고, 사용되지 않았다는 에러가 생기는데 저 빨간줄을 없애야겠다는 생각이 들었다.

# 🌟 해결

eslint-plugin-react 모듈을 설치하고, .eslintrc.json 파일에 "plugin:react/recommended" preset을 extends하면 더 이상 해당 문구가 뜨지 않는다.

{% highlight js %}
$ yarn add eslint-plugin-react -D
{% endhighlight %}

{% highlight js %}
  "extends": [
    ...
    "plugin:react/recommended"
    ...
  ]
{% endhighlight %}
