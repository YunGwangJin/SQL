go
select*from companyinfo


select*from companyinfo where id = 40853

select*from StockPrice

select max(close_)as 최고가, min(close_)as 최저가, avg(close_) as 평균가
from StockPrice
where id = 40853

select*from StockPrice

select max(close_), min(close_), avg(close_)
from StockPrice
where id = 40853



select city
,sum(employees)as 고용인
,max(employees)as 최대고용
,count(*)as 회사수
from companyinfo
group by City
order by 고용인 desc

select*from companyinfo

/*having : group by에서 집계특성 조건 추가*/
select city
,sum(Employees) as 고용인
,max(Employees) as 최대고용
,count(*) as 회사수
from companyinfo
group by City
having sum(employees)>=2000000
order by 고용인 desc

/*-------------------------------------------------------------------------------
 /*****partition by + 순위함수 / 이동함수*****/
row_number()	: 중복순위 무시(동일한 값 일단 순위 매김, 동일한 순위x)
rank()	:중복순위 적용(동일값 동일 순위, 다음순위 중복순위 적용4 4->6)
dense_ran()	:중복순위 적용(동일값 동일 순위, 다음순위 중복순위 적용x 4 4->5*/

select name
, employees
, ROW_NUMBER() over (order by employees desc) as 순위
from companyinfo
order by 순위



/*이동함수 : lag : 이전 행의 값을 가져옴 // lead : 다음 행의 값을 가져옴		//변화율 확인시 활용*/
--over 뒤에 조건***********

select date_
, close_ as 종가
,lag(close_, 1) over(order by date_) as 어제종가
,lead(close_, 1) over(order by date_) as 내일종가
from StockPrice
where id = 40853
order by Date_



select date_
, close_/lag(close_,1) over (order by date_)-1 as 오늘수익률
, lead(close_,1) over (order by date_) / close_-1 as 내일수익률
from StockPrice
where id = 40853
order by date_

 select name
 ,incinctrycode
 , Employees
 , rank() over (partition by incinctrycode order by employees desc)as 순위	--partition by  : column에서 같은 값 끼리 모아서 연산******
 from companyinfo

 select name
 ,incinctrycode
 , Employees
 , rank() over (partition by incinctrycode order by employees desc)as 순위
 from companyinfo
 where IncInCtryCode is not null
 order by 순위

use study
 select*from companyinfo
 order by IncInCtryCode

 select date_
 , id
 , close_/lag(close_,1) over (partition by id order by date_)-1.0 as 수익률
 from StockPrice

 select date_
 , id
 , close_
 , avg(close_)
 over(partition by id
 order by date_ROWS BETWEEN
 2 preceding and 0 preceding) as SMA3
 from stockprice


