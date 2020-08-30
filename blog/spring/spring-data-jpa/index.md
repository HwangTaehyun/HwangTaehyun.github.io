---
layout: post
title: "spring data jpa"
subtitle: "jpa vs spring data jpa"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

    - JPA
    JPA is a specification that standardizes the way Java Objects are mapped to a relational database system. Being just a specification, JPA consists of a set of interfaces, like EntityManagerFactory, EntityManager, and annotations that help you map a Java entity object to a database table.

    There are several JPA providers, like HIbernate, EclipseLink, or Open JPA which you can use.

    - Spring Data JPA
    Spring Data JPA is a JPA data access abstraction. Just like JPA, Spring Data JPA cannot work without a JPA provider.

    Spring Data JPA offers a solution to the DDD Repository pattern or the DAO (Data Acess Object) pattern. It can also generate JPA queries on your behalf through method name conventions.

    Spring Data JPA can work with Hibernate, Eclipse Link, or any other JPA provider. A very interesting benefit of using Spring or Java EE is that you can control transaction boundaries declaratively using the @Transactional annotation.

**from https://stackoverflow.com/questions/16148188/whats-the-difference-between-jpa-and-spring-data-jpa**

[https://cornswrold.tistory.com/317](https://cornswrold.tistory.com/317) 참고