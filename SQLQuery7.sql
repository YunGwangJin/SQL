use study
go
select*from companyinfo

/*사용자 저장 프로시저 : 비즈니스 로직 구축 // 데이터 처리 가능				(함수보다 폭넓은 사용)*/				
drop procedure sp_select_companyinfo

create procedure sp_select_companyinfo
as
begin
select*from companyinfo
end						--생성된 프로시저 확인 : db-> 프로그래밍-> 프로시저

exec sp_select_companyinfo --프로시저 실행				exec procedure_name

select*from companyinfo

--특정수치보다 고용인이 낮은 기업 하위 10%출력 (나라별로 묶음, 고용인 기준 오름차순)    찾을 속성 : id, name, 나라, 고용인
create procedure em_select_companyinfo  
as
begin
(select id
, name
, employees over (partition by employees>=dense_rank(count(employees)*0.1)
from companyinfo
where employees<=500000
partition by IncInCtryCode
order by Employees)
end

---기업코드와 기간입력받아 해당기간동안 해당기업의 가격을 출력
create proc sp_select_stockprice @id int, @startdate date, @enddate date	--create procedure / procedure_name / @value_name date_type
as					
begin
select date_,close_
from stockprice
where id=@id
and date_ between @startdate and @enddate
order by Date_ desc
end 

go
exec sp_select_stockprice 40853, '2020-10-01', '2020-10-13' 

/*프로시저 수정 //  삭제*/

alter procedure sp_select_stockprice @id int, @startdate date, @enddate date	--create -> alter
as
begin
select date_,close_
from stockprice
where id=@id
and date_ between @startdate and @enddate
order by Date_ desc
end 

drop procedure sp_select_companyinfo



/*제어문 // 반복문*/

declare @i int =1
declare @i int =111	--if
if @i%2 =0
begin

print N'짝수'

end

else
begin
print N'홀수'
end

declare @i int =1	--while
declare @added bigint =0
while(@i<=100)
begin 
set @added = @added + @i
set @i = @i+1
end
print @added



declare @added bigint =0
while(@i<=100)
begin
if @i%9=0
begin
print cast(@i as varchar) + N':9의 배수업니다.'
set @i = @i+1
continue
end
else
if @added>=3000
begin
print N'@added가'+cast(@added as varchar)+N'값이 되어 종료합니다.'
break
end 
set @added = @added + @i
set @i = @i +1
end


--테이블 이름을 매개변수로 받아 테이블 출력
alter procedure sp_select_table_info @tablename varchar(300)
as
begin
declare @sqlquery varchar(3000)
set @sqlquery = 'select*from '+ @tablename

exec(@sqlquery)

end
go

exec sp_select_table_info 'StockPrice'
exec sp_select_table_info 'companyinfo'


-- 코드를 입력하세요
SELECT car_type
, cars
from car_rental_company_car
where (option = "통풍시트" or option="열선시트", or option ="가죽시트")
group by car_type
order by car_type

--REGEXP : 특정 문자열 찾을 때 사용