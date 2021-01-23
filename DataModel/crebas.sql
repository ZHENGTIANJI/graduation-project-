/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2021/1/22 10:40:06                           */
/*==============================================================*/


drop table if exists QR_code;

drop table if exists binding_type;

drop table if exists book;

drop table if exists book_type;

drop table if exists borrow;

drop table if exists borrow_type;

drop table if exists data;

drop table if exists data_type;

drop table if exists file_att;

drop table if exists journal;

drop table if exists journal_type;

drop table if exists language;

drop table if exists major;

drop table if exists paper;

drop table if exists paper_type;

drop table if exists "user";

/*==============================================================*/
/* Table: QR_code                                               */
/*==============================================================*/
create table QR_code 
(
   id                   int                            not null,
   QR_code              varchar(10)                    null,
   constraint PK_QR_CODE primary key clustered (id)
);

/*==============================================================*/
/* Table: binding_type                                          */
/*==============================================================*/
create table binding_type 
(
   id                   int                            null,
   name                 varchar(100)                   null
);

/*==============================================================*/
/* Table: book                                                  */
/*==============================================================*/
create table book 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   book_type_id         int                            null,
   major_type_id        int                            null,
   QR_code              varchar(10)                    null,
   publisher            varchar(100)                   null,
   publish_dt           datetime                       null,
   author               varchar(100)                   null,
   stock_dt             datetime                       null,
   teacher              varchar(100)                   null,
   number               int                            null,
   CD                   varchar(2)                     null,
   location             varchar(100)                   null,
   status               varchar(100)                   null,
   book_number          varchar(100)                   null,
   format               varchar(100)                   null,
   price                varchar(100)                   null,
   number_of_page       int                            null,
   binding_type         varchar(100)                   null,
   language             varchar(100)                   null,
   note                 varchar(1000)                  null,
   constraint PK_BOOK primary key clustered (id)
);

/*==============================================================*/
/* Table: book_type                                             */
/*==============================================================*/
create table book_type 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_BOOK_TYPE primary key clustered (id)
);

/*==============================================================*/
/* Table: borrow                                                */
/*==============================================================*/
create table borrow 
(
   id                   int                            not null,
   borrower_id          int                            null,
   borrow_dt            datetime                       null,
   QR_code              varchar(100)                   null,
   borrow_type_id       int                            null,
   return_dt            datetime                       null,
   is_return            varchar(100)                   null,
   deadline             datetime                       null,
   constraint PK_BORROW primary key clustered (id)
);

/*==============================================================*/
/* Table: borrow_type                                           */
/*==============================================================*/
create table borrow_type 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_BORROW_TYPE primary key clustered (id)
);

/*==============================================================*/
/* Table: data                                                  */
/*==============================================================*/
create table data 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   data_type_id         int                            null,
   QR_code              varchar(10)                    null,
   unit                 varchar(100)                   null,
   stock_dt             datetime                       null,
   location             varchar(100)                   null,
   number               int                            null,
   class_number         varchar(100)                   null,
   language             varchar(100)                   null,
   compile_dt           datetime                       null,
   format               int                            null,
   number_of_page       varchar(100)                   null,
   author               varchar(100)                   null,
   major_id             int                            null,
   note                 varchar(100)                   null,
   constraint PK_DATA primary key clustered (id)
);

/*==============================================================*/
/* Table: data_type                                             */
/*==============================================================*/
create table data_type 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_DATA_TYPE primary key clustered (id)
);

/*==============================================================*/
/* Table: file_att                                              */
/*==============================================================*/
create table file_att 
(
   id                   int                            not null,
   physical_name        varchar(100)                   not null,
   display_name         varchar(100)                   null,
   extension_name       varchar(100)                   null,
   file_size            varchar(100)                   null,
   url                  varchar(100)                   null,
   uploader_id          int                            null,
   uploaded_dt          datetime                       null,
   paper_id             int                            null,
   constraint PK_FILE_ATT primary key clustered (id)
);

/*==============================================================*/
/* Table: journal                                               */
/*==============================================================*/
create table journal 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   journal_type_id      int                            null,
   grade                varchar(20)                    null,
   publish_dt           datetime                       null,
   stock_dt             datetime                       null,
   major_id             int                            null,
   period               varchar(100)                   null,
   office_name          varchar(100)                   null,
   QR_code              varchar(10)                    null,
   language             varchar(100)                   null,
   class_number         varchar(100)                   null,
   location             varchar(100)                   null,
   number               varchar(100)                   null,
   address              varchar(100)                   null,
   organization         varchar(100)                   null,
   note                 varchar(100)                   null,
   constraint PK_JOURNAL primary key clustered (id)
);

/*==============================================================*/
/* Table: journal_type                                          */
/*==============================================================*/
create table journal_type 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_JOURNAL_TYPE primary key clustered (id)
);

/*==============================================================*/
/* Table: language                                              */
/*==============================================================*/
create table language 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_LANGUAGE primary key clustered (id)
);

/*==============================================================*/
/* Table: major                                                 */
/*==============================================================*/
create table major 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_MAJOR primary key clustered (id)
);

/*==============================================================*/
/* Table: paper                                                 */
/*==============================================================*/
create table paper 
(
   id                   int                            null,
   name                 varchar(100)                   null,
   author               varchar(100)                   null,
   adviser              varchar(100)                   null,
   xuezhi               varchar(10)                    null,
   paper_type_id        int                            null,
   direction            varchar(100)                   null,
   major_id             int                            null,
   dabian_dt            datetime                       null,
   stock_dt             datetime                       null,
   location             varchar(100)                   null,
   status               varchar(4)                     null,
   QR_code              varchar(10)                    null,
   class_number         varchar(100)                   null,
   format               varchar(100)                   null,
   numvber_of_page      int                            null,
   language             varchar(100)                   null,
   note                 varchar(100)                   null
);

/*==============================================================*/
/* Table: paper_type                                            */
/*==============================================================*/
create table paper_type 
(
   id                   int                            not null,
   name                 varchar(100)                   null,
   constraint PK_PAPER_TYPE primary key clustered (id)
);

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table "user" 
(
   id                   int                            null,
   name                 varchar(100)                   null
);

