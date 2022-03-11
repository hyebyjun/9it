--��> 7566�� ������� �޿��� ���� �޴� ����� �̸�, �޿��� ��ȸ�϶�.

select ename, sal
from emp
where sal > (
select sal
from emp
where empno = 7566);

--��> emp���̺��� �����ȣ�� 7521�� ����� ������ ���� �޿��� 7934�� �������
--���� ����� �����ȣ, �̸�, ������, �Ի�����, �޿��� ��ȸ�϶�
--where���� ���Ǹ��� subquery ���� ����

select  empno, ename, job, hiredate, sal
from emp
where job = (select job
from emp
where empno = 7521)
and sal >(select sal 
from emp
where empno = 7934);

--��>emp ���̺��� �޿��� ���� ���� �޴� ����� �̸�, �μ���ȣ, �޿�, �Ի�����
--��ȸ�϶�.
--�μ����� �ִ밪�� �޿��� �޴� ����� �����ȣ, �̸�, �޿�, �μ���ȣ
select empno, ename, sal, deptno, hiredate
from emp
where sal in (select max(sal)
from emp);

--��>emp ���̺��� �޿��� ��պ��� ���� ����� �����ȣ, �̸�, ������, �޿�,
--�μ���ȣ�� ����Ͽ���.

select empno, ename, sal, deptno, job
from emp
where sal < (select avg(sal)
from emp);

--��>emp ���̺��� �μ��� �ּұ޿��� 20�� �μ��� �ּ� �޿����� ���� �μ��� ��ȸ�϶�.

select deptno, min(sal)
from emp
group by deptno
having min(sal) > (select min(sal)
from emp
where deptno = 20);

--��> �� �μ��� �ִ� �޿��� ���� ����� �����ȣ, �̸�, �޿�, �μ���ȣ�� ���
select empno, ename, sal, deptno
from emp
where sal in (select max(sal)
from emp
group by deptno);

update emp set deptno=10, sal=3000
where empno = 7000;
commit;
insert into emp ( empno, ename, deptno, sal) values(7000, 'Hong',10,3000);

select empno, ename, sal, deptno
from emp
where (deptno,sal) in (select deptno, max(sal)
from emp
group by deptno);

--��>������ salesman�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� �̸�,
--�޿�, ������ ��ȸ�ϴ�.

select ename, sal, job
from emp
where job !='SALESMAN'
and sal > any(select sal
from emp
where job ='SALESMAN');

--��>������ SALESMAN�� ��� ������� �޿��� ���� �޴� ����� �̸�, �޿�, ����, �Ի���,
--�μ���ȣ�� ��ȸ�϶�

select ename, sal, job, hiredate, deptno
from emp
where job != 'SALESMAN'
and sal> all(select sal from emp
where job='SALESMAN');

--��>FORD, BLAKE�� ������ �� �μ��� ���� ����� ������ ��ȸ
--(��, FORD, BALKE ��� ������ ������� ����)

select ename, sal, mgr, deptno
from emp
where mgr in (select mgr from emp
where ename in ('FORD', 'BLAKE'))
and deptno in (select deptno from emp
where ename in ('FORD', 'BLAKE'))   --non-pair wise��
and ename not in ('FORD', 'BLAKE');

select ename, mgr, deptno
from emp
where (mgr ,deptno) in (select mgr , deptno
from emp
where ename in ('FORD', 'BLAKE'))  -- pair wise��
and ename not in ('FORD', 'BLAKE');

--��> �Ҽ� �μ��� ��� �޿����� ���� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ, �Ի���,
--���� ������ ��ȸ�ϴ� SQL���̴�. (Co-related subquery�� join)

select ename,deptno,hiredate,sal,
(select avg(sal) from emp t
where t.deptno=e.deptno) deptavgsal
from emp e
where sal < (select avg(sal)
from emp t
where t.deptno=e.deptno);

select ename, sal, deptno, hiredate, job
from emp e
where sal > (select avg(sal)
from emp
where deptno = e.deptno);

select e.ename, e.sal, e.deptno, e.hiredate, e.job
from emp e,(select deptno, avg(sal) avg_sal
from emp
group by deptno) e2
where e.sal > e2.avg_sal
and e.deptno = e2.deptno;

select rownum, empno, ename, deptno, sal
from emp;


select rownum, empno, ename, deptno, sal      ---2
from emp                    -----1
order by sal desc;          ----3

select rownum no, empno, ename, deptno, sal 
from (select  empno, ename, deptno, sal      
        from emp                    
        order by sal desc) a 
where rownum < 6 ;    --Top_N ����

select empno, ename, (case when deptno = (select deptno from dept
where loc = 'DALLAS') then 'TOP'
else 'BRENCH' end) as location
from emp;

select ename, empno, 
decode (deptno ,(select deptno from dept
where loc = 'DALLAS'), 'TOP', 'BRENCH') as location
from emp;

select ename, deptno, sal,
(select avg(sal) from emp where deptno = a.deptno)as asal
from emp a;

select ename, deptno, sal, hiredate
from emp a
order by(select dname from dept
where deptno = a.deptno) desc;

select deptno, ename
from emp
where deptno in(
    select deptno
    from emp
    where ename like '%T%');


--��>�Ҽ� ����� �����ϴ� �μ��� �μ���ȣ, �μ��� ��ȸ 
select deptno, ename
from emp
where exists(
    select deptno
    from emp
    where deptno in (10,20,30));
--��> �������� ����鸸 ��ȸ 
SELECT ENAME,JOB
FROM EMP
WHERE JOB = 'MANAGER';

SELECT ename, JOB
FROM emp
where job = 'MANAGER';

select empno, ename
from emp
where empno in(select mgr
from emp);

select empno, ename, job ,hiredate, sal, deptno
from emp e
where exists (select 1
from emp
where e.empno=mgr);


--��> �����ڰ� �ƴ� �Ϲ� ����鸸 ��ȸ
select ename,empno
from emp
where empno not in (select mgr from emp
where mgr is not NULL);

select empno, ename, job, hiredate, sal deptno
from emp e
where not exists(select 1 from emp
where e.empno=mgr);

desc dept
 INSERT INTO dept VALUES (70, 'MARKETING','seoul' ) ;
 
desc dept
INSERT INTO dept (deptno, dname, loc)
 VALUES (70, 'MARKETING','seoul' ) ;  --deptno�÷��� PK����� ��� 

insert into emp (empno, ename, hiredate)
values (6000, 'Kim', sysdate);  ---������ �Լ�
select * from emp;

INSERT INTO dept
values (60, 'MIS', null);
select * from dept;

insert into emp (empno, ename, hiredate)
values (6000, 'Kim', sysdate);  ---������ �Լ�
select * from emp;


insert into emp (empno, ename, hiredate)
values (6000, 'Kim', to_date('02-25-97','MM-DD-RR'));  --?

insert into emp (empno, ename, hiredate)
values (6000, 'Kim', to_date('02-25-97', 'MM-DD-RR'));

INSERT INTO dept (deptno, dname)
values (1000, 'IT'); ---?

INSERT INTO dept ( dname, loc)
values ('IT', 'KangNam');  ---?

insert into emp(empno,ename,deptno)
values(7001, 'Lee',50);

insert into emp (empno, ename, hiredate)
values (6000, 'Kim', sysdate);  ---������ �Լ�
select * from emp;

drop table test purge;
create table test (name varchar2(10),
address varchar2(50) default 'seoul');

desc test
select * from test;

INSERT INTO dept (deptno, dname)
values (60, 'MIS');

insert into emp(empno, ename, hiredate)
values (6000, 'Kim', to_date('02-25-97', 'MM-DD-RR'));

drop table test purge;
create table test(name varchar2(10),
address varchar2(50) default 'seoul');
desc test
select * from test;

insert into test(name)values('kim');

drop table test (name) values ('kim');
insert into test values ('lee', 'inchon');
insert into test values ('park', null);
select * from test;
insert into test values ('song', default);

select * from test;

drop table test purge;

create table test (name varchar2(10),
                       address varchar2(50) default 'seoul');
                       
desc test
select * from test;

insert into test (name) values ('kim');
insert into test values ('lee', 'inchon');
insert into test values ('park', null);
select * from test;
insert into test values ('song', default);

select * from test;

create table new_emp(
id number(4),
name varchar2(10));

insert into new_emp
select empno, ename from emp
where ename like '%A%';
select * from new_emp;

--# INSERT���� VALUES �� ��ſ� ���������� ����ϸ�
--���� ���̺��� ���� �����ϴ� ���� �߰� �� �� �ִ�.
--(INSERT���� VALUES�� ���ڵ� �߰��� ���� 1���� �ุ �߰���)
--INSERT���� VALUES �� ��ſ� ���������� ����ϸ�
--subquery�� �˻� ��� �����ŭ �߰���

--# INSERT ���� �� ��Ͽ��� ���� �� �� ������ ������
--���������� ���� �� �� ������ ������ ��ġ�ؾ� ��

select empno, ename, sal
from emp;

update emp
set sal = 0;
select * from emp;

rollback;
select*from emp;

--��> ¦�� ����� ������� �޿��� 10% �λ� �����Ͻÿ�

update emp
set sal = sal*1.1
where mod(empno,2)=0;
select*from emp;

rollback;
select*from emp;

update emp  set empno = 7788  where deptno = 10;
update emp  set deptno = 90 where empno = 7788;

update emp set hiredate = sysdate where deptno = (select deptno from dept
where loc = 'DALLAS');
select hiredate from emp;
rollback;

select * from emp where ename = 'KING';
update emp
set deptno = (select deptno from emp where ename = 'SCOTT'),
sal = (select sal from emp where ename = 'JANES')
where ename = 'KING';
select * from emp where ename = 'KING';
rollback;

update emp
set(job, deptno)=(select job,deptno
from emp
where empno = 7499),
where empno=7698;

delete from emp ;
select * from emp ;
rollback;
select * from emp;
delete from emp where sal >= 3000;
select empno, ename, sal from emp;
rollback;
select * from emp;

delete from emp where deptno =( select deptno 
from emp where ename ='SCOTT');
select*from emp;

rollback;
select*from emp;

delete from dept where deptno = 0;

select max(sal),min(sal),sum(sal),avg(sal)