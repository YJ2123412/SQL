-- 테이블 삭제는 잘못된 작업이 있어 처음부터 다시 하고 싶을 때 하면 됩니다.
-- drop TABLE tbl_buy#;
-- DROP TABLE tbl_custom#;
-- DROP table tbl_product#;

-- 
CREATE TABLE tbl_custom# (
	custom_id varchar2(20) PRIMARY KEY ,  
	name varchar2(40) NOT NULL,		
	email varchar2(40),
	age number(3) DEFAULT 0,		
	reg_date date DEFAULT sysdate 
);

INSERT INTO tbl_custom# 
VALUES ( 'mina012', '김미나', 'kimm@gmail.com', 20, to_date('2022-03-10 14:23:25', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_custom# 
VALUES ('hongGD', '홍길동', 'gil@korea.com', 32, to_date('2021-10-21 11:12:23','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_custom# 
VALUES ( 'twice', '박모모', 'momo@daum.net', 29, to_date('2021-12-25 19:23:45','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_custom# (custom_id,name,email) VALUES ( 'wonder', '이나나', 'lee@naver.com');


CREATE TABLE tbl_product#(
	pcode varchar2(20) PRIMARY KEY ,
	category char(2) NOT NULL,
	pname varchar2(40) NOT NULL,
	price number(9) NOT NULL 
);
INSERT INTO tbl_product# tp 
VALUES ('DOWON123a', 'B2', '동원참치선물세트', 54000);
INSERT INTO tbl_product# tp 
VALUES ('CJBAb12g', 'B1', '햇반 12개입', 14500);
INSERT INTO tbl_product# tp 
VALUES ('JINRMn5', 'B1', '진라면 5개입', 6350);
INSERT INTO tbl_product# tp 
VALUES ('APLE5kg', 'A1', '청송사과 5kg', 66000);
INSERT INTO tbl_product# tp 
VALUES ('MANGOTK4r', 'A2', '애플망고 1kg', 32000);


CREATE TABLE tbl_buy#(
	buy_idx number(8) PRIMARY KEY ,		
	customId varchar2(20) NOT NULL ,			
	pcode varchar2(20) NOT NULL ,
	quantity number(5) DEFAULT 1 ,		
	buy_date DATE,
	FOREIGN KEY (customId)				
			REFERENCES tbl_custom#(custom_id),	
	FOREIGN KEY (pcode)
			REFERENCES tbl_product#(pcode)
);

DROP SEQUENCE buy2_pk_seq;
CREATE SEQUENCE buy2_pk_seq START WITH 1001;

INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval, 'mina012' , 'CJBAb12g' , 5,to_date('2023-07-15 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval, 'mina012' , 'APLE5kg' , 2,to_date('2023-11-10 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval, 'mina012' , 'JINRMn5' , 2,to_date('2023-12-09 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval, 'twice' , 'JINRMn5' , 3 ,to_date('2023-12-21 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval, 'twice' , 'MANGOTK4r' , 2 ,to_date('2024-01-10 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval, 'hongGD' , 'DOWON123a' , 1 ,to_date('2024-01-13 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# 
VALUES (buy2_pk_seq.nextval,  'hongGD' , 'APLE5kg' , 1 ,to_date('2023-09-09 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy# VALUES (buy2_pk_seq.nextval, 'mina012' , 'CJBAb12g' , 5, sysdate);


