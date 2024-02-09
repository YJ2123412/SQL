/*
 시퀀스: 오라클의 객체. 값을 자동으로 만들어줌
 일련번호로 사용하는 값에 사용
 목적: 행을 식별하기위해 (mysql은 시퀀스 없고 auto increment 속성으로 사용)
 CREATE
 * */

--1. 시퀀스 생성
CREATE SEQUENCE test_seq;

--2. 시퀀스 사용을 위한 함수: nextval(다음 시퀀스 값), currval(현재 시퀀스 값)
SELECT test_seq.nextval FROM dual;

--현재 시퀀스 값은 nextval 을 처음 한번 꼭 실행한 후에(값이 만들어진 후) 실행가능
SELECT test_seq.currval FROM dual;

--3. 시퀀스 시작값을 바꾸기
CREATE SEQUENCE TEST_SEQ2 START WITH 2001;

--4. 증가값 바꾸기
CREATE SEQUENCE TEST_SEQ3 INCREMENT BY 5;
SELECT TEST_SEQ3.NEXTVAL FROM DUAL ; -- 실행시킬때마다 5씩 올라감