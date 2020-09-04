---
layout: post
title: "Java Nested Class"
subtitle: "Nested Class 종류"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
header-img: "img/header.jpg"
order: 9
---

# 🚀 Nested Class

Java에는 중첩 클래스라는게 존재한다. C++에도 존재하지만, 그 종류가 더 다양하다. Java Nested Class는 오라클 docs를 참고했다.
[https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html)

## 🔥 Static Nested Class
많은 사람들이 Static Nested Class에 대해 Static Inner Class로도 지칭을 하는데 공식 용어는 Static Nested Class가 맞는 것 같다.
> Terminology: Nested classes are divided into two categories: static and non-static. Nested classes that are declared static are called static nested classes. Non-static nested classes are called inner classes.
> **from [https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html)**

Nested Class라는게 논리적으로 같은 내용을 같은 Class에 묶기 위해 나온 개념인데, 자바는 Static Nested Class라는 개념을 만들어서 외부 클래스에 대한 참조를 가지지 않는 Nested Class를 만들었다. 이로써 얻는 장점은 GC가 자원 회수를 더 쉽게 할 수 있고(외부 참조 x), 또 Inner Class로 만드는 인스턴스 생성 오버헤드가 더 작은 장점이 있다.

## 🔥 Inner Class
> There are two special kinds of inner classes: local classes and anonymous classes.
> **from [https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html)**

docs에서는 class안에 선언한 class는 Inner Class라고 설명한다. 그리고 Inner Class에 2가지 특별 케이스로 local class와 anonymous class가 존재한다고 설명되어 있다. Class안의 단순 Class의 이름도 정해줘야 할 것 같은데 없으니.. 편의상 클래스안의 그냥 클래스는 Inner Class, 그리고 나머지도 정확하게는 Inner Class가 맞지만 사용 상황에 맞게 정확한 명칭에 맞추어 Local Class, Anonymous Class라고 하는게 좋을 것 같다.

Inner Class는 선언 방법과 선언 위치에 따라 3가지로 나뉜다.

* Inner Class

class 안의 class
```java
class A {
  class B {

  }
}
```

* Local Class

method 안의 class
```java
class A {
    void showExample() {
        class B {

        }
    }
}
```

* Anonymous Class

java는 top-level class나 static class가 아니면 static member field를 inner class와 method 안에서 허락하지 않는다. 그런데 interface는 inherently static하기 때문에 메소드에서 interface를 선언하고, 구현체를 직접 써서 사용하고 싶을 때 문제가 생기게 된다. 따라서 이 때 Anonymous Class를 이용하면, Class안에서 Interface를 선언하고 method안에서 Anonymous Class를 사용할 수 있다. (Anonymous Class는 expression이라고 docs에 쓰여져 있다. new operator를 통한 객체 생성 표현식)

> [https://stackoverflow.com/questions/41015440/declaring-a-static-variable-in-a-non-static-class-in-java](https://stackoverflow.com/questions/41015440/declaring-a-static-variable-in-a-non-static-class-in-java) 참고

```java
class A {
    interface HelloWorld {
        public void greet();
        public void greetSomeone(String someone);
    }
    void showExample() {
        HelloWorld frenchGreeting = new HelloWorld() {
            String name = "tout le monde";
            public void greet() {
                greetSomeone("tout le monde");
            }
            public void greetSomeone(String someone) {
                name = someone;
                System.out.println("Salut " + name);
            }
        };
    }
}
```
