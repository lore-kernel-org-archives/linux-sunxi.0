Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022094.outbound.protection.outlook.com [40.107.75.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BD379DA
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762535652; cv=fail; b=GJ4aRm42SkexhEvVepTmfVCSkJUH4elmt+6oa5Bya2/c4LGkM7sWcONdWdknCMXHClvgsvuNjMZLTmGvfjZv0jhQxiECMW1JXlyrXCbsz0eLbDV1Ug3pTUwaEXrmz+mq3xZPX6tpqQC9CD1mAF91ByokVULsNO67D/BCfaiRg5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762535652; c=relaxed/simple;
	bh=C9VcCYq63w7IJiJvJAvtj7dgIvnFfDiZ6KTFKvYOnW8=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uunFyhZwpk0R9/NUtVT1ZDHJRE+PQl9E3VrXG5b+zacFD8RqLPId/FVaAyJyIWBLWW+MkkUEU9UX6QTZvEPSVz4HCSKUtgk99mjsjLbYIpywDM+VsaGm9AlsjT8vEsEdN+SWmRD3mXCIJjUtp2V1ibtcKt3ooOrkvqRdZjX96c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; arc=fail smtp.client-ip=40.107.75.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQNXCzjjORHWFn+Uvj+O0JxlKeP8M+vS+1l8BvWzmEWU9Gykc+pFBi2Zqwh5YoJnxY09Yp1By3860N4Q8yyf3/d8bdCuNFVKcASLTvf2gBhVQyA+hcbyy84ZxD+Cy5qNeOht5oDMyz+KWFZnWnMXqv9h0HZuUuzILxQvmi103ta7yLdSLA/EeOs1livsFum/OVbFriP45GR+zofUWsA584ePx/flbV2jmZi03YhF7frQDw/Vzgkv8MGegLBJtwPIVVhYrG6WwPGnoQHoXjlipvAhH0b7b/suRSyGf4ZLSvLiIfoM3iAYnO9Q6iLSAm/nZ558wu1JiI6opwNsTA/84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iLPlMeV+akKTQQB5YKR5IQAROw6g/bqygBTK5sQw1w=;
 b=TIt4SSyPR3h+dhKmoyn3CBBxhvR0YPN9opERQPKWk8PoF2GuLyAJcMiRdWw23L2ZdHn3VKvy0/zfsnEd1v6AKITATjN7CzpxyuFKPZpgAKLkNRhrwwKrsp3rp4qM8jnm1yg2XydnVk8DXyR4PnWuZLVU7TM8DD2Q4e10U/glwyD65rwzNvEk9wwvzti5cPnaLwSSG7cC76VKCLs8W5qFt2hBcLfjOYRMxvPIcRtFXJKR6h1+4o15oTXXxoNPP3tkpiAT1OZlRpWofXMo0rT/HieDbW+waAzFfsCmFSexBpEVZiDiysBVcM/1kJyr0EV/FS6fwyNLlOSwzDgB6rO/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by TYZPR06MB5202.apcprd06.prod.outlook.com (2603:1096:400:1f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:14:02 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9275.013; Fri, 7 Nov 2025
 17:14:02 +0000
Message-ID: <5290a949-1eed-47e9-a258-024447009c7b@linumiz.com>
Date: Fri, 7 Nov 2025 18:13:13 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
To: Lukas Schmid <lukas.schmid@netcube.li>
References: <4693897.cEBGB3zze1@lukas-hpz440workstation>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <4693897.cEBGB3zze1@lukas-hpz440workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|TYZPR06MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: e03f3391-f000-47c8-96ea-08de1e210bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0hDa1hCQXpoT2pMZWRIZ3NUUGc0aEtEM1pEUC9lTnV2aUt5bDRSUStIRFFl?=
 =?utf-8?B?eFFVb0FGYi96dDBmRDlqQ2hUdzhuN3UzeENlNi8wMkVGUnlqK3R3STF4T0g2?=
 =?utf-8?B?VHlwWHJzbjBFQkpkTHF4clB5Yis2WkNHOTVJZjZxeUdOS2JGQVlIY01GY2Ns?=
 =?utf-8?B?WGphbXFDRGhaZlRjUnhVakw0YThjVlpydVNEaWhJdGRWZVorZVpTWHJJZFIz?=
 =?utf-8?B?SkhkMmxTL2JtUnYyS3dHK3Fqam03M1VzN3o3Z3NscmpxeWVFeEt3bmthYlhZ?=
 =?utf-8?B?eHc1QVN3dk5hQmd4MUhSUVl0L1NtMmFSVmNFbUxwSVZNdzVJc21vZXBjWWF1?=
 =?utf-8?B?aHduRWt1cUdES0lrdG1PZDJ6b1dKQzFxdGQ0VVlSb3JCNm5jL25DMEtBZEdj?=
 =?utf-8?B?NUZUczVNUmVZdDlxQ0FSV3BDWksxaEdpUk9RMmJsMHVUdEd4N21iM3A2enM5?=
 =?utf-8?B?TThjUWk3aFZQblNNeEV5M05xazZRdUdJV1dacmVKRUllT0pnUVNrWjlwRHlo?=
 =?utf-8?B?OG45WmZWN1QyZ3ZJNW56OFBNQThMdTNJSTVBeWxjYzJaRnZFckRNR04ybFc2?=
 =?utf-8?B?Y2J0blhyU29ZWmJzUFkzODdzMnVpdXpKZXJ4eHkyRG1sK0dpRGVtZHExcVdR?=
 =?utf-8?B?SXRxQ0xDV21wQ0cxQXUwek9YcG1wdWxNdHhGKzVXM2VVUDJ4bW4zTHU1WlV6?=
 =?utf-8?B?cnBQYldoQzJEVFh5M2gxTUFLRVQwYkx3RlhVTnhtWEl0dXhTVk81ZE9vclBu?=
 =?utf-8?B?RnQ4TTAvR1BzMmJSRndpdWlaRXJUUjlVcklOYjJQM1hZaEZrTDMvNDViQTlz?=
 =?utf-8?B?bHUvRGh2WHpOSjJTTCs3a3F0RDNWRVhudTMvaXhoTGVyaVpjZjNNL0F2d2VJ?=
 =?utf-8?B?Q3lkcFo1R3Ixem9EdlE4UThrMGJSbEdMZ3Y3aldBNkFRc29CWTcxdlFLbnFU?=
 =?utf-8?B?MEhYM1RYK2s1QkgrYVlvalk0ZUVXS1pha3BFK2ZFbjBKR09BSGNnTGF1ZGlv?=
 =?utf-8?B?cnBUZnZwcXJydHR0TWFlazJKSHNBZWhVQWZRUjZWa012U2RPTm15RmVJcFlo?=
 =?utf-8?B?b3B0UHQ4OU1pdmV6eU5EbmFyWHYzdS90N055M0ljb3JPQk5GK3RxYXBzeld2?=
 =?utf-8?B?aXY5bkc4c1pNaGlMUmU5aGVaL21xbEdtODZJOW9ucFJjUUlNdWJvQlo5Nm9W?=
 =?utf-8?B?eEMwT1FhVzF0dlZjR25lQ2xQbFNxUFRURmY0ajVnVGZHOEREa09Fa0FQMmJq?=
 =?utf-8?B?TlhldThNbkNlN2I5OEhEeUtlY2dyWFQ5VFZVTHpoaHRJV25SVXFuNE9GMFJo?=
 =?utf-8?B?RGpld082Qyt3N1FTNlFaeFgzN0x1Sm1tb3d2MW5LZkZjd1dRRVgxemRSRFVC?=
 =?utf-8?B?eW5ZODlNZzVlNVdqSUdtUHJ0RG91Yjg2L0RQcVNINWhZQ010Q0pFSnZXd0lQ?=
 =?utf-8?B?WS9DcnlZTERkS2FJbklQMmJSa25jOXFOdGczWnRMdUpHTnowU3JabXR0Rm1r?=
 =?utf-8?B?YkJ1dnlQK3VFeFlqZjM4TzlJLzI2Q09QSHp0WHdFTFdnRzBEdC9CMnZyQTlO?=
 =?utf-8?B?MDliRVJKTThyUytKUVlhRUIyQm13N3V0dkRwM3F5Nm9sL2ZwNzloUnVYKzdT?=
 =?utf-8?B?L2s3TnYwQnVLU3I4cGpMM1U4RGluQ2RtbitteDNzbEFXVW11dFJiMmk2RnV5?=
 =?utf-8?B?dEpGa1BKV2ErTjh3bWd1dmxJeENRYjhuSkgzaVlJVDlvVUNTQWVPWlZ5SWha?=
 =?utf-8?B?ZzdpM0szRXpnM0E2NHZrbXZRU2ZEbWZBcjdxM2RMT3lSN2luODhHVjBBT2dt?=
 =?utf-8?B?QUhsdVR0RWVxREFWS2JSMjFkMUhHTjdFUTFHcHNRV2FIZHA0RHdrYjJsNGJj?=
 =?utf-8?B?UnVXLyszT0w4ZlJab1FMUWpMUUhOVDVEcWVzZG9lNTU5eEIvL0VIUENqT2tR?=
 =?utf-8?Q?3gIOhB9NZR57lxpTkO26ZIWsIp1JeINf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3U2QUs2TUZ0THVIdlJPVjlsSlIxYzhnZjBoVXdTYmdLTFprUUtGRDU3bE1v?=
 =?utf-8?B?ZXJZN3NHdHVTMzA0am1qZjkxSEwvT2hrTWw3bFFsNU5qS2JYVks5M1Y1RzlT?=
 =?utf-8?B?MDllcFVyNGNVcWNLcDYydFFkMzQyZWpPK1JzRlQ3MU92T2Zva2xkZXE0U3hz?=
 =?utf-8?B?L2NSUGM0TzA3SmdvaytqVHo3M3crTFRjUFFUTkFsUXNjckVxVG1QVlhnMU53?=
 =?utf-8?B?TXlMZHQraUJlNHI0UE5vWmJMMmlvelVjempBeGF3MHVSd2pvU3pDZUlaWENy?=
 =?utf-8?B?K1BqSW1Fc0crdm5BSGpuV0JFbURkaXo0KytNSVBGVHV0WHJmV1RLSHRjVlJC?=
 =?utf-8?B?VjR0aE13QnlWdTM2MXN3Tm9VVW1lSTdDSzFVeG5JTWxVTzBmb1V6T2w1aXQ3?=
 =?utf-8?B?NmtaU2hWKzZCci9aTllldmREUE5xN0J6UG90MmhqR1NHOWljWXZNZUg5b2lO?=
 =?utf-8?B?ZUpvS0Rpa29KczVKejMzY3U3ZVh3V1BMOE9nTkwxZDh5RWIrbWhvc0Y5czIv?=
 =?utf-8?B?STIwWitvVzZNbWg2Qmc0ZU9ydStINkFwZlVubDZrc2l0RFl6L2JYY0tBOS84?=
 =?utf-8?B?a3JYUTUrMTRpMmZxUGdzZUhGQzRxL01DanlBV3dsWlNJcUp6aExVdmJiaVRS?=
 =?utf-8?B?QVVnblZpUkpyNHk3S2F0cWdFZEJNQzUxM0xVNllnU3l5cGIwWFF0N2M4eElD?=
 =?utf-8?B?WG94cXBCb3FkYW82RExuUmZtSTI5bW4xRkJWUHZISzlSRTNaeWdrcGFndURO?=
 =?utf-8?B?VzE4YTBNTWM1NTdrMUI2U3BSYVZXZXNjd3F3azR5dElMdFd0RGRuc1I4eENV?=
 =?utf-8?B?WDFaSUp6QVhNL0o4cXZvcEdsT2crSWlJRmYrc0xJTmdQcmcwSGRsbEJ4ZGRX?=
 =?utf-8?B?N043Qnd5bC8vUmdYOXUrODRLZVJKblpwM0VjM1dDMHJDYU9sWXdMaUpiZmdD?=
 =?utf-8?B?YnhkQ2ZhNElmcEZGbjh0cDcvRjMyRXMzNUpPdlpMNEkzUDNQdG0yUytYTTRM?=
 =?utf-8?B?dDBweTR5bTdQYzNIOW5pd3lrNmhoc0RSQTdRSlU3LzZHWHR1MS9lbUljK2dh?=
 =?utf-8?B?R2c5Z0tyWjVtZ1kzYUJ4V3E2NVYvQlY0Q25waSt2aVBLVGFLSUZlK2IxZVV2?=
 =?utf-8?B?dVdSUmlWbDBicFZLS1p5T1hVUDVQNitDNVVicDVPNVhrZUVuTVd4S1lCekFI?=
 =?utf-8?B?eTFiNXhBNzFYeW9NY1ljOGd4RmRuUnhxWnFLUm1VNTNaOVZ3R21KdHp3anZH?=
 =?utf-8?B?bGM4S2Nibk8wWnpRQXFGb2F5c1Yyc0EwL0RMVDJ0ZVg5VGozQmYxL05iYWxJ?=
 =?utf-8?B?ZHhvbmx3M0Y0Zk1aMzU1MmJLRW83VGl3K3V4ci95SVhJVkEvNlNHSFl0cVk4?=
 =?utf-8?B?Z2dxbm9zWlFmMUw0VUpmdU4vVDBCcXJxVU1xa3J6b2huV0MwaWh3RVJrOG02?=
 =?utf-8?B?a1M0eVhVT0NuTjBORDRnSndYQ0lyeUthVzdFL2E0UjcyaEJsODBmOTZVa0wr?=
 =?utf-8?B?Q1F3MEp0YUtSQ3U2N09Qc29haHU4VWNleStrY0RIR1JVRzFJVmloZll4R2Zm?=
 =?utf-8?B?Wm5xT2c4ZUxZU0taODZjZEZYbFpoUENvNU8wY3Fta01MNFl6MXQwTlRNcWZv?=
 =?utf-8?B?R1BCNWxUV0xsU2ZWWDlYbTZreFVZNkZRT0ZYOGN2c3Y2MWN4OEl3bEwrQjFx?=
 =?utf-8?B?K0ZaQzJmQmFRQ01zU1BTWGJQc2JnYXFaUzdiYndESWxoTTRBRThMNHFPeHZD?=
 =?utf-8?B?WjVTTDdXN0JjaGM1TnVoR3E5WnRlZEU1OG13Z3VxRzFwNjdCaXp0VTVOdk45?=
 =?utf-8?B?bVkyZWJUZHhxNlVFdzZxQlNHbHliMnRhcHlHS2QzSmljKzZpdExMeVB1Y0Zs?=
 =?utf-8?B?YUZzQWhTYXJkN09XMmRzdGFOTWxYektoWHp1c09VUWxrdmt3WEd1YzR0bmRw?=
 =?utf-8?B?YnFDQTUyRGYybnMzbUY4YTQyK3VYZnNTdjZVMDhmM2k1QnQ1MndTaVZmNURT?=
 =?utf-8?B?aThIOTBNS3o5MFZRb0NDZEpBKy85NFpUWWtFeXhVdWxqTmZjSzRsRWRTR0hj?=
 =?utf-8?B?Y2VmV0dyYTIyQ3phM3BRZktnOEFWUEp4NUJvV1JiNzhocHFpU1J2NzVSMVJG?=
 =?utf-8?B?QjU1SkxuUXh2aTNVNERPZDYvSEs4LytXRjNpV0tvakgzeStLQ2dma2k4SFZV?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03f3391-f000-47c8-96ea-08de1e210bed
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:14:01.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1w9upZHJ4xxI5zDBG68qF1hnBydJ5maXgyQ97RoQPMRvb3/5nDJywhDRQzThju/l659K+Xz/PGzvqn84zl47JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5202

Hi Lukas,

On 8/1/25 10:33 PM, Lukas Schmid wrote:
> I’m working on enabling secure boot on the Allwinner T113-S3 (as part of 
> preparing my SoM design for EU CRA compliance).
> 
> I’ve successfully fused the SoC with secure boot enabled and burned the 
> ROTPK_HASH. The SoC correctly boots a TOC0-signed image from SD card, and U-
> Boot starts up and behaves as expected.

Could you please share how this is done or may be with a document patch to
u-boot? To add, am also in the initial analysis of adding secure boot for A133.

Thanks,
Parthiban
