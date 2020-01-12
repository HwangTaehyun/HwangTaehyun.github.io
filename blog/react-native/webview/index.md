---
layout: post
title: "react-native webview 링크 다루기"
subtitle: "react-native webview 링크 다루기"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# react-native-webview

react-native-webview라는 npm 패키지를 설치해서 사용을 하면서 생겼던 문제를 공유하기 위해 블로그에 남긴다.

#### IOS

먼저 iOS의 경우 universial link 등록 과정이 조금 복잡해 아직 테스트를 해보지 않았지만, stack overflow나 다른 글들을 찾아보아도 큰 문제가 있어보이지는 않는다.

추후에 다시 테스트해보고 관련 이슈들을 정리해보려고 한다.

#### Android

먼저 웹서버를 띄워놓고, 해당 url을 webview로 열었다. 그리고 웹서버의 html에 링크할 url이 있는 a tag를 위치시키고, 이 a tag를 눌렀을 때 url에 맞는 scheme이 등록된 Android의 인텐트 필터를 찾아 안드로이드 시스템이 해당 인텐트 필터를 가지고 있는 앱에게 연결을 해줄것이라고 생각했다.

먼저 아래와 같이 AndroidManifest.xml 파일에 인텐트 필터를 등록해놓고, (\<activity> \</activity> 안에 위치)

```console
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="http" android:host="applinktest.com" />
    <data android:scheme="https" android:host="applinktest.com" />
</intent-filter>
```

그리고 react-native-webview안에서 아래와 같이 intent 스킴 url과 app link url을 가진 웹 서버를 띄우고 클릭해보니 에러가 발생했다.

```html
<a
    className="App-link"
    href="intent://applinktest.com#Intent;package=com.applinktest;action=android.intent.action.VIEW;scheme=http;end"
    target="_blank"
    rel="noopener noreferrer"
>
    intent
</a>
<a
    className="App-link"
    href="http://applinktest.com"
    rel=" noopener noreferrer"
>
    app-link
</a>
```

이상하다고 생각되서 크롬과 삼성 인터넷에서도 테스트를 해보았다.

크롬은 인텐트 스팀과 앱링크 모두 정상작동했다.

삼성인터넷은 인텐트 스킴은  정상 작동하고, 앱 링크의 경우 앱으로 바로 이동하지는 않고 먼저 해당 주소의 웹사이트로 이동하고 주소창 오른쪽에 해당 앱 아이콘을 보여주었는데, 이 아이콘을 누르면 앱으로 이동했다.

react-native-webivew는 분명 android의 webview를 래핑했을것이고, 해당 webview는 Android 4.4부터 크로미움기반으로 새로 개발되었다. 하지만 크롬과는 다르게 작동하는 것을 알 수 있었다.

네이티브는 아직 공부를 안해서 android webview에서도 정말 작동하지 않는지 테스트 해보지 않았지만 카카오 채팅창의 웹뷰로 테스트 해보았을때, 삼성 인터넷과 같이 intent 스킴은 정상 작동하고, 앱링크는 제대로 처리하지 못하는 것을 추측할 수 있었다.

해결 방법은 아래와 같이 originWhitelist에 명시적으로 onShouldStartLoadWithRequest에서 처리할 url들을 명시해주고 (http, https, intent) onShouldStartLoadWithRequest에서 처리하는 것이다.

{% highlight js %}
<WebView
    source={ { uri: link } }
    originWhitelist={['http://*', 'https://*', 'intent://*']}
    // onShouldStartLoadWithRequest={openExternalLink}
    onShouldStartLoadWithRequest={(event) => {
        console.log('onShouldstart');
        console.log(event.url);
        if (event.url.startsWith("http")) {
            Linking.openURL(event.url);
        }
        if (
            Platform.OS === 'android' &&
            event.url.startsWith("intent")
        ) {
            SendIntentAndroid.openChromeIntent(event.url)
                // SendIntentAndroid.openAppWithUri(event.url)
                .then((isOpened) => {
                    if (!isOpened) {
                        Toast.show('앱 실행에 실패했습니다');
                    }
                    return false;
                })
                .catch((err) => {
                    console.log(err);
                });
            return false;
        }
        if (Platform.OS === 'ios') {
            return true;
        }
        return true;
    }}
/>
{% endhighlight %}