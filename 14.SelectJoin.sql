/*
 테이블 조인: 테이블의 컬럼을 합하는 연산
( 참고로 UNION 연산은 테이블의 행을 합하는 연산)
 형식: 
  */

--STEP1: FROM 뒤에 두개의 테이블 나열
SELECT * FROM TBL_CUSTOM, TBL_BUY; --첫번째 테이블의 행에 BUY를 하나씩 다 넣음 (4X7=28): 모든 경우의 수
--결과: 2개의 테이블 공통 컬럼인 CUSTOM_ID로 모든 경우의 수를 조합하여 합침 : 크로스 조인

--STEP2: 동등 조인은 위의 결과 중 고객 ID 값이 같은 것만 의미 있으므로 조건식을 추가한 것
--형식 1) SELECT * FROM 테이블1 , 테이블 2 WHERE T1.공통컬럼 = T2.공통컬럼;
--	  2)SELECT * FROM 테이블1 JOIN 테이블 2 ON T1.공통컬럼 = T2.공통컬럼;

--DH
--1
SELECT  * FROM TBL_CUSTOM tc ,TBL_BUY tb 
WHERE TC.CUSTOM_ID = TB.CUSTOMID;
--참고: 고객 중 한번도 구매하지 않은 이는 결과에 없음
--2
SELECT  * FROM TBL_CUSTOM tc JOIN TBL_BUY tb 
ON TC.CUSTOM_ID = TB.CUSTOMID;




--STEP3: 2단계 결과로 예시만들기
--1. 2024년에 상품을 구매한 고객의 이메일을 모두 조회하세요
SELECT CUSTOMID ,TC.EMAIL , TB.BUY_DATE  
FROM TBL_CUSTOM tc,TBL_BUY tb 
WHERE TC.CUSTOM_ID = TB.CUSTOMID
AND TO_CHAR(BUY_DATE, 'YYYY') = '2024'; 

--2. 테이블 바꾼 예시: 회원 TWICE가 구매한 상품명과 가격을 조회
SELECT TB.CUSTOMID "구매회원",tb.QUANTITY * TP.PRICE "구매금액" , tp.PNAME "구매상품"
FROM TBL_BUY tb , TBL_PRODUCT tp 
WHERE  TP.PCODE =TB.PCODE  --일치한 것만 찾아냄으로써 중복을 없앰
AND TB.CUSTOMID = 'twice';

--3. 2개의 테이블을 조인하는 예시 생각해보기
--가장 많이 팔린 제품의 이름과 가격의 정렬은?
SELECT SUM(TB.QUANTITY) "합계",TP.PCODE , TP.PNAME,TP.PRICE, SUM(TP.PRICE * TB.QUANTITY) "합계금액"
FROM TBL_BUY TB, TBL_PRODUCT TP
WHERE TB.PCODE = TP.PCODE
GROUP BY TP.PCODE ,TP.PNAME,TP.PRICE
ORDER BY "합계" DESC; 

--진라면 구매한 회원의 이름과 메일 조회하기
SELECT TB.PCODE, TC.NAME,TC.EMAIL 
FROM TBL_BUY tb , TBL_CUSTOM tc 
WHERE TB.CUSTOMID = TC.CUSTOM_ID 
AND TB.PCODE = 'JINRMn5';

--B1 카테고리 상품의 구매 현황(가격, 상품명, 구매수량, 구매날짜)을 조회
SELECT TP.CATEGORY, TP.PNAME, TP.PRICE, TB.QUANTITY, TB.BUY_DATE 
FROM TBL_BUY tb, TBL_PRODUCT tp
WHERE TB.PCODE = TP.PCODE 
AND TP.CATEGORY = 'B1';




--외부조인
--SELECT *FROM 테이블1 T1 LEFT OUTER JOIN 테이블2 ON T1.공통컬럼 = T2.공통컬럼;   OUTER 생략가능
--테이블2에 없는 값도 1에 있으면 조인에 포함시킴 / 값이 없으면 NULL
SELECT *
FROM TBL_CUSTOM tc 
LEFT JOIN TBL_BUY tb 
ON TC.CUSTOM_ID = TB.CUSTOMID ;

--구매이력이 없는 회원 검색
SELECT TC.CUSTOM_ID, TC.NAME ,TC.EMAIL , TC.AGE 
FROM TBL_CUSTOM tc 
LEFT JOIN TBL_BUY tb 
ON TC.CUSTOM_ID = TB.CUSTOMID  --조인 조건식
WHERE TB.CUSTOMID IS NULL;	   --그 외의 조건식

--상품과 구매에 대한 외부 조인 연습
INSERT INTO "C##IDEV".TBL_PRODUCT VALUES('SNACK99', 'C1', '새우깡번들', 5500);

--구매이력이 없는 상품 조회
SELECT TP.PNAME , TP.PRICE     --TP.* 표기가능
FROM TBL_PRODUCT tp 
LEFT JOIN TBL_BUY tb  
ON TB.PCODE = TP.PCODE 
WHERE TB.QUANTITY IS NULL;


--형식3: 오라클에서만 사용하는 조인 형식 (외부 OUTER 조인)
SELECT *
FROM TBL_PRODUCT tp , TBL_BUY tb 
WHERE TP.PCODE = TB.PCODE (+);          --NULL 값이 발생하는 테이블 컬럼에 +표시

