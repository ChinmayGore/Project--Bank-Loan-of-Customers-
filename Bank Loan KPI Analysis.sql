
use bankloan;

select * from finance_1;
select * from finance_2;

select count(id) from finance_2;

select count(*) from finance_1;

## KPI 1 

select year(issue_d) as year_of_issue_date , sum(loan_amnt) as total_amtloan
from finance_1
group by year_of_issue_date
order by year_of_issue_date;


## KPI 2 

select grade ,sub_grade ,sum(revol_bal) as revo_balance
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;


## KPI 3 

SELECT 
verification_status,
concat("$", format(round(SUM(total_pymnt)/1000000,2 ),2),"M") AS TOTAL_PAYMENT
FROM finance_1 inner join finance_2
ON(finance_1.id = finance_2.id)
group by verification_status
ORDER BY verification_status;


## KPI 4

select addr_State, last_credit_pull_d,loan_status from
finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_State, last_credit_pull_d,loan_status 
order by loan_status;


## KPI 5

select home_ownership,year(last_pymnt_d),
concat("$", format(round(SUM(last_pymnt_amnt)/10000,2 ),2),"K")  as lastpaymentamount
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by home_ownership,last_pymnt_d
order by home_ownership,last_pymnt_d;

