/*
 * 단어장 프로그램을 위한 테이블 만들기
 * 1. 테이블 구조 ENGLISH VARCAHR2(100), 같은 값 x, 반드시 값 있어야
 * KOREAN NVARCHAR2(100), 같은 값 x, 반드시 값 있어야
 * LEVEL NUMBER(1), 반드시 값이 있어야
 * IDX NUMBER(8) null가능, 1~4 범위로만
 * 2. 테이블에 행 추가 - 데이터 입력하기
 *  
 * 오러클의 키워드는 테이블명, 컬럼명으로 사용 못함
 * 3. 컬럼 값들의 규칙 - 같은 값을 가질 수 없다, - 유니ㅋ,
 * 검색 속도 향상시키기 위한 컬럼을 정해라
 * 데이터 행을 식별할 수 있는 컬럼을 정해라(기본키 설정)
 *  
 * */
CREATE TABLE TBL_JAVAWORD(
ENGLISH VARCHAR2(100), 
KOREAN NVARCHAR2(100), 
STEP NUMBER(1), 
IDX NUMBER(8)
);
INSERT INTO TBL_JAVAWORD
(ENGLISH, KOREAN, STEP, IDX)
VALUES('list', '목록', 1, 1);
INSERT INTO TBL_JAVAWORD
(ENGLISH, KOREAN, STEP, IDX)
VALUES('main', '주요한', 1, 2);
INSERT INTO TBL_JAVAWORD
(ENGLISH, KOREAN, STEP, IDX)
VALUES('static', '정적인', 2, 3);
INSERT INTO TBL_JAVAWORD
(ENGLISH, KOREAN, STEP, IDX)
VALUES('remove', '삭제하다', 2, 4);
INSERT INTO TBL_JAVAWORD
(ENGLISH, KOREAN, STEP, IDX)
VALUES('interface', '접점', 1, 5);

--모든 컬럼을 추가할 경우에는 걸럼명을 제외할 수 있음 
--NSERT INTO TBL_JAVAWORD
--VALUES('interface', '접점', 1, 5);

SELECT *FROM TBL_JAVAWORD tj 
WHERE ENGLISH LIKE '%t';

SELECT *FROM TBL_JAVAWORD tj WHERE IDX BETWEEN 1 AND 20;

ALTER TABLE TBL_JAVAWORD MODIFY ENGLISH NOT NULL;

CREATE TABLE TBL_CONSTR(
ANAME VARCHAR2(20) NOT NULL,
BNAME VARCHAR2(20) UNIQUE ,
CNO NUMBER(4)NOT NULL UNIQUE ,
DNO NUMBER(4) CHECK(DNO BETWEEN 1 AND 4)
);

INSERT INTO TbL_CONSTR (ANAME, CNO) VALUES ('APPLE',3); 

SELECT ANAME, CNO FROM TBL_CONSTR;

--제약조건: 테이블에 저장되는 데이터가 '요구사항에 대한 부적절한 값'을 가지 않도록 규정
--오류
--1) 입력 오류 : UNIQUE 위반
--INSERT INTO TBL_CONSTR tc (ANAME, BNAME, CNO) VALUES('APPLE','BANANA',3); --CNO 값 중복
INSERT INTO TBL_CONSTR tc (ANAME, BNAME, CNO) VALUES('APPLE','BANANA',4);
--INSERT INTO TBL_CONSTR tc (ANAME, BNAME, CNO) VALUES('APPLE','BANANA',5); --BNAME 컬럼값 중복
--2) NOT NULL 위반
INSERT INTO TbL_CONSTR (CNO) VALUES (3); 

--3) CHECK위반
INSERT INTO TBL_CONSTR tc (ANAME,CNO, DNO) VALUES('APPLE',7,13); -- 값의 범위 1~4아님



DELETE TABLE TBL_CONSTR;


