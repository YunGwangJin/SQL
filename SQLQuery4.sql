use study
go
select*from companyinfo 

select sum(employees) as ���
, min(Employees) as �ּ�
, max(employees) as �ִ�
, count(employees) as ����
from companyinfo

print len('ABC def fed ACVA')	--���ڿ� ���� ��ȯ
print ltrim('ABC def fed ACVA')	--������� ����
print rtrim('ABC def fed ACVA')	--������� ����
print upper('ABC def fed ACVA')	--��� ���ڸ� �빮�ڷ� ǥ��
print lower('ABC def fed ACVA')	--��� ���ڸ� �ҹ��ڷ� 
print left('ABC def fed ACVA', 6)	--���ʿ��� 6�� ���
print right('ABC def fed ACVA', 6)	--�����ʿ��� 6�� ���
print reverse('ABC def fed ACVA')	--�Ųٷ� ���
print replace('ABC def fed ACVA', 'ABC', 'ZZZ')	--Ư�� ���� ġȯ
print replicate('ABC def fed ACVA', 10)	--Ư�� ���ڿ� �ݺ�
print '['+space(10)+'}'	--����(SPACE)�� ������ ���
print str(12345)+'6789'	--�������� ���ڿ��� ��ȯ
print substring('ABC def fed ACVA', 6, 3)	--���ڿ� �˻� : ��𼭺��� �� �� �˻�
print charindex('fed', ' ABC def fed ACVA ')	--Ư�� ���ڿ��� ��ġ�� �˻�

print getdate()	--���縦 ��ȯ
print year(getdate())	--�⵵ ��ȯ
print month(getdate())	--���� ��ȯ
print day(getdate())	--��¥�� ��ȯ
print datediff(day,getdate(),'2023-01-1')	--�� ��¥ ���� ���̸� ��ȯ
print dateadd(month,3,getdate())	--��¥�� ����

select*from
StockPrice
where month(date_) = '10'	--where�� Ư�� �⵵, ��, �� ����**************

/*cast convert*/
print cast(2020 as varchar)+N'��'--print 2020+'��' --> error
print convert(varchar, 2020)+N'��'								--���ھ� N = �����ڵ����� �˷��ֱ� ����


print cast(getdate() as varchar)
print convert(varchar(8), getdate(), 112)

use study


select *from companyinfo

select IncInCtryCode, count(*)from companyinfo
group by IncInCtryCode