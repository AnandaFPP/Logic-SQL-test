CREATE TABLE CUSTOMER (
    CUST_ID BIGINT UNIQUE NOT NULL PRIMARY KEY,
    CUST_FIRSTNAME VARCHAR(30) NOT NULL,
    CUST_LASTNAME VARCHAR(30),
    CUST_BIRTHDATE DATE,
    CUST_GENDER CHAR(1) NOT NULL,
    CUST_ADDRESS VARCHAR(50),
    CUST_CITY VARCHAR(50),
    CUST_POSTCODE CHAR(5)
);
CREATE TABLE ACCOUNT (
    ACC_NUMBER CHAR(13) UNIQUE NOT NULL PRIMARY KEY,
    ACC_OWNER BIGINT NOT NULL,
    ACC_DATE_CREATED DATE NOT NULL,
    ACC_BALANCE DECIMAL(10, 0) NOT NULL,
    FOREIGN KEY (CUST_ID) REFERENCES (CUSTOMER.CUST_ID)
);
CREATE TABLE TRANSACTION (
    TRS_ID BIGINT UNIQUE NOT NULL PRIMARY KEY,
    TRS_FROM_ACCOUNT CHAR(13) NOT NULL,
    TRS_DATE DATE NOT NULL,
    TRS_AMOUNT DECIMAL(10, 0) NOT NULL,
    TRS_TYPE CHAR(2) NOT NULL,
    FOREIGN KEY (ACC_NUMBER) REFERENCES (ACCOUNT)
);
CREATE TABLE TRANSACTION_TRANSFER (
    TRS_ID BIGINT NOT NULL PRIMARY KEY,
    TRS_TO_ACCOUNT CHAR(13) NOT NULL,
    TRS_STATUS CHAR(1) NOT NULL,
    FOREIGN KEY (ACC_NUMBER) REFERENCES (ACCOUNT)
);
-- PENAMBAHAN DATA DALAM TABLE ACCOUNT
INSERT INTO ACCOUNT(
        ACC_NUMBER,
        ACC_OWNER,
        ACC_DATE_CREATED,
        ACC_BALANCE
    )
VALUES('1111122222333', 2, now(), 1000000);
INSERT INTO ACCOUNT(
        ACC_NUMBER,
        ACC_OWNER,
        ACC_DATE_CREATED,
        ACC_BALANCE
    )
VALUES('1231231231231', 2, now(), 2000000);
INSERT INTO ACCOUNT(
        ACC_NUMBER,
        ACC_OWNER,
        ACC_DATE_CREATED,
        ACC_BALANCE
    )
VALUES('1234512345123', 1, now(), 1000000000);
-- PENAMBAHAN DATA DALAM TABLE CUSTOMER
INSERT INTO CUSTOMER(
        CUST_ID,
        CUST_FIRSTNAME,
        CUST_LASTNAME,
        CUST_BIRTHDATE,
        CUST_GENDER,
        CUST_ADDRESS,
        CUST_CITY,
        CUST_POSTCODE
    )
VALUES(
        1,
        "Ananda",
        "Fadhilah",
        "2001-04-14",
        1,
        "Sultan alauddin",
        "Makassar",
        "90231"
    );
INSERT INTO CUSTOMER(
        CUST_ID,
        CUST_FIRSTNAME,
        CUST_LASTNAME,
        CUST_BIRTHDATE,
        CUST_GENDER,
        CUST_ADDRESS,
        CUST_CITY,
        CUST_POSTCODE
    )
VALUES(
        2,
        "John",
        "Michael",
        "2001-04-13",
        1,
        "Antang",
        "Makassar",
        "90235"
    );
-- PENAMBAHAN DATA DALAM TABLE TRANSACTION
INSERT INTO TRANSACTION(
        TRS_ID,
        TRS_FROM_ACCOUNT,
        TRS_DATE,
        TRS_AMOUNT,
        TRS_TYPE
    )
VALUES(1, '1111122222333', now(), 100000, "TF");
INSERT INTO TRANSACTION(
        TRS_ID,
        TRS_FROM_ACCOUNT,
        TRS_DATE,
        TRS_AMOUNT,
        TRS_TYPE
    )
VALUES(2, '1234512345123', now(), 200000, "DB");
INSERT INTO TRANSACTION(
        TRS_ID,
        TRS_FROM_ACCOUNT,
        TRS_DATE,
        TRS_AMOUNT,
        TRS_TYPE
    )
VALUES(3, '1111122222333', now(), 1500000, "TF");
-- PENAMBAHAN DATA DALAM TABLE TRANSACTION_TRANSFER
INSERT INTO TRANSACTION_TRANSFER(TRS_ID, TRS_TO_ACCOUNT, TRS_STATUS)
VALUES(1, '1231231231231', 1);
-- Nomor 1
SELECT C.CUST_ID,
    C.CUST_FIRSTNAME,
    C.CUST_LASTNAME,
    COUNT(A.ACC_NUMBER) AS JUMLAH_REKENING
FROM CUSTOMER C
    LEFT JOIN ACCOUNT A ON C.CUST_ID = A.ACC_OWNER
GROUP BY C.CUST_ID,
    C.CUST_FIRSTNAME,
    C.CUST_LASTNAME;
-- Nomor 2
SELECT ACCOUNT.ACC_NUMBER,
    TRANSACTION.TRS_DATE
from TRANSACTION
    LEFT JOIN ACCOUNT on ACCOUNT.ACC_NUMBER = TRANSACTION.TRS_FROM_ACCOUNT
    LEFT JOIN CUSTOMER ON ACCOUNT.acc_owner = CUSTOMER.CUST_ID
WHERE CUSTOMER.CUST_FIRSTNAME = 'John'
    AND CUSTOMER.CUST_LASTNAME = 'Michael'
ORDER BY ACCOUNT.ACC_NUMBER,
    TRANSACTION.TRS_DATE;