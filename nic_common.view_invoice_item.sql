SELECT i.*,order_status_org AS order_status,id_ad_org AS id_ad,'000 Org' AS source, i.customer_id AS customer_id1, i.customer_id	AS customer_id2, i.id_invoice AS id_invoice2
FROM [invoice_item_alpha] i
UNION all
SELECT i.*, concat('Re_',i.order_status_org),(CASE WHEN d.super_partner_id IN (131,113,114) THEN i.id_x ELSE i.id_cascaded_from_ad end),d.Super_partner_Id_Name, i.customer_id	AS customer_id1, i.customer_id AS customer_id2, i.id_invoice AS id_invoice_2
FROM [invoice_item_alpha] i JOIN [nic_common.view_dimension_alpha]d ON i.id_ad_org=d.ad_id AND d.super_partner_id IN (131,180,190,113,114,181,191)
