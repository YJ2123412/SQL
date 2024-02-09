CREATE OR REPLACE PROCEDURE "C##IDEV".money_of_day2(
   p_id IN tbl_custom.custom_id %TYPE,      -- 출력(리턴) 변수
   p_date IN varchar2,      -- 출력(리턴) 변수
   p_money OUT NUMBER
)
IS
   v_pcode TBL_BUY.PCODE %TYPE;
   v_quantity TBL_BUY.QUANTITY %TYPE;
   v_price TBL_PRODUCT.PRICE %TYPE;
BEGIN
   SELECT PCODE, QUANTITY
      INTO v_pcode , v_quantity
   FROM TBL_BUY
   WHERE CUSTOMID = p_id AND BUY_DATE = p_date;
   
   DBMS_OUTPUT.PUT_LINE('* p : ' || v_pcode || v_quantity );
   SELECT PRICE
      INTO v_price
   FROM TBL_PRODUCT
   WHERE PCODE = v_pcode;
   DBMS_OUTPUT.PUT_LINE('* p : ' || v_price);
   SELECT v_quantity * v_price
      INTO p_money
   FROM dual;
   DBMS_OUTPUT.PUT_LINE('* m : ' || p_money);
   EXCEPTION
   WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('조건에 맞는 데이터가 없습니다.');
END;