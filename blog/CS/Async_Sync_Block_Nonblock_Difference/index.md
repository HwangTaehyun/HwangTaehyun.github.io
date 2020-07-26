---
layout: post
title: "Async vs Sync vs Block vs Non-Block 비교"
subtitle: "Async vs Sync vs Block vs Non-Block 비교"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# 💡 Async vs Sync vs Block vs Non-Block 차이

처음 이 4가지의 개념을 이해하는데 정말 너무 고생을 했었다. 그래도 여러 글을 읽고, 선배 형들과 같은 동기 개발자들과 이야기를 많이 하면서 나름대로 이해한 내용을 정리해보고 다른 분들도 도움이 되었으면 해서 지금 글을 정리해본다.

# 🔶 Async vs Sync

먼저 비동기와 동기 함수 콜이다.

아주 쉽게 이해를 하면 이 둘은 현재 return값을 신경쓸지 말지의 여부이다.

신경을 쓴다는 이야기는 현재 return값을 받을 것인지 말것인지 이다.

sync call의 경우 무조건 지금 return 값을 받고, 다음 로직을 수행하겠다는 의미이다.

async call의 경우 현재 return값을 안받고, 나중에 그 결과를 signal을 통해 받든, 아니면 안받든 (thread한테 파일을 읽는 작업을 시키고 다 완료되었으면 그냥 끝내줘 라는 작업일 경우가 해당된다.) 어찌됐든 작업결과를 지금은 신경쓰지 않겠다는 개념이다.

# 🔷 Block vs Non-Block

block은 무언가에 의해 막힌다는 의미이다.

block call을 하는 순간 현재 실행흐름은 막히고, block call이 풀려야지만 다음 실행흐름을 이어갈 수 있다.

non-block call은 call을 하더라도 바로 다시 실행흐름이 나에게 오기때문에 실행흐름을 막힘없이 이어갈 수 있다. 말그대로 block 되지 않는다는 개념이다.

# 🙋 sync & block / sync & non-block / async & block / async & non-block 비교

이제 위의 4가지 속성을 조합해 sync-block, sync-non-block, async-block, async-non-block의 의미도 이해할 수 있다.

아주 대표적으로 궁합이 잘 맞는게 sync-block과 async-non-block일 것이다.

# 1. sync & block
sync는 return값을 지금 받아야하는데, 내가 부른 함수가 return 결과값을 처리하는 동안 나는 실행흐름을 멈출것이라는 의미이다.

# 2. async & non-block
async는 return값을 지금 신경쓰지않고, 나는 내 실행흐름을 계속 쭉 이어갈거야라는 의미이다.
대표적으로 thread에게 작업을 위임하는 작업일 것이다. 그리고 내 실행흐름은 계속 이어질 것이다.

# 3. sync & non-block
이제 정말 특이한 케이스들이다. 위의 경우 예시는 boolean isFinish() 와 같은 작업일 것이다.
비동기로 작업을 걸어놓고, 내가 계속 poll하는식으로 작업이 끝났는지 여부를 확인한다. return값은 바로바로 끝났다면 true, 안끝났다면 false가 올 것이다. 실행흐름은 절대 block되지 않고, return값은 바로바로 온다.

# 4. async & block
많은 사람들도 이야기를 하지만 이 경우는, 에러 상황과 가깝다고 한다. 이런 함수를 만들려고 노력하지 않을 것이라는 이야기이다. 현재 return값을 받을지 말지 신경은 쓰지 않으면서도, 내가 콜한 함수가 끝날때까지 내 실행흐름을 block한다는 것은 매우 비효율적이다.

async & non-block 함수를 구현했지만 의도치않게 내부적으로 block이 되는 (공유자원 접근시, 이미 다른 스레드가 쓰고 있어서 기다린다던지 등등 여러 상황) 경우 이때 async & block처럼 작동된다고 할 수 있을 것이다.