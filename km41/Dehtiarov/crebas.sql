/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     25.10.2017 6:24:29                           */
/*==============================================================*/


alter table Credit
   drop constraint FK_CREDIT_WANT_TO_R_USER;

alter table Credit
   drop constraint "FK_CREDIT_WILL_BE_C_CREDIT P";

alter table "USER"
   drop constraint FK_USER_IS_ROLE;

drop index will_be_choosen_FK;

drop index want_to_rent_car_FK;

drop table Credit cascade constraints;

drop table "Credit plan" cascade constraints;

drop table Role cascade constraints;

drop index is_FK;

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: Credit                                                */
/*==============================================================*/
create table Credit 
(
   id_credit            INTEGER              not null,
   user_email           VARCHAR2(20)         not null,
   role_name            CLOB                 not null,
   credit_date          DATE                 not null,
   credit_name          VARCHAR2(20)         not null,
   date_of_start        DATE                 not null,
   range                DATE                 not null,
   value                VARCHAR2(30)         not null,
   status               CHAR(20)             not null,
   constraint PK_CREDIT primary key (id_credit)
);

/*==============================================================*/
/* Index: want_to_rent_car_FK                                   */
/*==============================================================*/
create index want_to_rent_car_FK on Credit (
   user_email ASC,
   role_name ASC
);

/*==============================================================*/
/* Index: will_be_choosen_FK                                    */
/*==============================================================*/
create index will_be_choosen_FK on Credit (
   credit_date ASC,
   credit_name ASC
);

/*==============================================================*/
/* Table: "Credit plan"                                         */
/*==============================================================*/
create table "Credit plan" 
(
   credit_date          DATE                 not null,
   credit_name          VARCHAR2(20)         not null,
   credit_description   VARCHAR2(100),
   credit_range         SMALLINT             not null,
   credit_value         SMALLINT             not null,
   credit_percent       SMALLINT             not null,
   constraint "PK_CREDIT PLAN" primary key (credit_date, credit_name)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role 
(
   role_name            CLOB                 not null,
   role_desc            CLOB,
   constraint PK_ROLE primary key (role_name)
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   user_password        VARCHAR2(20)         not null,
   user_email           VARCHAR2(20)         not null,
   role_name            CLOB                 not null,
   user_name            VARCHAR2(20)         not null,
   user_passport        VARCHAR2(8)          not null,
   user_IDcode          CHAR(12)             not null,
   user_phonenumber     CHAR(12)             not null,
   constraint PK_USER primary key (user_email, role_name)
);

/*==============================================================*/
/* Index: is_FK                                                 */
/*==============================================================*/
create index is_FK on "USER" (
   role_name ASC
);

alter table Credit
   add constraint FK_CREDIT_WANT_TO_R_USER foreign key (user_email, role_name)
      references "USER" (user_email, role_name);

alter table Credit
   add constraint "FK_CREDIT_WILL_BE_C_CREDIT P" foreign key (credit_date, credit_name)
      references "Credit plan" (credit_date, credit_name);

alter table "USER"
   add constraint FK_USER_IS_ROLE foreign key (role_name)
      references Role (role_name);

