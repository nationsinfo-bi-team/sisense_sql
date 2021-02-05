
SELECT *,subString(v.processor_name,IndexOf(concat(concat(' ',v.processor_name),' '),p.processor_name_original,1),1 ) AS test from

(SELECT DISTINCT processor_name
FROM [db03_reporting.tbl_sale_chargeback_vae]  ) v 
LEFT JOIN
 (SELECT DISTINCT * FROM [nic_gateway.merchant_processor]) p
ON (IndexOf(concat(concat(' ',v.processor_name),' '),p.processor_name_original,1)>0 AND (SubString(v.processor_name,IndexOf(concat(concat(' ',v.processor_name),' '),p.processor_name_original,1)-1,1 )<>'G' OR v.processor_name LIKE '%GRTO%' OR (v.processor_name LIKE '%GFH%' and p.processor_name_original LIKE '%GFH%')))
