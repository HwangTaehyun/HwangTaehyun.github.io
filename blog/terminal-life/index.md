---
layout: post
title: "Make Ctrl-k in Terminal copy to the system clipboard"
subtitle: "Make Ctrl-k in Terminal copy to the system clipboard"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

Terminal에서 현재 명령어를 복사하고 싶은 경우가 생겼는데 항상 마우스를 이용해 드래그해서 복사 붙여넣기를 사용하고 있었다.

어떻게 단축키로 해결할 수 있을까 생각을 하다가, 터미널 명령어인 ctrl-k(cursor 뒤 내용 모두 잘라내기)를 실행했을 때, 이 내용이 시스템 클립보드에 저장만 된다면 될 것 같았다.

다음은 구글링을 통해 찾은 방법이다.

[ https://apple.stackexchange.com/questions/336228/make-ctrl-k-in-terminal-copy-to-the-system-clipboard ]( https://apple.stackexchange.com/questions/336228/make-ctrl-k-in-terminal-copy-to-the-system-clipboard )

.zshrc에 다음 코드를 추가하고 현재 터미널에 설정 적용(. ~/.zshrc)을 해주면 된다.
{% highlight js %}
pb-kill-line () {
  zle kill-line   # `kill-line` is the default ctrl+k binding
  echo -n $CUTBUFFER | pbcopy
}

zle -N pb-kill-line  # register our new function

bindkey '^K' pb-kill-line  # change the ctrl+k binding to use our new function
{% endhighlight %}

해결!