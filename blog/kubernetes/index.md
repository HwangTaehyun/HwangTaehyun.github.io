---
layout: post
title: "Kubernetes (1)"
subtitle: "Kubernetes 배경지식 정리"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

'도커/쿠버네티스를 활용한 컨테이너 개발 실전 입문' 책을 읽으며, 쿠버네티스 용어들과 공부한 내용들을 정리 해보려고 한다.

# Kubernetes

쿠버네티스는 클러스터를 관리하는 도구이다.
클러스터는 그러면 뭘까?

# Cluster

클러스터는 쿠버네티스의 여러 리소스를 관리하기 위한 집합체를 말한다. Cluster 단어 뜻을 찾아봐도 집합체이지만.. ㅎㅎ 다시 말해, 클러스터는 노드라는 워커 머신의 집합체라고 한다. 이제 노드가 무엇인지 찾아봐야 한다.

# Node

노드는 컨테이너가 돌아가는 서버라고 할 수 있다. 단어 뜻을 찾아보면 하나의 접점이라고 하는데, 하나의 서버, 하나의 컴퓨터(점)이라고 생각하려고 한다.
AWS의 EC2 인스턴스도 하나의 노드라고 생각할 수 있을 것 같다.

그런데 쿠버네티스에의 노드에는 2가지 종류의 노드가 있다.
쿠베 공식문서를 찾아보면 마스터 노드의 정의가 나와있다. (kube-proxy는 추가적인 설명을 덧붙였다.)

- MASTER 노드
  - kube-apiserver, kube-controller-manager, kuber-scheduler 이 3개의 프로세스가 실행되는 노드이다.
- NON-MASTER(Minion) 노드
  - MASTER 노드와 통신을 위한 kubelet 프로세스와 네트워크 프록시 서버인 kube-proxy 프로세스 2개를 실행하는 노드이다.

여기서 NON-MASTER 노드가 다른 사람들(다른 블로그)에서 설명하는 워커 노드를 말하는 것 같다.

일반적으로
