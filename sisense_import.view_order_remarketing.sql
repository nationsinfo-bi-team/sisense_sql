SELECT
	`o`.`id_order` AS `id_order`,
	`o`.`signup_type` AS `signup_type`,
	`o`.`order_status` AS `order_status`,
IF
	( isnull( `brand`.`ip` ), 'NA', `brand`.`ip` ) AS `IP`,
IF
	( isnull( `d`.`isp` ), 'Other', `d`.`isp` ) AS `ISP`,
	cast( `o`.`order_date` AS date ) AS `daykey`,
	`o`.`id_ad` AS `id_ad`,
	`o`.`id_brand` AS `id_brand`,
	`c`.`LOGIN_NAME` AS `login_name`,
	`o`.`id_affiliate` AS `id_affiliate`,
	( CASE `o`.`device_type` WHEN 'desktop' THEN 'desktop' WHEN 'mobile' THEN 'mobile' WHEN 'tablet' THEN 'mobile' ELSE 'NA' END ) AS `device_type`,
	(
	CASE
			
			WHEN ( `di`.`super_partner_id` = 130 ) THEN
			'NA' 
			WHEN (
				( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
				AND ( `o`.`id_affiliate` = '0' ) 
				AND ( `di`.`brand_id` NOT IN ( 40, 41 ) ) 
				AND ( `o`.`id_ad` NOT IN ( 'R2OU3050', 'R2OU3010', 'R2OU3060M', 'R2OU3060W' ) ) 
				) THEN
				'EM00' 
				WHEN (
					( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
					AND ( `o`.`id_affiliate` = '0' ) 
					AND ( `di`.`brand_id` = 40 ) 
					) THEN
					'YSAM_EM00' 
					WHEN (
						( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
						AND ( `o`.`id_affiliate` = '2' ) 
						AND ( `di`.`brand_id` = 40 ) 
						) THEN
						'YSAM_EM02' 
						WHEN (
							( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
							AND ( `o`.`id_affiliate` = '0' ) 
							AND ( `di`.`brand_id` = 41 ) 
							) THEN
							'CSRC_EM0' 
							WHEN (
								( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
								AND ( `o`.`id_affiliate` = '1' ) 
								AND ( `di`.`brand_id` NOT IN ( 40, 41 ) ) 
								) THEN
								'EM01' 
								WHEN (
									( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
									AND ( `o`.`id_affiliate` = '1' ) 
									AND ( `di`.`brand_id` = 40 ) 
									) THEN
									'YSAM_EM01' 
									WHEN (
										( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
										AND ( `o`.`id_affiliate` = '1' ) 
										AND ( `di`.`brand_id` = 41 ) 
										) THEN
										'CSRC_EM01' 
										WHEN (
											( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
											AND ( `o`.`id_affiliate` = '2' ) 
											AND ( `di`.`brand_id` NOT IN ( 40, 41 ) ) 
											) THEN
											'EM02' 
											WHEN (
												( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
												AND ( `o`.`id_affiliate` = '2' ) 
												AND ( `di`.`brand_id` = 40 ) 
												) THEN
												'YSAM_EM02' 
												WHEN (
													( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
													AND ( `o`.`id_affiliate` = '2' ) 
													AND ( `di`.`brand_id` = 41 ) 
													) THEN
													'CSRC_EM02' 
													WHEN (
														( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
														AND ( `o`.`id_affiliate` = '3' ) 
														AND ( `di`.`brand_id` NOT IN ( 40, 41 ) ) 
														) THEN
														'EM03' 
														WHEN (
															( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
															AND ( `o`.`id_affiliate` = '3' ) 
															AND ( `di`.`brand_id` = 40 ) 
															) THEN
															'YSAM_EM03' 
															WHEN (
																( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																AND ( `o`.`id_affiliate` = '3' ) 
																AND ( `di`.`brand_id` = 41 ) 
																) THEN
																'CSRC_EM03' 
																WHEN (
																	( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																	AND ( `o`.`id_affiliate` = '4' ) 
																	AND ( `di`.`brand_id` NOT IN ( 40, 41 ) ) 
																	) THEN
																	'EM04' 
																	WHEN (
																		( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																		AND ( `o`.`id_affiliate` = '4' ) 
																		AND ( `di`.`brand_id` = 40 ) 
																		) THEN
																		'YSAM_EM04' 
																		WHEN (
																			( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																			AND ( `o`.`id_affiliate` = '4' ) 
																			AND ( `di`.`brand_id` = 41 ) 
																			) THEN
																			'CSRC_EM04' 
																			WHEN (
																				( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																				AND ( `o`.`id_affiliate` = '5' ) 
																				AND ( `di`.`brand_id` NOT IN ( 40, 41 ) ) 
																				) THEN
																				'EM05' 
																				WHEN (
																					( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																					AND ( `o`.`id_affiliate` = '5' ) 
																					AND ( `di`.`brand_id` = 40 ) 
																					) THEN
																					'YSAM_EM05' 
																					WHEN (
																						( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																						AND ( `o`.`id_affiliate` = '5' ) 
																						AND ( `di`.`brand_id` = 41 ) 
																						) THEN
																						'CSRC_EM05' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '6' ) ) THEN
																						'EM06' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '7' ) ) THEN
																						'EM07' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '8' ) ) THEN
																						'EM08' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '9' ) ) THEN
																						'EM09' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '10' ) ) THEN
																						'EM10' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '11' ) ) THEN
																						'EM11' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '12' ) ) THEN
																						'EM12' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '13' ) ) THEN
																						'EM13' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '14' ) ) THEN
																						'EM14' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '15' ) ) THEN
																						'EM15' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '16' ) ) THEN
																						'EM16' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '17' ) ) THEN
																						'EM17' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '18' ) ) THEN
																						'EM18' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '19' ) ) THEN
																						'EM19' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '20' ) ) THEN
																						'EM20' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '21' ) ) THEN
																						'EM21' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '22' ) ) THEN
																						'EM22' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '23' ) ) THEN
																						'EM23' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '24' ) ) THEN
																						'EM24' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '25' ) ) THEN
																						'EM25' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '26' ) ) THEN
																						'EM26' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '27' ) ) THEN
																						'EM27' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '28' ) ) THEN
																						'EM28' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '29' ) ) THEN
																						'EM29' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '30' ) ) THEN
																						'EM30' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '31' ) ) THEN
																						'EM31' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '32' ) ) THEN
																						'EM32' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '33' ) ) THEN
																						'EM33' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '34' ) ) THEN
																						'EM34' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '35' ) ) THEN
																						'EM35' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '36' ) ) THEN
																						'EM36' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = '37' ) ) THEN
																						'EM37' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3050' ) AND ( `o`.`id_affiliate` = '0' ) ) THEN
																						'R2 EM00' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '1' ) ) THEN
																						'R2 EM01' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '2' ) ) THEN
																						'R2 EM02' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '3' ) ) THEN
																						'R2 EM03' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '4' ) ) THEN
																						'R2 EM04' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '5' ) ) THEN
																						'R2 EM05' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '6' ) ) THEN
																						'R2 EM06' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '7' ) ) THEN
																						'R2 EM07' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '8' ) ) THEN
																						'R2 EM08' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '9' ) ) THEN
																						'R2 EM09' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '10' ) ) THEN
																						'R2 EM10' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '11' ) ) THEN
																						'R2 EM11' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '12' ) ) THEN
																						'R2 EM12' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '13' ) ) THEN
																						'R2 EM13' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '14' ) ) THEN
																						'R2 EM14' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '15' ) ) THEN
																						'R2 EM15' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '16' ) ) THEN
																						'R2 EM16' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '17' ) ) THEN
																						'R2 EM17' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '18' ) ) THEN
																						'R2 EM18' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3010' ) AND ( `o`.`id_affiliate` = '19' ) ) THEN
																						'R2 EM19' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3060M' ) ) THEN
																						'R2 Monthly Email' 
																						WHEN ( ( `di`.`super_partner_id` = 131 ) AND ( `o`.`id_ad` = 'R2OU3060W' ) ) THEN
																						'R2 Weekly Email' 
																						WHEN ( ( `o`.`id_ad` = 'YSAMW0' ) AND ( `o`.`id_affiliate` LIKE '%w%' ) ) THEN
																						concat( 'YSAM_W', LEFT ( `o`.`id_affiliate`, 1 ) ) 
																						WHEN ( `o`.`id_ad` = 'YSAMW0' ) THEN
																						'YSAM_W0' 
																						WHEN ( `o`.`id_ad` = 'YSAMW1' ) THEN
																						'YSAM_W1' 
																						WHEN ( `o`.`id_ad` = 'YSAMW2' ) THEN
																						'YSAM_W2' 
																						WHEN ( `o`.`id_ad` = 'YSAMW3' ) THEN
																						'YSAM_W3' 
																						WHEN ( `o`.`id_ad` = 'YSAMW4' ) THEN
																						'YSAM_W4' 
																						WHEN ( `o`.`id_ad` = 'YSAMW5' ) THEN
																						'YSAM_W5' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = 'REMA' ) ) THEN
																						'Monthly_Email' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = 'REMB' ) ) THEN
																						'Monthly_Email' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = 'REWA' ) ) THEN
																						'Weekly_Email' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` = 'REWB' ) ) THEN
																						'Weekly_Email' 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` LIKE 'RE%' ) ) THEN
																						`o`.`id_affiliate` 
																						WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` LIKE 'GM%' ) ) THEN
																						`o`.`id_affiliate` 
																						WHEN (
																							( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																							AND ( ( `o`.`id_affiliate` LIKE '%A' ) OR ( `o`.`id_affiliate` LIKE '%B' ) ) 
																							AND ( `di`.`brand_id` = 40 ) 
																							) THEN
																							concat(
																								'YSAM_EM',
																							IF
																								(
																									( length( `o`.`id_affiliate` ) = 3 ),
																									LEFT ( `o`.`id_affiliate`, 2 ),
																									concat( '0', LEFT ( `o`.`id_affiliate`, 1 ) ) 
																								) 
																							) 
																							WHEN (
																								( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																								AND ( ( `o`.`id_affiliate` LIKE '%A' ) OR ( `o`.`id_affiliate` LIKE '%B' ) ) 
																								AND ( `di`.`brand_id` = 30 ) 
																								) THEN
																								concat(
																									'R2 EM',
																								IF
																									(
																										( length( `o`.`id_affiliate` ) = 3 ),
																										LEFT ( `o`.`id_affiliate`, 2 ),
																										concat( '0', LEFT ( `o`.`id_affiliate`, 1 ) ) 
																									) 
																								) 
																								WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` LIKE 'GEM%' ) ) THEN
																								LEFT ( `o`.`id_affiliate`, 5 ) 
																								WHEN (
																									( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) 
																									AND ( ( `o`.`id_affiliate` LIKE '%A' ) OR ( `o`.`id_affiliate` LIKE '%B' ) OR ( `o`.`id_affiliate` LIKE '%C' ) ) 
																									) THEN
																									concat(
																										'EM',
																									IF
																										(
																											( length( `o`.`id_affiliate` ) = 3 ),
																											LEFT ( `o`.`id_affiliate`, 2 ),
																											concat( '0', LEFT ( `o`.`id_affiliate`, 1 ) ) 
																										) 
																									) ELSE 'NA' 
																								END 
																								) AS `emai_message`,
																								HOUR ( `o`.`order_date` ) AS `hour`,
																								(
																								CASE
																										
																										WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` LIKE '%A' ) ) THEN
																										'Control A' 
																										WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` LIKE '%B' ) ) THEN
																										'Challenger B' 
																										WHEN ( ( `di`.`super_partner_id` IN ( 130, 131, 132 ) ) AND ( `o`.`id_affiliate` LIKE '%C' ) ) THEN
																										'Challenger C' ELSE 'Other' 
																									END 
																									) AS `split_test_type`,
																									`di`.`super_partner_id` AS `super_partner_id` 
																								FROM
																									(
																										(
																											(
																												(
																													(
																														`nic_billing`.`order` `o`
																														JOIN `main`.`tbl_customer` `c` ON (
																															( ( `o`.`id_customer` = `c`.`CUSTOMER_ID` ) AND ( `o`.`id_order` > 9600000 ) AND ( `c`.`test_account` = 0 ) ) 
																														) 
																													)
																													LEFT JOIN `nic_common`.`View_Dimension_Alpha` `di` ON ( ( `o`.`id_ad` = `di`.`ad_id` ) ) 
																												)
																												LEFT JOIN `nic_common`.`contacts` `co` ON ( ( ( `c`.`BRAND_ID` = `co`.`id_brand` ) AND ( `c`.`LOGIN_NAME` = `co`.`email` ) ) ) 
																											)
																											LEFT JOIN `nic_content`.`email_domain_to_isp` `d` ON ( ( `co`.`domain` = `d`.`domain` ) ) 
																										)
																									LEFT JOIN `nic_reporting`.`ips_by_brand` `brand` ON ( ( ( `co`.`created` BETWEEN `brand`.`start_date` AND `brand`.`end_date` ) AND ( `co`.`id_brand` = `brand`.`id_brand` ) ) ) 
	)
