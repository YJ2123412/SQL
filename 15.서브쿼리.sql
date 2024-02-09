/*
 서브 쿼리(sub query): SELECT 조회 결과(여러개의 행)가 다른 DML 명령어에 쓰일 수 있음 
 					SELECT, INSERT, DELECT, UPDATE에 포함되는 SELECT를 서브쿼리라고 함
 					
 SELECT와 함께 쓰이는 서브쿼리: SELECT 컬럼1, 컬럼2 FROM (SELECT...)
 											WHERE 컬럼명 1= 값(SELECT 결과)
 
 SELECT 서브 쿼리는 JOIN으로 대체할 수 있음 (때에 따라..)
 **/
--1) WHERE에서 쓰는 서브쿼리: TWICE가 구매한 상품 정보
SELECT TP.*           --> 검색하고서 조건에서 걸러냄
FROM TBL_BUY tb , TBL_PRODUCT tp 
WHERE  TP.PCODE =TB.PCODE  --일치한 것만 찾아냄으로써 중복을 없앰                     --1) 크로스 연산
AND TB.CUSTOMID = 'twice';													--2) 조건식 연산

--서브쿼리  - 실행할때마다 SELECT 조회부터 시작하기에 검색 횟수가 많음
SELECT TP.*
FROM TBL_PRODUCT tp 
WHERE PCODE IN																--2) 조건식 연산
--('CJBAb12g','APLE5kg','DOWON123a');
(SELECT PCODE FROM TBL_BUY tb  WHERE CUSTOMID = 'twice'); 					--1) 조건식 연산


--2) FROM에서 사용되는 서브쿼리  : 컬럼명 또는 테이블명 별칭을 줄때 한글 또는 키워드를 사용시 ""
SELECT 
	SALEMONEY.PCODE,SUM(QUANTITY),SUM("구매금액")
FROM
(SELECT QUANTITY * PRICE "구매금액" , PNAME, TP.PCODE, QUANTITY 			--TP, TB는 해당 ()안에서만 쓸 수 있는 AS
FROM TBL_BUY tb , TBL_PRODUCT tp 
WHERE TP.PCODE =TB.PCODE) SALEMONEY
GROUP BY SALEMONEY.PCODE;

--2-1) 정렬
SELECT 
	COUNT(QUANTITY),SALEMONEY.PCODE,SUM(QUANTITY),SUM("구매금액")
FROM
(SELECT QUANTITY * PRICE "구매금액" , PNAME, TP.PCODE, QUANTITY 			--TP, TB는 해당 ()안에서만 쓸 수 있는 AS
FROM TBL_BUY tb , TBL_PRODUCT tp 
WHERE TP.PCODE =TB.PCODE) SALEMONEY
GROUP BY COUNT(QUANTITY),SALEMONEY.PCODE
ORDER BY COUNT(QUANTITY) DESC;

--JOIN을 통한 처리
SELECT 
    tp.PCODE,
    SUM(tb.QUANTITY) AS TotalQuantity,
    SUM(tp.PRICE * tb.QUANTITY) AS TotalAmount
FROM 
    TBL_PRODUCT tp
JOIN 
    TBL_BUY tb ON tp.PCODE = tb.PCODE
GROUP BY 
    tp.PCODE;
   
   
--오라클 WITH 구문 : SELECT 조회 결과를 저장해놓고 사용
WITH SALEMONEY
AS
(
	SELECT TP.PCODE, PNAME, QUANTITY, PRICE, TB.QUANTITY * TP.PRICE "구매금액" 			
	FROM TBL_BUY tb , TBL_PRODUCT tp 
	WHERE TP.PCODE =TB.PCODE
)
SELECT SALEMONEY.PCODE, SUM(SALEMONEY.QUANTITY), SUM("구매금액")
FROM SALEMONEY
GROUP BY SALEMONEY.PCODE;
   
   
   
--서브쿼리와 조인을 이용한 문제를 1개씩 만들어서 조원끼리 공유해서 풀어보기
   
   

--- tbl_student 와 tbl_score 에서 '김모모'라는 이름을 가진 2021001 학번의 점수를 각각 출력하고 평균을 구하시오.

--RANK 함수 (그룹화 결과에 대한 순위 제공)









--회원별로 구입한 금액이 가장 큰 상품은?
WITH CODE
AS 
	(WITH BIG
	 AS
		(SELECT 
			tp.PCODE,
		    TB.CUSTOMID, 
		    SUM(tp.PRICE * tb.QUANTITY) AS TotalAmount,
		    MAX(tp.PRICE * tb.QUANTITY) AS "가장 많이 쓴 금액"
		FROM 
		    TBL_PRODUCT tp
		JOIN 
		    TBL_BUY tb ON tp.PCODE = tb.PCODE
		GROUP BY 
			TB.CUSTOMID, tp.PCODE
		ORDER BY TotalAmount ASC)
	SELECT BIG.PCODE, BIG."가장 많이 쓴 금액"
	FROM BIG
	GROUP BY BIG.PCODE, BIG."가장 많이 쓴 금액")
SELECT CODE.PCODE, TBL_PRODUCT.PNAME  
FROM CODE, TBL_PRODUCT
GROUP BY CODE.PCODE, TBL_PRODUCT.PNAME;





	WITH BIG
	 AS
		(SELECT 
		    TB.CUSTOMID, 
		    MAX(tp.PRICE * tb.QUANTITY) AS "가장 많이 쓴 금액"
		FROM 
		    TBL_PRODUCT tp
		JOIN 
		    TBL_BUY tb ON tp.PCODE = tb.PCODE
		WHERE TB.CUSTOMID = 'mina012'
		OR TB.CUSTOMID = 'hongGD'
		OR TB.CUSTOMID = 'twice'
		GROUP BY 
			TB.CUSTOMID
		ORDER BY "가장 많이 쓴 금액" ASC;)
	SELECT BIG.CUSTOMID,TB.PCODE, BIG."가장 많이 쓴 금액"
	FROM BIG, TBL_BUY tb  
	WHERE BIG."가장 많이 쓴 금액" = TB.PCODE,
	GROUP BY BIG.CUSTOMID,TB.PCODE,BIG."가장 많이 쓴 금액";



		SELECT 
		    TB.CUSTOMID, 
		    TP.PNAME, 
		    MAX(tp.PRICE * tb.QUANTITY) AS "가장 많이 쓴 금액"
		FROM 
		    TBL_PRODUCT tp
		JOIN 
		    TBL_BUY tb ON tp.PCODE = tb.PCODE
		GROUP BY 
			TB.CUSTOMID,TP.PNAME;


	
	
	WITH MINA 
	AS (SELECT 
			TB.PCODE, 
		    TB.CUSTOMID, 
		    MAX(tp.PRICE * tb.QUANTITY) AS "가장 많이 쓴 금액"
		FROM 
		    TBL_PRODUCT tp
		JOIN 
		    TBL_BUY tb ON tp.PCODE = tb.PCODE
		WHERE TB.CUSTOMID = 'mina012'
		GROUP BY 
			TB.PCODE,TB.CUSTOMID)
	SELECT MINA.CUSTOMID, MAX("가장 많이 쓴 금액") AS "하나"
	FROM MINA
	GROUP BY MINA.CUSTOMID;



	
	
	WITH BIG 
	AS (SELECT 
			TB.PCODE, 
		    TB.CUSTOMID, 
		    MAX(tp.PRICE * tb.QUANTITY) AS "많이 쓴 금액"
		FROM 
		    TBL_PRODUCT tp
		JOIN 
		    TBL_BUY tb ON tp.PCODE = tb.PCODE
		GROUP BY 
			TB.PCODE,TB.CUSTOMID)
	SELECT BIG.CUSTOMID, MAX("많이 쓴 금액") AS "하나"
	FROM BIG
	GROUP BY BIG.CUSTOMID;





