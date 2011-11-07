--Ʒ������
update PUB_PARAMS set CODE_NAME='Ʒ������' where CODE_ID='10' and TYPE_CODE='SORT_TYPE';
delete from PUB_GOODSSORT where SORT_TYPE=11 and SORT_ID in ('32FD7EE2-5F01-4131-B46F-2A8A81B9C60F','FE684BAA-F8F9-40EB-BFE5-716A143E53E3','5D8D7AF6-2DE3-4866-85C7-925E07F66096','C988E384-AB8D-4F5E-95F4-554D4689396C');

--������ṹ

--���ѷ���
CREATE TABLE MQQ_GROUPING(
  --��ҵ����<0Ϊ��������>
	TENANT_ID int NOT NULL ,
    --�������
	S_GROUP_ID varchar(50) NOT NULL,
    --�����������û���
	G_USER_ID varchar(50) NOT NULL,
    --��ʾ����
	I_SHOW_NAME varchar(50) NOT NULL,
    --��������
	I_GROUP_NAME varchar(50) NOT NULL,
	SEQ_NO int,
  CONSTRAINT PK_MQQ_GROUPING PRIMARY KEY (TENANT_ID,G_USER_ID,S_GROUP_ID)
);

--�ҵĺ���
CREATE TABLE MQQ_FRIENDS(
  --��ҵ����<0Ϊ��������>
	TENANT_ID int NOT NULL ,
    --�����������û���
	F_USER_ID varchar(50) NOT NULL,
    --���Ѵ���
	FRIEND_ID varchar(50) NOT NULL,
    --��������
	FRIEND_NAME varchar(50) NOT NULL,
	  --�Ƿ��������� 1��δ���룬0�Ǽ���
	IS_BE_BLACK varchar(1) NOT NULL,
    --�������
	S_GROUP_ID varchar(50) NOT NULL,
    --��ע
	NOTE varchar(200),
	  --��ʾ���� ������+ ' '+��ע
	U_SHOW_NAME varchar(255) NOT NULL,
	  --�Ƿ�����
	IS_ONLINE varchar(1) NOT NULL,
	  --ʵ��ID��Ԥ������ҵ������
	REF_ID varchar(1) NOT NULL,
    --�û�����
	USER_TYPE varchar(20) NOT NULL,
	SEQ_NO int,
  CONSTRAINT PK_MQQ_FRIENDS PRIMARY KEY (TENANT_ID,F_USER_ID,S_GROUP_ID,FRIEND_ID)
);