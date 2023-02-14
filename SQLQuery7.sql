use study
go
select*from companyinfo

/*����� ���� ���ν��� : ����Ͻ� ���� ���� // ������ ó�� ����				(�Լ����� ������ ���)*/				
drop procedure sp_select_companyinfo

create procedure sp_select_companyinfo
as
begin
select*from companyinfo
end						--������ ���ν��� Ȯ�� : db-> ���α׷���-> ���ν���

exec sp_select_companyinfo --���ν��� ����				exec procedure_name

select*from companyinfo

--Ư����ġ���� ������� ���� ��� ���� 10%��� (���󺰷� ����, ����� ���� ��������)    ã�� �Ӽ� : id, name, ����, �����
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

---����ڵ�� �Ⱓ�Է¹޾� �ش�Ⱓ���� �ش����� ������ ���
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

/*���ν��� ���� //  ����*/

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



/*��� // �ݺ���*/

declare @i int =1
declare @i int =111	--if
if @i%2 =0
begin

print N'¦��'

end

else
begin
print N'Ȧ��'
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
print cast(@i as varchar) + N':9�� ������ϴ�.'
set @i = @i+1
continue
end
else
if @added>=3000
begin
print N'@added��'+cast(@added as varchar)+N'���� �Ǿ� �����մϴ�.'
break
end 
set @added = @added + @i
set @i = @i +1
end


--���̺� �̸��� �Ű������� �޾� ���̺� ���
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


-- �ڵ带 �Է��ϼ���
SELECT car_type
, cars
from car_rental_company_car
where (option = "��ǳ��Ʈ" or option="������Ʈ", or option ="���׽�Ʈ")
group by car_type
order by car_type

--REGEXP : Ư�� ���ڿ� ã�� �� ���