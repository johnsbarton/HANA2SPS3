create column table "DW"."D_CHANNEL"
(
 "CHANNEL_ID" INTEGER   not null,
 "CHANNEL_NAME" VARCHAR(30)  ,
 "CHANNEL_TYPE" VARCHAR(4)  ,
 "CHANNEL_SUBTYPE" VARCHAR(8)  ,
 "CHANNEL_CONTACT" VARCHAR(30)  ,
 "CHANNEL_LOCATION" VARCHAR(30)  ,
 primary key cpbtree ("CHANNEL_ID"));

create column table "DW"."D_CUSTOMER"
(
 "CUSTOMER_ID" INTEGER   not null,
 "CUSTOMER_NUMBER" VARCHAR(20)  ,
 "CUSTOMER_FNAME" VARCHAR(30)  ,
 "CUSTOMER_LNAME" VARCHAR(30)  ,
 "TRW_NUMBER" VARCHAR(30)  ,
 "PHONE_NUMBER" VARCHAR(30)  ,
 "CITY" VARCHAR(30)  ,
 "STATE" VARCHAR(30)  ,
 "ZIP" VARCHAR(30)  ,
 "CUSTOMER_SCORE" INTEGER  ,
 "START_DATE" DATE  ,
 primary key cpbtree ("CUSTOMER_ID"));

create column table "DW"."D_LOCATION"
(
 "LOCATION_ID" INTEGER   not null,
 "STORE_NUMBER" INTEGER   not null,
 "STORE_NAME" VARCHAR(20)  ,
 "STATE" VARCHAR(20)  ,
 "CITY" VARCHAR(20)  ,
 "ZIP_CODE" VARCHAR(20)  ,
 "PHONE_NUMBER" VARCHAR(20)  ,
 primary key cpbtree ("LOCATION_ID"));

create column table "DW"."D_PRODUCT"
(
 "PRODUCT_ID" INTEGER   not null,
 "PRODUCT_NAME" VARCHAR(30)  ,
 "PRODUCT_TYPE" VARCHAR(10)  ,
 "PRODUCT_NUMBER" VARCHAR(20)  ,
 "CATEGORY" VARCHAR(20)  ,
 "SUBCATEGORY" VARCHAR(20)  ,
 "MANUFACTURER" VARCHAR(20)  ,
 "UPC_CODE" VARCHAR(20)  ,
 primary key cpbtree ("PRODUCT_ID"));

create column table "DW"."FACT_01"
(
 "CUSTOMER_ID" INTEGER  ,
 "LOCATION_ID" INTEGER  ,
 "PRODUCT_ID" INTEGER  ,
 "CHANNEL_ID" INTEGER  ,
 "ORDER_NUMBER" INTEGER  ,
 "PAYMENT_METHOD" VARCHAR(2)  ,
 "SALE_DATE" DATE  ,
 "SHIP_DATE" DATE  ,
 "DELIVERY_DATE" DATE  ,
 "SHIPPING" DECIMAL(12,4)  ,
 "DISCOUNT" DECIMAL(12,4)  ,
 "TAX" DECIMAL(12,4)  ,
 "TOTAL" DECIMAL(9,2)  ,
 "QUANTITY" INTEGER  ,
 "WEIGHT" DECIMAL(12,4)  ,
 "DURATION" INTEGER  ,
 "AUTHCODE" VARCHAR(8)  ,
 "TRANS_TIME" TIME  ,
 "CALL_TYPE" VARCHAR(1)  ,
 "SHIP_CODE" VARCHAR(6)  );

