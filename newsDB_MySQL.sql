use master
go
if exists(select 1 from sys.databases where [name] = 'newsDB')
begin
	drop database newsDB
end

create database newsDB
go

use newsDB 
go

if exists(select 1 from sys.objects where [name] = 'userInfo')
begin
	drop table userInfo
end
go

--�û���Ϣ��
create table userInfo
(
	--�û����
	[userId] int not null identity(1,1) primary key,
	--�û�����Ψһ��
	[userName] varchar(20) not null unique,
	--����(��¼����)
	[password] varchar(20) not null
);
go


if exists(select 1 from sys.objects where [name] = 'newsTypeInfo')
begin
	drop table newsTypeInfo
end

--�������ͱ�
create table newsTypeInfo
(
	--���ͱ��
	[typeId] int not null identity(1,1) primary key,
	--�������ƣ�Ψһ��
	[typeName] varchar(20) not null unique,
	--���ͱ�ע����Ϊ�գ�
	[remark] varchar(50) null
);
go

if exists(select 1 from sys.objects where [name] = 'newsInfo')
begin
	drop table newsInfo
end

--������Ϣ��
create table newsInfo
(
	--���ű��
	[newsId] int not null identity(1,1) primary key,
	--�������ͣ������
	[typeId] int not null FOREIGN KEY REFERENCES newsTypeInfo(typeId),
	--���ŷ����ߣ������
	[userId] int not null FOREIGN KEY REFERENCES userInfo(userId),
	--���ű���
	[title] varchar(40) not null,
	--��������
	[content] text not null,
	--�Ƿ��Ƽ����ţ�0���Ƽ���1�Ƽ�����Ĭ��Ϊ0
	[recommended] int not null default(0),
	--���ŵ��������Ĭ��Ϊ0
	[click] int not null default(0),
	--���ŷ���ʱ�䣬Ĭ��Ϊ��ǰʱ��
	[releaseTime] Date not null default(getdate()),
	--���Źؼ���
	[keywords] varchar(20) not null
);
go



--����û�
insert into userInfo values('test','123456');
insert into userInfo values('admin','123456');

--�������
insert into newsTypeInfo values('ѧԺ����','����ѧԺ�ڲ�������');
insert into newsTypeInfo values('��ҵ����','����IT��ҵ������');
insert into newsTypeInfo values('��ҵ����','����ѧԺѧԱ������');
insert into newsTypeInfo values('��������','��ѧԱ�йص���������');
insert into newsTypeInfo values('ѧԱ����','����ѧԱ��ѧϰ������������');
insert into newsTypeInfo values('ѧԺ','����ѧԺ�ڲ�������');
insert into newsTypeInfo values('��ҵ','����IT��ҵ������');
insert into newsTypeInfo values('��ҵ','����ѧԺѧԱ������');
insert into newsTypeInfo values('����','��ѧԱ�йص���������');
insert into newsTypeInfo values('����','����ѧԱ��ѧϰ������������');
insert into newsTypeInfo values('����','����ѧԺ�ڲ�������');
insert into newsTypeInfo values('��','����IT��ҵ������');
insert into newsTypeInfo values('��','����ѧԺѧԱ������');
insert into newsTypeInfo values('��','��ѧԱ�йص���������');
insert into newsTypeInfo values('ѧ','����ѧԱ��ѧϰ������������');
go

--�������
insert into newsInfo (typeId,userId,title,content,keywords)
values(2,2,'����׼������"������ʱ����','��Ҫ��Ϊ��','��������������');

insert into newsInfo (typeId,userId,title,content,recommended,keywords)
values(1,2,'��ý�Դ�ѧУ԰���������о�','����������ý',1,'ѧԱ����ý');

insert into newsInfo (typeId,userId,title,content,keywords)
values(1,2,'��У�ٿ��ڶ����쵼�ɲ���ѵѧϰ��','4��12����...','��ѵ������');

insert into newsInfo (typeId,userId,title,content,keywords)
values(1,2,'��������������-��լ��ѧУ԰����','У԰�Ļ�����','�����ĸ�');

insert into newsInfo (typeId,userId,title,content,keywords)
values(1,2,'��Ժ��������������������γ�','������Ժ�γ�','���������');

insert into newsInfo (typeId,userId,title,content,keywords)
values(1,2,'������ҵάȨ�ḱ���³���λ','�����и�����ҵ','άȨ��Э��');

insert into newsInfo (typeId,userId,title,content,keywords)
values(1,2,'����ʦ���������ձ�ר��','����ʦ��ʽ','���³���ר�ã�ý��');

insert into newsInfo (typeId,userId,title,content,keywords)
values(5,2,'�����������ܾ�����������ս����','����������ܾ���','���գ����򣬾���');



-- 1.ǰ̨��¼
-- 2.�û�����
--
-- 3.��̨�û�����
-- 4.ǰ̨�û���ֹ����
-- 5.ǰ̨�û���ע


--��������
select top 5 * from newsTypeInfo where typeId not in(select top (5*(1-1)) typeId from newsTypeInfo)

select * from userInfo
select * from newsTypeInfo where typeId = 1
update newsTypeInfo set typeName ='',remark = '' where typeId = 1

--����
--insert into newsInfo(typeId,userId,title,content,keywords) values(,,'','','')

select * from newsInfo

select * from newsInfo where newsId = 1

select top 6 * from newsInfo where newsId not in(select top (6*(2-1)) newsId from newsInfo)
--�ȷ��࣬��Ա������
--1��
select top 6 * from (select *  from newsInfo where typeId = 2)as table1
where newsId not in(select top (6*(1-1)) newsId from (select *  from newsInfo where typeId = 2)as table1)
--2��
select top 6 * from newsInfo where typeId = 1 and newsId not in
(select top (6*(2-1)) newsId from newsInfo where typeId=1 order by newsId desc)
order by newsId desc
select count (*) from newsInfo where typeId = 1

if exists (select * from sysobjects where [name] = 'newsInfo_newsTypeInfo')
	drop view newsInfo_newsTypeInfo
go
--������ͼ
create view newsInfo_newsTypeInfo
as
	select a.*,b.typeName,b.remark from newsInfo a inner join newsTypeInfo b on a.typeId = b.typeId 
go

select * from newsInfo_newsTypeInfo where typeId = 1
select top 6 * from newsInfo_newsTypeInfo where newsId not in(select top (6*(2-1)) newsId from newsInfo_newsTypeInfo)

select COUNT(*) from newsInfo

delete from newsInfo where newsId = 1 

update newsInfo set click+=1 where newsId = 1
update newsInfo set title='',typeId=1,content='',keywords='',recommended=1 where newsId = 1

select top 6 * from (select *  from newsInfo where typeId = 1)as table1 where newsId not in
(select top 0 newsId from (select *  from newsInfo where typeId = 1)as table1)

select top 6 * from (select *  from newsInfo where typeId = 5)as table1  where newsId not in(select top 0 newsId from (select *  from newsInfo where typeId = 5)as table1)

select top 6 * from (select *  from newsInfo where typeId = 1)as table1  where newsId not in(select top 0 newsId from (select *  from newsInfo where typeId = 1)as table1)




select top 6 * from (select *  from newsInfo where typeId = 1)as table1 where newsId not in(select top 0 newsId from (select *  from newsInfo where typeId = 1)as table1)

select top 6 * from (select *  from newsInfo where typeId = 1)as table1 where newsId not in(select top 0 newsId from (select *  from newsInfo where typeId = 1)as table1)
select * from newsInfo

select * from newsInfo a left join newsTypeInfo b on a.typeId = b.typeId where b.typeId = 9

select top 6 * from newsInfo where newsId not in(select top 0 newsId from newsInfo order by newsId desc)order by newsId desc

select top 6 * from newsInfo where newsId not in(select top 0 newsId from newsInfo order by newsId desc)order by newsId desc