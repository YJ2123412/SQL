/*
 * SQL의 집계(개수, 최대값, 최소값, 합계, 평균) 함수 - 그룹함수 ->GROUP BY 구문과 주로 쓰임, 집계함수는 다른 컬럼과 함께 조회하려면 GROUP BY가 필요
 * 1)성적 테이블의 전체 행 개수
 * 2) 성적 테이블의 과목 컬럼 중 국어 값을 가는 전체 행 개수
 * 
 */
-- 1)성적 테이블의 전체 행 개수
SELECT COUNT(*) FROM TBL_SCORE ;

-- 2) 성적 테이블의 과목 컬럼 중 국어 값을 가는 전체 행 개수
SELECT COUNT(*) FROM TBL_SCORE ts WHERE SUBJECT = '국어';
--조회된 함수결과에 컬럼명을 주려면 AS "컬럼명"
SELECT COUNT(*) AS "COUNT" FROM TBL_SCORE ts WHERE SUBJECT = '국어';

--오류: 집계함수는 다른 컬럼과 함께 조회하려면 GROUP BY가 필요
--SELECT SUBJECT, COUNT(*) FROM TBL_SCORE ts ; 

--조회 칼럼에 SUBJECT 추가 가능
SELECT SUBJECT ,COUNT(*) FROM TBL_SCORE ts  GROUP BY SUBJECT ; 
--오류 SELECT SUBJECT ,COUNT(*) FROM TBL_SCORE ts  GROUP BY STUNO  ; 

--3) 성적 테이블의 'JUMSU' 컬럼의 합계
SELECT SUM(JUMSU) FROM TBL_SCORE ts ;
-- 4) 특정 과목(국어점수)
SELECT SUM(JUMSU) FROM TBL_SCORE ts WHERE SUBJECT = '국어' ;

--5) 평균
SELECT AVG(JUMSU) FROM TBL_SCORE ts ;

--6) 최대값
SELECT MAX(JUMSU) FROM TBL_SCORE ts ;

--7)최솟값
SELECT MIN(JUMSU) FROM TBL_SCORE ts ;

--8)여러개
SELECT COUNT(*), SUM(JUMSU) "합계" ,AVG(JUMSU) "평균" FROM TBL_SCORE ;

--GROUP BY는 그룹화 컬럼명1, 그룹화 컬럼명2... 로 할 수 있음
SELECT subject, COUNT(*)FROM TBL_STUDENT ts  GROUP BY SUBJECT; 

/*
 * 집계함수 count, avg , sum, min, max 등 그룹 함수라고도 합니다. 
 * 그룹화 - 지정한 컬럼값이 같을 것을 갖는 행에 대해 집계 함수를 실행합니다.
 *      
 * 
 * select 
 *       그룹화컬럼, 그룹함수
 * from 테이블이름
 * [WHERE] 그룹화하기 이전의 조건식
 * GROUP BY 그룹화에 사용할 컬럼명
 * [HAVING] 그룹화 후에 그룹화 결과값을 사용하는 조건식
 * [ORDER BY] 정렬 컬럼
 */
---------------
--예시1) 학번(학생)별로 수강한 갯수와 평균 조회하기
SELECT STUNO, COUNT(*),AVG(JUMSU) FROM TBL_SCORE ts 
GROUP BY STUNO;


--2) 위의 결과에 대해 평균이 80점 미만인 학번(학생) 조회하기
SELECT STUNO, COUNT(*),AVG(JUMSU)
FROM TBL_SCORE ts 
GROUP BY STUNO
HAVING AVG(JUMSU) <80;  --HAVING은 집계함수 결과에 대한 조건식/ 

--점수가 80점 이상 데이터만 예시 1번을 실행한다면 WHERE JUMSU >=80 GROUP BY STUNO
SELECT STUNO, COUNT(*),AVG(JUMSU) FROM TBL_SCORE ts 
WHERE JUMSU >=80
GROUP BY STUNO;


--3) 예시 1번의 결과를 평균 내림차순으로 조회
SELECT STUNO, COUNT(*),AVG(JUMSU) "학생별 평균"        --컬럼의 별칭으로 조건 걸기 가능
FROM TBL_SCORE ts 
GROUP BY STUNO
ORDER BY "학생별 평균" DESC;


--4) 학기별-교사별 COUNT, AVG 조회하기
SELECT TERM ,TEACHER , COUNT(*), AVG(JUMSU)  
FROM TBL_SCORE ts 
GROUP BY TERM , TEACHER ;






