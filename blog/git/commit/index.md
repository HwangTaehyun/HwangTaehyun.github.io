---
layout: post
title: "git commit"
subtitle: "git commit"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/git.png"
order: 9
---

git commit을 했을때 git project에는 어떤 파일들이 추가되는지 궁금해져 한번 정리해보려고 한다.

먼저 commit 할 파일들을 만들어서 commit해보자

git project의 아무 폴더에 들어가서 아래의 명령어를 실행하자

{% highlight js %}
$ echo tt >> tt.txt
$ git add .
$ git commit -m "tt"
{% endhighlight %}

그리고 git project root폴더 위치에서 ls .git/objects를 쳐보면

해당 파일을 만든 폴더의 tree object와 그 폴더의 상위 폴더 tree object

그리고 해당 파일의 blob object가 생긴 것을 알 수 있다.

git cat-file -p tree-object 를 하게 되면 tree-object가 가지고 있는 tree-object sha-1값과 blob object sha-1값을 알 수 있고,

git cat-file -p blob-object를 하게 되면 blob-object의 파일 내용이 출력된다.

ex.) 위의 예에서는 tt가 출력된다.
