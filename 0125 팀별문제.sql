--이후 시험문제 (02.01.목요일) - 중점 포인트: '비지니스 로직에 필요하다', SELECT 10문제, 테이블은 제공했던 3개 그대로 사용.. 
--그 이외 문제는 랜덤..


--A조
--김미나가 구매한 상품 금액 합계(이광원)
SELECT SUM(TB.QUANTITY*tp.PRICE) AS "합계"
FROM TBL_BUY TB, TBL_PRODUCT tp 
WHERE Tb.CUSTOMID = 'mina012' AND tb.PCODE = tp.PCODE ;


--홍길동이 구매한 상품의 갯수는?(권태윤)
SELECT tc.NAME ,COUNT(TB.QUANTITY) "구매 갯수" 
FROM TBL_BUY tb JOIN TBL_CUSTOM tc 
ON TB.CUSTOMID  = tc.CUSTOM_ID AND tc.NAME = '홍길동'
GROUP BY tc.NAME;


--강주찬 1) `20살`이상 고객님들의 `구매`한 `상품명`  2) 테이블 2개 조인으로 문제를 변경하세요. 2개 각각입니다.
SELECT TC.NAME, TP.*
FROM TBL_PRODUCT tp 
JOIN TBL_BUY tb 
ON TP.PCODE = TB.PCODE 
JOIN TBL_CUSTOM tc 
ON TC.AGE >=20;


SELECT TC.NAME, TC.AGE, TP.PNAME 
FROM TBL_PRODUCT tp,TBL_BUY tb,TBL_CUSTOM tc 
WHERE TP.PCODE = TB.PCODE; AND TC.AGE >=20;


--사과를 구매한 사람의 '이름'과 '구매'한 갯수만큼의 '가격'의 합을 구해줘(고길현)----출제 X
SELECT TC.NAME ,sum("가격의 합")
FROM TBL_CUSTOM tc ,APPLE
(SELECT TB.CUSTOMID, TBL_BUY.QUANTITY, SUM(TB.QUANTITY *TP.PRICE) "가격의 합"
FROM TBL_BUY tb,TBL_PRODUCT TP
WHERE TB.PCODE = TP.PCODE AND TB.PCODE = 'APLE5kg'
GROUP BY TB.QUANTITY, TB.CUSTOMID) AS APPLE
WHERE APPLE.CUSTOMID = CUSTOMID 
GROUP BY TC.NAME;







SELECT tc.NAME, sum("구매 금액의 합") FROM 
(SELECT NAME, tp.PRICE , tp.PRICE * tb.QUANTITY "구매 금액의 합" 
FROM TBL_CUSTOM tc 
JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOMID 
JOIN TBL_PRODUCT tp 
ON tp.PCODE = tb.PCODE AND tp.PNAME = '청송사과 5kg')tc 
GROUP BY tc.NAME;


-- with 구문이용하여 saleMoney를 그룹으로 묶고 그 중 구매합산 금액 중 20000~70000사이 값을 출력하시오(김태완)-> 서브쿼리 없이 구하기




--B조
--이대환 나이가 30이상인 회원들의 나이와 상품코드를 서브쿼리와 조인을 모두 사용해 조회하세요.
SELECT TC.CUSTOM_ID,TC.AGE,TC.NAME , TB.PCODE 
FROM TBL_CUSTOM tc  
JOIN TBL_BUY tb
ON TC.CUSTOM_ID  = TB.CUSTOMID AND TC.AGE >=30;


--김승한 물건을 구매한 사람 중, 가장 나이가 많은 고객을 찾으려고 한다. 다음 빈칸에 맞는 코드를 넣으시오.(테이블이 되는 코드는 ‘13_9번문제.sql 파일을 기반으로 한다.’)
--노희영 2021년 상반기 사이에 가장 많이 산 사람의 이름 , 물건이름 , 수량 순으로 조회하시오
--이예진 회원별로 가장 많은 사용금액을 구하시오
--이재훈 구매이력이 2 이상인 고객 중에 나이가 20을 초과한 인원만 조회하세요.
--민찬희 tbl_student 와 tbl_score 에서 '김모모'라는 이름을 가진 2021001 학번의 점수를 각각 출력하고 평균을 구하시오




--C조
-- 문제 : 가격이 1만원 이상의 상품마다 각각 고객들이 구매한 개수의 평균을 출력하시오. (출제자 : 임현범)

-- 문제 : 진라면을 구매한 고객의 이름, 구매수량, 구매날짜를 조회하자. (출제자 : 전예진)


-- 문제 : 20대 사용자들이 구매한 가격의 평균가격(출제자 : 조이루)


-- 문제 : 2023년에 팔린 상품의 이름과 코드,총 판매액 그리고 총 판매개수를 구하시오. (출제자 : 정제원)

-- 문제 : 미나와 길동이는 한집에 살고 있습니다. 미나와 길동이가 구매한 상품,수량,가격을 조회하세요. (출제나 : 장성우)




--D조
-- 조하연 문제 : 진라면을 가장 많이 구매한 회원을 구매금액이 높은 순으로 회원아이디와 총 진라면 구매금액을 보여주세요.

-- 한진만 문제 : 팔린 갯수가 가장 많은 순서로 상품(상품코드와 상품이름)을 정렬하고 총 팔린 금액을 출력하시오
-- 황병훈 문제 : 진라면을 구매한 고객들의 평균 나이를 제품코드(PCODE)와 함께출력해주세요.



--조지수 문제 : 30이하 회원별 구매금액을 구하고 회원으로 그룹바이해서 구매금액 합계가 큰 순으로 정렬

--한주영 문제 2023년 구매 금액 5만원 이상에게 할인쿠폰을 발송하려 한다.CUSTOMID,구매 총액, 구매 일자를 구하시오. COUPON 사용하기


--차정호 문제 :문제 햇반의 총 매출과 팔린 갯수 산사람의 회원 아이디를 구하세요


