/*==============================================================*/
/* DBMS name:      SAP HANA 2.0 Database                        */
/* Created on:     6/12/2018 5:53:51 PM                         */
/*==============================================================*/


alter table TRADECASHFLOW
   drop constraint FK_TRADECASHFLOW_TRADEHEADER;

alter table TRADEEVENT
   drop constraint FK_TRADEEVENT_TRADEHEADER;

drop table "tmp_TRADECASHFLOW" cascade;

rename table TRADECASHFLOW to "tmp_TRADECASHFLOW";

drop table "tmp_TRADEEVENT" cascade;

rename table TRADEEVENT to "tmp_TRADEEVENT";

drop table "tmp_TRADEHEADER" cascade;

rename table TRADEHEADER to "tmp_TRADEHEADER";

drop table VT_TRADECASHFLOW;

drop table VT_TRADEEVENT;

drop table VT_TRADEHEADER;

drop remote source IQDB1 cascade;

/*==============================================================*/
/* Table: TRADECASHFLOW                                         */
/*==============================================================*/
create column table TRADECASHFLOW (
   CASHFLOWID           DECIMAL(19,0)        not null,
   TRADEID              DECIMAL(19,0)        not null,
   LEGID                VARCHAR(1),
   CASHFLOWSTATUSID     VARCHAR(1),
   CASHFLOWTYPEID       VARCHAR(1),
   USERMODIFIEDFLAG     INTEGER,
   STARTDATE            DATE                 not null,
   ENDDATE              DATE                 not null,
   PAYMENTDATE          DATE,
   FIXINGDATE           DATE,
   RATE                 FLOAT,
   PRINCIPALAMOUNT      FLOAT,
   AMOUNT               FLOAT,
   LASTMODIFIEDDATETIME TIMESTAMP            not null,
   CAPTURESYSLASTMODIFDATETIME TIMESTAMP,
   CALCULATIONPERIODTYPEID VARCHAR(1),
   CURRENCYID           VARCHAR(3)           not null,
   TRADEEVENTID         DECIMAL(19,0)        not null,
   COMMENTS             VARCHAR(100),
   FACTOR               FLOAT,
   SPREAD               FLOAT,
   STRIKE               FLOAT,
   ISRESET              INTEGER,
   DAYCOUNTTYPEID       VARCHAR(1),
   CALCULATIONDAYS      INTEGER,
   LASTMODIFIEDUSERID   INTEGER,
   NOTIONALFIXINGDATE   DATE,
   FXRATE               FLOAT,
   ENDFXRATE            FLOAT,
   primary key cpbtree (CASHFLOWID, TRADEID)
);

insert into TRADECASHFLOW (CASHFLOWID, TRADEID, LEGID, CASHFLOWSTATUSID, CASHFLOWTYPEID, USERMODIFIEDFLAG, STARTDATE, ENDDATE, PAYMENTDATE, FIXINGDATE, RATE, PRINCIPALAMOUNT, AMOUNT, CALCULATIONPERIODTYPEID, CURRENCYID, TRADEEVENTID, COMMENTS, FACTOR, SPREAD, STRIKE, ISRESET, DAYCOUNTTYPEID, CALCULATIONDAYS, LASTMODIFIEDUSERID, NOTIONALFIXINGDATE, FXRATE, ENDFXRATE)
select CASHFLOWID, TRADEID, LEGID, CASHFLOWSTATUSID, CASHFLOWTYPEID, USERMODIFIEDFLAG, STARTDATE, ENDDATE, PAYMENTDATE, FIXINGDATE, RATE, PRINCIPALAMOUNT, AMOUNT, CALCULATIONPERIODTYPEID, CURRENCYID, TRADEEVENTID, COMMENTS, FACTOR, SPREAD, STRIKE, ISRESET, DAYCOUNTTYPEID, CALCULATIONDAYS, LASTMODIFIEDUSERID, NOTIONALFIXINGDATE, FXRATE, ENDFXRATE
from "tmp_TRADECASHFLOW";

/*==============================================================*/
/* Table: TRADEEVENT                                            */
/*==============================================================*/
create column table TRADEEVENT (
   TRADEEVENTID         DECIMAL(19,0)        not null,
   TRADEID              DECIMAL(19,0)        not null,
   CAPTURESYSTEMID      INTEGER              not null,
   CAPTURESYSTEMTRADEID VARCHAR(30)          not null,
   CAPTURESYSTEMPARENTTRADEID VARCHAR(30),
   LASTMODIFIEDDATETIME TIMESTAMP            not null,
   TRADEEVENTSTATUSID   VARCHAR(1)           not null,
   TRADEEVENTTYPEID     VARCHAR(1)           not null,
   EVENTDATE            DATE,
   EVENTSETTLEDATE      DATE,
   COUNTERPARTYID       INTEGER,
   QUANTITY             FLOAT,
   REMAININGQUANTITY    FLOAT,
   PARTIALFLAG          INTEGER              not null,
   RATE                 FLOAT,
   AMOUNT               FLOAT,
   CURRENCYID           VARCHAR(3),
   CAPTURESYSTEMTYPEOFEVENTID VARCHAR(1)           not null,
   CAPTURESYSLASTMODIFIEDDATETIME TIMESTAMP            not null,
   CREATEDUSERID        INTEGER              not null,
   CREATEDDATETIME      TIMESTAMP,
   LASTMODIFIEDUSERID   INTEGER              not null,
   COMMENTS             VARCHAR(100),
   CLIENTTRADEREFERENCE VARCHAR(255),
   COUNTERPARTYTRADEREFERENCE VARCHAR(50),
   CAPTUREMODEID        VARCHAR(1)           not null,
   DEALFUNCTIONID       INTEGER,
   EVENTTRADEDATE       DATE,
   EXECUTIONTIME        TIMESTAMP,
   EXECUTIONCOUNTRY     VARCHAR(6),
   CLOSINGPRICE         FLOAT,
   GTCFILECREATEDDATETIME TIMESTAMP,
   GTCLOADINSERTEDDATETIME TIMESTAMP,
   GTCIMPORTSTARTDATETIME TIMESTAMP,
   PREMIUMAMOUNT        FLOAT,
   CLEANPRICE           FLOAT,
   PRINCIPALAMOUNT      FLOAT,
   ACCRUEDINTERESTP     FLOAT,
   ACCRUEDINTERESTDAYSP FLOAT,
   ACCRUEDINTERESTR     FLOAT,
   ACCRUEDINTERESTDAYSR FLOAT,
   CLEANUNITPRICE       FLOAT,
   ORIGINALREMAININGQUANTITY FLOAT,
   ORIGINALQUANTITY     FLOAT,
   SETTLEMENTMODEID     VARCHAR(1),
   EXTERNALDEALID       VARCHAR(64),
   primary key cpbtree (TRADEEVENTID, TRADEID)
);

insert into TRADEEVENT (TRADEEVENTID, TRADEID, CAPTURESYSTEMID, CAPTURESYSTEMTRADEID, CAPTURESYSTEMPARENTTRADEID, TRADEEVENTSTATUSID, TRADEEVENTTYPEID, EVENTDATE, EVENTSETTLEDATE, COUNTERPARTYID, QUANTITY, REMAININGQUANTITY, PARTIALFLAG, RATE, AMOUNT, CURRENCYID, CAPTURESYSTEMTYPEOFEVENTID, CREATEDUSERID, LASTMODIFIEDUSERID, COMMENTS, CLIENTTRADEREFERENCE, COUNTERPARTYTRADEREFERENCE, CAPTUREMODEID, DEALFUNCTIONID, EVENTTRADEDATE, EXECUTIONCOUNTRY, CLOSINGPRICE, PREMIUMAMOUNT, CLEANPRICE, PRINCIPALAMOUNT, ACCRUEDINTERESTP, ACCRUEDINTERESTDAYSP, ACCRUEDINTERESTR, ACCRUEDINTERESTDAYSR, CLEANUNITPRICE, ORIGINALREMAININGQUANTITY, ORIGINALQUANTITY, SETTLEMENTMODEID, EXTERNALDEALID)
select TRADEEVENTID, TRADEID, CAPTURESYSTEMID, CAPTURESYSTEMTRADEID, CAPTURESYSTEMPARENTTRADEID, TRADEEVENTSTATUSID, TRADEEVENTTYPEID, EVENTDATE, EVENTSETTLEDATE, COUNTERPARTYID, QUANTITY, REMAININGQUANTITY, PARTIALFLAG, RATE, AMOUNT, CURRENCYID, CAPTURESYSTEMTYPEOFEVENTID, CREATEDUSERID, LASTMODIFIEDUSERID, COMMENTS, CLIENTTRADEREFERENCE, COUNTERPARTYTRADEREFERENCE, CAPTUREMODEID, DEALFUNCTIONID, EVENTTRADEDATE, EXECUTIONCOUNTRY, CLOSINGPRICE, PREMIUMAMOUNT, CLEANPRICE, PRINCIPALAMOUNT, ACCRUEDINTERESTP, ACCRUEDINTERESTDAYSP, ACCRUEDINTERESTR, ACCRUEDINTERESTDAYSR, CLEANUNITPRICE, ORIGINALREMAININGQUANTITY, ORIGINALQUANTITY, SETTLEMENTMODEID, EXTERNALDEALID
from "tmp_TRADEEVENT";

/*==============================================================*/
/* Table: TRADEHEADER                                           */
/*==============================================================*/
create column table TRADEHEADER (
   TRADEID              DECIMAL(19,0)        not null,
   LASTMODIFIEDDATETIME TIMESTAMP            not null,
   CAPTURESYSTEMID      INTEGER              not null,
   CAPTURESYSTEMTRADEID VARCHAR(32)          not null,
   TRADESTATUSID        VARCHAR(1)           not null,
   BLOCKNUMBER          INTEGER,
   FUNDID               INTEGER,
   PRIMEBROKERID        INTEGER,
   PRIMEBROKERACCOUNTID INTEGER,
   COUNTERPARTYID       INTEGER,
   STRATEGYID           INTEGER,
   TRADETYPEID          INTEGER,
   DESCRIPTION          VARCHAR(64),
   INTRACOMPANYFLAG     INTEGER,
   PRODUCTID            INTEGER,
   SECURITYID           INTEGER              not null,
   TRADEDIRECTIONID     VARCHAR(1),
   TRADEDATE            DATE,
   SETTLEDATE           DATE,
   MATURITYDATE         DATE,
   LIQUIDATIONDATE      DATE,
   EFFECTIVEDATE        DATE,
   TRADECURRENCYID      VARCHAR(3),
   QUANTITY             FLOAT,
   CURRENTQUANTITY      FLOAT,
   FACTOR               FLOAT,
   PRICE                FLOAT,
   ACCRUED              FLOAT,
   COMMISSIONAMOUNT     FLOAT,
   COMMISSIONRATE       FLOAT,
   COMMISSIONCURRENCYID VARCHAR(3),
   FEETYPEID            INTEGER,
   FEEAMOUNT            FLOAT,
   FEE2TYPEID           INTEGER,
   FEE2AMOUNT           FLOAT,
   SETTLECURRENCYID     VARCHAR(3),
   SETTLEFXRATEISINVERTED INTEGER,
   SETTLEFXRATE         FLOAT,
   NETAMOUNT            FLOAT,
   GROSSAMOUNT          FLOAT,
   FIXEDRATE            FLOAT,
   BASECURRENCYID       VARCHAR(3),
   TRADETIMEFXRATEISINVERTED INTEGER,
   TRADETIMEFXRATE      FLOAT,
   CLEARINGMODEID       INTEGER,
   CAPTURESYSLASTMODIFDATETIME TIMESTAMP,
   CREATEDUSERID        INTEGER              not null,
   CREATEDDATETIME      TIMESTAMP,
   LASTMODIFIEDUSERID   INTEGER              not null,
   CAPTURESYSTEMCURRENTTRADEID VARCHAR(30),
   CAPSYSCURRENTTYPEOFEVENTID VARCHAR(1),
   ASSOCIATEDCAPSYSTRADEID VARCHAR(32),
   CUSTOMTRADETYPEID    INTEGER,
   SETTLEMENTMODEID     VARCHAR(1),
   UNITQUANTITY         FLOAT,
   CORPORATEACTIONFLAG  INTEGER,
   BROKERID             INTEGER,
   INVESTMENTTYPEID     INTEGER,
   PAYMENTCOMMENT       VARCHAR(64),
   CONFIRMMETHODID      VARCHAR(1),
   MARGININGMETHODID    VARCHAR(1),
   INITIALMARGINAMOUNT  FLOAT,
   INITIALMARGINPERCENT FLOAT,
   INITIALMARGINCURRENCYID VARCHAR(3),
   OTCPOSITIONSTATUSID  VARCHAR(1),
   PURPOSE              VARCHAR(10),
   MIRRORFLAG           INTEGER              default 0 not null,
   TRADETYPECODE        VARCHAR(3),
   DEALID               INTEGER,
   CAPTURESYSTEMSECURITYID INTEGER,
   VARMARGINING         INTEGER,
   CENTRALCLEARINGID    INTEGER,
   SETTLEAMOUNT         FLOAT,
   TRADEBLOCKID         DECIMAL(19,0),
   CAPTURESYSTEMTRADEBLOCKID VARCHAR(32),
   TRADEBLOCKAMOUNT     FLOAT,
   FEECURRENCYID        VARCHAR(3),
   FEE2CURRENCYID       VARCHAR(3),
   MARGINTYPEID         VARCHAR(1),
   ACCRUALTYPE          VARCHAR(30),
   BREAKCLAUSEDATE      DATE,
   BREAKCLAUSEFREQUENCY VARCHAR(1),
   TRADEPOSITIONID      DECIMAL(19,0),
   ACCRUEDVALUE         FLOAT,
   ACCRUEDFACTOR        FLOAT,
   QUOTEDCLEAN          INTEGER,
   FINANCEDCLEAN        INTEGER,
   COLLATERALIZED       VARCHAR(1),
   INITIALFXRATE        FLOAT,
   primary key cpbtree (TRADEID)
);

insert into TRADEHEADER (TRADEID, CAPTURESYSTEMID, CAPTURESYSTEMTRADEID, TRADESTATUSID, BLOCKNUMBER, FUNDID, PRIMEBROKERID, PRIMEBROKERACCOUNTID, COUNTERPARTYID, STRATEGYID, TRADETYPEID, DESCRIPTION, INTRACOMPANYFLAG, PRODUCTID, SECURITYID, TRADEDIRECTIONID, TRADEDATE, SETTLEDATE, MATURITYDATE, LIQUIDATIONDATE, EFFECTIVEDATE, TRADECURRENCYID, QUANTITY, CURRENTQUANTITY, FACTOR, PRICE, ACCRUED, COMMISSIONAMOUNT, COMMISSIONRATE, COMMISSIONCURRENCYID, FEETYPEID, FEEAMOUNT, FEE2TYPEID, FEE2AMOUNT, SETTLECURRENCYID, SETTLEFXRATEISINVERTED, SETTLEFXRATE, NETAMOUNT, GROSSAMOUNT, FIXEDRATE, BASECURRENCYID, TRADETIMEFXRATEISINVERTED, TRADETIMEFXRATE, CLEARINGMODEID, CREATEDUSERID, LASTMODIFIEDUSERID, CAPTURESYSTEMCURRENTTRADEID, CAPSYSCURRENTTYPEOFEVENTID, ASSOCIATEDCAPSYSTRADEID, CUSTOMTRADETYPEID, SETTLEMENTMODEID, UNITQUANTITY, CORPORATEACTIONFLAG, BROKERID, INVESTMENTTYPEID, PAYMENTCOMMENT, CONFIRMMETHODID, MARGININGMETHODID, INITIALMARGINAMOUNT, INITIALMARGINPERCENT, INITIALMARGINCURRENCYID, OTCPOSITIONSTATUSID, PURPOSE, MIRRORFLAG, TRADETYPECODE, DEALID, CAPTURESYSTEMSECURITYID, VARMARGINING, CENTRALCLEARINGID, SETTLEAMOUNT, TRADEBLOCKID, CAPTURESYSTEMTRADEBLOCKID, TRADEBLOCKAMOUNT, FEECURRENCYID, FEE2CURRENCYID, MARGINTYPEID, ACCRUALTYPE, BREAKCLAUSEDATE, BREAKCLAUSEFREQUENCY, TRADEPOSITIONID, ACCRUEDVALUE, ACCRUEDFACTOR, QUOTEDCLEAN, FINANCEDCLEAN, COLLATERALIZED, INITIALFXRATE)
select TRADEID, CAPTURESYSTEMID, CAPTURESYSTEMTRADEID, TRADESTATUSID, BLOCKNUMBER, FUNDID, PRIMEBROKERID, PRIMEBROKERACCOUNTID, COUNTERPARTYID, STRATEGYID, TRADETYPEID, DESCRIPTION, INTRACOMPANYFLAG, PRODUCTID, SECURITYID, TRADEDIRECTIONID, TRADEDATE, SETTLEDATE, MATURITYDATE, LIQUIDATIONDATE, EFFECTIVEDATE, TRADECURRENCYID, QUANTITY, CURRENTQUANTITY, FACTOR, PRICE, ACCRUED, COMMISSIONAMOUNT, COMMISSIONRATE, COMMISSIONCURRENCYID, FEETYPEID, FEEAMOUNT, FEE2TYPEID, FEE2AMOUNT, SETTLECURRENCYID, SETTLEFXRATEISINVERTED, SETTLEFXRATE, NETAMOUNT, GROSSAMOUNT, FIXEDRATE, BASECURRENCYID, TRADETIMEFXRATEISINVERTED, TRADETIMEFXRATE, CLEARINGMODEID, CREATEDUSERID, LASTMODIFIEDUSERID, CAPTURESYSTEMCURRENTTRADEID, CAPSYSCURRENTTYPEOFEVENTID, ASSOCIATEDCAPSYSTRADEID, CUSTOMTRADETYPEID, SETTLEMENTMODEID, UNITQUANTITY, CORPORATEACTIONFLAG, BROKERID, INVESTMENTTYPEID, PAYMENTCOMMENT, CONFIRMMETHODID, MARGININGMETHODID, INITIALMARGINAMOUNT, INITIALMARGINPERCENT, INITIALMARGINCURRENCYID, OTCPOSITIONSTATUSID, PURPOSE, MIRRORFLAG, TRADETYPECODE, DEALID, CAPTURESYSTEMSECURITYID, VARMARGINING, CENTRALCLEARINGID, SETTLEAMOUNT, TRADEBLOCKID, CAPTURESYSTEMTRADEBLOCKID, TRADEBLOCKAMOUNT, FEECURRENCYID, FEE2CURRENCYID, MARGINTYPEID, ACCRUALTYPE, BREAKCLAUSEDATE, BREAKCLAUSEFREQUENCY, TRADEPOSITIONID, ACCRUEDVALUE, ACCRUEDFACTOR, QUOTEDCLEAN, FINANCEDCLEAN, COLLATERALIZED, INITIALFXRATE
from "tmp_TRADEHEADER";

