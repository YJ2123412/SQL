--이대환 나이가 30이상인 회원들의 나이와 상품코드를 서브쿼리와 조인을 모두 사용해 조회하세요.


--김승한  ->기존에 배부된 PDF 참고
--물건을 구매한 사람 중, 가장 나이가 많은 고객을 찾으려고 한다. 다음 빈칸에 맞는 코드를 넣으시오.
--(테이블이 되는 코드는 ‘13_9번문제.sql 파일을 기반으로 한다.’)

--노희영 2022년 상반기에 가장 많이 산 사람의 이름 , 물건이름 , 수량 순으로 조회하시오

--이예진 회원별로 가장 많은 사용금액을 구하시오

--이재훈 구매수량이 2 이상인 고객 중에 나이가 20을 초과한 인원만 조회하세요. => 답은 동등 조인

--민찬희 tbl_student 와 tbl_score 에서 '김모모'라는 이름을 가진 2021001 학번의 점수를 각각 출력하고 평균을 구하시오.













정답

--이대환
 SELECT abc.age, abc.pcode FROM (
   SELECT * FROM TBL_BUY tb
   JOIN TBL_CUSTOM tc ON tb.CUSTOMID = tc.CUSTOM_ID AND age>30) abc
   GROUP BY abc.age, abc.pcode;

--김승한
SELECT TC.CUSTOM_ID , TC.NAME , TC.AGE 
FROM TBL_CUSTOM tc 
JOIN TBL_BUY tb  ON TC.CUSTOM_ID =TB.CUSTOMID 
WHERE TC.AGE =
(SELECT MAX(AGE))
FROM TBL_CUSTOM
);

고객의 이름과 나이를 찾아야 하므로 custom id의 name, age를 select한다.
Join의 조건확인대상은 구매한 목록을 확인해야 하므로, tbl_buy를 쓴다.
Where의 조건인 서브쿼리의 괄호 안에는 고객의 목록이 있는 테이블의 최대 나이를 찾아야 하므로 tbl_custom을 넣는다.


--노희영
SELECT A.NAME "이름", C.PNAME "물건이름", MAX(B.QUANTITY) ||'개'"수량"
FROM  TBL_CUSTOM A, TBL_BUY B, TBL_PRODUCT C
WHERE A.CUSTOM_ID  = B.CUSTOMID 
AND B.PCODE  = C.PCODE 
AND QUANTITY = (SELECT MAX(QUANTITY) 
              FROM TBL_BUY 
             WHERE BUY_DATE BETWEEN TO_DATE('2022-01-01','yyyy-mm-dd') 
                                AND TO_DATE('2022-06-30','yyyy-mm-dd'))
GROUP BY A.NAME,C.PNAME;






--이예진
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


--이재훈
SELECT tc.CUSTOM_ID , tc.NAME , tc.EMAIL ,tc.AGE , tb.QUANTITY 
FROM TBL_CUSTOM tc  
LEFT JOIN TBL_BUY tb 
ON tc.CUSTOM_ID = tb.CUSTOMID  
WHERE tb.QUANTITY >=2 AND tc.AGE >20;  


--민찬희
SELECT
st.stuno 학생번호,
st.name 이름,sc.JUMSU 점수,(SELECT avg(JUMSU) FROM tbl_score WHERE st.STUNO='2021001'),sc.SUBJECT 과목  FROM TBL_STUDENT st
INNER JOIN TBL_SCORE sc ON st.stuno = sc.stuno
WHERE st.name = '김모모';
