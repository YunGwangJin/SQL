use study		--데이터베이스 접근
go
select*from companyinfo


select*from companyinfo where id = 40853	--테이블 조회

select max(close_)as 최고가, min(close_)as 최저가, avg(close_) as 평균가	--COLUMN선택 조회
from StockPrice
where id = 40853		--select 조건

select*from StockPrice

select max(close_), min(close_), avg(close_)
from StockPrice
where id = 40853



/*
	집계함수 
	count, min/max, avg, sum, group by(해당 column을 중심으로, 해당 column값 중복 x ), having
*/

--	select -> from -> where -> group by -> having -> order by

select id														
, max(close_)as 최고가, min(close_) as 최저가, avg(close_) as 평균가
, count(close_)as 거래일수
from StockPrice
group by id
order by 거래일수

select city
,sum(employees)as 고용인
,max(employees)as 최대고용
,count(*)as 회사수
from companyinfo
group by City
order by 고용인 desc


/*having : group by에서 집계특성 조건 추가*/
select city
,sum(Employees) as 고용인
,max(Employees) as 최대고용
,count(*) as 회사수
from companyinfo
group by City
having sum(employees)>=2000000
order by 고용인 desc
  