---
layout: post
title: "tomcat 서비스 등록 (설치)"
subtitle: "tomcat 서비스 등록 (설치)"
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

tomcat을 사용하는데 서버를 재시작 할 때, tomcat도 매번 재시작을 시켜줘야 했다. systemd 서비스로 등록해야서 자동으로 시작되게 해야겠다라고 생각하다가 이번 기회에 서비스로 등록하게 되었다.

# tomcat 서비스 등록

**1. /etc/systemd/system/ 디렉토리에 tomcat.service 파일을 생성한다**

```console
foo@bar:~$ vi /etc/systemd/system/tomcat.service
```
**2. 서비스 파일 작성**

CATALINA_HOME과 함께 CATALINA_BASE를 꼭 넣어줘야 한다.
```bash
[Unit]
Description=tomcat 9
After=network.target syslog.target

[Service]
Type=forking
Environment="JAVA_HOME=자바 패스"
Environment="CATALINA_HOME=톰캣 패스"
Environment="CATALINA_BASE=톰캣 패스"
User=root
Group=root
ExecStart=톰캣 패스/bin/startup.sh
ExecStop=톰캣 패스/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```

**3. 서버 재부팅시, 프 자동으로 뜰 수 있도록 다음 명령어를 실행해준다.**

```console
foo@bar:~$ systemctl enable tomcat.service
```

**4. tomcat 서비스 파일을 수정했을 경우 (자바 환경 변수 변경 등), 다음 명령어로 설정 파일을 적용해 준다.**

```console
foo@bar:~$ systemctl daemon-reload
```
