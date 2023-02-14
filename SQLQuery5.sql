use study
/*1.���̺� ����*/
create table persons
(
personid int	--creat table
, lastname varchar(255)
, firstname varchar(255)
, address varchar(255)
, city varchar(255)
)
go
select*from persons

/*2.���̺� ����*/
drop table persons --delete table

/*3.���̺� ����*/
create table persons
(
personid int	--creat table
, lastname varchar(255)
, firstname varchar(255)
, address varchar(255)
, city varchar(255)
)


/*alter table : �� �߰�(add) ����(drop column) / �������� �߰� / �� Ÿ�� ����(alter column)*/						--alter table ... add / drop table / alter column.... (data type)
alter table persons add newcol int  --add column																--insert in to table_name(c1, c2,...) values('value1', 'value2'...)
go																												--update table_name set c1 = '...', c2='...' where cn='...'
select*from persons

alter table persons drop column newcol  --drop column
go
select*from persons

alter table persons alter column personid int	--chage datatype
go
select*from persons

/*4.������ �ڵ鸵*/ 
insert into persons (lastname, firstname) values('alfred', 'hitcokc')  --������ �߰�
go
select*from persons

insert into persons values (20, 'alfred','hitchoook', 'korea','seoul')	--��ü Į�� �Ѳ����� ������ �߰�
go
select*from persons

delete from persons
where personid is null  /*null Ư�� ����***********/
create table customers(
go
select*from persons

update persons		--������ ����
set address = 'teheran-ro 54', city='seoul'
where personid =20
go
select*from persons

/*5.���̺� ��������*/
-- not null / unique / primary key / foreign key /default
id int not null
, lastname varchar(255) not null
, firname varchar(255) not null
, age int                                   )
select*from customers

--insert into customers(id, age) values(10 ,30) : ���� ���� x error

drop table customers
go
create table customers
(
id int not null unique
, lastname varchar(255) not null
, firstname varchar(255) not null
, age int
)
go
insert into customers values(10, 'a', 'b',20)  
insert into customers values(10, 'c', 'd',20)	--error : unique�������� ����

/*6.�߿���������*/
--*******************primary key   : unique // not null // �ߺ�x
alter table customers add constraint pk_customers primary key (id) --primary key
alter table customers drop constraint pk_customers	--primary key ����


--*******************foreign key
--�߸��� ������ ������ ����
drop table customers

create table customers
(
id int primary key
, lastname varchar(255)
, firstname varchar(255)
, age int
)

create table orders
(
orderid int primary key not null 
,orderumber int not null
, personid int foreign key references customers(id)
)

insert into customers values(10,'a', 'b',20)
insert into customers values(11, 'c', 'd', 22)
insert into customers values(12, 'e','f', 21)
insert into customers values(13, 'A', 'ZZZ', 30)

insert into orders values(1, 20, 13)
insert into orders values(1, 20, 14)  --customers ���̺� id���� 14�� �����Ͱ� ����********************************************







