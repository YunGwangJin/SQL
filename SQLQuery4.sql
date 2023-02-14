use study
go
select*from companyinfo 

select sum(employees) as 평균
, min(Employees) as 최소
, max(employees) as 최대
, count(employees) as 갯수
from companyinfo

print len('ABC def fed ACVA')	--문자열 길이 변환
print ltrim('ABC def fed ACVA')	--선행공백 제거
print rtrim('ABC def fed ACVA')	--후행공백 제거
print upper('ABC def fed ACVA')	--모든 문자를 대문자로 표시
print lower('ABC def fed ACVA')	--모든 문자를 소문자로 
print left('ABC def fed ACVA', 6)	--왼쪽에서 6자 출력
print right('ABC def fed ACVA', 6)	--오른쪽에서 6자 출력
print reverse('ABC def fed ACVA')	--거꾸로 출력
print replace('ABC def fed ACVA', 'ABC', 'ZZZ')	--특정 패턴 치환
print replicate('ABC def fed ACVA', 10)	--특정 문자열 반복
print '['+space(10)+'}'	--공백(SPACE)을 여러개 출력
print str(12345)+'6789'	--정수형을 문자열로 반환
print substring('ABC def fed ACVA', 6, 3)	--문자열 검색 : 어디서부터 몇 자 검색
print charindex('fed', ' ABC def fed ACVA ')	--특정 문자열의 위치값 검색

print getdate()	--현재를 반환
print year(getdate())	--년도 반환
print month(getdate())	--월을 반환
print day(getdate())	--날짜를 반환
print datediff(day,getdate(),'2023-01-1')	--두 날짜 간의 차이를 반환
print dateadd(month,3,getdate())	--날짜를 더함

select*from
StockPrice
where month(date_) = '10'	--where문 특정 년도, 월, 일 추출**************

/*cast convert*/
print cast(2020 as varchar)+N'년'--print 2020+'년' --> error
print convert(varchar, 2020)+N'년'								--문자앞 N = 유니코드임을 알려주기 위함


print cast(getdate() as varchar)
print convert(varchar(8), getdate(), 112)

use study


select *from companyinfo

select IncInCtryCode, count(*)from companyinfo
group by IncInCtryCode