/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10/25/2017 2:56:47 AM                        */
/*==============================================================*/


alter table Apartment
   drop constraint "FK_APARTMEN_OWN APART_USER";

alter table ApartmentPhoto
   drop constraint "FK_APARTMEN_HAVE PHOT_APARTMEN";

alter table BookApartments
   drop constraint "FK_BOOKAPAR_BOOK APAR_APARTMEN";

alter table BookApartments
   drop constraint "FK_BOOKAPAR_BOOK APAR_USER";

alter table BookFacilities
   drop constraint "FK_BOOKFACI_BOOK FACI_FACILITY";

alter table BookFacilities
   drop constraint "FK_BOOKFACI_BOOK FACI_USER";

alter table Facility
   drop constraint "FK_FACILITY_ORGANIZE _USER";

alter table "User"
   drop constraint "FK_USER_USER HAS _ROLE";

drop index "Own apartments_FK";

drop table Apartment cascade constraints;

drop index "Have photos_FK";

drop table ApartmentPhoto cascade constraints;

drop index "Book apartments_FK";

drop index "Book apartments2_FK";

drop table BookApartments cascade constraints;

drop index "Book facilities_FK";

drop index "Book facilities2_FK";

drop table BookFacilities cascade constraints;

drop index "Organize facilities_FK";

drop table Facility cascade constraints;

drop table Role cascade constraints;

drop index "user has a role_FK";

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: Apartment                                             */
/*==============================================================*/
create table Apartment 
(
   landlord_role_fk     CHAR(20)             not null,
   landlord_email_fk    CHAR(100)            not null,
   adress               CHAR(50)             not null,
   apartment_price      FLOAT(8)             not null,
   apartment_description CHAR(600)            not null,
   max_amount_dwellers  NUMBER(2)            not null,
   additional_number    NUMBER(15)           not null,
   constraint PK_APARTMENT primary key (landlord_role_fk, landlord_email_fk, adress)
);

/*==============================================================*/
/* Index: "Own apartments_FK"                                   */
/*==============================================================*/
create index "Own apartments_FK" on Apartment (
   landlord_role_fk ASC,
   landlord_email_fk ASC
);

/*==============================================================*/
/* Table: ApartmentPhoto                                        */
/*==============================================================*/
create table ApartmentPhoto 
(
   landlord_role_fk     CHAR(20)             not null,
   landlord_email_fk    CHAR(100)            not null,
   adress               CHAR(50)             not null,
   apartment_photo      BLOB                 not null,
   photo_desc           CHAR(140)            not null,
   constraint PK_APARTMENTPHOTO primary key (landlord_role_fk, landlord_email_fk, adress, apartment_photo)
);

/*==============================================================*/
/* Index: "Have photos_FK"                                      */
/*==============================================================*/
create index "Have photos_FK" on ApartmentPhoto (
   landlord_role_fk ASC,
   landlord_email_fk ASC,
   adress ASC
);

/*==============================================================*/
/* Table: BookApartments                                        */
/*==============================================================*/
create table BookApartments 
(
   landlord_role_fk     CHAR(20)             not null,
   landlord_email_fk    CHAR(100)            not null,
   adress_fk            CHAR(50)             not null,
   booker_role_fk       CHAR(20)             not null,
   booker_email_fk      CHAR(100)            not null,
   operation_date       DATE,
   constraint PK_BOOKAPARTMENTS primary key (landlord_role_fk, landlord_email_fk, adress_fk, booker_role_fk, booker_email_fk)
);

/*==============================================================*/
/* Index: "Book apartments2_FK"                                 */
/*==============================================================*/
create index "Book apartments2_FK" on BookApartments (
   booker_role_fk ASC,
   booker_email_fk ASC
);

/*==============================================================*/
/* Index: "Book apartments_FK"                                  */
/*==============================================================*/
create index "Book apartments_FK" on BookApartments (
   landlord_role_fk ASC,
   landlord_email_fk ASC,
   adress_fk ASC
);

/*==============================================================*/
/* Table: BookFacilities                                        */
/*==============================================================*/
create table BookFacilities 
(
   organizer_role_fk    CHAR(20)             not null,
   organizer_email_fk   CHAR(100)            not null,
   facility_id_fk       INTEGER              not null,
   booker_role_fk       CHAR(20)             not null,
   booker_email_fk      CHAR(100)            not null,
   date_of_operation    DATE                 not null,
   constraint PK_BOOKFACILITIES primary key (organizer_role_fk, organizer_email_fk, facility_id_fk, booker_role_fk, booker_email_fk)
);

/*==============================================================*/
/* Index: "Book facilities2_FK"                                 */
/*==============================================================*/
create index "Book facilities2_FK" on BookFacilities (
   booker_role_fk ASC,
   booker_email_fk ASC
);

/*==============================================================*/
/* Index: "Book facilities_FK"                                  */
/*==============================================================*/
create index "Book facilities_FK" on BookFacilities (
   organizer_role_fk ASC,
   organizer_email_fk ASC,
   facility_id_fk ASC
);

/*==============================================================*/
/* Table: Facility                                              */
/*==============================================================*/
create table Facility 
(
   organizer_role_fk    CHAR(20)             not null,
   organizer_email_fk   CHAR(100)            not null,
   facility_id          INTEGER              not null,
   facility_name        CHAR(30)             not null,
   facility_adress      CHAR(50)             not null,
   date_start           DATE                 not null,
   date_end             DATE                 not null,
   amount_of_tickets    NUMBER(6)            not null,
   facility_price       FLOAT(8)             not null,
   facility_description CHAR(600)            not null,
   constraint PK_FACILITY primary key (organizer_role_fk, organizer_email_fk, facility_id)
   constraint FACILITY_UNIQUE UNIQUE (facility_name, facility_adress)
);

/*==============================================================*/
/* Index: "Organize facilities_FK"                              */
/*==============================================================*/
create index "Organize facilities_FK" on Facility (
   organizer_role_fk ASC,
   organizer_email_fk ASC
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role 
(
   role_name            CHAR(20)             not null,
   role_description     CHAR(200),
   constraint PK_ROLE primary key (role_name)
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   role_name_fk         CHAR(20)             not null,
   email                CHAR(100)            not null,
   name                 CHAR(20)             not null,
   password             CHAR(25)             not null,
   phone_number         NUMBER(15)           not null,
   id_code              NUMBER(10),
   scan_doc             BLOB,
   constraint PK_USER primary key (role_name_fk, email)
);

/*==============================================================*/
/* Index: "user has a role_FK"                                  */
/*==============================================================*/
create index "user has a role_FK" on "User" (
   role_name_fk ASC
);

alter table Apartment
   add constraint "FK_APARTMEN_OWN APART_USER" foreign key (landlord_role_fk, landlord_email_fk)
      references "User" (role_name_fk, email);

alter table ApartmentPhoto
   add constraint "FK_APARTMEN_HAVE PHOT_APARTMEN" foreign key (landlord_role_fk, landlord_email_fk, adress)
      references Apartment (landlord_role_fk, landlord_email_fk, adress);

alter table BookApartments
   add constraint "FK_BOOKAPAR_BOOK APAR_APARTMEN" foreign key (landlord_role_fk, landlord_email_fk, adress_fk)
      references Apartment (landlord_role_fk, landlord_email_fk, adress);

alter table BookApartments
   add constraint "FK_BOOKAPAR_BOOK APAR_USER" foreign key (booker_role_fk, booker_email_fk)
      references "User" (role_name_fk, email);

alter table BookFacilities
   add constraint "FK_BOOKFACI_BOOK FACI_FACILITY" foreign key (organizer_role_fk, organizer_email_fk, facility_id_fk)
      references Facility (organizer_role_fk, organizer_email_fk, facility_id);

alter table BookFacilities
   add constraint "FK_BOOKFACI_BOOK FACI_USER" foreign key (booker_role_fk, booker_email_fk)
      references "User" (role_name_fk, email);

alter table Facility
   add constraint "FK_FACILITY_ORGANIZE _USER" foreign key (organizer_role_fk, organizer_email_fk)
      references "User" (role_name_fk, email);

alter table "User"
   add constraint "FK_USER_USER HAS _ROLE" foreign key (role_name_fk)
      references Role (role_name);

