---
layout: post
title: "browser rendering 과정"
subtitle: "browser rendering 과정"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# 💡 브라우저의 rendering 과정 (DOM부터..)

HTML 마크업을 처리하고 DOM 트리를 빌드합니다.
CSS 마크업을 처리하고 CSSOM 트리를 빌드합니다.
DOM 및 CSSOM을 결합하여 렌더링 트리를 형성합니다.
렌더링 트리에서 레이아웃을 실행하여 각 노드의 기하학적 형태를 계산합니다. (composite view)
개별 노드를 화면에 페인트합니다.

너무 잘 설명되어 있는 글이 있어 링크를 남깁니다!
[https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-tree-construction?hl=ko](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-tree-construction?hl=koa)