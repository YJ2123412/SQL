/*
오라클 ROWNUM 컬럼: 오라클이 SELECT 결과에 부여하는 행번호, 오라클이 내부적으로 관리를 위한 컬럼
 * */
--1)상품 테이블의 상품 가격을 내림차순으로 정렬하여 조회
SELECT *
FROM TBL_PRODUCT tp 
ORDER BY PRICE DESC ;

--2) ROWNUM 컬럼을 출력, 정렬 이전의 ROWNUM(원하는 결과가 아님)   --ROWNUM은 SELECT된 결과에 붙이는 것..
SELECT ROWNUM, TP.*
FROM TBL_PRODUCT TP
ORDER BY PRICE DESC;

--3)서브 쿼리로 변경 --원하는 ROWNUM출력을 위해서는 서브쿼리로 만들어야함
SELECT ROWNUM, TP.*,TPCODE.*
FROM(
	SELECT *
	FROM TBL_PRODUCT 
	ORDER BY PRICE DESC
	)TP

--4) 결과에 ROWNUM 조건을 적용해봅시다
SELECT ROWNUM, TP.*
FROM(
	SELECT *
	FROM TBL_PRODUCT 
	ORDER BY PRICE DESC
	)TP
--WHERE ROWNUM=1    --ROWNUM이 1이 포함되는 경우만 가져올 수 있음
--WHERE ROWNUM=3 --안됨

--5) 중간 일부를 가져오기 위해서 BETWEEN ~ AND  연산.. 4번을 대상으로 서브 쿼리를 또 써야함
--예시 : 게시판의 글목록에 대해 페이지 번호 적용합니다.
SELECT *
FROM (
	SELECT ROWNUM R, TP.* --괄호 속 ROWNUM에 대한 별칭 필요 (ROWNUM은 컬럼 키워드이기에), 밖에서 사용하기 위해..
	FROM(
		SELECT *
		FROM TBL_PRODUCT 
		ORDER BY PRICE DESC
		)TP
	)
--WHERE R=3;
WHERE R BETWEEN 2 AND 4;

--6)오라클 12C 버전부터는 FETCH 명령이 있음  ->4번을 대신하여 사용가능(ROWNUM<3)과 같은 결과
SELECT *
FROM TBL_PRODUCT tp 
ORDER BY PRICE DESC 
FETCH FIRST 2 ROWS ONLY; --TOP2 가져오기

--여러개 동시에 서브쿼리로 만들기 가능
SELECT ROWNUM, TP.*,TPCODE.*
FROM(
	SELECT *
	FROM TBL_PRODUCT 
	ORDER BY PRICE DESC
	)TP,
	(
	SELECT *
	FROM TBL_PRODUCT 
	ORDER BY PCODE DESC
	)TPCODE;




