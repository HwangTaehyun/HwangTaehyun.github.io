---
layout: post
title: "MobX: Since strict-mode is enabled, changing (observed) observable values without using an action is not allowed"
subtitle: "MobX: Since strict-mode is enabled, changing (observed) observable values without using an action is not allowed"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header : true
order: 9
---

# MobX: Since strict-mode is enabled, changing (observed) observable values without using an action is not allowed

Mobx를 열심히 사용을 하는데 갑자기 시뮬레이터에 Warning이 나왔다.

?? action에서만 observable value들을 바꾸고 있는데, 내가 어디 엄한 곳에서 바꾸고 있나? 라는 생각이 들어 확인을 해보니 아니였고, 혹시 비동기 action에서 추가로 해줘야하는 작업때문이가? 라는 생각이 들었다.

예전에 mobx 스터디를 할 때, 비동기 action에서는 runInAction으로 항상 감싸줘야 한다고 했었는데, 이거를 적용해보니 해당 Warning이 말끔히 사라졌다.

비동기 함수에서 mobx observable value를 바꾸는 작업이 있다면, 원래는 해당 observable value를 바꾸는 action을 새로 정의하고, 필요한 곳에서 불러야하지만 이런 부분이 귀찮기 때문에

```js
runInAction(()=>{
    // change observable valuse
    this.aa = "aa"
})
```

mobx에서는 runInAction을 만들어 사용하라고 하는 것 같다.