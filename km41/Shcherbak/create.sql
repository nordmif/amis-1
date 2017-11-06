/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     06.11.2017 2:33:16                           */
/*==============================================================*/


alter table List
   drop constraint "FK_LIST_PRODUCTS _PRODUCTS";

alter table List
   drop constraint "FK_LIST_ÑREATION _USER";

alter table "Order"
   drop constraint "FK_ORDER_BOOKING A_LIST";

alter table "Products in shop"
   drop constraint "FK_PRODUCTS_OWNER OF _PRODUCT";

alter table "Products in shop"
   drop constraint "FK_PRODUCTS_SELLES PR_SHOP";

drop index "Products belong to the list_FK";

drop index "Ñreation of the list_FK";

drop table List cascade constraints;

drop table "Order" cascade constraints;

drop table Product cascade constraints;

drop index "Owner of the product_FK";

drop index "Selles products_FK";

drop table "Products in shop" cascade constraints;

drop table Shop cascade constraints;

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: List                                                  */
/*==============================================================*/
create table List 
(
   product_name         VARCHAR2(20)         not null,
   shop_id              INTEGER              not null,
   user_email           VARCHAR2(20)         not null,
   product_quantity     NUMBER(20)           not null,
   constraint PK_LIST primary key (product_name, shop_id, user_email)
);

/*==============================================================*/
/* Index: "Ñreation of the list_FK"                             */
/*==============================================================*/
create index "Ñreation of the list_FK" on List (
   user_email ASC
);

/*==============================================================*/
/* Index: "Products belong to the list_FK"                      */
/*==============================================================*/
create index "Products belong to the list_FK" on List (
   product_name ASC,
   shop_id ASC
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   product_name         VARCHAR2(20)         not null,
   shop_id              INTEGER              not null,
   user_email           VARCHAR2(20)         not null,
   order_date           DATE                 not null,
   constraint PK_ORDER primary key (product_name, shop_id, user_email)
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product 
(
   product_name         VARCHAR2(20)         not null,
   product_tm           VARCHAR2(30)         not null,
   product_country      VARCHAR2(20)         not null,
   product_price        NUMBER(8,2)          not null,
   product_category     VARCHAR2(20)         not null,
   product_photo        BLOB                 not null,
   constraint PK_PRODUCT primary key (product_name)
);

/*==============================================================*/
/* Table: "Products in shop"                                    */
/*==============================================================*/
create table "Products in shop" 
(
   product_name         VARCHAR2(20)         not null,
   shop_id              INTEGER              not null,
   adding_date          DATE                 not null,
   constraint "PK_PRODUCTS IN SHOP" primary key (product_name, shop_id)
);

/*==============================================================*/
/* Index: "Selles products_FK"                                  */
/*==============================================================*/
create index "Selles products_FK" on "Products in shop" (
   shop_id ASC
);

/*==============================================================*/
/* Index: "Owner of the product_FK"                             */
/*==============================================================*/
create index "Owner of the product_FK" on "Products in shop" (
   product_name ASC
);

/*==============================================================*/
/* Table: Shop                                                  */
/*==============================================================*/
create table Shop 
(
   shop_id              INTEGER              not null,
   shop_adress          VARCHAR2(40)         not null,
   shop_name            VARCHAR2(15)         not null,
   shop_email           VARCHAR2(30)         not null,
   shop_phone           NUMBER(15)           not null,
   shop_admin_name      VARCHAR2(40)         not null,
   shop_password        NUMBER(15)           not null,
   constraint PK_SHOP primary key (shop_id)
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_email           VARCHAR2(20)         not null,
   user_name            VARCHAR2(30)         not null,
   user_lastname        VARCHAR2(30)         not null,
   user_password        NUMBER(15)           not null,
   constraint PK_USER primary key (user_email)
);

alter table List
   add constraint "FK_LIST_PRODUCTS _PRODUCTS" foreign key (product_name, shop_id)
      references "Products in shop" (product_name, shop_id);

alter table List
   add constraint "FK_LIST_ÑREATION _USER" foreign key (user_email)
      references "User" (user_email);

alter table "Order"
   add constraint "FK_ORDER_BOOKING A_LIST" foreign key (product_name, shop_id, user_email)
      references List (product_name, shop_id, user_email);

alter table "Products in shop"
   add constraint "FK_PRODUCTS_OWNER OF _PRODUCT" foreign key (product_name)
      references Product (product_name);

alter table "Products in shop"
   add constraint "FK_PRODUCTS_SELLES PR_SHOP" foreign key (shop_id)
      references Shop (shop_id);

