Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022140.outbound.protection.outlook.com [52.101.126.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643234D39E
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762621284; cv=fail; b=FZfdq4kReG79vQhMveHaiOP7j5GfcD7A/05YpkeOyE9edkEtEkAZUhbh7jfVRmj3s2vbo7OiuEiUorHYnSrSjP5DrkF4ushv/Ba/G0OqapH1PdIPVl5zWRDLN9fh8EGHvHtcT5SzOGiE6Nyz7Oad92t+jUSz1v9dqKl33/Ch6dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762621284; c=relaxed/simple;
	bh=vNWZx/xOliSe+6W7UJ/cwSkLwjSI4cnggkYAKHdDpEA=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O0jVw/tGzkfr5I1rDi6/obBkdXuOMD6TYAsz2TKDOIXPiOaMaa5BiKMi3ekGBTmjr64hmzuSxTRgkEWKEml7AQHRxDquRWzC5mArelGTvBF+VlW4SDV1yLmtGPl0VsVaeYPFJY2kTCfig6wx8VGGOmzA41QA3FP+mTwikN0NSYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; arc=fail smtp.client-ip=52.101.126.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ5cXQFkvEcCjDhs5bIxY5khigZNX3Ddbf1VIlOTBiettR4OswAx/V78iQy+McIVDYSck9yUTeNQzbXCWVOdkYjCgrDrmImpD+8+p0UPVgnejoV7jMBtYlSM0Mm7GfQ5GBsoz9SHkVw00mtR8DQ7AVrs+ho83GolDOPnPnRb8bsfrxDyiT2NrLOaFZEnlf61LIGjfrfsF8WXxgkx+ywiO7kILXSQUEhS1IP68ihx5ZNZcNKmBAxMe/h+Lm3vQnqN7kXzGuxlvkTNV18eP3oVAy6NHZRh+pt47a7uP/K0CiamgSrGm+yyaCjmMdyr9mpp1Tdf9PxMqqs4us+P8hvvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDLGSMaNoAf7+b61nYOaLJkrRZnl2v0xwFhti12nAwY=;
 b=VXawu76ZG5dbYVAxebec7dPrMZFchqR+G7C4xvHxxDrcrF7EmM3SE4Gt4x1zko68hVO0j7gxE5I+xsa/F27pxXuEoLaBIKhrneoECkU3KFp/rWJWZJrjgaibU/iA0r4NXMQU/pQYwzPowdzQxKYkA3rC2vy3W4NOVSPUsCMPWVkfrYv5YpzjqgqAu4/N/bJL3Gdvp+gmyAN7RdnVRWimHsoVsLl2D5mBwzy8qEf64Ecv4CuO6b/op4es/VoP5aZRgmLbM9iFJqD3wIyWiGZSquHUbg4k7XT/utkmrTz4pWf/QlRd0cwTnKt1KpzajgcnmRuPfQty1JmtBA2aUlZp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by KUXPR06MB7997.apcprd06.prod.outlook.com (2603:1096:d10:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 17:01:18 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9275.013; Sat, 8 Nov 2025
 17:01:18 +0000
Message-ID: <ef1596c2-d27b-4098-ae9b-168685799de7@linumiz.com>
Date: Sat, 8 Nov 2025 18:01:02 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
To: Lukas Schmid <lukas.schmid@netcube.li>
References: <4693897.cEBGB3zze1@lukas-hpz440workstation>
 <5290a949-1eed-47e9-a258-024447009c7b@linumiz.com>
 <2286928.tdWV9SEqCh@lukas-hpz440workstation>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <2286928.tdWV9SEqCh@lukas-hpz440workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::25) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|KUXPR06MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9b21c4-bedc-4c3b-06b1-08de1ee86f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnptTy96WTllcDVwS1hENUc2Uy9xeXVGWU5Cb0FyMy9hQnpxNTFJVUpzY3N3?=
 =?utf-8?B?V1ZUMTFWejNJUHNBVFBiOUlWejVvU1F2TjJ4cnJKdmhSZXJCaVU4c0ZXd0FV?=
 =?utf-8?B?djF2VUJCZFBuN1RSdVVsKzNwN1BxNkk2OC9aQkdaZ0xnSHFsblZtVE5rSno3?=
 =?utf-8?B?Szk2bWNiY1VrS1k1dWtaYXNvb1pCVkczY1oxbVFWaHY2ejk0WE43ck9EcEpw?=
 =?utf-8?B?cXNnY0o5WVV0TkZsSHRPaUNiRVNMZzh1cHdMY1NxOGhOakNEc2ExWU5ITGNF?=
 =?utf-8?B?OG54ZGIrSXNFUXNsRVZSbDZORHREbXplQTd0MUpabzlsWG1xQVlnZGdkWGhG?=
 =?utf-8?B?M2F2d2tmcG5QbU1aNVdodmFiRkhpaW1DK09kamFRMmxRK0xrYi9xMEF2ZjNP?=
 =?utf-8?B?TUs4VHovcHJiU3MxRmJuR1NJc2FtdmNWVEdjVnU4M0RDWGY2WE55RnZNM0FV?=
 =?utf-8?B?ZDA5Snc3OXZBWGYzeHByQUJucmVXZkI4S2Z1cm5iTnUzY01HYmVyOStqeXNW?=
 =?utf-8?B?L0x4Q09tZnVlai93MGx3WDdTVWtmdEx5ZDl4SEtxQU9kQmdMRllsNHBNRGhK?=
 =?utf-8?B?L1dyNGRBenZFQWRtRWIxNFhQTVN4UzZLalZCdXk3aUpaVnJFdEJVOGp5Zzd6?=
 =?utf-8?B?S1RIbnJlQjE3MzcxMThlVmRwWlBFaVRNYVpqYXZGN2ZzeDYrenNrWGtKTzdI?=
 =?utf-8?B?bDBVOTBxUWd3bmM1a0lpZ2pURHBPelJ3T0RrZ3FSS0lzcENDVUZoTHF0TTBn?=
 =?utf-8?B?TC9aWklwaTBoUmh5TWZxWk93c2tDZnFGdUtwY3UvYnR3QkF5SUF6cnhyNFJo?=
 =?utf-8?B?NFJzdENnY3lESy9udGN4WGJncksyMFNlckkwNE41cDlqYldWaUI1eVZzelNB?=
 =?utf-8?B?V1p6WmlwMkFhSFdIL3ZwZzZ2THAyOUQ2OUhJd2g2Z0J3ay8xaWxMM3FrTUE1?=
 =?utf-8?B?SjdueGdnRU1NbGJCNmZtbGFGcldEZzBBWDRjY2pMTURMTXRYbDZnWWwwZWg5?=
 =?utf-8?B?YzN1a09ZTE5YWnkyREFEa05KSXJYbFBWcFZ3cG5HUGx0WjVGcG9aNERzQ0ph?=
 =?utf-8?B?aEYwUWo4T056QnZGTFFkbVFGclRUbTUyRGoyaktkTE90Y0c4aVFkUXdoQUpN?=
 =?utf-8?B?dktJNGpweVZGdTlTUzRXMXNSTTZZNVA2b3lDWmxURDFTOW9iSGVtd1hNaFRw?=
 =?utf-8?B?WkRLOXR3UnliQXBIOFdOK3VCNFY4YUJ2UUlyTk8vbmZaKzVWblVKZkk0Um8x?=
 =?utf-8?B?WVM0YS90alpmWm56SXJFa3kvWTJlMGhZbGg2NUNYLzM2VGxBNGw4VTJWMVp0?=
 =?utf-8?B?V1ovamtHZzZVcWhHY0psbHhORFE4ZnRweGlCMHRsUklIRWdQeFVjalM1d1lz?=
 =?utf-8?B?NVNSWlVIR2FmL3psSjJQWUcvWFJ1RmdLR29jdFNjdjNFckgwQUh3bFRQVm1m?=
 =?utf-8?B?eEtuMS92QjBmc29Pc1VSRS93ck0yWnUwN242aklKTEpjMEU5YkZKM0J5cnNR?=
 =?utf-8?B?QURwY0RXM1k0ekZQbjJQSWxkZzFKYU05MW93aGkxMzZxcGhnYmZQUkVGRDhL?=
 =?utf-8?B?SFcwcDNoTjFETFllR052bnBocFpWeGJQZ2k0SEJ3Nlk3akZCK3NRWmlMOEl0?=
 =?utf-8?B?ZUJ0bE1FK0Q5S0N6aE5FOEpJdi9IZGNuRXlGdjVzSzNMSWhaT0hub2J6WFR4?=
 =?utf-8?B?SzJUdmNZTk5ReXdRVlp5UldiTHJ4UEdaaVhTR0VpdTFtQjAyWjJpb0FwVTRy?=
 =?utf-8?B?MXpjUTltRWRMcGRLY3g0MGVFdXd1VE9lVCtNVFJjaXJrSTFkOHMzVG5iaSt1?=
 =?utf-8?B?eU84SWNZbTVHMFNIeFhWVk5EbmRjZUQvRUppSXBtcDBsY3VQUVpvNDBxVW94?=
 =?utf-8?B?UDlvVUNodUVCbXNGQ1ovRUhoanVqbUlXWGY5SDlPS2d6VXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjNGaWlVMXdraExha0s5eFBhSW5Dekd2bWNsVHpNWnI1MmRiQzVhZ0VtNURp?=
 =?utf-8?B?UlNuYWgwZVptRUR0OUNVWDVYMHdkUEhHNTBNZVlKb2JIemRCMzE1aGZ6QWMw?=
 =?utf-8?B?bE1ZTFlLYTRuaVlBc0dCbXE3YitWUldPdkFidVNxME0xZ0NvV2lNU0FEdlp3?=
 =?utf-8?B?WGlucTE0WjY5VkFvZm5vZmtTaDNDbWVwTlhINzZPWFFCV1NzLy9yYXhZd0lF?=
 =?utf-8?B?djl3K2kwZWtSTDRuSlhNVktqUlRwbEpQOEVwMWR6SGVXSldqU3VQY2R4cmdE?=
 =?utf-8?B?RmtzdTdMaXczZjA1QitmcWpKQzVKeUE5R2d6UG8vckVqeG10T1oyTU9ENVZq?=
 =?utf-8?B?dkNvS2hHUTFOUm01UVl3Zy94MDhYeVFJR1FiM2FGaTZueGhRVVRmMERZbkU5?=
 =?utf-8?B?MU9GUkVQVWJTdGVJcnhXbGxPVERuQm9GVjN1RWdwdWl6emY0LzJ0TUVHb0tQ?=
 =?utf-8?B?RGNWTWhUM2g2V2xJaVFGOTh0L1F4YU5VZ0s1bUcvZDlhWWdycVJzQjVmWFJP?=
 =?utf-8?B?TGRoK3JQNXd4a1RCMENIbmJLRzVjWURFMElPWkhCUWh2Z2p4eXBSZUd5Tk9V?=
 =?utf-8?B?b2VtZWJRWHgwRVNGNC9OUks0SXpaZFNLbGszMEhwSlhLVDhiWXF1YytDR2F6?=
 =?utf-8?B?cEtEREdEZ2dRN0dMZWlPeGRyZ1ZwdTVvT3pON0swa1BjQnNtN0NQbjdHUnZw?=
 =?utf-8?B?M1gzQzcyall5U2hIVEJMNE03VE5udmJ2blBvY0gwck9JTTVCS1lOYjN3b1M3?=
 =?utf-8?B?clgyTk53ckU1OHBrdTZuMjc1QnNDMk5PMG1yZ1M0WGxEbVE1NlZYOGRad1I5?=
 =?utf-8?B?L3cxWEhka3VUdXk0WVNud3hvQm9RdEVUODJsV3FjdEhzTWpmZ1R2OTM0alVi?=
 =?utf-8?B?bUFwM3JnLy9Ub2V2Zmx0dnlHVUJ0Zk9mbDlKSFdkbDg0bDRXckFsanRDbHky?=
 =?utf-8?B?YUtaOGpYOUxXL0t3c0hrN0dmMzk1aGV0Y0RnRVBRcy9Qd2pubWVxVzFSM0Vm?=
 =?utf-8?B?ZTBYRU9ZV2l0YjdVaFVRb1poMWJ3a0FDa2tTZytHWFZuWG9ncFkyNXNjTFJH?=
 =?utf-8?B?emNrSXJIVzJJWkIyandDdzhUYm1RSVNCZFpDVUJGN0p0czYzQm9oZjhCNXBn?=
 =?utf-8?B?eWpFN0JUUTFmQ2VVYVMrZG9xbHh6aWVEejRQVDB0STZhN0tKemVmZkdWUEt0?=
 =?utf-8?B?Uzc4cDd4V2ZEYTVTZUxGTC9SQk5jY3dJalhtOE9oYUcyTFJESFFONng3UFdr?=
 =?utf-8?B?RDV1VjhsMXpNRlg4NTErMzhnMVBmRHZQUGVLRXd0eDJMQmp6aFBiTzFXZEtt?=
 =?utf-8?B?YkxrUFRRQUJUNHE4c3BsT1dTWnlmWkFpVDlkakhKL05QdmdoWHFzanU3aE94?=
 =?utf-8?B?MDE0cGM1cnNhM0RVWU82cWpkdXprWFlrMU43Q0RLdEhTYVBnbVpud1ZFZjlS?=
 =?utf-8?B?WDFmL2RTRXB0SzdFQ2UzSkhkd0hMR3hkdjlBbnpGQVdEZ3ZMeG0xZzMzbWNo?=
 =?utf-8?B?L0tYR2VEOTVEelRqV1VCTVRUbFdEaTl4REtqdTNybDlBSm91bkVBZGhvMzcz?=
 =?utf-8?B?a1lpVUFueHNiWXBvWWI1QjlNajI0QXVMOUdrNk1iamVZbjU0bldyT3AxVXNk?=
 =?utf-8?B?Z3hURUJJYVJnVUJrcTh6WkFyQllKRzJ6SWlwOWtCT2VvWTJ6MS9lZ0d0eFM3?=
 =?utf-8?B?TXpVMDdxcWRtR3ppL2x6ZmNoT0VIczlsWGZOSitzdE5SWk9ZMmxYbmkvbE4z?=
 =?utf-8?B?ZVVmSndEckdQKzdqTjNneHFUdU9Dc3NkaUwzQ3BLVXJiZW9NdVN1RkJQRy9z?=
 =?utf-8?B?aW13eFZmL2tlYjhMbjNaR2NMU2dQdHRtSjJReWx3L0p0QkcxVVVlTzRBakt3?=
 =?utf-8?B?ZE9ZdVN1RVAwREM0aFRvMDJjQksyWTRzUTZDNlRDT1VxWWkzUHRCQlB2Sm51?=
 =?utf-8?B?NDMxMkMwdnRwZG5JSEkwOE9jSnQrdFN4bHFwcDJxQ3VkaDVsVk8zd1JTZm94?=
 =?utf-8?B?OXBpaTdyNm1wN0hzM3hBMkZzVUU1VWpYeXpKQjZTa0s1dHhPQUhyTDVJUVJG?=
 =?utf-8?B?aDJtcG5HUEFBaDlZVGl5MkcrUHF5OHNjSHNOK09LelJFRXlUSkplSzdGTTZS?=
 =?utf-8?B?ZGxjcTEreXhFam1XRmtGblpNNktSOXd5aU9FcDlyVkdSTkE4Q2puNC95ak9i?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9b21c4-bedc-4c3b-06b1-08de1ee86f25
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 17:01:18.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9YLJhXzXGagu/cGYtHlip1xLNQ/z09vAbmmumkGIPn4sMN4aksIeLuK1OsiNvrNHXdMS0C+6PQ0QuzGo2ZZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB7997

Dear Lukas,

On 11/8/25 5:56 PM, Lukas Schmid wrote:
> On Freitag, 7. November 2025 18:13:13 Mitteleuropäische Normalzeit Parthiban 
> wrote:
>> Hi Lukas,
> Hi Parthiban
>>
>> On 8/1/25 10:33 PM, Lukas Schmid wrote:
>>> I’m working on enabling secure boot on the Allwinner T113-S3 (as part of
>>> preparing my SoM design for EU CRA compliance).
>>>
>>> I’ve successfully fused the SoC with secure boot enabled and burned the
>>> ROTPK_HASH. The SoC correctly boots a TOC0-signed image from SD card, and
>>> U- Boot starts up and behaves as expected.
>>
>> Could you please share how this is done or may be with a document patch to
>> u-boot? To add, am also in the initial analysis of adding secure boot for
>> A133.
> I actually do have a document on how I fused and flashed my prototype board 
> here: https://nagami.readthedocs.io/en/latest/software/enable-secureboot-on-soc/

Thanks for your response and link to the document. I will check that.

> 
> The required changes to U-Boot are already in a Patch, but I haven't heard 
> anything back yet.

I couldn't find that patch in upstream u-boot mainline list. Could you please
point to the series / patch?

Thanks,
Parthiban

>>
>> Thanks,
>> Parthiban
> Best regards,
> Lukas
> 

