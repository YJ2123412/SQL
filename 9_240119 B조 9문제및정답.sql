(1월 19일)

식료품을 판매하는 매장의 판매 관리를 위한 시스템을 구축합니다. 이 쇼핑몰에서 `고객` 은  필요한 `상품`을
`구매`할 수 있습니다. 고객은 회원가입 후 상품을 구매할 수 있습니다. 

    
+ 회원 예시 데이터
      'mina012', '김미나', 'kimm@gmail.com', 20, '2022-03-10 14:23:25'  
      'hongGD', '홍길동', 'gil@korea.com', 32, '2021-10-21 11:12:23'
      'twice', '박모모', 'momo@daum.net', 29, '2021-12-25 19:23:45'
      'wonder', '이나나', 'lee@naver.com', 40, 현재날짜와 시간

  + 상품 예시 데이터
        'DOWON123a', 'B2', '동원참치선물세트', 54000
        'CJBAb12g', 'B1', '햇반 12개입', 14500
        'JINRMn5', 'B1', '진라면 5개입', 6350
        'APLE5kg', 'A1', '청송사과 5kg', 66000
        'MANGOTK4r', 'A2', '애플망고 1kg', 32000


  + 구매
        'mina012' , 'CJBAb12g' , 5 , '2022-03-7 14:33:15'
        'mina012' , 'APLE5kg' , 2 , '2022-03-10 14:33:15'
        'mina012' , 'JINRMn5' , 2 , '2022-04-16 10:13:15'
        'twice' , 'JINRMn5' , 3 , '2021-12-25 19:32:15'
        'twice' , 'MANGOTK4r' , 2 , '2021-12-27 19:32:15'
        'hongGD' , 'DOWON123a' , 1 , '2021-10-21 11:13:25'
        'hongGD' , 'APLE5kg' , 1 , '2022-04-21 11:13:25'
    
 + 테이블 이름은  excustomer,exproduct, exbuy 로 각각하고 
 컬럼은 적합한 이름과 형식,제약조건을 정해서 하세요.

 
 + 컬럼
   - 이름과 형식 : 적합하게 정의합니다.
   - NOT NULL , UNIQUE(필요시), PK 제약조건 각 테이블에 정하세요.
   - FK : 참조 관계 테이블에 정하세요.
   + 팀원들 각각 select 가 필요한 시나리오로조회 문제를 하나씩 만들어 공유하세요.

   
+ `회원` 은  고유ID , 이름, 이메일, 나이 , 가압날짜로 관리하며
  + PK


+ `상품` 은  상품코드, 카테고리, 상품명, 가격이 필요합니다.
  + PK
 
 
+ `구매` 는  상품을 구매한 회원의 고유ID, 상품코드 , 구매수량, 구매날짜를 저장하여 관리합니다. 
  + PK 
  + FK



CREATE TABLE TBL_excustomer (
ID VARCHAR2(30) PRIMARY KEY,
NAME VARCHAR2(30),
EMAIL VARCHAR2(30),
AGE NUMBER(10),
JOINDATE DATE
);

CREATE TABLE TBL_exproduct (
PRODUCTCODE VARCHAR2(30) PRIMARY KEY,
CATEGORY VARCHAR2(30),
PNAME VARCHAR2(30),
PRICE NUMBER(10)
);

CREATE TABLE TBL_exbuy (
ID VARCHAR2(30),
PRODUCTCODE VARCHAR2(30),
BUY NUMBER(10),
BUYDATE DATE
);

ALTER TABLE TBL_exbuy ADD CONSTRAINT TBL_exbuy FOREIGN KEY(ID) REFERENCES TBL_excustomer(ID);
ALTER TABLE TBL_exbuy ADD CONSTRAINT TBL_exbuy FOREIGN KEY(PRODUCTCODE) REFERENCES TBL_exproduct(PRODUCTCODE);
ALTER TABLE TBL_excustomer


INSERT INTO "C##IDEV".TBL_EXCUSTOMER
(ID, NAME, EMAIL, AGE, JOINDATE)
VALUES('mina012', '김미나', 'kimm@gmail.com', 20, TO_DATE('2022-03-10 14:23:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXCUSTOMER
VALUES ('hongGD', '홍길동', 'gil@korea.com', 32, TO_DATE('2021-10-21 11:12:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXCUSTOMER
VALUES ('twice', '박모모', 'momo@daum.net', 29, TO_DATE('2021-12-25 19:23:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXCUSTOMER
VALUES ( 'wonder', '이나나', 'lee@naver.com', 40, TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'));

SELECT *FROM TBL_EXCUSTOMER te ;

INSERT INTO "C##IDEV".TBL_EXPRODUCT
(PRODUCTCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B2', '동원참치선물세트', 54000);

INSERT INTO "C##IDEV".TBL_EXPRODUCT
VALUES('CJBAb12g', 'B1', '햇반 12개입', 14500);
INSERT INTO "C##IDEV".TBL_EXPRODUCT
VALUES('JINRMn5', 'B1', '진라면 5개입', 6350);
INSERT INTO "C##IDEV".TBL_EXPRODUCT
VALUES('APLE5kg', 'A1', '청송사과 5kg', 66000);
INSERT INTO "C##IDEV".TBL_EXPRODUCT
VALUES('MANGOTK4r', 'A2', '애플망고 1kg', 32000);

SELECT *FROM TBL_EXPRODUCT te ;

ALTER TABLE "C##IDEV".TBL_EXBUY MODIFY BUYDATE DATE;


INSERT INTO "C##IDEV".TBL_EXBUY
(ID, PRODUCTCODE, BUY, BUYDATE)
VALUES('mina012' ,'CJBAb12g' , 5 ,TO_DATE('2022-03-07 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXBUY
VALUES('mina012' ,'APLE5kg' , 2 ,TO_DATE('2022-03-10 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXBUY
VALUES('mina012' ,'JINRMn5' , 2 ,TO_DATE('2022-04-16 10:13:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXBUY
VALUES('twice' ,'JINRMn5' , 3 ,TO_DATE('2021-12-25 19:32:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXBUY
VALUES('twice' ,'MANGOTK4r' , 2,TO_DATE('2021-12-27 19:32:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXBUY
VALUES('hongGD','APLE5kg' , 1 ,TO_DATE('2022-04-21 11:13:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##IDEV".TBL_EXBUY        
VALUES('hongGD','DOWON123a', 1, TO_DATE('2021-10-21 11:13:25','YYYY-MM-DD HH24:MI:SS'));
    
SELECT *FROM TBL_EXBUY te ;
      
--구매 테이블에 기본키 만들기
--0) 기본키가 필요한 이유: 행 식별
--1) 기본키에 들어갈 값은 시퀀스로 만듭니다. EXBUY_PK_SEQ 시작값은 1001
CREATE SEQUENCE EXBUY_PK_SEQ START WITH 1001;

--2) 기본키 컬럼명을 BUYIDX로 하여 추가 NUMBER(8)
ALTER TABLE TBL_EXBUY ADD BUYIDX NUMBER(8);

--3) 기존 행에 적용할 BUY_IDX 컬럼값을 저장하기 NOT NULL, UNIQUE
ALTER TABLE TBL_EXBUY ADD CONSTRAINT BUYIDX_PK CHECK (BUYIDX IS NOT NULL);
ALTER TABLE TBL_EXBUY ADD UNIQUE (BUYIDX);

--4)BUY_IDX 컬럼에 프라이머리키
ALTER TABLE TBL_EXBUY ADD CONSTRAINT BUYIDX_PK PRIMARY KEY(BUYIDX);

--5)이제부터 새로운 행을 추가할 때에는 시퀀스 함수로 PK 값을 INSERT

INSERT INTO TBL_EXBUY (ID, PRODUCTCODE, BUY, BUYDATE,BUYIDX)        
VALUES('hongGD','DOWON123a', 1, TO_DATE('2021-10-21 11:13:25','YYYY-MM-DD HH24:MI:SS'),EXBUY_PK_SEQ.NEXTVAL);













------------------------
SELECT BUYDATE "구매날짜", PRODUCTCODE "구매물품코드" FROM TBL_EXBUY 
WHERE TO_CHAR(BUYDATE,'YYYY-MM')='2022-04'
ORDER BY BUYDATE, PRODUCTCODE;


--이대환
SELECT ID AS "구매자" ,COUNT(*) AS "구매횟수" FROM TBL_EXBUY 
WHERE ID ='mina012' 
GROUP BY ID;

--노희영
SELECT ID  AS "구매자", COUNT(*) AS "구매수량" FROM TBL_EXBUY te 
WHERE TO_CHAR (BUYDATE,'YYYY-MM-DD')  BETWEEN  '2021-12-20' AND '2022-03-16'
GROUP BY ID;

--이재훈
SELECT *FROM TBL_EXBUY te 
WHERE BUY >=3;

--김승환
SELECT MAX(BUY) "구매수량", ID  AS "구매자" FROM TBL_EXBUY te 
WHERE TO_CHAR (BUYDATE,'YYYY-MM-DD')  BETWEEN  '2021-01-01' AND '2022-03-01'
GROUP BY ID;

--민찬희

SELECT ID AS "구매자", te.BUYDATE AS "구매날짜" FROM TBL_EXBUY te 
WHERE ID = 'mina012';

/* B조 문제
 * 노희영) 구매 날짜가 2021년12월 20일 부터 2022년 03월 16일인 구매내역의 아이디별 상품 구매수량을 조회하시오.
 * 이예진) 2022년 4월 동안 판매된 물품의 코드는?
 * 이대환) mina012 가 구매한 상품의 총 구매수량을 구하시오.
 * 이재훈) 물품을 3개이상 구매한 고객님은?
 * 김승한) 구매날짜 2021년 1월1일~2022년 3월1일 사이에 가장 많이 산 사람의 이름은?
 * 민찬희) mina012회원이 구매한 시간만 추출하시오
 * */        














/*답
* 노희영
 	SELECT ID "회원ID", SUM(QUANTITY) "구매 수량",CODE "상품코드"
  	FROM TB_BUY
 	WHERE BUYDATE BETWEEN TO_DATE('2021-12-20','yyyy-mm-dd') 
    AND TO_DATE('2022-03-16','yyyy-mm-dd')
 	GROUP BY CODE,ID
 	ORDER BY ID ASC;
  
 * 이예진
  	SELECT BUYDATE "구매날짜", PRODUCTCODE "구매물품" FROM TBL_EXBUY 
	WHERE TO_CHAR(BUYDATE,'YYYY-MM')='2022-04'
	ORDER BY BUYDATE, PRODUCTCODE;
 
 * 이대환
  	SELECT ID  ,sum (num) FROM EXBUY WHERE id ='mina012' GROUP BY ID ;
 
 * 이재훈
  	SELECT * FROM EXBUY WHERE BUY_COUNT >= 3 ;
 
 * 김승한
  	SELECT Max(id) FROM TBL_exbuy 
  	WHERE date2 BETWEEN TO_DATE('2021-01-01','yyyy-mm-dd')
	AND TO_DATE('2022-03-01','yyyy-mm-dd')GROUP BY buy ; 
	
 * 민찬희
   SELECT B_DATE FROM BUY WHERE B_UID = 'mina012';
 * */



