---
layout: default
title: "Blog"
description: 개인적으로 궁금해서 공부했던 내용들, 공유하고 싶은 내용을 남겨요.
main: true
project-header: false
header-img: img/about.jpg
---

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.blog == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
