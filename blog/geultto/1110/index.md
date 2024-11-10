---
layout: post
title: "Rob Pike가 설명하는 동시성과 병렬성의 차이"
subtitle: "Concurrency Is Not Parallelism"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# 동시성과 병렬성의 차이

Rob Pike가 설명하는 동시성과 병렬성에 대한 설명 자료가 있어 가져왔다.
Rob Pike의 ["Concurrency Is Not Parallelism"](https://www.youtube.com/watch?v=oV9rvDllKEg) 강연에서 동시성과 병렬성에 대해 다음과 같이 설명한다.

> "Concurrency is about dealing with lot of things at once, Parallelism is about doing a lot of things at once"
> — Rob Pike, ["Concurrency Is Not Parallelism"](href="https://www.youtube.com/watch?v=oV9rvDllKEg), [1:08](href="https://youtu.be/oV9rvDllKEg?t=68")

많은 사람들이 이 문장만 인용하지만, 영상에서는 더욱 중요한 설명이 있다.

> "Concurrency is about structure and Parallelism is about execution"
> — Rob Pike, ["Concurrency Is Not Parallelism"](https://www.youtube.com/watch?v=oV9rvDllKEg), [2:10](https://youtu.be/oV9rvDllKEg?t=130)

> "Concurrency is a way to structure a thing so that you can maybe use Parallelism to do a better job but Parallelism is not the goal of Concurrency. Concurrency goal is a good structure."
> — Rob Pike, ["Concurrency Is Not Parallelism"](https://www.youtube.com/watch?v=oV9rvDllKEg), [2:30](https://youtu.be/oV9rvDllKEg?t=150)

> "Concurrency is way to structure a program by breaking it into pieces that can be executed independently"
> — Rob Pike, ["Concurrency Is Not Parallelism"](https://www.youtube.com/watch?v=oV9rvDllKEg), [3:44](https://youtu.be/oV9rvDllKEg?t=224)

Concurrency와 Parallelism은 혼동 될 수 있지만 분리된 개념이며, Concurrency는 독립적인 작업들로 쪼개 구조화하는 것이라고 설명한다. 여기에 Parallelism까지 적용한다면 더 좋게 만들 수 있다고 한다.

그리고 Concurrency의 예시로 마우스, 키보드, 디스플레이 드라이버가 하나의 single core에서 작업되는 것을 예시로 들었다. single core이기 때문에 이 모든 작업들이 정말 동시에 이루어질 수 없음에도 사용자는 single core가 너무 멀티 태스킹을 잘해서 동시에 작업이 이루어지는 것과 같이 느낄 수 있다.
Parallel한 것으로 예시는 백터 내적과 같은 계산을 예시로 들었다. 내적하려는 벡터들의 각 성분끼리 곱한 값들을 나중에 모두 더하면 되기 때문에, 각 성분끼리 곱하는 작업을 병렬적으로 처리하고 나중에 모두 더하면 된다.

Oracle의 [멀티스레딩 용어 정의 문서](https://docs.oracle.com/cd/E19455-01/806-5257/6je9h032b/index.html)에서는 다음과 같이 설명한다.

> **Parallelism**:
> A condition that arises when at least two threads are executing simultaneously.

> **Concurrency**:
> A condition that exists when at least two threads are making progress. A more generalized form of parallelism that can include time-slicing as a form of virtual parallelism.

결국 Concurrency란 특정 time period동안 여러개의 쓰레드가 모두 작업을 할 수 있는 것이라고 이해할 수 있다. 결국 Rob Pike가 말한 것처럼 동시에 여러 일을 다룰 수 있는 것을 의미한다. 그리고 at once는 simultaneously가 아니라 within the same time frame 처럼 이해를 하면 좋을 것 같다.

여기서 재미있는건 go 1.14부터 go scheduler가 cooperative scheduling에서 preemptive scheduling으로 방식을 바꾸어서 진정한 Concurrency를 이루었다고 생각할 수 있다.

왜냐하면 cooperative scheduling은 block되는 function call이나 종료가 되지 않는 무한 for loop등의 task (thread)를 처리할 때 다른 task (thread)들이 실행될 수 있는 기회를 빼앗아 기아 상태로 만들 수 있어 특정 task로 인해 concurency를 보장하지 않을 수 있기 때문이다.

그리고 preemptive scheduling이 되면서 각 go routine들은 10ms time slice를 가지고 있다가 preempted (interrupted) 된다.

```go
// forcePreemptNS is the time slice given to a G before it is
// preempted.
const forcePreemptNS = 10 * 1000 * 1000 // 10ms
```

출처: [Go 언어 소스 코드](https://github.com/golang/go/blob/go1.19.1/src/runtime/proc.go#L5279-L5281)
