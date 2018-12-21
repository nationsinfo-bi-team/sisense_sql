SELECT
	`nic_reporting`.`portal_credit_info_myscore_summary`.`Date` AS `date`,
	'MyScore' AS `Partner`,
	'Credit Score' AS `Offer`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p2` AS `Device`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p3` AS `Location`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p4` AS `Creative`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p5` AS `Ad_ID`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p6` AS `YSAM_ID`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`CPAtotal` AS `Revenue`,
	'CPA' AS `Revenue_Type`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`Clicks` AS `clicks`,
	`nic_reporting`.`portal_credit_info_myscore_summary`.`Conversions` AS `conversions` 
FROM
	`nic_reporting`.`portal_credit_info_myscore_summary` UNION ALL
SELECT
	`nic_reporting`.`portal_credit_info_fs360_summary`.`Date` AS `date`,
	'FS360' AS `Partner`,
	'Credit Score' AS `Offer`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p2` AS `Device`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p3` AS `Location`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p4` AS `Creative`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p5` AS `Ad_ID`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p6` AS `YSAM_ID`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`revenue` AS `Revenue`,
	'CPA' AS `Revenue_Type`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`Clicks` AS `clicks`,
	`nic_reporting`.`portal_credit_info_fs360_summary`.`Conversions` AS `conversions` 
FROM
	`nic_reporting`.`portal_credit_info_fs360_summary` UNION ALL
SELECT
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`Date` AS `date`,
	'FS360' AS `Partner`,
	'Credit Score' AS `Offer`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p2` AS `Device`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p3` AS `Location`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p4` AS `Creative`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p5` AS `Ad_ID`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p6` AS `YSAM_ID`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`revenue` AS `Revenue`,
	'CPA' AS `Revenue_Type`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`Clicks` AS `clicks`,
	`nic_reporting`.`portal_credit_info_fs360_summary_new`.`Conversions` AS `conversions` 
FROM
	`nic_reporting`.`portal_credit_info_fs360_summary_new` 
WHERE
	( `nic_reporting`.`portal_credit_info_fs360_summary_new`.`Date` BETWEEN '2016-01-01' AND '2016-11-20' ) UNION ALL
SELECT
	cast( `nic_reporting`.`portal_credit_info_zeta_summary`.`Date` AS date ) AS `date`,
	'Zeta' AS `Partner`,
	'Mortgage' AS `Offer`,
	`nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p3` AS `Device`,
	( CASE WHEN ( `nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p1` = 'LP' ) THEN `nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p1` ELSE `nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p2` END ) AS `Location`,
	`nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p4` AS `Creative`,
	( CASE WHEN ( `nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p1` = 'LP' ) THEN `nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p2` ELSE `nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p1` END ) AS `Ad_ID`,
	'' AS `Ysam_ID`,
	`nic_reporting`.`portal_credit_info_zeta_summary`.`revenue` AS `Revenue`,
	'CPC' AS `Revenue_Type`,
	`nic_reporting`.`portal_credit_info_zeta_summary`.`Clicks` AS `Clicks`,
	`nic_reporting`.`portal_credit_info_zeta_summary`.`Conversions` AS `conversions` 
FROM
	`nic_reporting`.`portal_credit_info_zeta_summary`
