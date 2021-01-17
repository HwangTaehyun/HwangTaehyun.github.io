---
layout: post
title: "react-native nested scroll view with horizontal direction"
subtitle: "react-native nested scroll view with horizontal direction (with android)"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header : true
order: 9
---

# ❎ 에러 발생

react-native에서 Scroll이 가능한 뷰를 위해 ScrollView라는 컴포넌트를 기본으로 제공해준다.
하지만 ScrollView안에 ScrollView를 사용해야할 경우가 생기는데, 기본적으로 이 경우 밖에 있는 ScrollView가 touch event를 모두 가져가서 안의 ScrollView는 작동하지 않는다.

이때 자식의 ScrollView에 nestedScrollEnabled 속성을 주게 되면 잘 작동한다. (ios는 기본적으로 nestedScrollEnabled가 가능해, 이 옵션은 안드로이드를 위해 존재한다.)

하지만 그래도 해결되지 않는 문제는 밖의 ScrollView가 가로 방향으로 스크롤이 가능할 때, 안에 ScrollView도 가로 방향으로 스크롤 될 수 있게 하는 문제다.
이론적으로는 nestedScrollEnabled만 줘도 되야할 것 같은데, 되지를 않는다. ios는 잘 되는데..

# 🌟 해결

한참 찾아보다가 [https://stackoverflow.com/questions/57734315/how-can-i-have-nested-horizontal-scrollviews-in-react-native/65756634#65756634](https://stackoverflow.com/questions/57734315/how-can-i-have-nested-horizontal-scrollviews-in-react-native/65756634#65756634), [https://github.com/facebook/react-native/issues/21436 ](https://github.com/facebook/react-native/issues/21436) 글들을 보고 해결했다.

{% highlight js %}
import { ScrollView } from 'react-native'
import { ScrollView as GestureHandlerScrollView } from 'react-native-gesture-handler'

<ScrollView horizontal>
    <GestureHandlerScrollView horizontal />
</ScrollVIew>
{% endhighlight %}

정말 너무 잘 작동한다. 하지만 여기에서 사람들이 의문을 가지는 부분에 대해서는 나도 똑같다. react-native-gesture-handler에서 제공하는 ScrollView는 어떻게 다르게 구현했길래 react-native에서 제공하는 ScrollView랑 다르게 작동하는걸까? ㅎㅎ