CREATE OR REPLACE PROCEDURE "C##IDEV".MONEY_OF_DAY(	 
	VID IN P_BUY.CUSTOMID %TYPE, 
	VDATE IN P_BUY.BUY_DATE %TYPE, 	-- 상품코드
	vtotal OUT NUMBER  
)

--1) 고객 ID 와 날짜 값으로 구매 테이블에서 수량과 PCODE 조회하고 변수에 저장하기
--2) 1에서 구한 코드의 가격을 조회하여 저장하기
--3) 2번 가격과 1번 수량을 곱하여 결과값을 저장 - > 출력변수
IS 
	VMONEY NUMBER(8);	
BEGIN 
	INSERT INTO MONEY_OF_DAY(CUSTOMID,BUY_DATE,vtotal)
		values (VID ,VDATE, vmoney);	-- 매개변수값으로 INSERT
		
		SELECT CUSTOMID 		-- 방금 INSERT한 현재 시퀀스 값 조회
		INTO VID
		FROM TBL_BUY tb ;	

		SELECT BUY_DATE 
		INTO VDATE 
		FROM TBL_BUY tb ;

		UPDATE vtotal SET vtotal = TBL_PRODUCT.PRICE  * TBL_BUY.QUANTITY 
		INTO vmoney
		FROM TBL_PRODUCT tp 
		WHERE BUY_DATE = VDATE;						
	
		isSuccess :='success';			-- 프로시저에서 일반변수 대입문 기호 :=
		commit ;
		EXCEPTION 			-- EXCEPTION 추가하여 처리 -> 메시지 출력, rollback 
		WHEN OTHERS THEN 
		dbms_output.put_line('실행 실패'); --만원 미만 실패
		rollback ;	
		isSuccess :='fail';
END;
	