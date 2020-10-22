---
layout: post
title: "react-native eslint & prettier 설정 (with airbnb-style)"
subtitle: "react-native eslint & prettier 설정 (with airbnb-style)"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# 🔥 eslint & prettier 설정하기
eslint에도 code formatting rule이 있어, prettier와 conflict이 나기 때문에 추가적인 설정을 해주어야한다.

eslint 와 prettier를 같이 사용하기 위해서는 다음 두가지 module을 설치하고 설정해줘야한다.
  * eslint-plugin-prettier
    * prettier를 ESLint 플러그인으로 추가한다. 즉, prettier에서 인식하는 코드상의 포맷 오류를 ESLint 오류로 출력해준다.

  * eslint-config-prettier
    * eslint의 code-formatting rule을 모두 꺼서 conflict 방지

{% highlight js %}
$ yarn add --dev eslint-plugin-perttier
$ yarn add --dev eslint-config-prettier
{% endhighlight %}

추가적인 설정 방법은 아래 github에 잘 설명되어 있다.

* [https://github.com/prettier/eslint-plugin-prettier](https://github.com/prettier/eslint-plugin-prettier)

# 🔥 airbnb + react-native-community eslint style 적용하기
다음으로는 airbnb eslint 설정과 react-native-community eslint 관련 모듈들을 설치한다.
그리고 기본적으로 쓸만한 rule들을 모두 모아놓은 preset을 제공하고 있어, 이것들만 .eslintrc.json의 extends 항목에 명시해주면 된다.

* eslint-config-airbnb
* @react-natvie-community/eslint-config

{% highlight js %}
$ npx install-peerdeps --dev eslint-config-airbnb
$ yarn add --dev @react-native-community/eslint-config
{% endhighlight %}

.eslintrc.json 파일의 extends 키에 다음과 같이 적어준다.
{% highlight js %}
"extends": [
    "eslint:recommended",
    "@react-native-community",
    "airbnb",
    "airbnb/hooks",
    "plugin:prettier/recommended"
],
{% endhighlight %}

# 🔥 추가 설정
그리고 혹시 babel-plugin-module-resolver를 이용해 path alias를 이용하고 있다면, 기본적으로 eslint가 인식하지 못해 해당 import문에 에러를 띄우게 된다.
다음 모듈을 설치 및 설정을 해주면 해결된다.
eslint 설정에 bable-module 추가 (alias path 인식 기능 추가)
[ https://www.npmjs.com/package/eslint-import-resolver-babel-module ](https://www.npmjs.com/package/eslint-import-resolver-babel-module)

설정 완료!