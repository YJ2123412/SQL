--DML: SELECT, INSERT, UPDATE, DELETE - 테이블의 행 데이터에 대한 조작
--한번 더 생각할 것은 기본키가 필요한 이유: 행 식별

--UPDATE 테이블명 SET 컬럼명1= 변경할 값, 컬럼명2 = 변경할 값... WHERE 조건식
--예시 미나가 구매한 DOWON123a의 수량을 모두 10으로 변경하기
UPDATE TBL_EXBUY SET BUY = 10
WHERE ID = 'hongGD' AND PRODUCTCODE ='DOWON123a';
--BUYIDX가 1001인 것의 구매수량을 5로 바꿈 -> 수정 또는 삭제될 조건식 컬럼이 PK 컬럼(행식별)일때에는 반드시 1개의 행만 수정이 적용됨
--PK가 아니면 개수 제한 X
--WHERE 조건 없는 SQL은 신중하게, 꼭 필요할떄만 사용하기
UPDATE TBL_EXBUY SET BUY = 5
WHERE BUYIDX = 1001;


SELECT * FROM TBL_EXBUY te 
ORDER BY ID;

--DELETE FROM 테이블명 WHERE 조건식 - 행전체 삭제
DELETE FROM TBL_EXBUY te WHERE BUYIDX = 1001;

--최종 결론: PK 컬럼은 응용프로그램 개발할때에는 없으면 안되는 컬럼
--행식별을 하여 조회 SELECT, 수정 UPDATE, 삭제 DELETE에 반영되는 행을 지정할 수 있음
------------------------------------------------------------------------------

--트랜잭션: INSERT, UPDATE, DELETE에서 반드시 하나의 단위로 처리해야할 작업
--예: 모모가 미나에게 5만원을 이체하려함. 모모계좌에는 -5만원 AND 미나 계좌는 +5만원 - 동시에 
--UPDATE가 2개의 명령어로 실행할 때 2개 모두 실행 또는 2개 모두 실행이 안되거나 해야하는 트랜잭션입니다.
--자동 커밋:INSERT, UPDATE, DELETE가 바로 테이블에 반영되는 것
--수동 커밋:INSERT, UPDATE, DELETE가 바로 반영되지 않고 COMMIT해야 실행 -> 다른 이도 확인 못함
-- 디비버 사용자가 추가한 INSERT는 커밋을 해야 SQLPLUS 사용자에게 보입(반영)니다.
--		INSERT, UPDATE, DELETE 명령 트랜잭션 취소는 ROLLBACK
--시퀀스는 이미 증가, 롤백과 관련없음

--SQL PLUS에서 명령보기 : SHOW AUTOCOMMIT;
--			   설정	: SET AUTOCOMMIT OFF(ON);

/*
 수동 커밋상태에서 SQL PLUS 실행, 계정 접속하기
 현재 트랜잭션 1) 인서트 2) 셀렉트 3) 업데이트
 * */
--디비버에서 AUTO COMMIT 해제하기 -> 데이터베이스 메뉴 ->트랜잭션모드
INSERT INTO TBL_EXBUY (ID, PRODUCTCODE, BUY, BUYDATE,BUYIDX)        
VALUES('hongGD','DOWON123a', 1, TO_DATE('2021-10-21 11:13:25','YYYY-MM-DD HH24:MI:SS'),EXBUY_PK_SEQ.NEXTVAL);

UPDATE TBL_EXBUY SET BUY = 13
WHERE BUYIDX = 1004;                --3번째

--롤백
ROLLBACK;

--처리완료
COMMIT;

