use study		--�����ͺ��̽� ����
go
select*from companyinfo


select*from companyinfo where id = 40853	--���̺� ��ȸ

select max(close_)as �ְ�, min(close_)as ������, avg(close_) as ��հ�	--COLUMN���� ��ȸ
from StockPrice
where id = 40853		--select ����

select*from StockPrice

select max(close_), min(close_), avg(close_)
from StockPrice
where id = 40853



/*
	�����Լ� 
	count, min/max, avg, sum, group by(�ش� column�� �߽�����, �ش� column�� �ߺ� x ), having
*/

--	select -> from -> where -> group by -> having -> order by

select id														
, max(close_)as �ְ�, min(close_) as ������, avg(close_) as ��հ�
, count(close_)as �ŷ��ϼ�
from StockPrice
group by id
order by �ŷ��ϼ�

select city
,sum(employees)as �����
,max(employees)as �ִ���
,count(*)as ȸ���
from companyinfo
group by City
order by ����� desc


/*having : group by���� ����Ư�� ���� �߰�*/
select city
,sum(Employees) as �����
,max(Employees) as �ִ���
,count(*) as ȸ���
from companyinfo
group by City
having sum(employees)>=2000000
order by ����� desc
  