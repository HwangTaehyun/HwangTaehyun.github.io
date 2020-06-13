---
layout: post
title: "git submodule"
subtitle: "git submodule"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/git.png"
order: 9
---

# git submodule 명령어 정리

git submodule을 관리할 때, 많이 사용하는 명령어들에 대해 정리해보았다.

- git submodule init
     - .gitmodules tracked 파일 내용을 로컬 .git/config 의 submodule entry에 추가.
     - 추가된 이후에는 다시 명령어를 재실행해도 업데이트 하지 않는다.

- git submodule update
    -  git project에 추가된 Subproject commit에 맞춰 .git/config에 추가된 submodule git project들을 정해진 폴더 위치에 git clone해온다.

- git submodule sync
    -  .gitmodules에 등록된 submodule들의 git project url과 .git/config의 submodule들의 git project url과 동기화한다.

# git submodule들 한방에 가져오기

- git submodule update --init --recursive
    - project를 clone하자마자 위의 명령어로 모든 submodule들을 다 가져올 수 있다.

# git submodule들 모두 제거하기

- git submodule deinit --all -f
    - project의 submodule들을 강제로 모두 제거한다.