---
layout: post
title: "node chalk module 사용법"
subtitle: "node chalk module example"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

chalk를 사용하는데 import 후 사용방법대로 사용해봤지만 컬러가 나오지 않았다.

stack overflow에서 검색을 하고, 다음과 같은 초기화 문구를 사용하니 컬러를 사용할 수 있었다.

```js
const ctx = new chalk.Instane({level:3});
console.log(ctx.red("red!!"))
```
