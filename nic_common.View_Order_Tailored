SELECT DISTINCT id_order,
                i.customer_id AS id_customer,
                signup_type,
                device_type,
                daykey,
                binb.bin,
                c.FIRST_NAME,
                c.LAST_NAME,
                i.order_Date AS calendate,
                i.id_ad_org,
                id_partner,
                i.order_status_org AS order_status,
                cvv_dropped,
                exp_override,
                i.flag_verification_static,
                verification_status,
                id_affiliate,
                i.enrollment_status,
                (CASE token.card_type
                     WHEN 'visa' THEN 'visa'
                     WHEN 'mastercard' THEN 'mastercard'
                     WHEN 'americanexpress' THEN 'americanexpress'
                     WHEN 'discover' THEN 'discover'
                     ELSE 'other'
                 END) AS card_type,
                (CASE
                     WHEN binb.level LIKE '%PREPAID%'
                          OR binb.level LIKE '%GIFT%' THEN 'PREPAID'
                     WHEN binb.type='CHARGE CARD'
                          AND binb.level <> 'PREPAID' THEN 'CREDIT'
                     WHEN binb.type='CREDIT'
                          AND binb.level <> 'PREPAID' THEN 'CREDIT'
                     WHEN binb.type='DEBIT'
                          AND binb.level <> 'PREPAID' THEN 'DEBIT'
                     ELSE 'OTHER'
                 END) AS CPD,
                c.SESSIONS_COUNT
FROM [invoice_item_alpha] i LEFT JOIN [main.tbl_customer]c ON i.customer_id=c.CUSTOMER_ID
LEFT JOIN
  (SELECT a.*
   FROM [nic_billing.billing_token] a JOIN (SELECT id_customer, max(id_billing_token) AS id_billing_token FROM [nic_billing.billing_token]
   GROUP BY id_customer) b ON a.id_billing_token=b.id_billing_token) token ON token.id_customer=i.customer_id
LEFT JOIN [nic_gateway.binbase] binb ON token.bin=binb.bin
