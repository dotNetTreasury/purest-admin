/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/9/5 15:31:21                            */
/*==============================================================*/


drop table if exists PUREST_DICT_CATEGORY;

drop table if exists PUREST_DICT_DATA;

drop table if exists PUREST_FILE_RECORD;

drop table if exists PUREST_FUNCTION;

drop table if exists PUREST_FUNCTION_INTERFACE;

drop table if exists PUREST_INTERFACE;

drop table if exists PUREST_INTERFACE_GROUP;

drop table if exists PUREST_ORGANIZATION;

drop table if exists PUREST_ROLE;

drop table if exists PUREST_ROLE_FUNCTION;

drop table if exists PUREST_ROLE_INTERFACE;

drop table if exists PUREST_SYSTEM_CONFIG;

drop table if exists PUREST_USER;

drop table if exists PUREST_USER_ROLE;

/*==============================================================*/
/* Table: PUREST_DICT_CATEGORY                                  */
/*==============================================================*/
create table PUREST_DICT_CATEGORY
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(20) not null comment '��������',
   CODE                 varchar(40) not null comment '�������',
   primary key (ID),
   key AK_DIC_CODE (CODE)
);

alter table PUREST_DICT_CATEGORY comment '�ֵ����';

/*==============================================================*/
/* Table: PUREST_DICT_DATA                                      */
/*==============================================================*/
create table PUREST_DICT_DATA
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   CATEGORY_ID          numeric(19,0) not null comment '�ֵ����ID',
   NAME                 varchar(20) not null comment '�ֵ�����',
   SORT                 numeric(8,0) not null comment '����',
   primary key (ID)
);

alter table PUREST_DICT_DATA comment '�ֵ�����';

/*==============================================================*/
/* Table: PUREST_FILE_RECORD                                    */
/*==============================================================*/
create table PUREST_FILE_RECORD
(
   ID                   numeric(19,0) not null comment 'Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   FILE_NAME            varchar(1000) not null comment '�ļ���',
   FILE_SIZE            numeric(10) not null comment '�ļ���С',
   FILE_EXT             varchar(10) not null comment '�ļ���չ��',
   FULL_PATH            varchar(1000) not null comment '����·��',
   primary key (ID)
);

alter table PUREST_FILE_RECORD comment '�ļ��ϴ���¼��';

/*==============================================================*/
/* Table: PUREST_FUNCTION                                       */
/*==============================================================*/
create table PUREST_FUNCTION
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(20) not null comment '����',
   CODE                 varchar(40) not null comment '����',
   PARENT_ID            numeric(19,0) comment '������',
   primary key (ID)
);

alter table PUREST_FUNCTION comment '���ܱ�';

/*==============================================================*/
/* Table: PUREST_FUNCTION_INTERFACE                             */
/*==============================================================*/
create table PUREST_FUNCTION_INTERFACE
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   INTERFACE_ID         numeric(19,0) comment '�ӿ�ID',
   FUNCTION_ID          numeric(19,0) comment '����ID',
   primary key (ID)
);

alter table PUREST_FUNCTION_INTERFACE comment 'ҳ��ӿڱ�';

/*==============================================================*/
/* Table: PUREST_INTERFACE                                      */
/*==============================================================*/
create table PUREST_INTERFACE
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(20) not null comment '�ӿ�����',
   PATH                 varchar(200) not null comment '�ӿڵ�ַ',
   REQUEST_METHOD       varchar(20) comment '���󷽷�',
   GROUP_ID             numeric(19,0) comment '�ӿڷ���ID',
   primary key (ID),
   key AK_Key_2 (PATH, REQUEST_METHOD)
);

alter table PUREST_INTERFACE comment '�ӿڱ�';

/*==============================================================*/
/* Table: PUREST_INTERFACE_GROUP                                */
/*==============================================================*/
create table PUREST_INTERFACE_GROUP
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(20) comment '����',
   CODE                 varchar(40) not null comment '����',
   primary key (ID)
);

alter table PUREST_INTERFACE_GROUP comment '�ӿڷ����';

/*==============================================================*/
/* Table: PUREST_ORGANIZATION                                   */
/*==============================================================*/
create table PUREST_ORGANIZATION
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(100) not null comment '����',
   PARENT_ID            numeric(19,0) comment '����Id',
   TELEPHONE            varchar(20) comment '��ϵ�绰',
   LEADER               varchar(20) comment '������',
   SORT                 int comment '����',
   primary key (ID)
);

alter table PUREST_ORGANIZATION comment '��֯����';

/*==============================================================*/
/* Table: PUREST_ROLE                                           */
/*==============================================================*/
create table PUREST_ROLE
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(20) not null comment '��ɫ����',
   DESCRIPTION          varchar(200) comment '��ɫ����',
   primary key (ID),
   key AK_ROLE_ROLENAME (NAME)
);

alter table PUREST_ROLE comment '��ɫ';

/*==============================================================*/
/* Table: PUREST_ROLE_FUNCTION                                  */
/*==============================================================*/
create table PUREST_ROLE_FUNCTION
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   ROLE_ID              numeric(19,0) comment '��ɫID',
   FUNCTION_ID          numeric(19,0) comment '����ID',
   primary key (ID)
);

alter table PUREST_ROLE_FUNCTION comment '��ɫ���ܱ�';

/*==============================================================*/
/* Table: PUREST_ROLE_INTERFACE                                 */
/*==============================================================*/
create table PUREST_ROLE_INTERFACE
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   ROLE_ID              numeric(19,0) comment '��ɫID',
   INTERFACE_ID         numeric(19,0) comment '�ӿ�ID',
   primary key (ID)
);

alter table PUREST_ROLE_INTERFACE comment '��ɫ�ӿڱ�';

/*==============================================================*/
/* Table: PUREST_SYSTEM_CONFIG                                  */
/*==============================================================*/
create table PUREST_SYSTEM_CONFIG
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   NAME                 varchar(20) comment '����',
   CONFIG_CODE          varchar(40) comment '����',
   CONFIG_VALUE         varchar(1000) comment 'ֵ',
   primary key (ID)
);

alter table PUREST_SYSTEM_CONFIG comment 'ϵͳ���ñ�';

/*==============================================================*/
/* Table: PUREST_USER                                           */
/*==============================================================*/
create table PUREST_USER
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   ACCOUNT              varchar(36) not null comment '�˺�',
   PASSWORD             varchar(100) not null comment '����',
   NAME                 varchar(20) not null comment '��ʵ����',
   TELEPHONE            varchar(11) comment '�绰',
   EMAIL                varchar(20) comment '����',
   AVATAR               longblob comment 'ͷ��',
   ORGANIZATION_ID      numeric(19,0) not null comment '��֯����Id',
   primary key (ID),
   key AK_USER_ACCOUNT (ACCOUNT)
);

alter table PUREST_USER comment '�û�';

/*==============================================================*/
/* Table: PUREST_USER_ROLE                                      */
/*==============================================================*/
create table PUREST_USER_ROLE
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   ROLE_ID              numeric(19,0) not null comment '��ɫID',
   USER_ID              numeric(19,0) not null comment '�û�ID',
   primary key (ID)
);

alter table PUREST_USER_ROLE comment '�û���ɫ';

alter table PUREST_DICT_DATA add constraint FK_Reference_5 foreign key (CATEGORY_ID)
      references PUREST_DICT_CATEGORY (ID) on delete restrict on update restrict;

alter table PUREST_FUNCTION_INTERFACE add constraint FK_Reference_11 foreign key (FUNCTION_ID)
      references PUREST_FUNCTION (ID) on delete restrict on update restrict;

alter table PUREST_FUNCTION_INTERFACE add constraint FK_Reference_12 foreign key (INTERFACE_ID)
      references PUREST_INTERFACE (ID) on delete restrict on update restrict;

alter table PUREST_INTERFACE add constraint FK_Reference_17 foreign key (GROUP_ID)
      references PUREST_INTERFACE_GROUP (ID) on delete restrict on update restrict;

alter table PUREST_ORGANIZATION add constraint FK_Reference_8 foreign key (PARENT_ID)
      references PUREST_ORGANIZATION (ID) on delete restrict on update restrict;

alter table PUREST_ROLE_FUNCTION add constraint FK_Reference_15 foreign key (ROLE_ID)
      references PUREST_ROLE (ID) on delete restrict on update restrict;

alter table PUREST_ROLE_FUNCTION add constraint FK_Reference_16 foreign key (FUNCTION_ID)
      references PUREST_FUNCTION (ID) on delete restrict on update restrict;

alter table PUREST_ROLE_INTERFACE add constraint FK_Reference_13 foreign key (ROLE_ID)
      references PUREST_ROLE (ID) on delete restrict on update restrict;

alter table PUREST_ROLE_INTERFACE add constraint FK_Reference_14 foreign key (INTERFACE_ID)
      references PUREST_INTERFACE (ID) on delete restrict on update restrict;

alter table PUREST_USER add constraint FK_Reference_7 foreign key (ORGANIZATION_ID)
      references PUREST_ORGANIZATION (ID) on delete restrict on update restrict;

alter table PUREST_USER_ROLE add constraint FK_Reference_4 foreign key (ROLE_ID)
      references PUREST_ROLE (ID) on delete restrict on update restrict;

alter table PUREST_USER_ROLE add constraint FK_Reference_6 foreign key (USER_ID)
      references PUREST_USER (ID) on delete restrict on update restrict;

