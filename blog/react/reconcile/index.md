---
layout: post
title: "React Rendering & Reconcile 이란?"
subtitle: "flatlist key prop"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header : true
order: 9
---

# React reconcile

- React에서 컴포넌트의 state가 바뀌게 되면 re-render가 일어나게 된다. 이때 state나 prop이 바뀌거나 또는 부모가 re-render되면 자식은 re-render 조건에 부합되게 된다. 그 후에 reconcile이라는 조정 단계에서 virtual-dom tree와 dom-tree를 비교하고 다른 element가 있는지 diffing algorithm을 통해 찾아낸다. (O(n))

이때 재미있는게 diffing algorithm은 2가지 가정을 한다. 첫번째는 부모 element의 type이 다르면 자식들은 비교하지 않고, 다시 마운트시킨다. 두번째는 다음은 key prop을 도입해 key가 같으면 (아마도 element type도 같아야 할 것이다.) 원래 있는 component instance를 그대로 사용한다. 이 말은 component instance의 state를 그대로 이용한다는 것이다.

이 때문에 FlatList나 map을 이용해 같은 컴포넌트를 여러개 그릴때, key에 index를 가급적이면 사용하지 말라는 warning이 뜨는 이유다. 혼자서 이해하는데 한참 걸렸다..

index를 key로 사용하면 re-ordering이나 array앞에 item을 추가하면 state mapping이 잘못되어 bug잡기도 힘든 엄청난 사태가 벌어진다.

key를 random으로 발급하면 unmount되고 mount가 새로 되어 큰 오버헤드가 발생한다. 만일 item에 고유 id가 있다면 id를 key로 사용하면 좋다. Item 고유 id를 key로 사용해 FlatList를 사용해보니 re-ordering의 경우 redering도 일어나지 않고, FlatList의 render 함수만 호출된다.

추가적으로 FlatList가 사용하는 data array에 새 아이템을 추가하면 기존의 아이템들도 re-render가 모두 일어나지만 reconcile에서 기존의 instance를 그대로 사용하게 하기때문에 dom 조작 오버헤드가 기존보다 덜 발생한다.
