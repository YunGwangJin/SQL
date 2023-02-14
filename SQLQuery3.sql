use study
go
select*from companyinfo
select*from StockPrice

select companyinfo.name		--**join 조건 on이용해서 부과
, stockprice.date_
, stockprice.close_
, companyinfo.ID
, StockPrice.ID
from companyinfo
join StockPrice
on companyinfo.ID = StockPrice.ID  

/*alias 이용 코드 간소화*/
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

/*서브쿼리 이용 데이터 필터링*/
select seoul.name, seoul.close_
from
(select a.name, s.date_, s.close_
from companyinfo a
join stockprice s
on a.id=s.id
where city = 'seoul'and s.Date_='20201012'and s.close_>=500000
)seoul
where close_>=500000


/*서브쿼리 단일 값 처리*/
select * 
from stockprice
where id=40853
and close_=(select max(close_) from stockprice where id= 40853)
 

/*단일 열 서브쿼리*/
select name
from companyinfo
where id in					   --id가 그 기업 리스트에 있으면 반환
(select id
from stockprice 
group by id
having max(close_)>=500000)		--주식가격 최고가 50만원 이상의 기업의 id반환

/*VIEW : 기본 테이블로 유도된 가상의 테이블*/
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