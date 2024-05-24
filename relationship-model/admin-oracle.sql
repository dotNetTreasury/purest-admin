/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2024/5/22 17:15:29                           */
/*==============================================================*/


alter table PUREST_DICT_DATA
   drop constraint FK_PUREST_D_REFERENCE_PUREST_D;

alter table PUREST_FUNCTION_INTERFACE
   drop constraint FK_PUREST_F_REFERENCE_PUREST_F;

alter table PUREST_FUNCTION_INTERFACE
   drop constraint FK_PUREST_F_REFERENCE_PUREST_I;

alter table PUREST_INTERFACE
   drop constraint FK_PUREST_I_REFERENCE_PUREST_I;

alter table PUREST_NOTICE_RECORD
   drop constraint FK_PUREST_N_REFERENCE_PUREST_N;

alter table PUREST_ORGANIZATION
   drop constraint FK_PUREST_O_REFERENCE_PUREST_O;

alter table PUREST_ROLE_FUNCTION
   drop constraint FK_PUREST_R_REFERENCE_PUREST_R;

alter table PUREST_ROLE_FUNCTION
   drop constraint FK_PUREST_R_REFERENCE_PUREST_F;

alter table PUREST_USER
   drop constraint FK_PUREST_U_REFERENCE_PUREST_O;

alter table PUREST_USER_ROLE
   drop constraint FK_PUREST_U_REFERENCE_PUREST_R;

alter table PUREST_USER_ROLE
   drop constraint FK_PUREST_U_REFERENCE_PUREST_U;

drop table PUREST_BACKGROUND_JOB_RECORD cascade constraints;

drop table PUREST_DICT_CATEGORY cascade constraints;

drop table PUREST_DICT_DATA cascade constraints;

drop table PUREST_FILE_RECORD cascade constraints;

drop table PUREST_FUNCTION cascade constraints;

drop table PUREST_FUNCTION_INTERFACE cascade constraints;

drop table PUREST_INTERFACE cascade constraints;

drop table PUREST_INTERFACE_GROUP cascade constraints;

drop table PUREST_NOTICE cascade constraints;

drop table PUREST_NOTICE_RECORD cascade constraints;

drop table PUREST_ORGANIZATION cascade constraints;

drop table PUREST_REQUEST_LOG cascade constraints;

drop table PUREST_ROLE cascade constraints;

drop table PUREST_ROLE_FUNCTION cascade constraints;

drop table PUREST_SYSTEM_CONFIG cascade constraints;

drop table PUREST_USER cascade constraints;

drop table PUREST_USER_ROLE cascade constraints;

/*==============================================================*/
/* Table: PUREST_BACKGROUND_JOB_RECORD                          */
/*==============================================================*/
create table PUREST_BACKGROUND_JOB_RECORD 
(
   ID                   VARCHAR2(40)         not null,
   JOB_NAME             VARCHAR2(128)        not null,
   JOB_ARGS             CLOB                 not null,
   TRY_COUNT            NUMBER,
   CREATION_TIME        DATE,
   NEXT_TRY_TIME        DATE,
   LAST_TRY_TIME        DATE,
   IS_ABANDONED         NUMBER(1),
   PRIORITY             NUMBER,
   constraint PK_PUREST_BACKGROUND_JOB_RECOR primary key (ID)
);

comment on table PUREST_BACKGROUND_JOB_RECORD is
'��̨��ҵ��¼��';

comment on column PUREST_BACKGROUND_JOB_RECORD.ID is
'Id';

comment on column PUREST_BACKGROUND_JOB_RECORD.JOB_NAME is
'����';

comment on column PUREST_BACKGROUND_JOB_RECORD.JOB_ARGS is
'����';

comment on column PUREST_BACKGROUND_JOB_RECORD.TRY_COUNT is
'���Դ���';

comment on column PUREST_BACKGROUND_JOB_RECORD.CREATION_TIME is
'����ʱ��';

comment on column PUREST_BACKGROUND_JOB_RECORD.NEXT_TRY_TIME is
'�´�ִ��ʱ��';

comment on column PUREST_BACKGROUND_JOB_RECORD.LAST_TRY_TIME is
'���ִ��ʱ��';

comment on column PUREST_BACKGROUND_JOB_RECORD.IS_ABANDONED is
'�Ƿ�ʱ';

comment on column PUREST_BACKGROUND_JOB_RECORD.PRIORITY is
'���ȼ�';

/*==============================================================*/
/* Table: PUREST_DICT_CATEGORY                                  */
/*==============================================================*/
create table PUREST_DICT_CATEGORY 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(20)         not null,
   CODE                 VARCHAR2(40)         not null,
   constraint PK_PUREST_DICT_CATEGORY primary key (ID),
   constraint UK_PUREST_CATEGORY_CODE unique (CODE)
);

comment on table PUREST_DICT_CATEGORY is
'�ֵ����';

comment on column PUREST_DICT_CATEGORY.ID is
'����Id';

comment on column PUREST_DICT_CATEGORY.CREATE_BY is
'������';

comment on column PUREST_DICT_CATEGORY.CREATE_TIME is
'����ʱ��';

comment on column PUREST_DICT_CATEGORY.UPDATE_BY is
'�޸���';

comment on column PUREST_DICT_CATEGORY.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_DICT_CATEGORY.REMARK is
'��ע';

comment on column PUREST_DICT_CATEGORY.NAME is
'��������';

comment on column PUREST_DICT_CATEGORY.CODE is
'�������';

/*==============================================================*/
/* Table: PUREST_DICT_DATA                                      */
/*==============================================================*/
create table PUREST_DICT_DATA 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   CATEGORY_ID          NUMBER(19,0)         not null,
   NAME                 VARCHAR2(20)         not null,
   SORT                 NUMBER               not null,
   constraint PK_PUREST_DICT_DATA primary key (ID)
);

comment on table PUREST_DICT_DATA is
'�ֵ�����';

comment on column PUREST_DICT_DATA.ID is
'����Id';

comment on column PUREST_DICT_DATA.CREATE_BY is
'������';

comment on column PUREST_DICT_DATA.CREATE_TIME is
'����ʱ��';

comment on column PUREST_DICT_DATA.UPDATE_BY is
'�޸���';

comment on column PUREST_DICT_DATA.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_DICT_DATA.REMARK is
'��ע';

comment on column PUREST_DICT_DATA.CATEGORY_ID is
'�ֵ����ID';

comment on column PUREST_DICT_DATA.NAME is
'�ֵ�����';

comment on column PUREST_DICT_DATA.SORT is
'����';

/*==============================================================*/
/* Table: PUREST_FILE_RECORD                                    */
/*==============================================================*/
create table PUREST_FILE_RECORD 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   FILE_NAME            VARCHAR2(1000)       not null,
   FILE_SIZE            NUMBER(10)           not null,
   FILE_EXT             VARCHAR2(10)         not null,
   CONTAINER_NAME       VARCHAR2(100)        not null,
   constraint PK_PUREST_FILE_RECORD primary key (ID)
);

comment on table PUREST_FILE_RECORD is
'�ļ��ϴ���¼��';

comment on column PUREST_FILE_RECORD.ID is
'Id';

comment on column PUREST_FILE_RECORD.CREATE_BY is
'������';

comment on column PUREST_FILE_RECORD.CREATE_TIME is
'����ʱ��';

comment on column PUREST_FILE_RECORD.UPDATE_BY is
'�޸���';

comment on column PUREST_FILE_RECORD.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_FILE_RECORD.REMARK is
'��ע';

comment on column PUREST_FILE_RECORD.FILE_NAME is
'�ļ���';

comment on column PUREST_FILE_RECORD.FILE_SIZE is
'�ļ���С';

comment on column PUREST_FILE_RECORD.FILE_EXT is
'�ļ���չ��';

comment on column PUREST_FILE_RECORD.CONTAINER_NAME is
'��������';

/*==============================================================*/
/* Table: PUREST_FUNCTION                                       */
/*==============================================================*/
create table PUREST_FUNCTION 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(20)         not null,
   CODE                 VARCHAR2(40)         not null,
   PARENT_ID            NUMBER(19,0),
   constraint PK_PUREST_FUNCTION primary key (ID),
   constraint UK_PUREST_FUNCTION_CODE unique (CODE)
);

comment on table PUREST_FUNCTION is
'���ܱ�';

comment on column PUREST_FUNCTION.ID is
'����Id';

comment on column PUREST_FUNCTION.CREATE_BY is
'������';

comment on column PUREST_FUNCTION.CREATE_TIME is
'����ʱ��';

comment on column PUREST_FUNCTION.UPDATE_BY is
'�޸���';

comment on column PUREST_FUNCTION.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_FUNCTION.REMARK is
'��ע';

comment on column PUREST_FUNCTION.NAME is
'����';

comment on column PUREST_FUNCTION.CODE is
'����';

comment on column PUREST_FUNCTION.PARENT_ID is
'������';

/*==============================================================*/
/* Table: PUREST_FUNCTION_INTERFACE                             */
/*==============================================================*/
create table PUREST_FUNCTION_INTERFACE 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   INTERFACE_ID         NUMBER(19,0),
   FUNCTION_ID          NUMBER(19,0),
   constraint PK_PUREST_FUNCTION_INTERFACE primary key (ID)
);

comment on table PUREST_FUNCTION_INTERFACE is
'ҳ��ӿڱ�';

comment on column PUREST_FUNCTION_INTERFACE.ID is
'����Id';

comment on column PUREST_FUNCTION_INTERFACE.CREATE_BY is
'������';

comment on column PUREST_FUNCTION_INTERFACE.CREATE_TIME is
'����ʱ��';

comment on column PUREST_FUNCTION_INTERFACE.UPDATE_BY is
'�޸���';

comment on column PUREST_FUNCTION_INTERFACE.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_FUNCTION_INTERFACE.REMARK is
'��ע';

comment on column PUREST_FUNCTION_INTERFACE.INTERFACE_ID is
'�ӿ�ID';

comment on column PUREST_FUNCTION_INTERFACE.FUNCTION_ID is
'����ID';

/*==============================================================*/
/* Table: PUREST_INTERFACE                                      */
/*==============================================================*/
create table PUREST_INTERFACE 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(20)         not null,
   PATH                 VARCHAR2(200)        not null,
   REQUEST_METHOD       VARCHAR2(20)         not null,
   GROUP_ID             NUMBER(19,0),
   constraint PK_PUREST_INTERFACE primary key (ID),
   constraint UK_INTERFACE_PATHMETHOD unique (PATH, REQUEST_METHOD)
);

comment on table PUREST_INTERFACE is
'�ӿڱ�';

comment on column PUREST_INTERFACE.ID is
'����Id';

comment on column PUREST_INTERFACE.CREATE_BY is
'������';

comment on column PUREST_INTERFACE.CREATE_TIME is
'����ʱ��';

comment on column PUREST_INTERFACE.UPDATE_BY is
'�޸���';

comment on column PUREST_INTERFACE.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_INTERFACE.REMARK is
'��ע';

comment on column PUREST_INTERFACE.NAME is
'�ӿ�����';

comment on column PUREST_INTERFACE.PATH is
'�ӿڵ�ַ';

comment on column PUREST_INTERFACE.REQUEST_METHOD is
'���󷽷�';

comment on column PUREST_INTERFACE.GROUP_ID is
'�ӿڷ���ID';

/*==============================================================*/
/* Table: PUREST_INTERFACE_GROUP                                */
/*==============================================================*/
create table PUREST_INTERFACE_GROUP 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(20),
   CODE                 VARCHAR2(40)         not null,
   constraint PK_PUREST_INTERFACE_GROUP primary key (ID),
   constraint UK_PUREST_IG_CODE unique (CODE)
);

comment on table PUREST_INTERFACE_GROUP is
'�ӿڷ����';

comment on column PUREST_INTERFACE_GROUP.ID is
'����Id';

comment on column PUREST_INTERFACE_GROUP.CREATE_BY is
'������';

comment on column PUREST_INTERFACE_GROUP.CREATE_TIME is
'����ʱ��';

comment on column PUREST_INTERFACE_GROUP.UPDATE_BY is
'�޸���';

comment on column PUREST_INTERFACE_GROUP.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_INTERFACE_GROUP.REMARK is
'��ע';

comment on column PUREST_INTERFACE_GROUP.NAME is
'����';

comment on column PUREST_INTERFACE_GROUP.CODE is
'����';

/*==============================================================*/
/* Table: PUREST_NOTICE                                         */
/*==============================================================*/
create table PUREST_NOTICE 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   TITLE                VARCHAR2(40)         not null,
   CONTENT              CLOB,
   NOTICE_TYPE          NUMBER(19,0)         not null,
   "LEVEL"              NUMBER(19,0),
   constraint PK_PUREST_NOTICE primary key (ID)
);

comment on table PUREST_NOTICE is
'֪ͨ�����';

comment on column PUREST_NOTICE.ID is
'����Id';

comment on column PUREST_NOTICE.CREATE_BY is
'������';

comment on column PUREST_NOTICE.CREATE_TIME is
'����ʱ��';

comment on column PUREST_NOTICE.UPDATE_BY is
'�޸���';

comment on column PUREST_NOTICE.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_NOTICE.REMARK is
'��ע';

comment on column PUREST_NOTICE.TITLE is
'����';

comment on column PUREST_NOTICE.CONTENT is
'����';

comment on column PUREST_NOTICE.NOTICE_TYPE is
'����';

comment on column PUREST_NOTICE."LEVEL" is
'����';

/*==============================================================*/
/* Table: PUREST_NOTICE_RECORD                                  */
/*==============================================================*/
create table PUREST_NOTICE_RECORD 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   RECEIVER             NUMBER(19,0)         not null,
   IS_READ              NUMBER(1)            not null,
   NOTICE_ID            NUMBER(19,0)         not null,
   constraint PK_PUREST_NOTICE_RECORD primary key (ID)
);

comment on table PUREST_NOTICE_RECORD is
'֪ͨ�����¼��';

comment on column PUREST_NOTICE_RECORD.ID is
'����Id';

comment on column PUREST_NOTICE_RECORD.CREATE_BY is
'������';

comment on column PUREST_NOTICE_RECORD.CREATE_TIME is
'����ʱ��';

comment on column PUREST_NOTICE_RECORD.UPDATE_BY is
'�޸���';

comment on column PUREST_NOTICE_RECORD.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_NOTICE_RECORD.REMARK is
'��ע';

comment on column PUREST_NOTICE_RECORD.RECEIVER is
'������';

comment on column PUREST_NOTICE_RECORD.IS_READ is
'�Ƿ��Ѷ�';

comment on column PUREST_NOTICE_RECORD.NOTICE_ID is
'֪ͨ����Id';

/*==============================================================*/
/* Table: PUREST_ORGANIZATION                                   */
/*==============================================================*/
create table PUREST_ORGANIZATION 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(100)        not null,
   PARENT_ID            NUMBER(19,0),
   TELEPHONE            VARCHAR2(20),
   LEADER               VARCHAR2(20),
   SORT                 NUMBER,
   constraint PK_PUREST_ORGANIZATION primary key (ID),
   constraint UK_PUREST_ORG_NAME_PID unique (NAME, PARENT_ID)
);

comment on table PUREST_ORGANIZATION is
'��֯����';

comment on column PUREST_ORGANIZATION.ID is
'����Id';

comment on column PUREST_ORGANIZATION.CREATE_BY is
'������';

comment on column PUREST_ORGANIZATION.CREATE_TIME is
'����ʱ��';

comment on column PUREST_ORGANIZATION.UPDATE_BY is
'�޸���';

comment on column PUREST_ORGANIZATION.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_ORGANIZATION.REMARK is
'��ע';

comment on column PUREST_ORGANIZATION.NAME is
'����';

comment on column PUREST_ORGANIZATION.PARENT_ID is
'����ID';

comment on column PUREST_ORGANIZATION.TELEPHONE is
'��ϵ�绰';

comment on column PUREST_ORGANIZATION.LEADER is
'������';

comment on column PUREST_ORGANIZATION.SORT is
'����';

/*==============================================================*/
/* Table: PUREST_REQUEST_LOG                                    */
/*==============================================================*/
create table PUREST_REQUEST_LOG 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   CONTROLLER_NAME      VARCHAR2(100),
   ACTION_NAME          VARCHAR2(100),
   REQUEST_METHOD       VARCHAR2(10),
   ENVIRONMENT_NAME     VARCHAR2(20),
   ELAPSED_TIME         NUMBER(16,0),
   CLIENT_IP            VARCHAR2(20),
   constraint PK_PUREST_REQUEST_LOG primary key (ID)
);

comment on table PUREST_REQUEST_LOG is
'������־��';

comment on column PUREST_REQUEST_LOG.ID is
'����Id';

comment on column PUREST_REQUEST_LOG.CREATE_BY is
'������';

comment on column PUREST_REQUEST_LOG.CREATE_TIME is
'����ʱ��';

comment on column PUREST_REQUEST_LOG.UPDATE_BY is
'�޸���';

comment on column PUREST_REQUEST_LOG.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_REQUEST_LOG.REMARK is
'��ע';

comment on column PUREST_REQUEST_LOG.CONTROLLER_NAME is
'������';

comment on column PUREST_REQUEST_LOG.ACTION_NAME is
'������';

comment on column PUREST_REQUEST_LOG.REQUEST_METHOD is
'��������';

comment on column PUREST_REQUEST_LOG.ENVIRONMENT_NAME is
'����������';

comment on column PUREST_REQUEST_LOG.ELAPSED_TIME is
'ִ�к�ʱ';

comment on column PUREST_REQUEST_LOG.CLIENT_IP is
'�ͻ���IP';

/*==============================================================*/
/* Table: PUREST_ROLE                                           */
/*==============================================================*/
create table PUREST_ROLE 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(20)         not null,
   DESCRIPTION          VARCHAR2(200),
   constraint PK_PUREST_ROLE primary key (ID),
   constraint UK_PUREST_ROLE_NAME unique (NAME)
);

comment on table PUREST_ROLE is
'��ɫ';

comment on column PUREST_ROLE.ID is
'����Id';

comment on column PUREST_ROLE.CREATE_BY is
'������';

comment on column PUREST_ROLE.CREATE_TIME is
'����ʱ��';

comment on column PUREST_ROLE.UPDATE_BY is
'�޸���';

comment on column PUREST_ROLE.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_ROLE.REMARK is
'��ע';

comment on column PUREST_ROLE.NAME is
'��ɫ����';

comment on column PUREST_ROLE.DESCRIPTION is
'��ɫ����';

/*==============================================================*/
/* Table: PUREST_ROLE_FUNCTION                                  */
/*==============================================================*/
create table PUREST_ROLE_FUNCTION 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   ROLE_ID              NUMBER(19,0),
   FUNCTION_ID          NUMBER(19,0),
   constraint PK_PUREST_ROLE_FUNCTION primary key (ID)
);

comment on table PUREST_ROLE_FUNCTION is
'��ɫ���ܱ�';

comment on column PUREST_ROLE_FUNCTION.ID is
'����Id';

comment on column PUREST_ROLE_FUNCTION.CREATE_BY is
'������';

comment on column PUREST_ROLE_FUNCTION.CREATE_TIME is
'����ʱ��';

comment on column PUREST_ROLE_FUNCTION.UPDATE_BY is
'�޸���';

comment on column PUREST_ROLE_FUNCTION.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_ROLE_FUNCTION.REMARK is
'��ע';

comment on column PUREST_ROLE_FUNCTION.ROLE_ID is
'��ɫID';

comment on column PUREST_ROLE_FUNCTION.FUNCTION_ID is
'����ID';

/*==============================================================*/
/* Table: PUREST_SYSTEM_CONFIG                                  */
/*==============================================================*/
create table PUREST_SYSTEM_CONFIG 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   NAME                 VARCHAR2(20),
   CONFIG_CODE          VARCHAR2(40)         not null,
   CONFIG_VALUE         VARCHAR2(1000),
   constraint PK_PUREST_SYSTEM_CONFIG primary key (ID),
   constraint UK_PUREST_CONFIG_CODE unique (CONFIG_CODE)
);

comment on table PUREST_SYSTEM_CONFIG is
'ϵͳ���ñ�';

comment on column PUREST_SYSTEM_CONFIG.ID is
'����Id';

comment on column PUREST_SYSTEM_CONFIG.CREATE_BY is
'������';

comment on column PUREST_SYSTEM_CONFIG.CREATE_TIME is
'����ʱ��';

comment on column PUREST_SYSTEM_CONFIG.UPDATE_BY is
'�޸���';

comment on column PUREST_SYSTEM_CONFIG.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_SYSTEM_CONFIG.REMARK is
'��ע';

comment on column PUREST_SYSTEM_CONFIG.NAME is
'����';

comment on column PUREST_SYSTEM_CONFIG.CONFIG_CODE is
'����';

comment on column PUREST_SYSTEM_CONFIG.CONFIG_VALUE is
'ֵ';

/*==============================================================*/
/* Table: PUREST_USER                                           */
/*==============================================================*/
create table PUREST_USER 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   ACCOUNT              VARCHAR2(36)         not null,
   PASSWORD             VARCHAR2(100)        not null,
   NAME                 VARCHAR2(20)         not null,
   TELEPHONE            VARCHAR2(11),
   EMAIL                VARCHAR2(20),
   AVATAR               BLOB,
   STATUS               NUMBER,
   ORGANIZATION_ID      NUMBER(19,0)         not null,
   constraint PK_PUREST_USER primary key (ID),
   constraint UK_PUREST_USER_ACCOUNT unique (ACCOUNT)
);

comment on table PUREST_USER is
'�û�';

comment on column PUREST_USER.ID is
'����Id';

comment on column PUREST_USER.CREATE_BY is
'������';

comment on column PUREST_USER.CREATE_TIME is
'����ʱ��';

comment on column PUREST_USER.UPDATE_BY is
'�޸���';

comment on column PUREST_USER.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_USER.REMARK is
'��ע';

comment on column PUREST_USER.ACCOUNT is
'�˺�';

comment on column PUREST_USER.PASSWORD is
'����';

comment on column PUREST_USER.NAME is
'��ʵ����';

comment on column PUREST_USER.TELEPHONE is
'�绰';

comment on column PUREST_USER.EMAIL is
'����';

comment on column PUREST_USER.AVATAR is
'ͷ��';

comment on column PUREST_USER.STATUS is
'״̬';

comment on column PUREST_USER.ORGANIZATION_ID is
'��֯����Id';

/*==============================================================*/
/* Table: PUREST_USER_ROLE                                      */
/*==============================================================*/
create table PUREST_USER_ROLE 
(
   ID                   NUMBER(19,0)         not null,
   CREATE_BY            NUMBER(19,0)         not null,
   CREATE_TIME          DATE                 not null,
   UPDATE_BY            NUMBER(19,0),
   UPDATE_TIME          DATE,
   REMARK               VARCHAR2(1000),
   ROLE_ID              NUMBER(19,0)         not null,
   USER_ID              NUMBER(19,0)         not null,
   constraint PK_PUREST_USER_ROLE primary key (ID)
);

comment on table PUREST_USER_ROLE is
'�û���ɫ';

comment on column PUREST_USER_ROLE.ID is
'����Id';

comment on column PUREST_USER_ROLE.CREATE_BY is
'������';

comment on column PUREST_USER_ROLE.CREATE_TIME is
'����ʱ��';

comment on column PUREST_USER_ROLE.UPDATE_BY is
'�޸���';

comment on column PUREST_USER_ROLE.UPDATE_TIME is
'�޸�ʱ��';

comment on column PUREST_USER_ROLE.REMARK is
'��ע';

comment on column PUREST_USER_ROLE.ROLE_ID is
'��ɫID';

comment on column PUREST_USER_ROLE.USER_ID is
'�û�ID';

alter table PUREST_DICT_DATA
   add constraint FK_PUREST_D_REFERENCE_PUREST_D foreign key (CATEGORY_ID)
      references PUREST_DICT_CATEGORY (ID);

alter table PUREST_FUNCTION_INTERFACE
   add constraint FK_PUREST_F_REFERENCE_PUREST_F foreign key (FUNCTION_ID)
      references PUREST_FUNCTION (ID);

alter table PUREST_FUNCTION_INTERFACE
   add constraint FK_PUREST_F_REFERENCE_PUREST_I foreign key (INTERFACE_ID)
      references PUREST_INTERFACE (ID);

alter table PUREST_INTERFACE
   add constraint FK_PUREST_I_REFERENCE_PUREST_I foreign key (GROUP_ID)
      references PUREST_INTERFACE_GROUP (ID);

alter table PUREST_NOTICE_RECORD
   add constraint FK_PUREST_N_REFERENCE_PUREST_N foreign key (NOTICE_ID)
      references PUREST_NOTICE (ID);

alter table PUREST_ORGANIZATION
   add constraint FK_PUREST_O_REFERENCE_PUREST_O foreign key (PARENT_ID)
      references PUREST_ORGANIZATION (ID);

alter table PUREST_ROLE_FUNCTION
   add constraint FK_PUREST_R_REFERENCE_PUREST_R foreign key (ROLE_ID)
      references PUREST_ROLE (ID);

alter table PUREST_ROLE_FUNCTION
   add constraint FK_PUREST_R_REFERENCE_PUREST_F foreign key (FUNCTION_ID)
      references PUREST_FUNCTION (ID);

alter table PUREST_USER
   add constraint FK_PUREST_U_REFERENCE_PUREST_O foreign key (ORGANIZATION_ID)
      references PUREST_ORGANIZATION (ID);

alter table PUREST_USER_ROLE
   add constraint FK_PUREST_U_REFERENCE_PUREST_R foreign key (ROLE_ID)
      references PUREST_ROLE (ID);

alter table PUREST_USER_ROLE
   add constraint FK_PUREST_U_REFERENCE_PUREST_U foreign key (USER_ID)
      references PUREST_USER (ID);

