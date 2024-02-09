---JDBC 프로젝트를 위한 SQL 테스트
--sql 테스트를 하고 자바 프로그래밍 하기





--회원정보수정: EMAIL, AGE
UPDATE TBL_CUSTOM 
	SET EMAIL = 'TEST@GAMIL.COM', AGE = 22
	WHERE CUSTOM_ID = 'nayeon33';

--회원탈퇴
DELETE FROM TBL_CUSTOM tc 
	WHERE TC.CUSTOM_ID = 'sana77';

SELECT * FROM TBL_CUSTOM tc 
WHERE TBL_CUSTOM.CUSTOM_ID = 



--프로덕트 PRODUCTVO, TBLPRODUCTCDAO 만들기
--selectByCategeory, selectByPname 메소드 만들기
--카테고리로 검색하기
SELECT DISTINCT  CATEGORY 
FROM  TBL_PRODUCT
ORDER  BY CATEGORY ASC; 

--2) 특정 카테고리에 대해 상품 목록 보여주기 (조회결과 1 OR n개)
SELECT DISTINCT  CATEGORY 
FROM  TBL_PRODUCT
WHERE CATEGORY = 'B1';

--상품명 유사검색
SELECT *FROM TBL_PRODUCT tp 
WHERE PNAME LIKE '%'||'사과'||'%';   --프로그램에서 매개변수 처리를 위해 연결연산으로


SELECT DISTINCT * FROM TBL_PRODUCT;



--MY PAGE를 위한 SQL
--아래 조회된 행들에 대해 컬럼과 매핑되는 CustomerBuyVo를 만들어야 함
SELECT BUY_IDX, TB.PCODE, PNAME,PRICE,QUANTITY ,BUY_DATE 
FROM TBL_BUY tb 
JOIN TBL_PRODUCT tp 
ON TB.PCODE = TP.PCODE 
WHERE TB.CUSTOMID ='mina012';

//




SELECT *FROM TBL_PRODUCT tp WHERE PNAME LIKE '%'||'사과'||'%';
SELECT DISTINCT * FROM TBL_PRODUCT;

SELECT DISTINCT * FROM  TBL_PRODUCT WHERE CATEGORY = 'A1' ORDER BY PNAME;



