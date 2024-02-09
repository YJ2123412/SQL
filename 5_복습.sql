-- 예제 테이블
CREATE TABLE tbl_member (
	mno NUMBER(5) not null,    		--회원번호
	name varchar2(50) not null,   		-- 이름
	email varchar2(100),  			-- 이메일
	join_date DATE default sysdate  	-- 가입날짜 , 날짜형식 : 날짜 패턴 문자열이 자동으로 날짜형식 변환
						-- 출력형식 :  yyyy-mm-dd HH:mi:SS.ms  ->대소문자 상관x
);

-- 예제 데이터 : insert 유형 3가지 확인하세요.
INSERT INTO 
	TBL_MEMBER			-- 컬럼명 모두 생략된 경우 
VALUES 
	(1,'김모모','momo@naver.com','2022-11-24');

INSERT INTO TBL_MEMBER VALUES (2,'박나연','parkny@gmail.com','2022-10-24');
INSERT INTO TBL_MEMBER VALUES (3,'최슬기','slgichoi@naver.com','2021-09-24');
INSERT INTO TBL_MEMBER VALUES (4,'박사나','san@gmail.com','2022-10-05');
INSERT INTO TBL_MEMBER VALUES (5,'이나연','nayeon@gmail.com','2020-10-05');
INSERT INTO TBL_MEMBER VALUES (6,'강나현','nahyeon@gmail.com','2021-05-05');
INSERT INTO TBL_MEMBER VALUES (7,'나쯔위','na1234@gmail.com','2021-05-05');
INSERT INTO TBL_MEMBER(MNO,NAME,JOIN_DATE) VALUES (8,'강감찬','2020-05-05');
INSERT INTO 
	TBL_MEMBER(MNO,NAME) 
VALUES 
	(9,'이순신');

-- DML: 2. SELECT 는 데이터 조회 (모든 행 , 특정 조건의 행, 모든 열, 지정된 열)
--		select 조회할 열 from 테이블 이름 [where]특정 행을 조회할 조건 [order by] 정렬할 컬럼
--				ㄴ 모든 열을 지정하는 기호 * (와일드카드 문자)
-- 1) 모든행과 모든 열 조회
SELECT *FROM TBL_MEMBER tm ;
-- 2) 지정된 열 `이름,이메일`의 모든 행 조회
SELECT NAME, EMAIL FROM TBL_MEMBER tm ;	
-- 3) 조건 `이름 박사나` 와 일치하는 행의 모든 컬럼 조회
SELECT NAME FROM TBL_MEMBER 
WHERE NAME = '박사나';
-- 4) 조건에 `이름 박사나` 와 일치하는 행의 지정된 컬럼 `이메일`조회
SELECT EMAIL FROM TBL_MEMBER tm WHERE NAME = '박사나';

-- 5) 문자열의 부분 일치 (유사 조건값) 검색 : 
-- `이름 중 성이 박`
SELECT NAME FROM TBL_MEMBER 
WHERE NAME LIKE '박%';

-- `이름 나연` 검색
SELECT NAME FROM TBL_MEMBER 
WHERE NAME LIKE '%나연';

-- `이메일이 naver 인 회원`
SELECT *FROM TBL_MEMBER 
WHERE EMAIL LIKE '%naver%';

-- 6) 여러가지 값으로 조회 : `이름이 김모모 또는 박나연 또는 강나현`
SELECT *FROM TBL_MEMBER 
WHERE NAME IN ('김모모', '박나연', '강나현');

-- 7) 이메일 email 컬럼의 null값 조회 : 
SELECT *FROM TBL_MEMBER 
WHERE EMAIL IS NULL;

-- 8) mno 컬럼값으로 조회
-- mno값이 4미만 조회
SELECT *FROM TBL_MEMBER 
WHERE MNO <4;

-- mno 값이 1,2,5,7 이 아닌것 조회 : 
SELECT *FROM TBL_MEMBER 
WHERE MNO NOT IN (1,2,5,7);

-- mno 값이 3~6 인 것 조회  : between (AND 연산)
SELECT *FROM TBL_MEMBER 
WHERE MNO BETWEEN 3 AND 6;


-- 9) 이름 순서로 모든 행과 열 조회
SELECT *FROM TBL_MEMBER 
ORDER BY NAME;



SELECT 2+3 FROM DUAL;









