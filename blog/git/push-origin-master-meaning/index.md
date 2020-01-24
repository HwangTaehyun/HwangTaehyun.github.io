---
layout: post
title: "What does "master" mean in "git push origin master""
subtitle: "What does "master" mean in "git push origin master""
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header : true
order: 9
---

# What does master" mean in "git push origin master""

[https://stackoverflow.com/questions/36255366/difference-between-git-push-origin-development-and-git-push-origin-headdevelopm](https://stackoverflow.com/questions/36255366/difference-between-git-push-origin-development-and-git-push-origin-headdevelopm) 참고

git push origin my-branch 를 해석해보면 origin이라는 remote로 현재 로컬 브랜치중 my-branch라는 것을 push하겠다는 의미이다. 어떤 remote 브랜치로? 내가 지금 푸쉬하는 my-branch라는 똑같은 이름의 remote브랜치로 연결짓는다. 암묵적으로 git에서 그렇게 연결하는 것이다.

만약에 내가 푸쉬하려는 로컬 브랜치를 특정 리모트 브랜치로 git push를 하고 싶다면 다음과 같이 명령어를 써야한다.

```bash
git push origin my-local-branch-name:target-remote-branch-name
```
또는 현재 헤드가 가리키는 브랜치를 보내고 싶다면 다음과 같이 실행하면 된다.
```bash
git push origin @:target-remote-branch-name
```

master가 아닌 브랜치에서 다음 명령어를 치면 현재 작업 브랜치가 master로 올라가지 않는다.
master라는 로컬 브랜치가 리모트의 master브랜치로 올라가는 명령어다.
```bash
git push origin master
```