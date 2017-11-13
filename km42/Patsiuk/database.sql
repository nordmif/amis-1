/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     13.11.2017 3:38:49                           */
/*==============================================================*/


alter table DISHES
   drop constraint "FK_DISHES_TYPE OF D_TYPEDISH";

alter table "Dish in menu"
   drop constraint "FK_DISH IN _DISH IN M_DISHES";

alter table "Dish in menu"
   drop constraint "FK_DISH IN _DISH IN M_WEDDINGD";

alter table HALL
   drop constraint "FK_HALL_OWN HALL_USERS";

alter table "PhotoHall"
   drop constraint "FK_PHOTOHAL_PHOTO OF _HALL";

alter table "TypeHall"
   drop constraint "FK_TYPEHALL_TYPE OF H_HALL";

alter table USERS
   drop constraint "FK_USERS_USER ROLE_ROLE";

alter table "WeddingDay"
   drop constraint "FK_WEDDINGD_BE BRIDE_USERS";

alter table "WeddingDay"
   drop constraint "FK_WEDDINGD_BE BRIDEG_USERS";

alter table "WeddingDay"
   drop constraint "FK_WEDDINGD_HALL IN O_HALL";

drop index "Type of dish_FK";

drop table DISHES cascade constraints;

drop index "Dish in menu_FK";

drop index "Dish in menu2_FK";

drop table "Dish in menu" cascade constraints;

drop index "Own hall_FK";

drop table HALL cascade constraints;

drop index "Photo of hall_FK";

drop table "PhotoHall" cascade constraints;

drop table ROLE cascade constraints;

drop table "TypeDishe" cascade constraints;

drop index "Type of hall_FK";

drop table "TypeHall" cascade constraints;

drop index "User role`s_FK";

drop table USERS cascade constraints;

drop index "Be bride_FK";

drop index "Be bridegroom_FK";

drop index "Hall in order_FK";

drop table "WeddingDay" cascade constraints;

/*==============================================================*/
/* Table: DISHES                                                */
/*==============================================================*/
create table DISHES 
(
   "DISHES_name"        CHAR(20)             not null,
   "DISHES_type"        CHAR(20),
   "DISHES_weight"      FLOAT                not null,
   "DISHES_price"       FLOAT                not null,
   "DISHES_amount_people" FLOAT                not null,
   constraint PK_DISHES primary key ("DISHES_name")
);

/*==============================================================*/
/* Index: "Type of dish_FK"                                     */
/*==============================================================*/
create index "Type of dish_FK" on DISHES (
   "DISHES_type" ASC
);

/*==============================================================*/
/* Table: "Dish in menu"                                        */
/*==============================================================*/
create table "Dish in menu" 
(
   "DISHES_name"        CHAR(20)             not null,
   "data"               DATE                 not null,
   constraint "PK_DISH IN MENU" primary key ("DISHES_name", "data")
);

/*==============================================================*/
/* Index: "Dish in menu2_FK"                                    */
/*==============================================================*/
create index "Dish in menu2_FK" on "Dish in menu" (
   "data" ASC
);

/*==============================================================*/
/* Index: "Dish in menu_FK"                                     */
/*==============================================================*/
create index "Dish in menu_FK" on "Dish in menu" (
   "DISHES_name" ASC
);

/*==============================================================*/
/* Table: HALL                                                  */
/*==============================================================*/
create table HALL 
(
   "HALL_name"          CHAR(20)             not null,
   "HALL_address"       CHAR(20)             not null,
   "USERS_email"        CHAR(20),
   "HALL_area"          FLOAT                not null,
   "HALL_volume"        NUMBER               not null,
   "HALL_prise_for_hour" FLOAT                not null,
   constraint PK_HALL primary key ("HALL_address")
);

/*==============================================================*/
/* Index: "Own hall_FK"                                         */
/*==============================================================*/
create index "Own hall_FK" on HALL (
   "USERS_email" ASC
);

/*==============================================================*/
/* Table: "PhotoHall"                                           */
/*==============================================================*/
create table "PhotoHall" 
(
   "PhotoHall_photo"    BLOB                 not null,
   "HALL_address"       CHAR(20),
   "PhotoHall_desc"     CLOB,
   constraint PK_PHOTOHALL primary key ("PhotoHall_photo")
);

/*==============================================================*/
/* Index: "Photo of hall_FK"                                    */
/*==============================================================*/
create index "Photo of hall_FK" on "PhotoHall" (
   "HALL_address" ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE 
(
   "ROLE_type"          CHAR(20)             not null,
   constraint PK_ROLE primary key ("ROLE_type")
);

/*==============================================================*/
/* Table: "TypeDishe"                                           */
/*==============================================================*/
create table "TypeDishe" 
(
   "DISHES_type"        CHAR(20)             not null,
   constraint PK_TYPEDISHE primary key ("DISHES_type")
);

/*==============================================================*/
/* Table: "TypeHall"                                            */
/*==============================================================*/
create table "TypeHall" 
(
   "HALL_type"          CHAR(20)             not null,
   "HALL_address"       CHAR(20),
   constraint PK_TYPEHALL primary key ("HALL_type")
);

/*==============================================================*/
/* Index: "Type of hall_FK"                                     */
/*==============================================================*/
create index "Type of hall_FK" on "TypeHall" (
   "HALL_address" ASC
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS 
(
   "USERS_name"         CHAR(15)             not null,
   "USERS_surname"      CHAR(15)             not null,
   "USERS_phone"        NUMBER(10)           not null,
   "USERS_email"        CHAR(20)             not null,
   "ROLE_type"          CHAR(20),
   "USERS_pass"         CHAR(10)             not null,
   constraint PK_USERS primary key ("USERS_email")
);

/*==============================================================*/
/* Index: "User role`s_FK"                                      */
/*==============================================================*/
create index "User role`s_FK" on USERS (
   "ROLE_type" ASC
);

/*==============================================================*/
/* Table: "WeddingDay"                                          */
/*==============================================================*/
create table "WeddingDay" 
(
   "data"               DATE                 not null,
   "HALL_address"       CHAR(20),
   "USERS_email"        CHAR(20),
   "USE_USERS_email"    CHAR(20),
   constraint PK_WEDDINGDAY primary key ("data")
);

/*==============================================================*/
/* Index: "Hall in order_FK"                                    */
/*==============================================================*/
create index "Hall in order_FK" on "WeddingDay" (
   "HALL_address" ASC
);

/*==============================================================*/
/* Index: "Be bridegroom_FK"                                    */
/*==============================================================*/
create index "Be bridegroom_FK" on "WeddingDay" (
   "USERS_email" ASC
);

/*==============================================================*/
/* Index: "Be bride_FK"                                         */
/*==============================================================*/
create index "Be bride_FK" on "WeddingDay" (
   "USE_USERS_email" ASC
);

alter table DISHES
   add constraint "FK_DISHES_TYPE OF D_TYPEDISH" foreign key ("DISHES_type")
      references "TypeDishe" ("DISHES_type");

alter table "Dish in menu"
   add constraint "FK_DISH IN _DISH IN M_DISHES" foreign key ("DISHES_name")
      references DISHES ("DISHES_name");

alter table "Dish in menu"
   add constraint "FK_DISH IN _DISH IN M_WEDDINGD" foreign key ("data")
      references "WeddingDay" ("data");

alter table HALL
   add constraint "FK_HALL_OWN HALL_USERS" foreign key ("USERS_email")
      references USERS ("USERS_email");

alter table "PhotoHall"
   add constraint "FK_PHOTOHAL_PHOTO OF _HALL" foreign key ("HALL_address")
      references HALL ("HALL_address");

alter table "TypeHall"
   add constraint "FK_TYPEHALL_TYPE OF H_HALL" foreign key ("HALL_address")
      references HALL ("HALL_address");

alter table USERS
   add constraint "FK_USERS_USER ROLE_ROLE" foreign key ("ROLE_type")
      references ROLE ("ROLE_type");

alter table "WeddingDay"
   add constraint "FK_WEDDINGD_BE BRIDE_USERS" foreign key ("USE_USERS_email")
      references USERS ("USERS_email");

alter table "WeddingDay"
   add constraint "FK_WEDDINGD_BE BRIDEG_USERS" foreign key ("USERS_email")
      references USERS ("USERS_email");

alter table "WeddingDay"
   add constraint "FK_WEDDINGD_HALL IN O_HALL" foreign key ("HALL_address")
      references HALL ("HALL_address");

