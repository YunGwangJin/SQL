go
select*from companyinfo


select*from companyinfo where id = 40853

select*from StockPrice

select max(close_)as �ְ�, min(close_)as ������, avg(close_) as ��հ�
from StockPrice
where id = 40853

select*from StockPrice

select max(close_), min(close_), avg(close_)
from StockPrice
where id = 40853



select city
,sum(employees)as �����
,max(employees)as �ִ���
,count(*)as ȸ���
from companyinfo
group by City
order by ����� desc

select*from companyinfo

/*having : group by���� ����Ư�� ���� �߰�*/
select city
,sum(Employees) as �����
,max(Employees) as �ִ���
,count(*) as ȸ���
from companyinfo
group by City
having sum(employees)>=2000000
order by ����� desc

/*-------------------------------------------------------------------------------
 /*****partition by + �����Լ� / �̵��Լ�*****/
row_number()	: �ߺ����� ����(������ �� �ϴ� ���� �ű�, ������ ����x)
rank()	:�ߺ����� ����(���ϰ� ���� ����, �������� �ߺ����� ����4 4->6)
dense_ran()	:�ߺ����� ����(���ϰ� ���� ����, �������� �ߺ����� ����x 4 4->5*/

select name
, employees
, ROW_NUMBER() over (order by employees desc) as ����
from companyinfo
order by ����



/*�̵��Լ� : lag : ���� ���� ���� ������ // lead : ���� ���� ���� ������		//��ȭ�� Ȯ�ν� Ȱ��*/
--over �ڿ� ����***********

select date_
, close_ as ����
,lag(close_, 1) over(order by date_) as ��������
,lead(close_, 1) over(order by date_) as ��������
from StockPrice
where id = 40853
order by Date_



select date_
, close_/lag(close_,1) over (order by date_)-1 as ���ü��ͷ�
, lead(close_,1) over (order by date_) / close_-1 as ���ϼ��ͷ�
from StockPrice
where id = 40853
order by date_

 select name
 ,incinctrycode
 , Employees
 , rank() over (partition by incinctrycode order by employees desc)as ����	--partition by  : column���� ���� �� ���� ��Ƽ� ����******
 from companyinfo

 select name
 ,incinctrycode
 , Employees
 , rank() over (partition by incinctrycode order by employees desc)as ����
 from companyinfo
 where IncInCtryCode is not null
 order by ����

use study
 select*from companyinfo
 order by IncInCtryCode

 select date_
 , id
 , close_/lag(close_,1) over (partition by id order by date_)-1.0 as ���ͷ�
 from StockPrice

 select date_
 , id
 , close_
 , avg(close_)
 over(partition by id
 order by date_ROWS BETWEEN
 2 preceding and 0 preceding) as SMA3
 from stockprice


