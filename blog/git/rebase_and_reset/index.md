---
layout: post
title: "git reset & rebase"
subtitle: "git reset & rebase 사용법"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

git을 사용할 때 가장 많이 사용하는 명령어를 꼽아보라면 reset과 rebase일 것 같다.

각 명령어의 사용법과 어떻게 적용이 되는지에 대해 정리해보았다.

# git reset

  git reset에는 --soft, --mixed (default), --hard 3가지 옵션이 있다.

그리고 argument로는 commit 번호가 온다.

git reset은 많이 헷갈리는 명령어이지만 아래만 기억하면 쉽게 사용할 수 있다.

- --soft

    HEAD포인터가 가리키는 커밋번호 바꾸기

- --mixed

    index까지 커밋 내용으로 바꾸기

- --hard

    working directory까지 커밋 내용으로 바꾸기

# git rebase

항상 로컬 브랜치에서 작업을 하다가 upstream브랜치 혹은 master 브랜치와 sync를 맞추기 위해서는 git pull 또는 git pull --rebase 명령어를 이용해야 하는데 개인적으로 git pull을 해서 로컬브랜치에 의미 없는 merge commit을 남기는게 좋지 않다고 생각한다.

일반적으로는 git pull --rebase를 이용해서 로컬 브랜치에 이유없는 merge commit을 남기지 않고, master브랜치 혹은 develop 브랜치에 pull request를 날릴때만 merge commit을 남겨서 이쁜 git history를 남기는게 좋은 것 같다.

그리고 rebase를 했을때, 큰 장점이 commit번호만 다르고 수정내용이 같은 commit일 경우, merge할 때 fast-forward로 합치지 않고, default로 merge commit을 남기고, 결과적으로 같은 내용의 commit이 두번 들어가게 된다. 하지만 rebase에서는 git에서 같은 commit은 다시 남기지 않고, 다른 커밋들만 위에 쌓고 HEAD포인터만 이동시켜서 깔끔한 history를 남겨준다.

그리고 rebase를 한다고해서 rebase를 할 commit의 author date는 바뀌지 않기 때문에 걱정할 필요 없다. 대신 commiter의 date는 바뀐다. (rebase가 commit을 새로 쌓기 때문에 새 commit의 시간이 바뀔거라고 생각하는 사람들이 있어서)

[https://stackoverflow.com/questions/2973996/git-rebase-without-changing-commit-timestamps](https://stackoverflow.com/questions/2973996/git-rebase-without-changing-commit-timestamps)

위의 링크를 보면 rebase후에 commiter의 time stamp도 바꾸는 방법이 나와있다.

