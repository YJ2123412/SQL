/*프로시저 만들어보기: MONEY_OF_DAY
  매개변수 IN : 고객 아이디, 날짜('YYYY-MM-DD)
  		 OUT: IN으로 받은 값들을 TBL_BUY에서 상품코드 조회하여 총 구매금액을 구함
  				총구매금액 = OUT
  				
  				단, 고객은 1일 1품목만 구매 가능합니다.
 실행
 DECLARE
 	VMONEY NUMBER(8);
 BEGIN
 	MONEY_OF_DAY('mina012','2023-11-10',vmoney)
 	DBMS_OUTPUT.PUT_LINE(CHR(10)||'고객ID: ' || VID|| '날짜: '||VDATE);
 	DBMS_OUTPUT.PUT_LINE('고객님의 구매금액은 ' || vmoney|| '입니다.');
 END;
 
 
 
 */

CREATE OR REPLACE PROCEDURE MONEY_OF_DAY(	 
	P_ID IN TBL_CUSTOM.CUSTOM_ID%TYPE,
	P_DATE IN VACHAR2,    --내가 임의로 날을 입력할것임
	P_PRICE OUT NUMBER 
IS
	V_QUNTITY TBL_BUY.QUANTITY%TYPE;
	V_PCODE TBL_BUY.PCODE%TYPE;
	V_PRICE TBL_PRODUCT.PRICE%TYPE;
BEGIN
	SELECT v_quantity * v_price
      INTO p_money
   FROM dual;
   DBMS_OUTPUT.PUT_LINE('* m : ' || p_money);
   EXCEPTION
   WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('조건에 맞는 데이터가 없습니다.');
END;

-------정답
CREATE OR REPLACE PROCEDURE money_of_day2(
   p_id IN tbl_custom.custom_id %TYPE,      -- 출력(리턴) 변수
   p_date IN varchar2,      -- 출력(리턴) 변수
   p_money OUT NUMBER
)
IS
   v_pcode TBL_BUY.PCODE %TYPE;
   v_quantity TBL_BUY.QUANTITY %TYPE;
   v_price TBL_PRODUCT.PRICE %TYPE;
BEGIN
   SELECT PCODE, QUANTITY 					--1일 1구매 조건으로 1개의 행이 조회됨
      INTO v_pcode , v_quantity				--조회 결과가 N개의 행이면 프로시저의 커서 기능을 이용(나중에)
      --INTO는 프로시저에서만 사용
   FROM TBL_BUY
   WHERE CUSTOMID = p_id AND TO_CHAR(BUY_DATE,'YYYY-MM-DD') = p_date;
   --테스트를 위한 코드
   DBMS_OUTPUT.PUT_LINE('* p : ' || v_pcode ||','|| v_quantity );
   SELECT PRICE
      INTO v_price
   FROM TBL_PRODUCT
   WHERE PCODE = v_pcode;
   DBMS_OUTPUT.PUT_LINE('* p : ' || v_price);
   SELECT v_quantity * v_price
      INTO p_money		--수량*가격 수식 연산결과를 출력매개변수 P_MONEY에 저장
   FROM dual;			--특정 테이블과 상관 없으므로 DUAL 임시 테이블 사용하여 연산
   DBMS_OUTPUT.PUT_LINE('* m : ' || p_money);
   EXCEPTION
   WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('조건에 맞는 데이터가 없습니다.');
     P_MONEY :=0;
END;
	
--실행
 DECLARE 
 	VMONEY NUMBER(8);--프로시저 실행결과 OUT 매개변수 저장(필수)
 	vid TBL_CUSTOM.CUSTOM_ID%TYPE; --프로시저 실행에 필요한 IN 매개변수값 저장변수
 	VDATE VARCHAR2(20);			   --없어도 되지만 출력등 편의상 선언 (VID, VDATE)
 BEGIN
	VID := 'mina012';
	vdate :='2023-11-11';
	--VID, VDATE IN 매개변수값으로 프로시저 실행
	--매개 변수에 저장된 프로시저 실행 결과를 VMONEY에 저장
 	MONEY_OF_DAY2(VID,VDATE,vmoney);
 	DBMS_OUTPUT.PUT_LINE(CHR(10)||'고객ID: ' || VID|| ' 날짜: '||VDATE);
 	DBMS_OUTPUT.PUT_LINE('고객님의 구매금액은 ' || vmoney|| '입니다.');
 END;
	
	
	
	
	SELECT  PCODE, QUANTITY
	INTO?, ?
	FROM TBL_BUY tb 
	WHERE CUSTOMID  = VID AND TO_CHAR(BUY_DATE,'YYYY-MM-DD')=VDATE; 
	
	SELECT PRICE
	INTO?
	FROM TBL_PRODUCT tp 
	WHERE PCODE = 1에서 구한 변수
	
	--3) 출력매개변수에 저장하기
	SELECT 1번에서 구한 수량값 변수*2번에서 구한 가격값 변수	
	INTO ? 
	FROM DUAL;
	
	CREATE OR REPLACE PROCEDURE "C##IDEV".MONEY_OF_DAY(	 
	VID IN P_BUY.CUSTOMID %TYPE, 
	VDATE IN P_BUY.BUY_DATE %TYPE, 	-- 상품코드
	vtotal OUT NUMBER  
)
IS 
	VMONEY NUMBER(8),
	VPCODE VARCHAR(20),
	APRICE NUMBER(8),
	VQUANTITY NUMBER(8);

	BEGIN 
	INSERT INTO MONEY_OF_DAY(CUSTOMID,BUY_DATE,vmoney)
		values (VID ,VDATE, vmoney);
	
	--1) 고객 ID 와 날짜 값으로 구매 테이블에서 수량과 PCODE 조회하고 변수에 저장하기
--2) 1에서 구한 코드의 가격을 조회하여 저장하기
--3) 2번 가격과 1번 수량을 곱하여 결과값을 저장 - > 출력변수

	SELECT PCODE, QUANTITY
	INTO APCODE, AQUANTITY
	FROM TBL_BUY tb 
	WHERE CUSTOMID  = VID AND TO_CHAR(BUY_DATE,'YYYY-MM-DD')= VDATE; 
	
	SELECT PRICE
	INTO APRICE
	FROM TBL_PRODUCT tp 
	WHERE PCODE = APCODE;
	
	--3) 출력매개변수에 저장하기
	SELECT AQUANTITY*APRICE	
	INTO vmoney 
	FROM DUAL;	
	

END;
	
	
	
	
	
	
		