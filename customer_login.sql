select distinct c.CUSTOMER_ID,c.created,
(case 
when MinuteDiff(min(l.created),c.created) <= 20  then 0 
when MinuteDiff(min(l.created),c.created) <= 1440 then 1 
when MinuteDiff(min(l.created),c.created) <= 2880 then 2 
when count(l.created)>0 then 3 
when count(l2.created)>0 THEN 4 else 5 end) AS timely_login 

FROM [main.tbl_customer] c 
LEFT JOIN [main.tbl_member_event_login] l ON  c.CUSTOMER_ID = l.customer_id and l.event_type = 'login'
LEFT JOIN 
[main.tbl_member_event_login] l2 ON c.CUSTOMER_ID = l2.customer_id and l2.event_type = 'fail' 

where (c.test_account = 'False' AND c.CUSTOMER_ID >= 28902848) 

GROUP BY c.customer_id,c.created
