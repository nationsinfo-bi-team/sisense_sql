SELECT DISTINCT Daykey,
                id_cascaded_from_ad AS Adid,
                super_partner_id AS Cascade_type,
                order_status,
                device_type,
                id_order AS Cascades,
                static_1st_bill,
                i.flag_invoice_Datequal,
                (CASE
                     WHEN binb.level='PREPAID'
                          OR binb.level LIKE '%GIFT%' THEN 'PREPAID'
                     WHEN binb.type='CHARGE CARD'
                          AND binb.level <> 'PREPAID' THEN 'CREDIT'
                     WHEN binb.type='CREDIT'
                          AND binb.level <> 'PREPAID' THEN 'CREDIT'
                     WHEN binb.type='DEBIT'
                          AND binb.level <> 'PREPAID' THEN 'DEBIT'
                     ELSE 'OTHER'
                 END) AS CPD
FROM [nic_common.view_invoice_item] i join  [nic_common.view_dimension_alpha] dimension ON i.id_ad =dimension.ad_id
AND signup_type IN ('initial_immediate',
                    'initial_recurring',
                    'credco_initial_immediate',
                    'credco_initial_recurring')
AND super_partner_id IN (180,
                         181,
                         190,
                         191)
LEFT JOIN [nic_billing.billing_token] token ON token.id_customer=i.customer_id
LEFT JOIN [nic_gateway.binbase] binb ON token.bin=binb.bin
