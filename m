Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022134.outbound.protection.outlook.com [40.107.75.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1528980F
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Jan 2026 04:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767846930; cv=fail; b=ZxqWfUp9eM9XIoKRUeA80ECrAfEqqiOxvnMpn1Z20Ldk7BILg5HQAH1p2lOtdhvliJL5umXV5Ktddu+C+JqnKcJVk6ScXWXKdklHLbmbK/k6rAAdv0cs1AdpGETH89B+WylCxbCdSEtYGiAIeLWbpy0TAP0/GLKP1m/dUemwRVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767846930; c=relaxed/simple;
	bh=fi41XvsarVyGB/c9z3DKYdQgPxraT/liUGW2EyKihx8=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ERhJUjoDcPCSe6C+KtQaj0a+FyZDmn7Wr9fko926BIAaCivYpQ0EFbERmBEquWC3VGfgppWlAktrqQIC41pVAxvnZ+R6wG5Q4bUmPKwB5xQrETXekiwzWcMpM9FMlkxOgmEE5S/Gu+1ikpdj0aTuXs2Mse+HL1P5FNJ6V0ls5aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; arc=fail smtp.client-ip=40.107.75.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqzthYN6lyMicXZixqWFSv+R1rSd5FFkFP2bRXQQdIxWcsedZ9Htd6W9OT+u25o/rNUFzdhEh+OODZ8e5ILseWyN/FEgzOMYplDam2pS4zqmVtxq8/NzKPTjQwCl97LGtynqyeTz8rpF9ePbJmqVr4XW4LfoYjPzya/bSwJrwKSn3pvsTWo7t/Dj8xNAW53L1MkU9kW9Ojgj33K55UlyXUNOQud5qWkBsnA2IKSCoBu4CIb3JFT6MjfXTlHEmPfT17uVk5F2PPUHr5DkZeRb4dHwW+j7PI5N5JWExlJp84cjSmDiHnV5GP5y+lvVncgXVH4tvtz0pfMQyExDx0kS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4F19455YVvoRkSmnWeQ13TBAGa6CrL0Lki0lKWiVvIQ=;
 b=y2DYBD3XF+a5GoPbr3Vx5elItYeUan9MW14zIUAp4niXLZ4rBJhSUb0t5VcWIUgYBspnmy6ffc6FiI8BarKVfsXeDa1TM/7fv3EbYZNojU+4875XgNWwHo5wGWUSnIJfubljqIV46PVPF77pFxAgG4vBWTvZKe50XdIqQUMOtavuqSFQvmHT7bp7unFX6y2V1qmQEl+DDSedQNDM8YijjEvS1mEyOuIFC7mzdFFWbvOjVWeum63kAVPqORGrF2ossAQonscZY33rzKph3KuqH45bzsWIajVoismVnj0uc7FGa4B44dP+EUXFD6+QxKIPAOzVzsUyUzlQ6LbccsrBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by SE2PPF72EA95D31.apcprd06.prod.outlook.com (2603:1096:108:1::7d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 04:35:22 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 04:35:20 +0000
Message-ID: <c9481953-82e0-47ee-bcfe-1ea8c30ed6f7@linumiz.com>
Date: Thu, 8 Jan 2026 05:34:44 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
To: Lukas Schmid <lukas.schmid@netcube.li>
References: <4693897.cEBGB3zze1@lukas-hpz440workstation>
 <2286928.tdWV9SEqCh@lukas-hpz440workstation>
 <ef1596c2-d27b-4098-ae9b-168685799de7@linumiz.com>
 <3365142.e9J7NaK4W3@lukas-hpz440workstation>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <3365142.e9J7NaK4W3@lukas-hpz440workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|SE2PPF72EA95D31:EE_
X-MS-Office365-Filtering-Correlation-Id: 65dd7f5b-ff82-49e7-bc6d-08de4e6f54b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGJpeW5UZjdpcGtQVldjZS8vMGpnZmxwYjRTTHVvcGMzb0lPMS9tWk9qdHBW?=
 =?utf-8?B?eHNtSzBWcUl2cDFuTnNwV0ZzYW9IOWNZUDh4cTVhT1ZPL09vMDAvVFJkRzRF?=
 =?utf-8?B?cFQzbFZnTk5ZU0ZaUWxjcUdRRWFuWWxSaXcxYUZyWHZvbzl4SzU4emVpNjFH?=
 =?utf-8?B?OUZNcURrSll1SXl6WXBBV09JcHF4RXFJOGxIWjljbFRERjJlQjdlVkxCdjlW?=
 =?utf-8?B?U3FqRzJ0MlE1RWtuU29oNlF0MW1mMk0vajFENGt5UTREUzUyYlBkNDdCMGdN?=
 =?utf-8?B?MDU3UkNvL2h2aVl0dS9TeW9yOEhHOHFLdlJXY2xCVVlObXV3SmI4OHczQUd2?=
 =?utf-8?B?RS9ENkU2bmxUUjExTllJRlpPV3VWQlVXWUMxWFhJU3lJSWZZcWRoUncvRkVX?=
 =?utf-8?B?eDZrZkVHbXdRNis3WllTWitZckV6UWZsY0xIMXNQUUxOeE1JajBnQWFXTWdZ?=
 =?utf-8?B?YzU3WWpMYXdhU0JHaytVS080czJxaDg5REZmRkhtbm1sWDZBdFNnaGZ1Y0x2?=
 =?utf-8?B?SkYxOEo1ck5CMFUxNEUyRkR2cTJzQTYyQUcxWm5sOVAvTTduNlJjdFFHK2tU?=
 =?utf-8?B?aTEvVWUyck1tUWxmWHFwWU5nY0cwS01oak5jcndrbG5XQnJiYWNGR2xXZTQ4?=
 =?utf-8?B?STJQOUg0ZW1SU0lvcXdYMXNsd2R5UFVVUlVhaUZpTjZMVERrKytqZFhKUm1X?=
 =?utf-8?B?NFBNeEFaR212cU12S0hmSzlCS0VyRDRINFhrMEtsczVpbDZBSmpYTGlpTEZW?=
 =?utf-8?B?RmZmL0RrU3dhZnNlaloxMFVYMkJaRlltMlA1NjVmRHNUSlFCTUk4cE0wMnRt?=
 =?utf-8?B?cytWeGZPN3I5NytBTFYzbnIzZEdZS2ZoTlFWVlpxR2FURVJRMDJ2SFZMc1dB?=
 =?utf-8?B?QnpDQzNlL0dNalhnZlZRcVJwaERndDkxNnk2WENwNzQrb28vV3JuSnFWa1ZL?=
 =?utf-8?B?WXBtMlc5dnNib3R0UW8rdm9PaEhQd2wrRi85Qm1FaTdpcW9sTWk0dGNDTkNm?=
 =?utf-8?B?ZEpLY3NadENMUkROZklVQmZNNStLRFF5dmMxQlpjc3poSGlSZmt5Nm0rMzcr?=
 =?utf-8?B?VWRHTm82cWV0bjM3Q041OWI4cEVaN0EyWk1qOERwYy9INGduelBHSkJJYUNs?=
 =?utf-8?B?TzJBS2tDQml0MHFhQnJqQi9WYlRnZ2NYVWVLWDZqWjZhWmVQcXN0b3lEK1hm?=
 =?utf-8?B?cFJGOUtNNmFXM25ELzVBejd1Y0ltNkhKMzU2Z0NLWnB2MmUrRmhJRGF5Znpq?=
 =?utf-8?B?Ly83ZmFMcU5wT3ZnckVMNG0wZDlBV0FwV3JyTUNRNnZDTUJEcGIvZ0l1YzRQ?=
 =?utf-8?B?ZHRpaTRvc3d5M3hYUHJWaUgxd1phQnlsQ0JXUVQ1eHhkNUlBTzk2VVVFdlFI?=
 =?utf-8?B?V2grUkNCaEZGRk4yMDQrQzFaOWJiaXRCL1FsZitsUWFHSnZxNTlaNWFubmN5?=
 =?utf-8?B?U3VOc0pNLzdVNmwxYTVLMnVNM0lYa0F4ZmYrSzkvYnllODNnV3ZsR2lEYitC?=
 =?utf-8?B?bUxGbjZyUFlhdHlRY1gzakxzcm9hKzMxTDZOQW5oWGtVUjVqOVNDN0hRQW93?=
 =?utf-8?B?NmJLVFRINTVwZ29ONkN2emZHUXVvdXM1emIwaHR1ZHJ5MzBIZmh2YUhqMERK?=
 =?utf-8?B?M2t6MTZZY1RrUmtka2pXRFI5NnpzZHpEN3pHVXZOczY0cXZjSG9USjJBSGpI?=
 =?utf-8?B?QXBwWjYrYm85YklzeGdXZk9jRGJUVGRqemNyN2szYlBONFZHTG1NQnlrWCtw?=
 =?utf-8?B?cU9JMUo5TU51eWlNNk10L2h6QTJYbUowbmhjN3FXdFUrZ0FJSHhWY0xQMjNz?=
 =?utf-8?B?cnYxTnA2bk4zSW1HSm9xK05IZzlwbW1rZUtVV3FMZU9JTnkrVnJ3aXFWMDV2?=
 =?utf-8?B?aHpkR0szQ0ExV2RDaVpvRXZDOTdJUGx6VWZVTUdOOXl0NFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THR3cDdyLzJqTFdSejNzY2dta2hicmZVbGZvYjIyVkw3WUJjUzdMR2ZNek1o?=
 =?utf-8?B?ZXZvWUg5MEVDU09Yb0VNUjVva2F0L1hhc2NZRzNua04ybGZFSG9YMTNFUVlE?=
 =?utf-8?B?Vkl1QUI3SVpBZXZJT21TazUwL2g5c0RjU3Rqd05kSklrMk1mRjl4UnliWkJ2?=
 =?utf-8?B?N2pUR0p3QXFVOG1DdjlvRCtXNVR3dFJyYWRnSmQ1TmpobTlzZjA0K01aU0cr?=
 =?utf-8?B?ZmUxK1Z2ZktyRklOd2tBSVk1TkRTY2t1eVVNclArdnU3SHc2MVhmdFJ1bU4z?=
 =?utf-8?B?K1Q0dmtJZklOekVnbjFMVndtR21lN3FSWUxqSU00WTRldG9WTVBiRklnZFha?=
 =?utf-8?B?TWNIcXRSZzJXbEJWNnFNRDIweWxnbmwvNVVJRjBlVWxWSnByaEJCdGJtMXJN?=
 =?utf-8?B?VUp3c3hlcEZscFZMNU1yc0x6MGVXOGN6UnpDUHdJREN5bHFLOENIUzRGeVhk?=
 =?utf-8?B?NzlzTkp0Zk9tK1FycDBjZnAzK3JKakhjelVtRzR1Wk5FbHgxZUppY216bzFO?=
 =?utf-8?B?ejZqZlZJNkI2T0tlU1c1a0hYL0RFanU5RHc4RXVmSU5HMnkzZmdWRHlPOW01?=
 =?utf-8?B?RXEzbEZjSE82dm1uQVhxNElPZ3poWGc1MmYzSmNuUGxXQm45NmFUcFMyamVn?=
 =?utf-8?B?aElqcEJxTEQwa09FaXVJZEJBSXlTZVltNTFKejJQYnVWdVlDbzVqUjk1eWl4?=
 =?utf-8?B?VllOQXZVSkt3YjVaZGxLZUN6SmZmdGtlT1ZGUkJuYjZSZlBKMWZMMWNqbHNS?=
 =?utf-8?B?a1N3K25qWk95SHJDR3JQTGFodjhZVlZWaHZFWmJOTVZJeERtZlhsYU1vMUo1?=
 =?utf-8?B?R3lLTWtrb0s2NFc3TzgxeHpEUFJtQkxNQlZJaHdDR1NkME0rbDVTZnZrdWNn?=
 =?utf-8?B?d2kydVBJdm5IeUhyTTJYL08rVkFmaDNnRDZ2VlhxWVJVSldVd1ZiOGdtTGxs?=
 =?utf-8?B?TE41bWtiRkZpWHM3eTNVQ1A4ZDNyZXNlTktVUzNjQnV5ZGhYMzhwUWV0b0xs?=
 =?utf-8?B?b0JsM2ZxYWZWd2hWWTZWNEFRU3Q1UjdiVWdjaUtOMjhpTHZrSXJsQ1dmK2NO?=
 =?utf-8?B?QUZINVl1dm5mc0E1MGlUanFZMFV2dGxuVDViTkRFM0kxQkZOZXpmTEo3U3F0?=
 =?utf-8?B?c2pMdFpmSGhQczhzN1lWem54VkF1eGVpWGZpSXQzVXJuT1JYSU5mQTdJWWZQ?=
 =?utf-8?B?YnhIbWJ1WUh0cEt3cHpmZ3E5ZVBVM0FlZDJhbHM3K0VpNXlHeHgwYytqYjFh?=
 =?utf-8?B?YUt1d1dUalgrd0UrVUVZZ3RIQkJyV1NWK3ViTDBMRkFDVVFwWmFYVEVINUNT?=
 =?utf-8?B?Ry90dGJBd1c2eGR0azZ2VzBDV1VyNzBXZkZRYXlaQlArTTh2Z3laSlRFcHBy?=
 =?utf-8?B?VzlNZGV0ZVR6b3Vsbmp1cnIvOVd4U0VMZHhzcEZNQ3FZcCsyMzRVVHl6b2V2?=
 =?utf-8?B?SG53UEVtUXpIcjNSQWNVdHYzZEdiU1owR3N3Qk1QRzhHVnRaS1BFeDN4Uzl6?=
 =?utf-8?B?SUlmZWl2eWZaaHNOS1lLcXRDUGFRRlEzM1huSm4zTTdMeUlaV0ZHSWFCSnMz?=
 =?utf-8?B?UWh2RjBJZnVYRTZNWDByK3dPYWowSWZmdXNDRVVYZ0JvVjhwNlVwbFZRTndL?=
 =?utf-8?B?K2lVd1pJbm5IMlFsMXQxbFdNc2tPZTVHK1RZY3FZZVRWdG41THMvdENhZjg3?=
 =?utf-8?B?d0J0RzNDR1o0dThjbkx1MWxZcEZUVmFuVFpqV2pmclpBYlJPVFNWaGxQWjhC?=
 =?utf-8?B?SHBiaUhsUXk1b3RhK01DRnN1dlE3ZlJueENrZDZZK2dGYkFKK2RjeUo2c3FG?=
 =?utf-8?B?T094MlQ4Qm9ncHplZFJtMWpXdXJlOVBQaXNnV0c1OUlLL002aGtkS0hoeEt2?=
 =?utf-8?B?NVd4R3RsYlJYdldlTTFNU25XVk5mSG1iZjZvaVBkL0Z3VURkaE1NTWUrN2ZF?=
 =?utf-8?B?d0ZlZUkwZldwMmFQamwvck4rSWNBRWdvSFoyVFpFc0tmZ045YW54UkFGRkRo?=
 =?utf-8?B?MElnTFdOVHBZZmVPZ25id2Y2QjVjNHZvL0p0bEdEVFBoaTlOWTZJUEEwTHdU?=
 =?utf-8?B?UEtsTCtRMDJhY1IwbnlYVHBaZGROYXgxMW1TUmRmcnk4cHY4Z2VHM3JiK3Fy?=
 =?utf-8?B?RjZlTVRwL2pDVm5wZTlJZ21iak1PckIvVjA3OUk4NitSaUE3Z0xLZHREdUJk?=
 =?utf-8?B?SGV1TmtpM2ppZE9SR1BudmZmOVRBS2wyZ3VBbUxwMGVqMVA5bGFsSkNRY2d0?=
 =?utf-8?B?R0hqdmRjTldIZUVOUnk5ZnRZSFpUZXlIVjM0U1lIaHBkK2J2TTE0ektzS2tt?=
 =?utf-8?B?NWpNVjlGc2VjeWU1VUFnV29VNWt4ajFvOXRHbnpxbVVkemt6aDIzUT09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dd7f5b-ff82-49e7-bc6d-08de4e6f54b9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 04:35:20.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SD8Q8Byk620cP0s/W2y+kscXQtaR8JS2j1UjqqpByudlYSvlpFsZlJ++r+J553RQQWmp9tzw30wYPCkroZQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF72EA95D31

Dear Lukas,

On 11/8/25 6:55 PM, Lukas Schmid wrote:
> I actually do have a document on how I fused and flashed my prototype
> board
> here:
> https://nagami.readthedocs.io/en/latest/software/enable-secureboot-on-soc
> /
> My changes are available here however: https://gitlab.com/netcube-systems-austria/u-boot/-/commits/next?ref_type=HEADS

Many thanks for sharing the details in the document and also the code changes.
I had to do minor changes to get the SPL -> (BL31 + U-Boot) to work with FIT
signature verification. In short, u-boot had to "loadbles" instead for firmware

@@ -164,7 +162,8 @@
                                @config-SEQ {
                                        description = "NAME";
 #if CONFIG_SUNXI_BL31_BASE
-                                       firmware = "atf", "uboot";
+                                       firmware = "atf";
+                                       loadables = "uboot";
 #else
                                        firmware = "uboot";
 #endif

and otherwise the verification worked great.

For secure boot,

```
commit 33cab879691bce96bddaf6558d53a987157e3a4f
Author: Parthiban Nallathambi <parthiban@linumiz.com>
Date:   Wed Jan 7 14:45:43 2026 +0530

    dts: sunxi: fix for ARM64 with A133 secure booting
    
    Fix the global dtsi to boot with secure boot enabled for A133
    
    Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
index 93e58bc9ba6..b3fffd39838 100644
--- a/arch/arm/dts/sunxi-u-boot.dtsi
+++ b/arch/arm/dts/sunxi-u-boot.dtsi
@@ -30,11 +30,7 @@
 &binman {
 #ifdef CONFIG_SPL_FIT_SIGNATURE
        spl {
-#ifdef CONFIG_SPL_IMAGE_TYPE_SUNXI_TOC0
                filename = "spl/u-boot-spl.bin";
-#else
-               filename = "spl/sunxi-spl.bin";
-#endif
 
                u-boot-spl-nodtb {
                };
@@ -46,19 +42,21 @@
                };
        };
 
-#ifdef CONFIG_SPL_IMAGE_TYPE_SUNXI_TOC0
         image {
             filename = "spl/sunxi-spl.bin";
 
             mkimage {
-                args = "-a 0x20060 -T sunxi_toc0";
+#ifdef CONFIG_SPL_IMAGE_TYPE_SUNXI_TOC0
+               args = "-v -n allwinner/sun50i-a133-helper-board -a 0x20060 -T sunxi_toc0";
+#elif CONFIG_SPL_IMAGE_TYPE_SUNXI_EGON
+               args = "-v -n allwinner/sun50i-a133-helper-board -a 0x20060 -T sunxi_egon";
+#endif
                 data-to-imagename;
 
                 u-boot-spl {
                };
             };
         };
-#endif
 #endif
```

that's the diff which I tried to use it. Without explicit CONFIG_SPL_IMAGE_TYPE_SUNXI_EGON,
the image generated by the previous stage using mkimage is again replaced with binman. So
the eGON wasn't working and I added the additional sunxi_egon one. And also I had to disable
"CONFIG_SPL_BINMAN_UBOOT_SYMBOLS".

For the TOC0 to work, I tried the below commands. As far as I understand from your blog and
also documents, ROTPK can be optionally flashed. If flashed, S_BROM will check for the
integrity of the public key. If not flashed / fused, it will continue to the next steps of
verification i.e verifying the signature of the SPL using the public key.

So I have tried using the below commands to enable the secure boot bit, (RTC base in A133
is 0x07000000) after flashing the TOC0 contained image in the eMMC.

mw 0x07000204 0x1
mw 0x03006050 0x00000800        # bit 11 = 1
mw 0x03006040 0x0048AC01        # write to offset 0x48
mw 0x07000204 0x0

when I reset after these commands, the device enters FEL. So it didn't boot. Also with FEL,
am not able to load using sunxi-fel. So I guess I bricked this device.

- Is there a way I can load SPL / U-boot using sunxi-fel with this state? [1] checks for
eGON and exits if I use TOC0. So it's not possible or is it only the limitation of sunxi-fel?
- SID Specification and Address map is not shared in public by Allwinner for A133. So assumed
"eFUSE Region Overview" [2] is after H6. Is there a way to verify or dump register contents
and cross check it?
- Only way to verify the written eFUSE is by reading it after writing i.e
md 0x03006040? But the SID_PRCTL states 0x02 is for reading. So I shall write
"mw 0x03006040 0x0048AC02" and read "md 0x03006050"?

[1]: https://github.com/linux-sunxi/sunxi-tools/blob/master/fel.c#L776
[2]: https://linux-sunxi.org/SID_Register_Guide

--
Thanks,
Parthiban
https://linumiz.com
https://www.linkedin.com/company/linumiz
> 
> Best regards,
> Lukas
