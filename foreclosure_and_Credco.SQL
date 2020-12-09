SELECT temp1.login_name, temp2.login_name, temp1.customer_id AS forto_customer_id, temp2.customer_id AS credco_customer_id, temp1.order_Date AS forto_order_date, temp2.order_Date AS credco_order_date

from

(SELECT i.customer_id, c.LOGIN_NAME, i.order_Date

FROM [nic_common.view_invoice_item] i 
JOIN [nic_common.view_dimension_alpha]d ON i.id_ad=d.ad_id
JOIN [main.tbl_customer] c ON c.CUSTOMER_ID=i.customer_id		
WHERE i.order_status='success' AND i.signup_type LIKE '%initial%' AND d.super_partner_id=417 AND d.vertical_type='foreclosure_rto'
) temp1 

join


(SELECT i.customer_id, c.LOGIN_NAME, i.order_Date

FROM [nic_common.view_invoice_item] i 
JOIN [nic_common.view_dimension_alpha]d ON i.id_ad=d.ad_id
JOIN [main.tbl_customer] c ON c.CUSTOMER_ID=i.customer_id		
WHERE i.order_status='success' AND i.signup_type LIKE '%initial%' AND d.super_partner_id=417 AND d.vertical_type='credco'
) temp2

ON temp1.login_name=temp2.login_name AND YearDiff(temp1.order_Date,temp2.order_Date)=0 AND monthdiff(temp1.order_Date,temp2.order_Date)=0 AND daydiff(temp1.order_Date,temp2.order_Date)=0

UNION ALL 


SELECT temp1.login_name, temp2.login_name, temp1.customer_id AS forto_customer_id, temp2.customer_id AS credco_customer_id, temp1.order_Date AS forto_order_date, temp2.order_Date AS credco_order_date

from

(SELECT i.customer_id, c.LOGIN_NAME, i.order_Date

FROM [nic_common.view_invoice_item] i 
JOIN [nic_common.view_dimension_alpha]d ON i.id_ad=d.ad_id
JOIN [main.tbl_customer] c ON c.CUSTOMER_ID=i.customer_id		
WHERE i.order_status='success' AND i.signup_type LIKE '%initial%' AND d.super_partner_id=417 AND d.vertical_type='foreclosure_rto'
) temp1 

join


(SELECT i.customer_id, c.LOGIN_NAME, i.order_Date

FROM [nic_common.view_invoice_item] i 
JOIN [nic_common.view_dimension_alpha]d ON i.id_ad=d.ad_id
JOIN [main.tbl_customer] c ON c.CUSTOMER_ID=i.customer_id		
WHERE i.order_status='success' AND i.signup_type LIKE '%initial%' AND d.super_partner_id=141 AND d.vertical_type='credco'
) temp2

ON temp1.login_name=temp2.login_name AND YearDiff(temp1.order_Date,temp2.order_Date)=0 AND monthdiff(temp1.order_Date,temp2.order_Date)=0 AND daydiff(temp1.order_Date,temp2.order_Date)=0
