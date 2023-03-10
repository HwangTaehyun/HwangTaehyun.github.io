---
layout: post
title: "error: invalid input syntax for type timestamp: "0NaN-NaN-NaNTNaN:NaN:NaN.NaN+NaN:NaN""
subtitle: "error: invalid input syntax for type timestamp: "0NaN-NaN-NaNTNaN:NaN:NaN.NaN+NaN:NaN""
type: "Year in Review"
blog: true
text: true
author: "Taehyun"
post-header: true
order: 9
---

# ❎ 에러 발생

TypeORM & Postgres 사용중 다음과 같은 에러를 보게 되었다.
> error: invalid input syntax for type timestamp: "0NaN-NaN-NaNTNaN:NaN:NaN.NaN+NaN:NaN"

# 🌟 해결

Postgres의 Column data type이 Date인데, TypeORM query문에서 사용하는 변수가 env 값을 사용하고 있는데 없는 env값을 참조하고 있어 undefined값이 들어가게 되면서 문제가 발생했다. stack trace가 제대로 나오지 않아 찾는데 시간이 좀 걸렸는데 기록과 내용 공유를 위해 에러 리포트를 작성했다.
