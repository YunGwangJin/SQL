use study
go
select*from companyinfo
select*from StockPrice

select companyinfo.name		--**join ���� on�̿��ؼ� �ΰ�
, stockprice.date_
, stockprice.close_
, companyinfo.ID
, StockPrice.ID
from companyinfo
join StockPrice
on companyinfo.ID = StockPrice.ID  

/*alias �̿� �ڵ� ����ȭ*/
select c.name
, s.date_
, s.close_
from companyinfo c
join stockprice s
on c.id=s.id

 /*
 inner join
 left join
 right join
 full outer join
 */
 select 
 c.name 
 , c.IND_ID
 , i.IND_ID
 from companyinfo c
 left join IndustryInfo i
 on c.IND_ID=i.IND_ID

 select
 c.name
 , c.IND_ID
 , i.IND_ID
 from companyinfo c
 full outer join IndustryInfo i
 on c.IND_ID=i.IND_ID

 select*from idmap

 select 
 c.name
 , c.ID
 , d.FIN_ID
 , d.Description
 from companyinfo c
 join idmap i
 on c.id=i.FIN_ID
 join descriptions d
 on i.FIN_ID =d.FIN_ID

/*�������� �̿� ������ ���͸�*/
select seoul.name, seoul.close_
from
(select a.name, s.date_, s.close_
from companyinfo a
join stockprice s
on a.id=s.id
where city = 'seoul'and s.Date_='20201012'and s.close_>=500000
)seoul
where close_>=500000


/*�������� ���� �� ó��*/
select * 
from stockprice
where id=40853
and close_=(select max(close_) from stockprice where id= 40853)
 

/*���� �� ��������*/
select name
from companyinfo
where id in					   --id�� �� ��� ����Ʈ�� ������ ��ȯ
(select id
from stockprice 
group by id
having max(close_)>=500000)		--�ֽİ��� �ְ� 50���� �̻��� ����� id��ȯ

/*VIEW : �⺻ ���̺�� ������ ������ ���̺�*/
create view vw_stockpricewithname
as
select a.name
, a.ID
, s.Date_
, s.close_
from companyinfo a
join StockPrice s
on a.ID=s.ID

select*
from vw_stockpricewithname
where name='nvidia'
order by date_

with cte_price as
(
select a.Name
, a.ID
, s.Date_
, s.close_
from companyinfo a
join stockprice s
on a.id=s.id
)
select*from cte_price where name='nvidia'