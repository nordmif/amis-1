/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     06.11.2017 9:11:03                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_VOTE_USER VIEW_USERS') then
    alter table Vote
       delete foreign key "FK_VOTE_USER VIEW_USERS"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VOTE_USER VIEW_VOTINGS') then
    alter table Vote
       delete foreign key "FK_VOTE_USER VIEW_VOTINGS"
end if;

drop index if exists Users.Users_PK;

drop table if exists Users;

drop index if exists Vote."user view votings and vote2_FK";

drop index if exists Vote."user view votings and vote_FK";

drop index if exists Vote."user view votings and vote_PK";

drop table if exists Vote;

drop index if exists Votings.Votings_PK;

drop table if exists Votings;

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users 
(
   User_email           long varchar                   not null,
   User_password        long varchar                   not null,
   User_name            long varchar                   not null,
   User_surname         long varchar                   not null,
   Admin_email          long varchar                   not null,
   constraint PK_USERS primary key (User_email)
);

/*==============================================================*/
/* Index: Users_PK                                              */
/*==============================================================*/
create unique index Users_PK on Users (
User_email ASC
);

/*==============================================================*/
/* Table: Vote                                                  */
/*==============================================================*/
create table Vote 
(
   User_email           long varchar                   not null,
   Voting_name          long varchar                   not null,
   "Voting_start date"  date                           not null,
   constraint PK_VOTE primary key clustered (User_email, Voting_name, "Voting_start date")
);

/*==============================================================*/
/* Index: "user view votings and vote_PK"                       */
/*==============================================================*/
create unique clustered index "user view votings and vote_PK" on Vote (
User_email ASC,
Voting_name ASC,
"Voting_start date" ASC
);

/*==============================================================*/
/* Index: "user view votings and vote_FK"                       */
/*==============================================================*/
create index "user view votings and vote_FK" on Vote (
User_email ASC
);

/*==============================================================*/
/* Index: "user view votings and vote2_FK"                      */
/*==============================================================*/
create index "user view votings and vote2_FK" on Vote (
Voting_name ASC,
"Voting_start date" ASC
);

/*==============================================================*/
/* Table: Votings                                               */
/*==============================================================*/
create table Votings 
(
   Voting_name          long varchar                   not null,
   "Voting_start date"  date                           not null,
   "Voting_finish date" date                           not null,
   Voting_question      long varchar                   not null,
   constraint PK_VOTINGS primary key (Voting_name, "Voting_start date")
);

/*==============================================================*/
/* Index: Votings_PK                                            */
/*==============================================================*/
create unique index Votings_PK on Votings (
Voting_name ASC,
"Voting_start date" ASC
);

alter table Vote
   add constraint "FK_VOTE_USER VIEW_USERS" foreign key (User_email)
      references Users (User_email)
      on update restrict
      on delete restrict;

alter table Vote
   add constraint "FK_VOTE_USER VIEW_VOTINGS" foreign key (Voting_name, "Voting_start date")
      references Votings (Voting_name, "Voting_start date")
      on update restrict
      on delete restrict;

