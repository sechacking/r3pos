--Ϊ����˵�������Դ������
alter table CA_MODULE add ACTION_RES varchar(50);

--��ݲ˵�����
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','��  ��','MODU_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','������','MODU_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','������','MODU_TYPE','00',5497000);

--��Ʒ��Ӧ�����ϰ���Ϣ
alter table CA_PROD_INFO add RES_VERSION varchar(10);
alter table CA_PROD_INFO add RES_DESKTOP varchar(255);
alter table CA_PROD_INFO add RES_IMAGES varchar(255);

--// ������֧��Ŀ ���̶���֤�𡱡���������֤�𡱡������۷����������г����á�
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'6E3CB7C8-C3B8-48D6-B508-F8D98ED6253C','�г�����','SCFY','3',6,'00',5497000 from CA_TENANT;
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'206FEBCB-6550-4EA0-A8E6-E8728AADA1BA','���۷���','XSFL','3',6,'00',5497000 from CA_TENANT;
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'B43EF134-66A1-41DF-A921-EFD76198307F','�̶���֤��','GDBZJ','3',6,'00',5497000 from CA_TENANT;
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'E9AED0B1-050C-4EFB-AA7A-0A64FE45EF97','������֤��','GDBZJ','3',6,'00',5497000 from CA_TENANT;

--ָ������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','��������','IDX_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���ῼ��','IDX_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','ҵ������','IDX_TYPE','00',5497000);

--��������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','��ȿ���','KPI_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���ȿ���','KPI_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','��ʵ����','KPI_TYPE','00',5497000);

--���˱�׼
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','�����������','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','����������','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','��ë�������','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','���������','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','����ɽ��','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','�����ë��','KPI_DATA','00',5497000);
--�����׼
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','������<����>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','�����<����>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','��ë��<����>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','������<�۽�>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','�����<�۽�>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','��ë��<�۽�>','KPI_CALC','00',5497000);

--�Ƿ����ý��ݿ���
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','����','KPI_OPTN','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','����','KPI_OPTN','00',5497000);

--Ӧ���˿� ACC_RECVABLE_INFO
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','��������','RECV_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','����֧��','RECV_TYPE','00',5497000);
--Ӧ���˿� ACC_PAYABLE_INFO
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('7','��������','ABLE_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('8','����֧��','ABLE_TYPE','00',5497000);


--����ָ��
CREATE TABLE MKT_KPI_INDEX (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --ָ��ID��
	KPI_ID char(36) NOT NULL ,
        --ָ������
	KPI_NAME varchar(50) NOT NULL ,
        --ƴ����
	KPI_SPELL varchar(50) NOT NULL ,
        --ָ������
	IDX_TYPE char (1) NOT NULL ,
        --�����׼
	KPI_CALC char(1) NOT NULL ,
        --��������
	KPI_TYPE char(1) NOT NULL ,
        --��ʾ��λ
	UNIT_NAME varchar(10) NOT NULL ,
        --���˱�׼
	KPI_DATA char(1) NOT NULL ,
	
	        --��׼ϵ��
	KPI_AGIO decimal(18, 3) NOT NULL ,
	        --�Ƿ�����
	KPI_OPTN char(1) NOT NULL ,

        --��ע
	REMARK varchar (100) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_INDEX PRIMARY KEY  
	(
		TENANT_ID,
		KPI_ID
	)
)  IN R3TB4K_BAS;

--�Ƿ���������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','����','USING_BRRW','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','��ֹ','USING_BRRW','00',5497000);

--����ָ���׼
CREATE TABLE MKT_KPI_OPTION (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --����ָ��
	KPI_ID char (36) NOT NULL ,
        --��������(���ʱ 1���ϰ��� 2���°��� ��ʱ 1,2,3,4��ʾ4������,�������Ϊ0)
	KPI_LV char (36) NOT NULL ,
        --����ÿ��ָ���� 1 ��ʼ����
	SEQNO int NOT NULL ,
	      --�����
	KPI_RATE decimal(18, 3) ,
	      --�����
	KPI_AMT decimal(18, 3) ,
	      --��ʱ��
	KPI_DATE1 int ,
	KPI_DATE2 int ,
        --�����ۿ�
	KPI_AGIO decimal(18, 3) ,
	      --�Ƿ���������
	USING_BRRW char(1) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_OPTION PRIMARY KEY 
	(
		TENANT_ID,
		KPI_ID,
		KPI_LV,
		SEQNO
	) 
)  IN R3TB4K_BAS;
CREATE INDEX IX_MKPO_KPI_ID ON MKT_KPI_OPTION(TENANT_ID,KPI_ID);

--����ָ���Ӧ��Ʒ�嵥
CREATE TABLE MKT_KPI_GOODS (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --����ָ��
	KPI_ID char (36) NOT NULL ,
        --��Ʒ����
	GODS_ID char (36) NOT NULL ,
        --���˵�λ
	UNIT_ID char (36) NOT NULL ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_GOODS PRIMARY KEY 
	(
		TENANT_ID,
		KPI_ID,
		GODS_ID
	) 
)  IN R3TB4K_BAS;
CREATE INDEX IX_MKPG_KPI_ID ON MKT_KPI_GOODS(TENANT_ID,KPI_ID);

--�Ƿ���������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','������ͬ','PLAN_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���Ŀ��','PLAN_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','�� �� ��','PLAN_TYPE','00',5497000);
--���ۼƻ�
CREATE TABLE MKT_PLANORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --��  ��
	PLAN_ID char (36) NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --��ˮ��
	GLIDE_NO varchar (20) NOT NULL ,
        --��ͬ�� <��λ��ѯ>
	FILES_NO varchar (50),
        --���
	KPI_YEAR int NOT NULL ,
        --ǩԼ����
	PLAN_DATE int NOT NULL ,
        --��ʼ����
	BEGIN_DATE varchar (10) NOT NULL ,
        --��������
	END_DATE varchar (10) NOT NULL ,
        --������
	CLIENT_ID varchar (36) NOT NULL ,
        --��������
	DEPT_ID varchar (12) NOT NULL ,
        --�ƻ�����
	PLAN_TYPE char (1) NOT NULL ,
        --������
	PLAN_USER varchar (36) ,
        --�������
	CHK_DATE varchar (10) ,
        --�����Ա
	CHK_USER varchar (36) ,
        --��������
	PLAN_AMT decimal(18, 3) ,
        --������
	PLAN_MNY decimal(18, 3) ,
        --��֤��-��ȡ
	BOND_MNY decimal(18, 3) ,
        --��֤��-�˻�
	BOND_RET decimal(18, 3) ,
        --�г���Ԥ��
	BUDG_MNY decimal(18, 3) ,
        --��ע
	REMARK varchar (100) ,
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_PLANORDER PRIMARY KEY 
	(
		TENANT_ID,
		PLAN_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_M_PNR_TENANT_ID ON MKT_PLANORDER(TENANT_ID);
CREATE INDEX IX_M_PNR_TIME_STAMP ON MKT_PLANORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_M_PNR_SHOP_ID ON MKT_PLANORDER(TENANT_ID,SHOP_ID);
CREATE INDEX IX_M_PNR_PLAN_DATE ON MKT_PLANORDER(PLAN_DATE);

--���ۼƻ���ϸ
CREATE TABLE MKT_PLANDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --���
	SEQNO int NOT NULL ,
        --������
	PLAN_ID char (36) NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --ָ�����
	KPI_ID char (36) NOT NULL ,
        --��������
	AMOUNT decimal(18, 3) ,
        --�ƻ����
	AMONEY decimal(18, 3) ,
        --��֤��
	BOND_MNY decimal(18, 3) ,
        --��ע
	REMARK varchar (100) NULL ,
	CONSTRAint PK_MKT_PLANDATA PRIMARY KEY  
	(
		TENANT_ID,
		PLAN_ID,
		KPI_ID
	)
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_M_PND_TENANT_ID ON MKT_PLANDATA(TENANT_ID);
CREATE INDEX IX_M_PND_PLAN_ID ON MKT_PLANDATA(TENANT_ID,PLAN_ID);
CREATE INDEX IX_M_PND_SHOP_ID ON MKT_PLANDATA(TENANT_ID,SHOP_ID);
CREATE INDEX IX_M_PND_GODS_ID ON MKT_PLANDATA(TENANT_ID,KPI_ID);

--���˽��
CREATE TABLE MKT_KPI_RESULT (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ƻ�����
	PLAN_ID char (36) NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --ָ������
	IDX_TYPE char (1) NOT NULL ,
        --�����׼
	KPI_CALC char(1) NOT NULL ,
        --��������
	KPI_TYPE char (1) NOT NULL ,
        --���˱�׼
	KPI_DATA char(1) NOT NULL ,
        --����ID
	KPI_ID char (36) NOT NULL ,
        --���
	KPI_YEAR int NOT NULL ,
        --��ʼ����
	BEGIN_DATE varchar (10) ,
        --��������
	END_DATE varchar (10) ,
        --������
	CLIENT_ID varchar (36) NOT NULL ,
        --�������
	CHK_DATE varchar (10) ,
        --�����Ա
	CHK_USER varchar (36) ,
	
        --�ƻ�����
	PLAN_AMT decimal(18, 3) ,
        --�ƻ���� 
	PLAN_MNY decimal(18, 3) ,
	
        --�������
	FISH_AMT decimal(18, 3) ,
        --��ɽ�� 
	FISH_MNY decimal(18, 3) ,
	
        --���˽��<Ԫ>
	KPI_MNY decimal(18, 3) ,
        --��ȡ����
	WDW_MNY decimal(18, 3) ,
        --��ע
	REMARK varchar (100) ,
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_RESULT PRIMARY KEY 
	(
		TENANT_ID,
		PLAN_ID,
		KPI_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MKPIR_TENANT_ID ON MKT_KPI_RESULT(TENANT_ID);
CREATE INDEX IX_MKPIR_TIME_STAMP ON MKT_KPI_RESULT(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MKPIR_KPI_YEAR ON MKT_KPI_RESULT(TENANT_ID,KPI_YEAR);
CREATE INDEX IX_MKPIR_KPI_ID ON MKT_KPI_RESULT(TENANT_ID,KPI_ID);
CREATE INDEX IX_MKPIR_PLAN_ID ON MKT_KPI_RESULT(TENANT_ID,PLAN_ID);
CREATE INDEX IX_MKPIR_SHOP_ID ON MKT_KPI_RESULT(TENANT_ID,SHOP_ID);

--���˼����嵥
CREATE TABLE MKT_KPI_RESULT_LIST (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ƻ�����
	PLAN_ID char (36) NOT NULL ,
        --����ָ��
	KPI_ID char (36) NOT NULL ,
        --��������(���ʱ 1���ϰ��� 2���°��� ��ʱ 1,2,3,4��ʾ4������,�������Ϊ0)
	KPI_LV char (36) NOT NULL ,
        --����ÿ��ָ���� 1 ��ʼ����
	SEQNO int NOT NULL ,
	      --�����
	KPI_RATE decimal(18, 3) ,
	      --�����
	KPI_AMT decimal(18, 3) ,
	      --��ʱ��
	KPI_DATE1 int ,
	KPI_DATE2 int ,
        --�����ۿ�
	KPI_AGIO decimal(18, 3) ,

        --�����
	FSH_VLE decimal(18, 3) ,
	      --���˽��
	KPI_MNY decimal(18, 3) ,
	
	CONSTRAint PK_MKT_KPI_R_LIST PRIMARY KEY 
	(
		TENANT_ID,
		PLAN_ID,
		KPI_ID,
		KPI_LV,
		SEQNO
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

--��������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','�г�����','REQU_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','�г�����','REQU_TYPE','00',5497000);

--�������쵥
CREATE TABLE MKT_REQUORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --����
	REQU_ID char (36) NOT NULL ,
        --������������֧����
	IORO_ID char (36) ,
        --��������
	DEPT_ID varchar (12) NOT NULL ,
        --��������
	REQU_TYPE char (36) NOT NULL ,
        --��ˮ��
	GLIDE_NO varchar (20) NOT NULL ,
        --�����
	REQU_DATE int NOT NULL ,
        --������
	CLIENT_ID varchar (36) NOT NULL ,
        --���
	REQU_USER varchar (36) ,
        --�������
	CHK_DATE varchar (10) ,
        --�����Ա
	CHK_USER varchar (36) ,
        --������
	REQU_MNY decimal(18, 3) ,
        --��ע
	REMARK varchar (100) ,
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_REQUORDER PRIMARY KEY 
	(
		TENANT_ID,
		REQU_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MRQD_TENANT_ID ON MKT_REQUORDER(TENANT_ID);
CREATE INDEX IX_MRQD_TIME_STAMP ON MKT_REQUORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MRQD_DEMA_DATE ON MKT_REQUORDER(REQU_DATE);

--����������ϸ
CREATE TABLE MKT_REQUDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --���
	SEQNO int NOT NULL ,
        --����
	REQU_ID char (36) NOT NULL ,
        --�ƻ�����
	PLAN_ID char (36) NOT NULL ,
        --����ID
	KPI_ID char (36) NOT NULL ,
        --���
	KPI_YEAR int ,
        --������
	REQU_MNY decimal(18, 3) ,
        --ժҪ
	REMARK varchar (100) ,
	CONSTRAint PK_MKT_REQUDATA PRIMARY KEY  
	(
		TENANT_ID,
		REQU_ID,
		SEQNO
	)
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_M_RQR_TENANT_ID ON MKT_REQUDATA(TENANT_ID);
CREATE INDEX IX_M_RQR_REQU_ID ON MKT_REQUDATA(TENANT_ID,REQU_ID);
CREATE INDEX IX_M_RQR_KPI_ID ON MKT_REQUDATA(TENANT_ID,PLAN_ID,KPI_YEAR,KPI_ID);
CREATE INDEX IX_M_RQR_KPI_YEAR ON MKT_REQUDATA(TENANT_ID,KPI_YEAR);

--�����ŵ굵������������Ϣ

--��Ȩ����
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','������Ȩ','CATEGORY','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','��ͬ����','CATEGORY','00',5497000);

--��Ȩ����
alter table CA_SHOP_INFO add CATEGORY char(1);
--ǩԼ����/��Ȩ��ʼʱ��
alter table CA_SHOP_INFO add BEGIN_DATE varchar(10);
--��������/��Ȩ��Чʱ��
alter table CA_SHOP_INFO add END_DATE varchar(10);
--���۶���Ǯ/ƽ���ף�
alter table CA_SHOP_INFO add SHOP_PRC decimal(18, 3);
--���/�����ܼ�
alter table CA_SHOP_INFO add SHOP_MNY decimal(18, 3);
--���������ƽ���ף�
alter table CA_SHOP_INFO add BUIL_AREA decimal(18, 3);

--��֤��-��ȡ
alter table SAL_INDENTORDER add BOND_MNY decimal(18, 3);
--��֤��-�˻�
alter table SAL_INDENTORDER add BOND_RET decimal(18, 3);

--��������,����PUB_CODE_INFO����
alter table SAL_INDENTORDER add OTH1_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH2_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH3_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH4_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH5_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH6_MNY decimal(18, 3);

--��֤��-��ȡ
alter table STK_INDENTORDER add BOND_MNY decimal(18, 3);
--��֤��-�˻�
alter table STK_INDENTORDER add BOND_RET decimal(18, 3);

--��������,����PUB_CODE_INFO����
alter table STK_INDENTORDER add OTH1_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH2_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH3_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH4_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH5_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH6_MNY decimal(18, 3);

--��������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','�̶���֤��','BOND_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���汣֤��','BOND_TYPE','00',5497000);
--��֤�����쵥
CREATE TABLE MKT_BONDORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --����
	BOND_ID char (36) NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --������������֧����
	IORO_ID char (36) ,
        --��������
	DEPT_ID varchar (12) NOT NULL ,
        --�������� 1.�̶���֤�� 2.���汣֤��
	BOND_TYPE char (36) NOT NULL ,
        --��ˮ��
	GLIDE_NO varchar (20) NOT NULL ,
        --�����
	BOND_DATE int NOT NULL ,
        --������
	CLIENT_ID varchar (36) NOT NULL ,
        --���
	BOND_USER varchar (36) ,
        --�������
	CHK_DATE varchar (10) ,
        --�����Ա
	CHK_USER varchar (36) ,
        --������
	BOND_MNY decimal(18, 3) ,
        --��ע
	REMARK varchar (100) ,
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_BONDORDER PRIMARY KEY 
	(
		TENANT_ID,
		BOND_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MBND_TENANT_ID ON MKT_BONDORDER(TENANT_ID);
CREATE INDEX IX_MBND_TIME_STAMP ON MKT_BONDORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MBND_DEMA_DATE ON MKT_BONDORDER(BOND_DATE);

--����������ϸ
CREATE TABLE MKT_BONDDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --����
	BOND_ID char (36) NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --���
	SEQNO int NOT NULL ,
        --��Ӧ����
	FROM_ID char (36) NOT NULL ,
        --������
	BOND_MNY decimal(18, 3) ,
        --ժҪ
	REMARK varchar (100) ,
	CONSTRAint PK_MKT_BONDDATA PRIMARY KEY  
	(
		TENANT_ID,
		BOND_ID,
		SEQNO
	)
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MBNR_TENANT_ID ON MKT_BONDDATA(TENANT_ID);
CREATE INDEX IX_MBNR_BOND_ID ON MKT_BONDDATA(TENANT_ID,BOND_ID);
CREATE INDEX IX_MBNR_FROM_ID ON MKT_BONDDATA(TENANT_ID,BOND_ID,FROM_ID);

--Ϊ�տ���Ӳ���
alter table ACC_RECVORDER add DEPT_ID varchar(12);
--Ϊ������Ӳ���
alter table ACC_PAYORDER add DEPT_ID varchar(12);

--Ϊ�տ���Ӳ���
alter table ACC_RECVABLE_INFO add DEPT_ID varchar(12);
--Ϊ������Ӳ���
alter table ACC_PAYABLE_INFO add DEPT_ID varchar(12);

update ACC_RECVORDER set DEPT_ID=(select DEPT_ID from VIW_USERS where TENANT_ID=ACC_RECVORDER.TENANT_ID and USER_ID=ACC_RECVORDER.RECV_USER);
update ACC_PAYORDER set DEPT_ID=(select DEPT_ID from VIW_USERS where TENANT_ID=ACC_PAYORDER.TENANT_ID and USER_ID=ACC_PAYORDER.PAY_USER);

update ACC_RECVABLE_INFO set DEPT_ID=(select DEPT_ID from SAL_SALESORDER where TENANT_ID=ACC_RECVABLE_INFO.TENANT_ID and SALES_ID=ACC_RECVABLE_INFO.SALES_ID) where RECV_TYPE in ('1','2');
update ACC_RECVABLE_INFO set DEPT_ID=(select DEPT_ID from SAL_INDENTORDER where TENANT_ID=ACC_RECVABLE_INFO.TENANT_ID and INDE_ID=ACC_RECVABLE_INFO.SALES_ID) where RECV_TYPE in ('3');
update ACC_RECVABLE_INFO set DEPT_ID=(select DEPT_ID from VIW_USERS where TENANT_ID=ACC_RECVABLE_INFO.TENANT_ID and USER_ID=ACC_RECVABLE_INFO.CREA_USER) where RECV_TYPE in ('4');

update ACC_PAYABLE_INFO set DEPT_ID=(select DEPT_ID from STK_STOCKORDER where TENANT_ID=ACC_PAYABLE_INFO.TENANT_ID and STOCK_ID=ACC_PAYABLE_INFO.STOCK_ID) where ABLE_TYPE in ('4','5');
update ACC_PAYABLE_INFO set DEPT_ID=(select DEPT_ID from STK_INDENTORDER where TENANT_ID=ACC_PAYABLE_INFO.TENANT_ID and INDE_ID=ACC_PAYABLE_INFO.STOCK_ID) where ABLE_TYPE in ('6');