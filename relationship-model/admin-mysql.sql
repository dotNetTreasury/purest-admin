/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2024/5/22 17:10:47                           */
/*==============================================================*/


drop table if exists PUREST_BACKGROUND_JOB_RECORD;

drop table if exists PUREST_DICT_CATEGORY;

drop table if exists PUREST_DICT_DATA;

drop table if exists PUREST_FILE_RECORD;

drop table if exists PUREST_FUNCTION;

drop table if exists PUREST_FUNCTION_INTERFACE;

drop table if exists PUREST_INTERFACE;

drop table if exists PUREST_INTERFACE_GROUP;

drop table if exists PUREST_NOTICE;

drop table if exists PUREST_NOTICE_RECORD;

drop table if exists PUREST_ORGANIZATION;

drop table if exists PUREST_REQUEST_LOG;

drop table if exists PUREST_ROLE;

drop table if exists PUREST_ROLE_FUNCTION;

drop table if exists PUREST_SYSTEM_CONFIG;

drop table if exists PUREST_USER;

drop table if exists PUREST_USER_ROLE;

/*==============================================================*/
/* Table: PUREST_BACKGROUND_JOB_RECORD                          */
/*==============================================================*/
create table PUREST_BACKGROUND_JOB_RECORD
(
   ID                   varchar(40) not null comment 'Id',
   JOB_NAME             varchar(128) not null comment '����',
   JOB_ARGS             longtext not null comment '����',
   TRY_COUNT            numeric comment '���Դ���',
   CREATION_TIME        datetime comment '����ʱ��',
   NEXT_TRY_TIME        datetime comment '�´�ִ��ʱ��',
   LAST_TRY_TIME        datetime comment '���ִ��ʱ��',
   IS_ABANDONED         numeric(1) comment '�Ƿ�ʱ',
   PRIORITY             numeric comment '���ȼ�',
   primary key (ID)
);

alter table PUREST_BACKGROUND_JOB_RECORD comment '��̨��ҵ��¼��';

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
   unique key UK_PUREST_CATEGORY_CODE (CODE)
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
   SORT                 numeric not null comment '����',
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
   CONTAINER_NAME       varchar(100) not null comment '��������',
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
   primary key (ID),
   unique key UK_PUREST_FUNCTION_CODE (CODE)
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
   REQUEST_METHOD       varchar(20) not null comment '���󷽷�',
   GROUP_ID             numeric(19,0) comment '�ӿڷ���ID',
   primary key (ID),
   unique key UK_INTERFACE_PATHMETHOD (PATH, REQUEST_METHOD)
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
   primary key (ID),
   unique key UK_PUREST_IG_CODE (CODE)
);

alter table PUREST_INTERFACE_GROUP comment '�ӿڷ����';

/*==============================================================*/
/* Table: PUREST_NOTICE                                         */
/*==============================================================*/
create table PUREST_NOTICE
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   TITLE                varchar(40) not null comment '����',
   CONTENT              longtext comment '����',
   NOTICE_TYPE          numeric(19,0) not null comment '����',
   LEVEL                numeric(19,0) comment '����',
   primary key (ID)
);

alter table PUREST_NOTICE comment '֪ͨ�����';

/*==============================================================*/
/* Table: PUREST_NOTICE_RECORD                                  */
/*==============================================================*/
create table PUREST_NOTICE_RECORD
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   RECEIVER             numeric(19,0) not null comment '������',
   IS_READ              numeric(1) not null comment '�Ƿ��Ѷ�',
   NOTICE_ID            numeric(19,0) not null comment '֪ͨ����Id',
   primary key (ID)
);

alter table PUREST_NOTICE_RECORD comment '֪ͨ�����¼��';

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
   PARENT_ID            numeric(19,0) comment '����ID',
   TELEPHONE            varchar(20) comment '��ϵ�绰',
   LEADER               varchar(20) comment '������',
   SORT                 numeric comment '����',
   primary key (ID),
   unique key UK_PUREST_ORG_NAME_PID (NAME, PARENT_ID)
);

alter table PUREST_ORGANIZATION comment '��֯����';

/*==============================================================*/
/* Table: PUREST_REQUEST_LOG                                    */
/*==============================================================*/
create table PUREST_REQUEST_LOG
(
   ID                   numeric(19,0) not null comment '����Id',
   CREATE_BY            numeric(19,0) not null comment '������',
   CREATE_TIME          datetime not null comment '����ʱ��',
   UPDATE_BY            numeric(19,0) comment '�޸���',
   UPDATE_TIME          datetime comment '�޸�ʱ��',
   REMARK               varchar(1000) comment '��ע',
   CONTROLLER_NAME      varchar(100) comment '������',
   ACTION_NAME          varchar(100) comment '������',
   REQUEST_METHOD       varchar(10) comment '��������',
   ENVIRONMENT_NAME     varchar(20) comment '����������',
   ELAPSED_TIME         numeric(16,0) comment 'ִ�к�ʱ',
   CLIENT_IP            varchar(20) comment '�ͻ���IP',
   primary key (ID)
);

alter table PUREST_REQUEST_LOG comment '������־��';

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
   unique key UK_PUREST_ROLE_NAME (NAME)
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
   CONFIG_CODE          varchar(40) not null comment '����',
   CONFIG_VALUE         varchar(1000) comment 'ֵ',
   primary key (ID),
   unique key UK_PUREST_CONFIG_CODE (CONFIG_CODE)
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
   STATUS               numeric comment '״̬',
   ORGANIZATION_ID      numeric(19,0) not null comment '��֯����Id',
   primary key (ID),
   unique key UK_PUREST_USER_ACCOUNT (ACCOUNT)
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

alter table PUREST_NOTICE_RECORD add constraint FK_Reference_13 foreign key (NOTICE_ID)
      references PUREST_NOTICE (ID) on delete restrict on update restrict;

alter table PUREST_ORGANIZATION add constraint FK_Reference_14 foreign key (PARENT_ID)
      references PUREST_ORGANIZATION (ID) on delete restrict on update restrict;

alter table PUREST_ROLE_FUNCTION add constraint FK_Reference_15 foreign key (ROLE_ID)
      references PUREST_ROLE (ID) on delete restrict on update restrict;

alter table PUREST_ROLE_FUNCTION add constraint FK_Reference_16 foreign key (FUNCTION_ID)
      references PUREST_FUNCTION (ID) on delete restrict on update restrict;

alter table PUREST_USER add constraint FK_Reference_7 foreign key (ORGANIZATION_ID)
      references PUREST_ORGANIZATION (ID) on delete restrict on update restrict;

alter table PUREST_USER_ROLE add constraint FK_Reference_4 foreign key (ROLE_ID)
      references PUREST_ROLE (ID) on delete restrict on update restrict;

alter table PUREST_USER_ROLE add constraint FK_Reference_6 foreign key (USER_ID)
      references PUREST_USER (ID) on delete restrict on update restrict;

