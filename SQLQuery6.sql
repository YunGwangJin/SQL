use study
go
select*from companyinfo

/*scale function*/
create function f_plus
(
@value1 int
, @value2 int
)
returns int 
as 
begin
declare @sum_value int
set @sum_value = (@value1+@value2)
return @sum_value
end

go
select dbo.f_plus(10, 20) as sum_

select * from StockPrice
select*from companyinfo

drop function r_return

create function f_return
(@startdate date, @enddate date, @id int)
returns decimal(12,10)						--함수의 결과값을 소수점 이하 10번째 자리까지 보이게
as begin
declare @startprice numeric					--데이터 숫자형으로 선언
declare @endprice numeric

set @startdate = (select min(Date_) from StockPrice where id = @id and date_>=@startdate)		--휴일인 경우 가까운 거래일 값 찾기
set @enddate = (select max(date_) from StockPrice where id = @id and date_<=@enddate)
set @startprice = (select close_ from StockPrice where id = @id and date_=@startdate)			--수익률 계산 시작
set @endprice = (select close_ from StockPrice where id = @id and date_=@enddate)
return (@endprice/@startprice)
end

select c.*
, dbo.f_return('2020-10-01', '2020-10-12', id) as ret
from companyinfo c



/*테이블 반환 함수*/
create function f_info(@id int)
returns table
as
return
(
select R.FIN_NAME
, R.FIN_VAL				--반환테이블 속성
, R.FDATE
, R.FPRD
, A.NAME

from companyinfo A		--테이블 조인 // 조건
join IDMap I
on A.ID=I.ID
join Ratios R
on I.FIN_ID = R.FIN_ID
where A.ID = @id
)
go
select*from dbo.f_info(40853)	--삼성전자 조회

--syntax2									**오류발생 왜??????? ㅅㅂ?
create function f_info2(@id int)
returns @return_table table
(
fin_name varchar(300)
, fin_val float
, fdate date
, fprd int
, name nvarchar(3000)
)
as
begin 
insert into @return_table	--@return_table에 밑에 데이터 입력
select r.fin_name
, r.fin_val
, r.FDate
, r.FPrd
. a.name
from companyinfo A		
join IDMap I
on A.ID=I.ID
join Ratios R
on I.FIN_ID = R.FIN_ID
where A.ID = @id
return
end


/* 함수 생성/수정 */
drop function f_info2
drop function f_info


--수정 : 생성부분 (create -> alter)
alter function f_info2
returns @return_table table
(
fin_name varchar(300)
, fin_val float
, fdate date
, fprd int
, name nvarchar(3000)
)
as
begin 
insert into @return_table	--@return_table에 밑에 데이터 입력
select r.fin_name
, r.fin_val
, r.FDate
, r.FPrd
. a.name
from companyinfo A		
join IDMap I
on A.ID=I.ID
join Ratios R
on I.FIN_ID = R.FIN_ID
where A.ID = @id
return
end


/* visualization tool ranking

Microsoft Power BI: Best for Business Intelligence
Tableau: Best for Interactive Charts
Qlik Sense: Best for Artificial Intelligence
Klipfolio: Best for Custom Dashboards
Looker: Best for Visualization Options
Zoho Analytics: Best for Zoho Users
Domo: Best for Custom Apps
*/