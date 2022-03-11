select sal
from emp;

select ename, sal, job, hiredate, deptno, empno
from emp
order by sal desc;  --desc(��������) / asc(��������)
 
select ename, sal, job, hiredate, deptno, empno
from emp
order by to_date(hiredate);

select empno, ename, job, deptno, sal
from emp
order by deptno, sal desc; --���̺��� �μ���ȣ�� �������� ���� �� �μ���ȣ�� ���� ��� �޿��� ���� ������ ����

select empno, ename, job, deptno, sal
from emp
order by 4,5 desc; --4,5�� select���� ����� column position��

select ename, sal, sal*12 "Annual Salary"
from emp
order by sal*12 desc; -- ǥ���� �������� �˾ƺ���

select ename, sal, sal*12 "Annual Salary"
from emp
order by "Annual Salary" desc; -- Alias�������� �˾ƺ���

select lower('Hello World'), upper('Hello World'), initcap('hello world')
from dual;

select concat(ename, concat('works as a',job))
from emp;

select length('korea'),length('���ѹα�'),lengthb('korea'),lengthb('���ѹα�')
from dual;

desc dual
select*from dual;

select substr('Hello World', 7), substr('Hello World',2,4)
,substr('Hello World',-5)
from dual;

-- emp ���̺��� �̸��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ��ȸ�Ѵ�.
-- ����� �̸������� �����϶�.
select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

--emp ���̺��� �̸� �� 'L'���� ��ġ�� ��ȸ�Ѵ�.

select ename,instr(ename, 'L')e_null,
instr(ename,'L',1,1)e_11,
instr(ename,'L',1,1)e_12,
instr(ename,'L',4,1)e_41
from emp
order by ename;

select sal, lpad(sal, 10, '$'), rpad(sal, 10, '$')
from emp;

select ltrim('Hello World', 'H') , ltrim('Hello World', 'e') 
       , rtrim('Hello World', 'd') , rtrim('Hello World', 'l') 
from dual; --�߰��� �ִ� �͵��� ���� �� ����.

select length('   he  llo   '), trim('   he  llo   '), trim(length('   he  llo   '))
from dual;

select replace('JACK and JUE', 'J', 'BL') 
from dual; -- jack�� jue�ܾ�� j�� bl�� ��ü�ؼ� ����Ʈ�ض�.

select translate('SQL*Plus', ' *SQL', '_s3#') 
from dual;

SELECT CHR(67)||CHR(65)||CHR(84) "Dog"
  FROM DUAL;
  
select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

select ename, job, LTRIM(job,'A'),sal,LTRIM(sal,1)
from emp
where deptno=20;

select ename, job, rtrim(job,'T'), sal,rTRIM(sal,1)
from emp
where deptno=10;

select ename, replace(ename,'SC','*?')
from emp
where deptno=20;

select ename, translate(ename,'SC','*?')
from emp
where deptno=20;

SELECT TRIM ( LEADING 'A' FROM 'AABDCADD') ���1 , -- �տ� A
TRIM ( 'A' FROM 'AABDCADD') ���2,-- �տ� A
TRIM ( TRAILING 'D' FROM 'AABDCADD') ���3 -- �ڿ� D
FROM DUAL ;

-- ��>  translate �Լ��� �̿��ؼ� ����̸��� �ҹ��ڷ� �ٲپ� ��ȸ
SELECT empno, ename,
          translate(ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
             'abcdefghijklmnopqrstuvwxyz') u_lower
FROM emp
WHERE deptno = 10;

select round(4567.678) ���1, round(4567.678, 0) ���2,
round(4567.678, 2) ���3, round(4567.678, -2) ���4
from dual;

select trunc(4567.678) ���1, trunc(4567.678, 0) ���2,
trunc(4567.678, 2) ���3, trunc(4567.678, -2) ���4
from dual;


SELECT POWER( 2, 10) ���1, CEIL (3.7) ���2, FLOOR (3.7) ���3
 FROM dual;
 
 --��> emp ���̺��� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
 select sal, mod(sal,30)
 from emp
 where deptno=10;
 
 --��> emp ���̺��� ����� Ȧ���� ��� ���� ����Ͽ���.
 select empno, ename, sal
 from emp
 where mod(empno, 2)=1;

select ename, sal, sign (sal-2975)
from emp
where deptno=20;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
select SYSDATE, SYSTIMESTAMP, current_date, current_timestamp
        , sessiontimezone
from dual;

alter session set time_zone='+3:00';
select sysdate, systimestamp, current_date, current_timestamp,sessiontimezone
from dual;


-- ��>EMP ���̺��� ��������� �ٹ��ϼ��� �� �� �� ���ΰ��� ��ȸ�Ѵ�.
select ename, hiredate, sysdate, sysdate-hiredate "Totoal Days",
trunc((sysdate-hiredate)/7,0) weeks,
round(mod((sysdate-hiredate),7),0) days
from emp
order by sysdate-hiredate desc;

select extract ( day from sysdate) ����,
extract ( month from sysdate) ��,
extract ( year from sysdate) �⵵
from dual;

select systimestamp a,
extract(hour from systimestamp) b,
to_char(systimestamp,'HH24')c
from dual;

select ename, hiredate, extract(year from hiredate)"year",
extract(day from hiredate)"day"
from emp
where deptno = 20;

select ename, hiredate, to_char ( hiredate, 'YYYY')"year",
to_char(hiredate, 'DD')"day"
from emp
where deptno = 20;


--emp ���̺��� 10�� �μ����� ��������� �ٹ� ������ ����Ͽ� ��ȸ�Ѵ�.
select ename, hiredate, sysdate,
months_between(sysdate, hiredate) m_between,
trunc(months_between(sysdate, hiredate),0) t_between
from emp
where deptno =10
order by months_between(sysdate, hiredate)desc;

--emp ���̺��� 10���� 30�� �μ����� �Ի� ���ڷκ��� 5������ ���� �� ��¥�� ����Ͽ� ���
select ename, hiredate, add_months(hiredate,5)a_month
from emp
where deptno in (10,30)
order by hiredate desc;

--emp ���̺��� 10,30�� �μ����� �Ի� ���ڷκ��� ���ƿ��� �ݿ���, ������� ����Ͽ� ��ȸ
select ename, hiredate, next_day(hiredate, '�ݿ���') n_6,
next_day(hiredate, '�����') n_7
from emp
where deptno in (10,30)
order by hiredate desc;

--emp ���̺��� �Ի��� ���� �ٹ� �ϼ��� ����Ͽ� ��ȸ�Ѵ�.
-- ��, ����ϰ� �Ͽ��ϵ� �ٹ��ϼ��� �����Ѵ�.

select empno, ename, hiredate, last_day(hiredate)l_last,
last_day(hiredate) - hiredate l_day
from emp
order by last_day(hiredate)-hiredate desc;

--
select round(to_date('21/7/16'),'month'),
round(to_date('21/7/15'),'month'),
round(to_date('21/7/16'),'year'),
round(to_date('21/6/15'),'year')
from dual;

select  trunc(to_date('21/7/16'), 'MONTH'),
trunc(to_date('21/7/15'), 'MONTH'), 
trunc(to_date('21/7/16'), 'YEAR'),
trunc(to_date('21/6/15'), 'YEAR')
from dual;

select 10||10 from dual;
select '10'+'10' from dual;

select sal, to_char(sal, '$999,999,999.00')from emp;
select hiredate, to_char(hiredate, 'YYYY"��" MM"��" DD"��"')from emp;

select to_number('$12,345.50','$99,999.00') from dual;
select to_date('2022�� 1�� 3��','YYYY"��"MM"��"DD"��"')from dual;

--��> ���ó�¥�� 1�� �� ���° ������ ��ȸ�Ѵ�.
--��, 1�� 1�� ���� ù° �Ͽ��� ������ 1������ �Ѵ�.
select to_char(sysdate,'WW')test
from dual;

--��> emp������ clerk�� ������� ���, �̸�, �Ի����ڸ� ��¥/�ð���
--'1998�� 1�� 1��(����) ��:��:��'�� ���·� ��ȸ.
select empno, ename,job, to_char(hiredate,'YYYY"��"MM"��"DD"��"')
from emp
where job='CLERK';

--��> ��� ����� �Ի��� ù��° ���ͺ� ��¥�� 6������ ����� ù��° �ݿ����Դϴ�.
-- ��� ����� �Ի��� ���ͺ� ��¥�� ����ϼ���.

select ename, hiredate, to_char(next_day(add_months(hiredate,6),'��'),'YYYY/month/DD')"next 6 month"
from emp;

--# TO_TIMESTAMP : �� ���ڸ� timestamp ��¥ ������ �������� ��ȯ
--# TO_YMINTERVAL : ���ڿ��� INTERVAL YEAR TO MONTH ���·� ��ȯ
--# TO_DSINYERVAL : ���ڿ��� INTERVAR DAY TO SECOND������ ��ȯ

select to_timestamp('2004-8-20 1:30:00', 'YYYY-MM-DD HH:MI:SS')
from dual;

select to_timestamp('10-09-77 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF')
from dual;

select sysdate, sysdate + to_dsinterval('003 11:25:33')as "���"
from dual;

--��> ����� �̸�, �Ի���, �Ի�����, �Ի��Ͽ��� 1�� 6���� ���� ��¥�� ��ȸ�϶� -- 'to yminterval' �Լ� �̿�

select empno, ename, hiredate,
hiredate+to_yminterval('01-06')as date2
from emp;

--emp ���̺� 30�� �μ������� ����̸�, �޿�, ���ʽ�, �޿�+���ʽ��� ��ȸ

select ename, sal, comm,sal+comm, sal+nvl(comm,0)
from emp
where deptno=30; 

select ename, sal, comm,sal+comm
from emp
where deptno=30
and comm is not null;

--�� emp ���̺��� 30�� �μ��� �ƴ� ������� ����̸�, �μ���ȣ, �Ŵ��� ��ȣ, �Ŵ�����ȣ�� null�̸�
--'������'�� ǥ���ϰ�, �Ŵ�����ȣ�� ������ '���'���� ǥ��

select ename, mgr, deptno, nvl2(mgr,'���','������')
from emp
where deptno!=30;

--�� emp ���̺��� 30�� �μ������� ����̸�, ����, ������ 'salesman'�� ��� null������ �����ؼ� ��ȸ�Ѵ�.
select ename, job, nullif(job,'SALESMAN')as result
from emp
where deptno=30;

--��> emp ���̺��� �̸�, ���ʽ�, ����, ���ʽ��� null �ƴ� ��� ���ʽ���, ���ʽ��� null�� ��쿣 ������, ��� null�� ��쿣 50���� ǥ��.
select ename, comm, sal, coalesce(comm,sal,50) result
from emp;

select ename, sal, comm, greatest(sal,comm)���
from emp
where comm is not null;

select ename, sal, comm, least(sal,comm)���
from emp
where comm is not null;

select coalesce(null, null, null, 1,2,3),
coalesce(null, null, null, null, null, null),
coalesce(0, null, null, 1,2,3)
from dual;

--#decode : SQL ������ IF - THEN - ELSE IF - END ������ ��� �� �� �ֵ��� Oracle ���� �����ϴ� �Լ�
 select DECODE (9+1, 9, '����1', 10, '����2') from dual;
 select DECODE (9+1, 9, '����1', 10, '����2', '����3') from dual;

--decode(ǥ����, �񱳰�1, ���ϰ�1, �񱳰�2, ���ϰ� 2,....[���ϰ�n])
--if ǥ����=�񱳰� 1 then ���ϰ� 1
--else if ǥ���� = �񱳰�2 then ���ϰ� 2
--....
--else ���ϰ� n

 --��> EMP����� ��� ������ analyst�� ��� �޿��� 10% ����, clerk�� ��� �޿��� 20%����, manager�� ��� 30%����,
 --president�� ��� 40% ����, salesman�� ��� 50%����, �� �ܿ� ���� �޿������� �������� ��ȸ�Ѵ�.
 
--ANSI��ȸ - SQL ǥ�� ����
--SQL1999ǥ�ؿ��� ����ó�� ������ �߰���
--CASE  [ǥ����] WHEN �񱳰�1 THEN ó��1
--      	      [ WHEN �񱳰�2 THEN ó��2
--                      :
--                   WHEN �񱳰�N THEN ó��N ]
--                   [ ELSE ����Ʈó�� ]
--                    END
--CASE  WHEN ������1 THEN ó��1
--        [ WHEN ������2 THEN ó��2
--                     :
--         WHEN ������N THEN ó��N ]
--        [ ELSE ����Ʈó�� ]
--         END

 select empno, ename, job, sal, decode (job, 'ANALYST',sal*1.1,'CLERK',sal*1.2,'MANAGER',sal*1.3,'PRESIDENT',sal*1.4,
 'SALESMAN',sal*1.5,sal)
 from emp;

select empno, ename, sal, job, case job when 'ANALYST' then sal*1.1 
when 'CLERK' then sal*1.2
when 'MANAGER' then sal*1.3
when 'PRESIDENT' then sal*1.4
when 'SALESMAN' then sal*1.5
else sal end salary
from emp;

--��> �����ȣ, �̸�, �޿�, �޿��� ������ ����Ͻÿ�.
--�޿��� 1000�̾��̸� 0
--�޿��� 1000�̻�~2000�̸��̸� �޿��� 3%
--�޿��� 2000�̻�~3000�̸��̸� �޿��� 6%
--�޿��� 3000�̻�~4000�̸��̸� �޿��� 9%
--�޿��� 4000�̻��̸� �޿��� 12%

select empno, ename, sal, case when sal<1000 then sal*1 
when sal<2000 then sal*0.97
when sal<3000 then sal*0.94
when sal<4000 then sal*0.91
else sal*0.88 end "������ ������ �޿�"
from emp;

select empno, ename, sal, decode(trunc(sal/1000),0,0,
1, sal*0.03,
2, sal*0.06,
3, sal*0.09,
sal*0.12) "TAX"
from emp;

SELECT MIN(ename), MAX(ename), MIN(hiredate), MAX(hiredate)    
FROM emp;

select avg(sal), max(sal), min(sal),sum(sal)
from emp
where job = 'salesman';


select count(*)c1,count(comm)c2,avg(comm)c3,avg(nvl(comm,0))c4
from emp;

select count(deptno) c_dept, count(distinct deptno) c_dis,
count(distinct job)c_job
from emp;

select stddev(sal), variance(sal)
from emp;

select count(*),trunc(avg(sal),1), min(sal),max(sal),sum(sal)
from emp
group by deptno;

select count(*)�μ���ȣ,job ����,trunc(avg(sal),1)���, min(sal)�ּ�,max(sal)�ִ�,sum(sal)��
from emp
group by deptno, job;

select count(*)�ο���, job ����,trunc(avg(sal),1)���,sum(sal)��
from emp
group by job;

select deptno �μ���ȣ, count(*)�ο���, trunc(avg(sal),1)���,sum(sal)��,min(sal)�ּ�,max(sal)�ִ�
from emp
group by deptno
order by sum(sal) desc;

--select ~ column, ǥ����, �׷��Լ�ǥ����, ..  --- 5
--from ~        --1
--[where ~]    ---2     filter ����
--[group by ~]  --3  
--[having �׷��Լ� ���� ����]  ---4
--[order by ~]  --6     

SELECT deptno �μ���ȣ, count(*) �ο���, sum(sal) �޿�����
FROM emp
GROUP BY deptno
HAVING count(*) > 4;

select deptno , avg(sal), sum(sal)
from emp
group by deptno
HAVING max(sal) >= 2900;

select listagg(ename,',')within group (order by ename)as names
from emp;

select deptno, listagg(ename,',') within group (order by ename) as names
from emp
group by deptno;

select deptno, listagg(job,',') within group(order by job desc) as jobs
from emp
group by deptno;

select listagg(ename, ':') within group(order by ename desc) "Ename",
listagg(hiredate, ':') within group(order by ename desc) "hiredate",
min(hiredate) "Earliest"
from emp
where deptno=20;

select ename, job, listagg(ename,',') within group(order by ename)over(partition by job)
as names
from emp
where job in('MANAGER','SALESMAN');

select ename, job, listagg(ename,',')within group(order by ename) as names
from emp
where job in ('MANAGER', 'SALESMAN')
group by job;

select sum(sal), deptno, listagg(ename,',')
within group(order by sal)as names
from emp
group by deptno
order by sum(sal) desc;

select to_number(null), ' ',avg(sal)
from emp
union all
select deptno, ' ',avg(sal)
from emp
group by deptno
union all
select deptno, job,avg(sal)
from emp
group by deptno, job;

select deptno,job,avg(sal)
from emp
group by rollup(deptno,job);

select emp.empno, emp.ename, emp.deptno, dept.dname
from emp, dept;

select a.ename, a.deptno, b.dname, b.loc
from emp a, dept b
where a.deptno=b.deptno;

select emp.empno, emp.ename, emp.deptno, dept.dname
from emp, dept;  ----56rows (14rows * 4rows)   ���� ���� ��������  cartesian product,  cross join(sql3ǥ��)

select a.ename, a.deptno, b.dname, b.loc
from emp a natural join dept b;

--natural join�� �� ���̺��� ������ �̸��� ���� ��� ���� �������� join����
--natural join�� �� ���̺��� ������ �̸��� �÷��� �÷�Ÿ���� �ٸ� ��� join�� �����ϸ� ���� �߻�
--natural join�� join ������ �÷��� �տ� ������ ���̺���̳� alias�� ����� �� ����

create table emp20
as select empno, ename, deptno deptid, sal, job
from emp
where deptno = 20;

desc emp20
select * from emp20;

select a.empno, a.ename, a.deptid, b.dname
from emp20 a join dept b on a.deptid = b.deptno;

select a.empno,a.ename, a.deptid, b.dname
from emp20 a join dept b on a.deptid = b.deptno;

desc salgrade 
select * from salgrade;

select a.empno, a.ename, a.salgrade, b.sal
from emp20 b join sal a on a.salgrade = sal;

select a.empno, a.ename, a.sal, b.grade
from emp a, salgrade b
where a.sal between b.losal and b.hisal;

select a.empno, a.ename, a.sal, b.grade
from emp a join salgrade b on (a.sal between b.losal and b.hisal);


--��> �����ȣ, ����̸�, �����ڹ�ȣ, �������̸� ��ȸ��� ����
--self join - �ڱ� ������ ������ ���̺�(PK<-FK�� ����)������ �����
select a.empno, a.ename, a.mgr, b.ename
from emp a, emp b
where a.mgr = b.empno;

select a.empno, a.ename, a.mgr, b.ename
from emp a join emp b on a.mgr = b.empno;

insert into emp (empno, ename)
value(7000,'ȫ�浿');
commit;

select empno, ename, deptno,job,sal
from emp;

--���� �÷����� null�ΰ�� PK�� FK equi ���� ���ǿ����� ���ε��� ���ؼ� ����
--����� ������ => ���� ����� ���������� outer join�� �����ؾ���

--��>�μ��� ���� �������� ���� ����� �����ؼ� ������� �μ���ȣ�� �μ��̸��� ���

select a.ename,a.deptno, b.dname,b.loc
from emp a, dept b
where a.deptno = b.deptno;

select a.ename, a.deptno, b.dname, b.loc
from emp a, dept b
where a.deptno=b.deptno(+);

select a.ename, a.deptno, b.dname, b.loc
from emp a left outer join dept b on a.deptno = b.deptno;

--��> �μ��� ��������� ���
--(40�� �μ� ���� ���� ����� �����ϵ��� SQL �ۼ�)

select b.deptno, b.dname, a.empno, a.ename
from emp a, dept b
where a.deptno = b.deptno
order by 1 asc;

select b.deptno, b.dname, a.empno, a.ename
from emp a right outer join dept b on a.deptno = b.deptno
order by 1 asc;

select b.deptno, b.dname, a.empno, a.ename
from emp a, dept b
where a.deptno(+)=b.deptno
order by 1 asc;

desc mgr
select * from emp;

select a.empno a.ename, b.deptno, d.ename
from emp a, dept b
where a.deptno(+)=b.deptno(+)
order by 1 asc;

--7000���� ��� ���ڵ�� 40�� �μ� ���� ���ڵ带 ��� ���� ����� ����

select b.deptno, b.dname, a.empno, a.ename
from emp a full outer join dept b on a.deptno = b.deptno
order by 1 asc;

select b.deptno, b.dname, a.empno, a.ename
from emp a cross join dept b;

