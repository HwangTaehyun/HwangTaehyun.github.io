---
layout: post
title: "VIM 사용법 (2)"
subtitle: "jump list & change list"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

VIM을 쓸 때, 가장 많이 사용하는, 가장 유용한 위치 이동 팁을 소개하려고 한다.

바로 jump list와 change list이다.

# jump list

vim에서는 내부 버퍼로 나의 jump들을 jump list로 관리한다.

/를 통한 검색과 n, N을 통한 이동
:을 통한 지정 라인 이동
gg, G를 통한 맨 처음, 마지막 라인 이동
'(', ')', '[[', ']]', '{', '}' 이동
L, M, H를 통한 vim 윈도우안에서 위 아래 중간 이동

등의 jump들이 jump list에 기록이 된다.

jump list에 등록이 되면 이제 ctrl-O, ctrl-I를 통해 jump list 앞 뒤로 이동이 가능하다.

jump list는 vim에서 :ju 명령어를 통해 확인할 수 있다.

# change list

vim에서는 라인 수정 위치(라인 위치)를 change list에 관리한다.

수정 여부는 입력모드를 갔다가 노말모드로 다시 오기만 해도 change list에 등록이 된다.

그리고 dd 명령어를 이용해 라인을 삭제해도 해당 라인 위치가 change list에 등록이 된다.

change list에 등록이 되면 이제 'g;', 'g,'를 통해 change list 앞 뒤로 이동이 가능하다.

change list는 vim에서 :changes 명령어를 통해 확인할 수 있다.

# 느낀점

jump list는 알고 있었지만, change list의 경우 vim을 사용하고서도 꽤 늦게 알게 된 기능이였다.

코드를 수정할 때, 내가 마지막으로 수정한 위치로 가고 싶은 경우가 꽤 많이 생긴다.

위의 기능을 이용하고서 확실히 불필요한 이동이나, 아까 고쳤던 부분이 어디지? 라는 생각이 많이 줄어들어서 코드를 수정할 때 피로감이 많이 줄어드는 것을 느낄 수 있었는데 이 글을 보는 분들도 적극 활용해 업무 효율을 높이면 좋겠다. 😆