/* `제약 조건 constraints`
 		: 테이블에 저장되는 데이터가 `부적절한 값`을 갖지않도록 규칙을 적용.
   1) NOT NULL(널 허용x)   2) UNIQUE(유일한 값)    3) CHECK (값의 범위)
   3) PRIMARY KEY (기본키): 1) 과 2)를 모두 만족. **데이터 행을 식별(구별)
   4) FOREIGN KEY (외래키, 참조키): 다른 테이블의 값을 참조하기 위해 사용
*/   


-- 1) 학생 테이블
CREATE TABLE tbl_student (
	stuno char(7) PRIMARY KEY,   -- pk 설정방법 1) 컬럼레벨 
	name varchar2(30) NOT NULL,  -- 학생 이름
	age number(3) CHECK (age BETWEEN 10 AND 30),	-- 나이 : 입력값의 범위 설정
	address nvarchar2(50)		-- 주소
);

/* 2) 성적 테이블
- '학번'에 해당 학생이 'subject' 과목을 'teacher' 선생님에게 강의를 'term'(학기)에 수강하고 점수 'jumsu' 받음.
- 요구사항 예시 : 동일한 학생이 동일한 과목을 2번 수강/시험을 중복하지 않는다. 
- 	  		     한 학생은 여러개의 과목을 수강한다.
*/
CREATE TABLE tbl_score(
	stuno char(7),		-- 외래키로 `학생`테이블의 `학번`값을 참조합니다.
	subject nvarchar2(20),		-- 과목명
	jumsu number(3) NOT NULL ,	-- 점수
	teacher nvarchar2(20) NOT NULL ,	-- 담당교사
	term char(6) NOT NULL,				-- 수강학기 (예)년도_학기
-- PK 설정방법 2) 테이블레벨	
	PRIMARY KEY(stuno,subject), 	-- 기본키는 복합컬럼으로 설정
	FOREIGN KEY
			(stuno) 			-- `성적` 테이블의 stuno 컬럼은 외래키
	REFERENCES 
			tbl_student(stuno)   -- 참조관계 테이블 설정
);		
/*
	FOREIGN key(성적테이블컬럼) REFERENCES 참조관계테이블(참조테이블컬럼)   
-		* 참조테이블 컬럼(학생테이블 stuno) 조건은 ? `기본키` 또는 `unique` 컬럼이어야합니다.
-	    * 참조관계를 만들 떄 사용한 성적테이블의 stuno는 값의 제약이 생깁니다.
-		  tbl_student 테이블 stuno 컬럼에 입력된 값으로 제한됩니다.	
-   	* `성적 테이블의 stuno 컬럼은 학생 테이블의 stuno 컬럼을 참조한다` 고
-		 하며 참조컬럼은 학생테이블의 stuno 이고 , 외래키 컬럼은 성적테이블의 stuno 입니다.	
*/


-- 필요시 참조관계일때 테이블 삭제 
DROP TABLE TBL_STUDENT ;
DROP TABLE TBL_SCORE ;


--필요시 참조관계일때 테이블 데이터 삭제
TRUNCATE TABLE TBL_STUDENT;
TRUNCATE TABLE TBL_SCORE ;


-- 3) 학생 테이블에 데이터 입력
INSERT INTO tbl_student(stuno,name,age,address)
VALUES ('2021001','김모모',16,'서초구');
INSERT INTO tbl_student(stuno,name,age,address)
VALUES ('2019019','강다현',18,'강남구');
INSERT INTO tbl_student(stuno,name,age,address)
VALUES ('2020017','박나래',16,'경기도');

-- *PK 제약조건 위반 오류* (PK 컬럼 stuno 에 2021001 이 입력된 상태)
INSERT INTO tbl_student(stuno,name,age,address)
VALUES ('2021001','김땡땡',18,'성북구');

-- 4) 성적 테이블에 데이터 입력
-- 성적 테이블은 stuno와 subject 가 한쌍이 되어 기본키 만들어졌습니다.
-- 이 때 요구사항은 학생 1명은 같은 이름의 과목을 1번만 수업을 듣는다는 조건이 필요합니다.
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','국어',89,'이나연','2022_1');
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','영어',78,'김길동','2022_1');
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2020017','과학',67,'박세리','2021_2');
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','국어',92,'이나연','2019_2');
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','영어',85,'박지성','2019_2');
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','과학',88,'박세리','2020_1');

-- *성적 테이블에 데이터 입력 : 오류 원인은?  `외래키` 무결성 `제약조건` 위반
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2021002','국어',89,'이나연','2022_1'); -- 학번 2021002 는 학생테이블에 없습니다.
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES (NULL,'국어',89,'이나연','2022_1');  --기본키를 이루는 컬럼은 NULL 금지


-- *PK 오류 
-- 1) 정상 실행
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','역사',89,'강감찬','2022_1');
-- 2) 오류
INSERT INTO tbl_score(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','영어',88,'김세리','2022_2');

-- PK(행을 `식별`하는 역할) 컬럼을 조건으로 select 조회하면 조회되는 행의 개수는 항상 0 또는 1입니다.
SELECT * FROM TBL_STUDENT ts WHERE STUNO  = '2019019';
SELECT * FROM TBL_STUDENT ts WHERE STUNO  = '2019020';	-- 조회 결과 없음
SELECT * FROM TBL_STUDENT ts WHERE NAME  = '김모모';		-- 추후에 김모모 입력 가능

--PK 가 여러개 컬럼으로 구성(복합 컬럼)될 때에는 컬럼들을 and 조건으로 하면 행을 식별할 수 있습니다.
SELECT * FROM TBL_SCORE ts WHERE STUNO  = '2019019' AND SUBJECT  ='영어';
SELECT * FROM TBL_SCORE ts WHERE STUNO  = '2019019' AND SUBJECT ject ='역사';	-- 조회 결과 없음
SELECT * FROM TBL_SCORE ts WHERE STUNO  = '2019019';
SELECT * FROM TBL_SCORE ts WHERE SUBJECT  ='과학';

-- *TBL_SCORE 테이블에 stuno 컬럼은 기본키의 구성컬럼이면서 외래키입니다. => 식별관계

/* 성적테이블의 개선사항
- 성적테이블에 '과목명'을 학생 1명이 동일한 과목을 수강한다면(예를 들면 1학년 국어 ,  2학년 국어, 3학년 국어 )
  1) 새로운 기본키를 만들어야 합니다. 일련번호 또는 성적코드 등.
  2) '과목'테이블 생성- 과목코드(PK), 과목명(중복허용), 담당교사(중복허용)
  */

SELECT * FROM TBL_SCORE ts ;
SELECT * FROM TBL_STUDENT ts ;


--테이블은 최소로 데이터가 중복되도록 구성. 데이터 중복은 데이터의 불일치를 만듬
--해당 과정: 정규화 -> 정규화가 잘 되어있따: 테이블 구성을 잘했다








