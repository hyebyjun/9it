--��> job_history, employees ������߿��� �μ� �Ǵ� ������ 2ȸ�̻�
--������ ��� ��ȸ (�����ȣ, ���� ����, ���� �μ���ȣ)

select employee_id, last_name, job_id, department_id
from employees t1
where 2<= (select count(*)
                from job_history
                where t1.ememployee_id = employee_id)

select employee_id, last_name, job_id, department_id
from employees t1, (select employee_id, count(*) cnt
                          from job_history
                          group by employee_id ) t2
where t1.ememployee_id = t2.employee_id
and t2.cnt >=2 ;


