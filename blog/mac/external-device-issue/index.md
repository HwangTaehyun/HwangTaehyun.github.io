---
layout: post
title: "Kernel panic in Mac with USB-C external displays"
subtitle: "Kernel panic in Mac with USB-C external displays"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# Mac Issue with USB-C external displays
맥을 clam shell mode로 회사에서 사용하고 있는데, 회사에서 잘 사용하다가 집에 또 가져가서 사용하다가 다시 회사에 가지고 와서 외장 디스플레이를 연결하면 mac이 죽는 문제가 있었다...
아니 이게 얼마짜린데 죽는거야라고 생각하면서 열심히 찾아보다가 아래 글을 읽게 되었다.

[https://eclecticlight.co/2019/11/02/are-you-experiencing-panics-or-problems-with-usb-c-external-displays/]( https://eclecticlight.co/2019/11/02/are-you-experiencing-panics-or-problems-with-usb-c-external-displays/)

요약을 하면 맥에서 외장 디스플레이를 분리할 때, 맥을 끄고나서 분리해야 해당 문제가 생기지 않는다고 한다.

맥이 켜져있는 상태에서 외장 디스플레이를 분리하고서도 잘 작동이 되다가, 다시 꽂을 때 문제가 되는 것을 보면 아마도 외장 디스플레이를 분리할 때 디바이스 해제 작업이 정상적으로 일어나지 않아서 다음번에 다시 외장 디스플레이를 연결할 때 문제가 되는 것 같다. 이렇게 되면, 전에 저장했었던 디스플레이 순서도 모두 다시 꼬여서 재설정을 해야한다. (😂)

위에서 알려준대로 외장 디스플레이를 분리하기전에 끄고나서 분리하고, 다시 사용하니 잘 된다 ㅠㅠ