1. 아이디어
2. 완성도
3. DB, URL 설계
4. 성실성

프로젝트명 : 초간단 MBTI 테스트
작성자 : 신세계INC 김유진

[CREATE 테이블]
create table login(
    id varchar(20) not null,
    pwd varchar(20) not null,
    primary key(id)
);

create table history(
    num int not null auto_increment,
    id varchar(20) not null,
    mbti varchar(20),
    regdate timestamp not null default now(),
    primary key(num)
);

[URL 설계]
0. 첫화면 : index.jsp (로그인 링크, 회원가입 링크)
1. 로그인 : login.jsp, select
1-2. 로그인 진행: loginProc.jsp
1-3. 로그아웃 진행 : logout.jsp
2. 회원가입 폼 : signupform.jsp, insert
2-1. 회원가입 진행 : signupProc.jsp 
3. 시작페이지 : start.jsp (게임하러가기버튼, MBTI 검사 기록보기 버튼)
4. ei페이지 : ei.jsp
5. sn페이지 : sn.jsp
6. tf페이지 : tf.jsp
7. jp페이지 : jp.jsp
8. 결과보기 페이지 : resultform.jsp(결과보러가기 버튼)
9. 결과 페이지 : result.jsp, insert
10. 기록 : history.jsp, select
