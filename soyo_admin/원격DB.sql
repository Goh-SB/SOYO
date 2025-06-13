SELECT NOTICE_NO
     , NOTICE_TITLE
     , NOTICE_DATE
     , STATUS
  FROM NOTICE
 ORDER BY NOTICE_NO DESC;

SELECT COUNT(*)
  FROM NOTICE;
  
INSERT INTO NOTICE VALUES(1, '제목', '내용', '2025-03-21', 'Y', NULL)
    
INSERT INTO NOTICE VALUES (1, '공지 제목 1', '이것은 공지 내용입니다 1', '2025-03-22', 'Y', NULL);
INSERT INTO NOTICE VALUES (2, '공지 제목 2', '이것은 공지 내용입니다 2', '2025-03-23', 'Y', NULL);
INSERT INTO NOTICE VALUES (3, '공지 제목 3', '이것은 공지 내용입니다 3', '2025-03-25', 'Y', NULL);
INSERT INTO NOTICE VALUES (4, '공지 제목 4', '이것은 공지 내용입니다 4', '2025-03-27', 'Y', NULL);
INSERT INTO NOTICE VALUES (5, '공지 제목 5', '이것은 공지 내용입니다 5', '2025-03-29', 'Y', NULL);
INSERT INTO NOTICE VALUES (6, '공지 제목 6', '이것은 공지 내용입니다 6', '2025-03-30', 'Y', NULL);
INSERT INTO NOTICE VALUES (7, '공지 제목 7', '이것은 공지 내용입니다 7', '2025-04-01', 'Y', NULL);
INSERT INTO NOTICE VALUES (8, '공지 제목 8', '이것은 공지 내용입니다 8', '2025-04-03', 'Y', NULL);
INSERT INTO NOTICE VALUES (9, '공지 제목 9', '이것은 공지 내용입니다 9', '2025-04-04', 'Y', NULL);
INSERT INTO NOTICE VALUES (10, '공지 제목 10', '이것은 공지 내용입니다 10', '2025-04-06', 'Y', NULL);
INSERT INTO NOTICE VALUES (11, '공지 제목 11', '이것은 공지 내용입니다 11', '2025-04-08', 'Y', NULL);
INSERT INTO NOTICE VALUES (12, '공지 제목 12', '이것은 공지 내용입니다 12', '2025-04-09', 'Y', NULL);
INSERT INTO NOTICE VALUES (13, '공지 제목 13', '이것은 공지 내용입니다 13', '2025-04-10', 'Y', NULL);
INSERT INTO NOTICE VALUES (14, '공지 제목 14', '이것은 공지 내용입니다 14', '2025-04-12', 'Y', NULL);
INSERT INTO NOTICE VALUES (15, '공지 제목 15', '이것은 공지 내용입니다 15', '2025-04-14', 'Y', NULL);
INSERT INTO NOTICE VALUES (16, '공지 제목 16', '이것은 공지 내용입니다 16', '2025-04-15', 'Y', NULL);
INSERT INTO NOTICE VALUES (17, '공지 제목 17', '이것은 공지 내용입니다 17', '2025-04-17', 'Y', NULL);
INSERT INTO NOTICE VALUES (18, '공지 제목 18', '이것은 공지 내용입니다 18', '2025-04-18', 'Y', NULL);
INSERT INTO NOTICE VALUES (19, '공지 제목 19', '이것은 공지 내용입니다 19', '2025-04-20', 'Y', NULL);
INSERT INTO NOTICE VALUES (20, '공지 제목 20', '이것은 공지 내용입니다 20', '2025-04-21', 'Y', NULL);
INSERT INTO NOTICE VALUES (21, '공지 제목 21', '이것은 공지 내용입니다 21', '2025-04-23', 'Y', NULL);
INSERT INTO NOTICE VALUES (22, '공지 제목 22', '이것은 공지 내용입니다 22', '2025-04-24', 'Y', NULL);
INSERT INTO NOTICE VALUES (23, '공지 제목 23', '이것은 공지 내용입니다 23', '2025-04-26', 'Y', NULL);
INSERT INTO NOTICE VALUES (24, '공지 제목 24', '이것은 공지 내용입니다 24', '2025-04-28', 'Y', NULL);
INSERT INTO NOTICE VALUES (25, '공지 제목 25', '이것은 공지 내용입니다 25', '2025-04-30', 'Y', NULL);
INSERT INTO NOTICE VALUES (26, '공지 제목 26', '이것은 공지 내용입니다 26', '2025-05-02', 'Y', NULL);
INSERT INTO NOTICE VALUES (27, '공지 제목 27', '이것은 공지 내용입니다 27', '2025-05-04', 'Y', NULL);
INSERT INTO NOTICE VALUES (28, '공지 제목 28', '이것은 공지 내용입니다 28', '2025-05-06', 'Y', NULL);
INSERT INTO NOTICE VALUES (29, '공지 제목 29', '이것은 공지 내용입니다 29', '2025-05-09', 'Y', NULL);
INSERT INTO NOTICE VALUES (30, '공지 제목 30', '이것은 공지 내용입니다 30', '2025-05-11', 'Y', NULL);
INSERT INTO NOTICE VALUES (31, '공지 제목 31', '이것은 공지 내용입니다 31', '2025-05-14', 'Y', NULL);
INSERT INTO NOTICE VALUES (32, '공지 제목 32', '이것은 공지 내용입니다 32', '2025-05-17', 'Y', NULL);
INSERT INTO NOTICE VALUES (33, '공지 제목 33', '이것은 공지 내용입니다 33', '2025-05-20', 'Y', NULL);
INSERT INTO NOTICE VALUES (34, '공지 제목 34', '이것은 공지 내용입니다 34', '2025-05-23', 'Y', NULL);
INSERT INTO NOTICE VALUES (35, '공지 제목 35', '이것은 공지 내용입니다 35', '2025-05-27', 'Y', NULL);

INSERT INTO MEMBER (MEMBER_ID, MEMBER_PWD, MEMBER_NAME, GENDER, BIRTH_DATE, EMAIL, PHONE, ADDRESS, ENROLL_DATE, STATUS) VALUES 
('user01', 'pwd123', '김철수', 'M', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'user01@example.com', '01012345678', '서울시 강남구 역삼동 123', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user02', 'pwd234', '이영희', 'F', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'user02@example.com', '01023456789', '부산시 해운대구 우동 456', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user03', 'pwd345', '박지민', 'M', TO_DATE('1995-03-22', 'YYYY-MM-DD'), 'user03@example.com', '01034567890', '대구시 수성구 범어동 789', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user04', 'pwd456', '최유리', 'F', TO_DATE('1992-07-10', 'YYYY-MM-DD'), 'user04@example.com', '01045678901', '인천시 연수구 송도동 321', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user05', 'pwd567', '정우성', 'M', TO_DATE('1987-12-25', 'YYYY-MM-DD'), 'user05@example.com', '01056789012', '광주시 북구 용봉동 654', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user06', 'pwd678', '한지민', 'F', TO_DATE('1993-11-11', 'YYYY-MM-DD'), 'user06@example.com', '01067890123', '대전시 서구 둔산동 987', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user07', 'pwd789', '송강', 'M', TO_DATE('1996-08-08', 'YYYY-MM-DD'), 'user07@example.com', '01078901234', '울산시 남구 삼산동 147', TO_DATE('2023-07-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user08', 'pwd890', '신세경', 'F', TO_DATE('1991-09-09', 'YYYY-MM-DD'), 'user08@example.com', '01089012345', '제주시 애월읍 고내리 258', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user09', 'pwd901', '강다니엘', 'M', TO_DATE('1997-12-12', 'YYYY-MM-DD'), 'user09@example.com', '01090123456', '세종시 도움4로 100', TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES 
('user10', 'pwd012', '수지', 'F', TO_DATE('1994-10-10', 'YYYY-MM-DD'), 'user10@example.com', '01001234567', '춘천시 석사동 777', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Y');



INSERT INTO MEMBER VALUES ('user11', 'pw1111', '임지민', 'M', TO_DATE('1990-02-02', 'YYYY-MM-DD'), 'user11@site.com', '01011112222', '서울시 은평구', TO_DATE('2023-01-11', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user12', 'pw2222', '홍윤아', 'F', TO_DATE('1991-04-03', 'YYYY-MM-DD'), 'user12@site.com', '01022223333', '부산시 남구', TO_DATE('2023-01-12', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user13', 'pw3333', '김민수', 'M', TO_DATE('1989-06-04', 'YYYY-MM-DD'), 'user13@site.com', '01033334444', '광주시 서구', TO_DATE('2023-01-13', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user14', 'pw4444', '이서진', 'M', TO_DATE('1992-08-05', 'YYYY-MM-DD'), 'user14@site.com', '01044445555', '인천시 계양구', TO_DATE('2023-01-14', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user15', 'pw5555', '박보검', 'M', TO_DATE('1993-10-06', 'YYYY-MM-DD'), 'user15@site.com', '01055556666', '수원시 팔달구', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user16', 'pw6666', '전지현', 'F', TO_DATE('1985-12-07', 'YYYY-MM-DD'), 'user16@site.com', '01066667777', '안양시 동안구', TO_DATE('2023-01-16', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user17', 'pw7777', '유아인', 'M', TO_DATE('1986-03-08', 'YYYY-MM-DD'), 'user17@site.com', '01077778888', '성남시 수정구', TO_DATE('2023-01-17', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user18', 'pw8888', '김태희', 'F', TO_DATE('1980-05-09', 'YYYY-MM-DD'), 'user18@site.com', '01088889999', '용인시 기흥구', TO_DATE('2023-01-18', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user19', 'pw9999', '소지섭', 'M', TO_DATE('1979-07-10', 'YYYY-MM-DD'), 'user19@site.com', '01099990000', '천안시 서북구', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user20', 'pw0000', '이지은', 'F', TO_DATE('1993-09-11', 'YYYY-MM-DD'), 'user20@site.com', '01000001111', '청주시 흥덕구', TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'Y');

INSERT INTO MEMBER VALUES ('user21', 'pwaaaa', '하정우', 'M', TO_DATE('1978-06-12', 'YYYY-MM-DD'), 'user21@site.com', '01022224444', '전주시 완산구', TO_DATE('2023-01-21', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user22', 'pwbbbb', '문채원', 'F', TO_DATE('1986-08-13', 'YYYY-MM-DD'), 'user22@site.com', '01033335555', '원주시 단구동', TO_DATE('2023-01-22', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user23', 'pwcccc', '정해인', 'M', TO_DATE('1988-10-14', 'YYYY-MM-DD'), 'user23@site.com', '01044446666', '경주시 황성동', TO_DATE('2023-01-23', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user24', 'pwdddd', '이하늬', 'F', TO_DATE('1983-12-15', 'YYYY-MM-DD'), 'user24@site.com', '01055557777', '포항시 남구', TO_DATE('2023-01-24', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user25', 'pweeee', '이민호', 'M', TO_DATE('1987-02-16', 'YYYY-MM-DD'), 'user25@site.com', '01066668888', '김해시 삼계동', TO_DATE('2023-01-25', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user26', 'pwffff', '이보영', 'F', TO_DATE('1979-04-17', 'YYYY-MM-DD'), 'user26@site.com', '01077779999', '아산시 배방읍', TO_DATE('2023-01-26', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user27', 'pwg123', '장기용', 'M', TO_DATE('1991-06-18', 'YYYY-MM-DD'), 'user27@site.com', '01088880000', '순천시 연향동', TO_DATE('2023-01-27', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user28', 'pwh456', '김소현', 'F', TO_DATE('1999-08-19', 'YYYY-MM-DD'), 'user28@site.com', '01099991111', '여수시 학동', TO_DATE('2023-01-28', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user29', 'pwi789', '도경수', 'M', TO_DATE('1993-10-20', 'YYYY-MM-DD'), 'user29@site.com', '01000002222', '목포시 상동', TO_DATE('2023-01-29', 'YYYY-MM-DD'), 'Y');
INSERT INTO MEMBER VALUES ('user30', 'pwj000', '강소라', 'F', TO_DATE('1990-12-21', 'YYYY-MM-DD'), 'user30@site.com', '01011113333', '창원시 성산구', TO_DATE('2023-01-30', 'YYYY-MM-DD'), 'Y');

COMMIT

DROP TABLE MEMBER

CREATE TABLE MEMBER (
  MEMBER_ID VARCHAR2(20) PRIMARY KEY,
  MEMBER_PWD VARCHAR2(20) NOT NULL,
  MEMBER_NAME VARCHAR2(18) NOT NULL,
  GENDER VARCHAR2(1),
  BIRTH_DATE DATE NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(11) NOT NULL,
  ADDRESS VARCHAR2(150) NOT NULL,
  ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
  STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y','N')) NOT NULL
);



COMMENT ON TABLE MEMBER IS '회원 정보 테이블';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원 아이디 (영문, 숫자 포함 6자 이상)';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호 (영문, 숫자, 특수문자 포함 8자 이상)';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원 이름 (최대 6글자)';
COMMENT ON COLUMN MEMBER.GENDER IS '회원 성별 (M 또는 F)';
COMMENT ON COLUMN MEMBER.BIRTH_DATE IS '회원 생년월일';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원 이메일 주소';
COMMENT ON COLUMN MEMBER.PHONE IS '회원 연락처 (숫자만 11자리)';
COMMENT ON COLUMN MEMBER.ADDRESS IS '회원 기본 배송지 주소';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원 가입일';
COMMENT ON COLUMN MEMBER.STATUS IS '회원 상태 (Y: 활성, N: 탈퇴)';

UPDATE MEMBER
   SET STATUS = 'N'
 WHERE MEMBER_ID = 
   AND STATUS = 'Y'

SELECT *
  FROM MEMBER
 WHERE MEMBER_ID =  'user02'
 
 
 
UPDATE MEMBER
   SET MEMBER_NAME = '김갑생'
     , GENDER = 'F'
     , BIRTH_DATE = '1989-10-01'
     , EMAIL = 'user02@example.com'
     , PHONE = '01041839810'
     , ADDRESS = '제주도 을령군'
  WHERE MEMBER_ID = 'user02'


SELECT NOTICE_NO
     , NOTICE_TITLE
     , NOTICE_CONTENT
     , NOTICE_DATE 
     , NOTICE_IMAGE
  FROM NOTICE
 WHERE NOTICE_NO = 1 
 
INSERT INTO PRODUCT VALUES (SEQ_PRODUCT.NEXTVAL
                          , ?
                          , ?
                          , ?
                          , NULL
                          , ?
                          , ?
                          , ?
                          , SYSDATE
                          , 'Y')
 
INSERT INTO PRODUCT_SIZE VALUES (SEQ_PRODUCT_SIZE.NEXTVAL
                                , SEQ_PRODUCT.CURRVAL
                                , ?
                                , ?)
                                
                                
 		SELECT COUNT(*)
 		  FROM PRODUCT
 		 WHERE PRODUCT_NAME LIKE '%상품%'

	SELECT PRODUCT_NO,
 			   PRODUCT_NAME,
 			   PRODUCT_PRICE,
 			   PRODUCT_CATEGORY,
 			   PRODUCT_CAPTION,
 			   PRODUCT_ORIGIN,
 			   PRODUCT_CHANGE,
 			   STATUS
 		FROM PRODUCT
 	   WHERE PRODUCT_NAME LIKE '%3%'
 	   ORDER BY PRODUCT_NO DESC 



SELECT 
    P.PRODUCT_NO,
    P.PRODUCT_NAME,
    P.PRODUCT_PRICE,
    P.PRODUCT_CATEGORY,
    P.PRODUCT_CAPTION,
    P.PRODUCT_ORIGIN,
    P.PRODUCT_CHANGE,
    P.STATUS,
    P.PRODUCT_SUB_CAPTION,
    PS.STOCK_COUNT
FROM PRODUCT P
JOIN PRODUCT_SIZE PS ON P.PRODUCT_NO = PS.PRODUCT_NO
WHERE P.PRODUCT_NO = 2
  AND PS.PRODUCT_SIZE = 'L';