/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     12.11.2017 22:58:02                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ORDERITE_ORDERITEM_ЗАМОВЛЕН') then
    alter table Orderitem
       delete foreign key FK_ORDERITE_ORDERITEM_ЗАМОВЛЕН
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORDERITE_ORDERITEM_ТОВАР') then
    alter table Orderitem
       delete foreign key FK_ORDERITE_ORDERITEM_ТОВАР
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ЗАМОВЛЕН_USER_ORDE_КОРИСТУВ') then
    alter table Замовлення
       delete foreign key FK_ЗАМОВЛЕН_USER_ORDE_КОРИСТУВ
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ТОВАР_VENDORS_P_ПОСТАЧАЛ') then
    alter table Товар
       delete foreign key FK_ТОВАР_VENDORS_P_ПОСТАЧАЛ
end if;

drop index if exists Orderitem.Orderitem_FK;

drop index if exists Orderitem.Orderitem2_FK;

drop index if exists Orderitem.Orderitem_PK;

drop table if exists Orderitem;

drop index if exists Замовлення.user_order_FK;

drop index if exists Замовлення.Замовлення_PK;

drop table if exists Замовлення;

drop index if exists Користувач.Користувач_PK;

drop table if exists Користувач;

drop index if exists Постачальник.Постачальник_PK;

drop table if exists Постачальник;

drop index if exists Товар.vendors_prod_FK;

drop index if exists Товар.Товар_PK;

drop table if exists Товар;

/*==============================================================*/
/* Table: Orderitem                                             */
/*==============================================================*/
create table Orderitem 
(
   user_login           varchar(1024)                  not null,
   order_date           date                           not null,
   vendor_login         varchar(1024)                  not null,
   prod_name            varchar(1024)                  not null,
   constraint PK_ORDERITEM primary key (user_login, order_date, vendor_login, prod_name)
);

/*==============================================================*/
/* Index: Orderitem_PK                                          */
/*==============================================================*/
create unique index Orderitem_PK on Orderitem (
user_login ASC,
order_date ASC,
vendor_login ASC,
prod_name ASC
);

/*==============================================================*/
/* Index: Orderitem2_FK                                         */
/*==============================================================*/
create index Orderitem2_FK on Orderitem (
vendor_login ASC,
prod_name ASC
);

/*==============================================================*/
/* Index: Orderitem_FK                                          */
/*==============================================================*/
create index Orderitem_FK on Orderitem (
user_login ASC,
order_date ASC
);

/*==============================================================*/
/* Table: Замовлення                                            */
/*==============================================================*/
create table Замовлення 
(
   user_login           varchar(1024)                  not null,
   order_date           date                           not null,
   order_status         long varchar                   null,
   constraint PK_ЗАМОВЛЕННЯ primary key (user_login, order_date)
);

/*==============================================================*/
/* Index: Замовлення_PK                                         */
/*==============================================================*/
create unique index Замовлення_PK on Замовлення (
user_login ASC,
order_date ASC
);

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on Замовлення (
user_login ASC
);

/*==============================================================*/
/* Table: Користувач                                            */
/*==============================================================*/
create table Користувач 
(
   user_login           varchar(1024)                  not null,
   user_name            varchar(1024)                  null,
   user_password        varchar(1024)                  null,
   user_email           varchar(1024)                  null,
   user_phonenum        numeric(15)                    null,
   constraint PK_КОРИСТУВАЧ primary key (user_login)
);

/*==============================================================*/
/* Index: Користувач_PK                                         */
/*==============================================================*/
create unique index Користувач_PK on Користувач (
user_login ASC
);

/*==============================================================*/
/* Table: Постачальник                                          */
/*==============================================================*/
create table Постачальник 
(
   vendor_login         varchar(1024)                  not null,
   vendor_name          varchar(1024)                  null,
   vendor_phonenum      numeric(15)                    null,
   vendor_password      varchar(1024)                  null,
   vendor_email         varchar(1024)                  null,
   constraint PK_ПОСТАЧАЛЬНИК primary key (vendor_login)
);

/*==============================================================*/
/* Index: Постачальник_PK                                       */
/*==============================================================*/
create unique index Постачальник_PK on Постачальник (
vendor_login ASC
);

/*==============================================================*/
/* Table: Товар                                                 */
/*==============================================================*/
create table Товар 
(
   vendor_login         varchar(1024)                  not null,
   prod_name            varchar(1024)                  not null,
   prod_price           numeric(8)                     null,
   prod_info            varchar(1024)                  null,
   constraint PK_ТОВАР primary key (vendor_login, prod_name)
);

/*==============================================================*/
/* Index: Товар_PK                                              */
/*==============================================================*/
create unique index Товар_PK on Товар (
vendor_login ASC,
prod_name ASC
);

/*==============================================================*/
/* Index: vendors_prod_FK                                       */
/*==============================================================*/
create index vendors_prod_FK on Товар (
vendor_login ASC
);

alter table Orderitem
   add constraint FK_ORDERITE_ORDERITEM_ЗАМОВЛЕН foreign key (user_login, order_date)
      references Замовлення (user_login, order_date)
      on update restrict
      on delete restrict;

alter table Orderitem
   add constraint FK_ORDERITE_ORDERITEM_ТОВАР foreign key (vendor_login, prod_name)
      references Товар (vendor_login, prod_name)
      on update restrict
      on delete restrict;

alter table Замовлення
   add constraint FK_ЗАМОВЛЕН_USER_ORDE_КОРИСТУВ foreign key (user_login)
      references Користувач (user_login)
      on update restrict
      on delete restrict;

alter table Товар
   add constraint FK_ТОВАР_VENDORS_P_ПОСТАЧАЛ foreign key (vendor_login)
      references Постачальник (vendor_login)
      on update restrict
      on delete restrict;

