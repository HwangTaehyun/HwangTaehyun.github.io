---
layout: post
title: "Underscore in URLS break markdown link parsing"
subtitle: "Underscore in URLS break markdown link parsing"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# ❎ 에러 발생
markdown link 사용법대로 []()를 잘 쓰고 있다가 []안에 _를 쓸 경우, link가 작동하지 않는 것을 알았다.

바로 구글링..

# 🌟 해결
[https://github.com/jekyll/jekyll/issues/529](https://github.com/jekyll/jekyll/issues/529) 글에서 해결 방법을 찾았다.

_를 \를 앞에 추가해 escape시키면 해결된다. 몇몇 마크다운(jekyll 포함)에서 _를 italic text를 구분하기 위해 사용하기 때문에 생기는 문제였다.
