/*
 * 단어장 프로그램을 위한 테이블 만들기
 * 1. 테이블 구조 ENGLISH VARCAHR2(100), 같은 값 x, 반드시 값 있어야
 * KOREAN NVARCHAR2(100), 같은 값 x, 반드시 값 있어야
 * LEVEL NUMBER(1), 반드시 값이 있어야
 * IDX NUMBER(8) null가능, 1~4 범위로만
 * 2. 테이블에 행 추가 - 데이터 입력하기
 *  
 * 오러클의 키워드는 테이블명, 컬럼명으로 사용 못함
 * 3. 컬럼 값들의 규칙 - 같은 값을 가질 수 없다,
 * 검색 속도 향상시키기 위한 컬럼을 정해라
 * 데이터 행을 식별할 수 있는 컬럼을 정해라(기본키 설정)
 * 4. 기본키: 테이블의 행을 식별(구별) WHERE 기본키 컬럼= 값; 조건 실행시 1개의 행 조회
 * 기본키는 하나만, 복합키는 가능
	자동으로 인덱스(색인) 생성. 인덱스는검색(조회)속도 향상시키는 방법
	NOT NULL과 UNIQUE의 특징을 지님(2가지 제약조건)
5. 외래키: 테이블간의 참조를 위해서 사용함
		외래키는 테이블 1개에서 여러개 만들어 질 수 있음
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


--새로운 연산자
INSERT INTO TBL_JAVAWORD
VALUES('constraint', '제약사항',3, 5);

INSERT INTO TBL_JAVAWORD
VALUES('order','순서', 1, 9);

--모든 컬럼을 추가할 경우에는 걸럼명을 제외할 수 있음 
--NSERT INTO TBL_JAVAWORD
--VALUES('interface', '접점', 1, 5);

SELECT *FROM TBL_JAVAWORD tj 
WHERE ENGLISH LIKE '%t';

SELECT *FROM TBL_JAVAWORD tj WHERE IDX =2 OR IDX =5 OR IDX =9;
SELECT *FROM TBL_JAVAWORD 
	WHERE IDX IN (2,5,9); 

SELECT *FROM TBL_JAVAWORD 
WHERE IDX >=2 AND IDX <=5;
SELECT *FROM TBL_JAVAWORD 
WHERE IDX BETWEEN 2 AND 5;

ALTER TABLE TBL_JAVAWORD MODIFY ENGLISH NOT NULL;

--SELECET 컬럼명1, 2.. FROM 테이블명
--					WHERE 컬럼명 = 값
--					ORDER BY 컬럼명1, 컬럼명2 [DESC]-내림차순 , [ASC] - 오름차순
		-->컬지정된 컬럼명으로 정렬.. 컬럼명1이 같은 값이면 컬럼명2로 정렬

SELECT *FROM TBL_JAVAWORD 
	WHERE IDX IN (2,5,9)
	ORDER BY IDX ; 

SELECT *FROM TBL_JAVAWORD;

INSERT INTO TBL_JAVAWORD
VALUES('pirvate','개인적인', 1, 6);

SELECT *FROM TBL_JAVAWORD 
	WHERE IDX IN (2,5,9) 
	ORDER BY IDX , KOREAN ; --idx 1차 정렬컬럼, korean 2차 정렬 컬럼
	
	
	
	
	--단어장 테이블에 제약조건을 적용해서 다시 만들어보자

	










