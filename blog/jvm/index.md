---
layout: post
title: "Java 8, Permanent Area(PermGen)은 어디로 이동했나?"
subtitle: "jvm PermGen"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# Java 8, Permanent Area(PermGen)은 어디로 이동했나?

Java 7에서 Java 8로 넘어오면서 jvm hotspot의 PermGen영역은 사라졌다. (jvm의 spec에 method area 영역)

string과 static 변수들은 모두 PermGen영역에서 Java heap 영역으로 위치가 변경되어서 Garbage Collector의 대상이 되었고,

클래스의 메타정보들은 Java 8부터 생긴 Metaspace 영역으로 옮겼다.

Metaspace는 Native Memory(off-heap) 공간으로 옮겼고, 기존에 PermGen처럼 정적인 공간(사용자 설정 가능)으로 생겼는데 기본적으로 작게 할당이 되어서 자주 out-of-memory 문제가 생긴 것을 해결할 수 있었다고 한다.
(Native Memory도 당연히 정해진 것보다 많이 쓰면 out-of-memory error가 난다.)

jvm이 native memory를 얼만큼 쓸지 또한 MetaspaceSize, MaxMetaspaceSize와 같은 옵션으로 설정이 가능하다.

아래는 Native Memory(native heap)와 Java의 heap 공간에 대한 내용으로 한 번 읽어보면 좋을 것 같다.

[https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/com.ibm.java.80.doc/diag/problem_determination/aix_mem_heaps.html](https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/com.ibm.java.80.doc/diag/problem_determination/aix_mem_heaps.html)

요약하면, Java heap공간은 JVM이 뜨면서 크게 process의 heap 공간을 할당받아 오고, 이 공간은 GC가 관리하는 영역이 된다. 그리고 이후에 malloc등의 C code들을 통해 OS로부터 heap공간을 할당받는 곳이 Native Memory공간이다.