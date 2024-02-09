--2024.01.19
--1. 문자열 함수/ 실제로는 테이블의 컬럼으로 실행
--SELECT LOWER(컬럼명) FROM 테이블명
SELECT INITCAP('hello') FROM DUAL; --INITIAL capital: 첫번째 대문자
SELECT UPPER('hello') FROM DUAL;	--대문자로 변환	
SELECT LOWER('OraCle')FROM DUAL;	--소문자로 변환
SELECT LENGTH ('oracle') FROM DUAL;	--문자열길이
SELECT SUBSTR('java program',3,5) FROM DUAL;	---부분 추출(문자열, 위치, 길이) 결과/ 오라클에서 인덱스는 1부터시작
SELECT SUBSTR('java program',-5,3) FROM DUAL;	--부분추출결과 : 위치 음수이면 문자열 뒤에서부터(뒤에서부터 5번째 3개)
SELECT REPLACE('java progam','pro','프로') FROM DUAL;	--문자열 바꾸기 . java 프로gram
SELECT INSTR ('java program','og') FROM DUAL;;	--자바의 	indexof/ 해당 문자열이 없으면 결과0
SELECT trim (' java program  ')FROM DUAL;	--공백(불필요한 앞뒤 공백)제거 
SELECT LENGTH (' java program   ') FROM dual; 	--공백포함 16
SELECT LENGTH (trim(' java program  ')) FROM dual; 	--공백제거 12

--2. 숫자 함수(정수 또는 실수 NUMBER를 대상으로 하는 함수)
--ABS(N) 절대값
--실수->실수
--TRUNC(숫자, 자리수):소수점 이하 자리수 맞추기 위해서 버림 3.177567->3.17
SELECT TRUNC(3.177567,2) FROM dual;
--ROUND(숫자, 자리수)
SELECT ROUND(3.177567,2) FROM dual;

--실수->정수
--CEIL(숫자): 실수를 정수로 올림으로 변환 
SELECT CEIL (3.177567) FROM DUAL; --4
--FLOOR(숫자): 실수를 정수로 내림으로 변환
SELECT FLOOR(3.177567) FROM dual; --3


--3. 날짜함수: TO_CHAR(날짜형식을 문자열로 변환)  TO_DATE(문자열을 날짜형식으로 변환)
SELECT SYSDATE ,SYSTIMESTAMP  FROM DUAL; --SYSTIMESTAMP는 표준시와의 시차(타임존) 표시
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL; --기호는 상관없음

--YYYY-MM-DD HH24:MI:SS 24시간기준
--YYYY-MM-DD HH:MI:SS AM 12시간기준(AM,PM)

--TBL_MEMBER에 JOIN_DATE 인서트

INSERT INTO TBL_MEMBER VALUES (2,'박나연','parkny@gmail.com','2022-10-24 13:24:55'); --오류 // 
INSERT INTO TBL_MEMBER VALUES (2,'박나연','parkny@gmail.com',
								TO_DATE('2022-10-24 13:24:55','YYYY-MM-DD HH24:MI:SS'));
SELECT *FROM TBL_MEMBER tm ;
--자동캐스팅해줄 수 있는 패턴은 YYYY-MM-DD만 가능

INSERT INTO TBL_MEMBER VALUES (10,'홍길동','GDhONG@gmail.com',TO_DATE('20240109','YYYYMMDD'));



---월 만 계산할때 수식 사용.. 일과 년은 그냥 더하면 됨
SELECT ADD_MONTHS(SYSDATE,3) FROM DUAL; --오늘날짜 +3개월이후. 첫번째 인자는 날짜형식, 두번째는 더해지는 값
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,3),'YYYY/MM/DD') FROM DUAL; --문자열 패턴 기호 - 또는 / 또는 구분기호 없음 가능
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2022-09-23')) FROM DUAL; --지정된 2개의 날짜 사이에 간격(월). 결과는 소수점
SELECT TRUNC(SYSDATE) - TO_DATE('20240110','YYYYMMDD')FROM DUAL;--2개의 날짜형식 값 간격(일) 날짜끼리 뺄셈
SELECT TRUNC(SYSDATE) FROM DUAL; 
	--  2개의 날짜의 간격(일). TRUNC(SYSDATE)는 일(DAY)까지로 변환

SELECT SYSDATE +5 FROM DUAL;















