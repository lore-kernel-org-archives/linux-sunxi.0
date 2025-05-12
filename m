Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B925B69A
	for <linux-sunxi@lists.linux.dev>; Mon, 12 May 2025 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041854; cv=fail; b=SbziDrcdR8PXw8wPnDdpLfLd+BCbc+Xfacer7tRBocc/tNEdAdDDM/f5ybgQ+UbljzSDqnXzWJ/TQyJDk9dwc1DuxNEi/tTK83lZm6CycKWeKwkwZG9maggBHLxdW12qZi0Jw6AOidcWM5jE8LKMKVAqfaNH1hgK57YChzb6Xo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041854; c=relaxed/simple;
	bh=6vPACx1h+SFsJVUsfwbCX4XjJmFUDAkRTN26aZ/TIxs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z+H5krZDpDa2gGT1Fh2uF6pC9j6S/Xd47K4MWP6qgwVcmUODEK9lp13bTY4f8eh7wCBmJgtm4KdpPZKnP/2t81Mu9siXAHsxiZCZV5wm4pC1GpvmR1cBZQAJpp8ru7pShNj1RtYwlXF1yF2HqJBjiNJktuazlbUNSroHVToRR2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=l/ac+VlB; arc=fail smtp.client-ip=40.107.21.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="l/ac+VlB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjTIsU0cR3JId3YzJQ0BIfU0cMFCvlPHKaZcujz0Tw/FqNxF4WDkuLT69pegaISz8/P9OKVXVuLQwKhVcH+VUjlhtNfBQBArRWK1HImBR1noJvDvsdFSR7IOBvBEj2qO104rdgdNbw2UKnb94oori6ho18eIloNl1AtBIsjoR8pJHlKrcbtSoYdwDE3vwp+uar16YOENdUV+bWGJWHB20ymi5mkqh5EaSpU6PYtFKYUcSphzS7jhkA+bkr4j/0eV1L98BV9T68rfRXEm1jmwM0GVeRfYK7npvxHIF8qlX2ZM1N3gRe4KpbYRdTUh0AhIrrrtYIJGI2Ju7ZQrowfTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxEgUU/xPytz3yZwOJltC2hPalVlt7CmaV9asKNzN1c=;
 b=Mx04E7mcFvVnF+3on6Wf9m1SKmwU1p153VF1TtKHiNm8IKBOJTCgCkjWrP75PSKtrdC5PQ2f5Vy1j4GUvs0BPBEcGq2n19atBauCYcsk36kbFNjWyGG3ZWpPp29ESmvC1WgS/+dWV79FVxtDd66O8EkInxz0Mq9dwterZwlyc0G9TKkTDsKZU9PSMpH+xLuYLDndyuIVHiyzYzQKQnxRK+e/bttYOsZaz8KICCEtjyjKN3l6L7ODZMso7K/haOf0fyYCv8ZScxHeiSz7IqVmxxRsWMLTctJcTP23quRViePwAVBbmAufTJbNOEkmnPuCTQChlL/kxRWMouHUGRb7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxEgUU/xPytz3yZwOJltC2hPalVlt7CmaV9asKNzN1c=;
 b=l/ac+VlBMffoc67buNEwUEsM14+YExM/qALVo6h2nyDPM1rQwjOhTjRKyPfJtd7VultH7ZnIpgdghTam6PKbZZv6cm66KXnPkkjwOdC8Z1zFj+G4EuXosjxTLcFYyUimUU8aVYF1xkuIw3Kzxf4zxd8Ya8CoCU5K7Zbrsl7UQ0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10716.eurprd04.prod.outlook.com (2603:10a6:800:270::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 09:24:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 09:24:08 +0000
Message-ID: <ab250c1b-d227-404d-b834-300b82b925a9@cherry.de>
Date: Mon, 12 May 2025 11:24:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: allwinner: a100: Add CPU Operating
 Performance Points table
To: Andre Przywara <andre.przywara@arm.com>, u-boot@lists.denx.de
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Cody Eksal <masterr3c0rd@epochal.quest>,
 Philippe Simons <simons.philippe@gmail.com>,
 Sumit Garg <sumit.garg@kernel.org>, linux-sunxi@lists.linux.dev,
 Tom Rini <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250511011003.15654-1-andre.przywara@arm.com>
 <20250511011003.15654-4-andre.przywara@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250511011003.15654-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10716:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b63507-4f6f-4dc0-0e07-08dd9136bf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mjl3NXR6WWJRM3JIT0Z0S2NUV0d6VFhXSjZucDhhMVB2YWgzYUgwcXM5aXlo?=
 =?utf-8?B?NzdRb3V1ay8zUkloMDRUT05SS2JRNkhxQTdRdC9SYnlIcldDSFp2blNRaWlr?=
 =?utf-8?B?U0twT3VETFpzTEJrSzNMZXlUczZEYkRpMjQwRmFYSHc0WUhtRzBkbHkwUVNW?=
 =?utf-8?B?WXdYOEdRc0MzTXhnWi9EdzRjTGFHL0ppU0dJbGZUYmhuMW5sVHpKajZndXZu?=
 =?utf-8?B?R2xNNHVndWh0ZmtGU0FCNGpTbnNNQXdVNGt5YThseXBwcGl6cDd1SGpVT2Mv?=
 =?utf-8?B?Z1AwMXZ0MldGZ2VXbGMxVUlheGNTWCtaQ1RHTGZGU3Jva3JmRlh2UW1zT2hT?=
 =?utf-8?B?U1RrVnl1VGl6ZEY3S0ZJNnNKazdqeFhGUm5CNHUrZG5xaXRuN2NTKzREU2tp?=
 =?utf-8?B?U29yY0VUdURpVVIwM1BBTjA3WlQxRW5SSldvdXdaSUNyYSswL0dwOVdHTS82?=
 =?utf-8?B?THNGenFOY05wR1NhaDFXVlhSa3E1d2pSdEQ5N1BZYmRBY1RVMmk2aGh4WXFp?=
 =?utf-8?B?MG9ia2JkRUZuYVBaMTgrRG55eDRGQllyRUtXTFFyYm9YeUlRUG5Ib1JacHRs?=
 =?utf-8?B?YWRINjRvcXFSVU14K285RjRBVUJ0YzE4RHp5N2JCMUdPNExRQ29INytIZUhU?=
 =?utf-8?B?L0UvcGVSeW52RXhxeHNVbVhrd3lsZzhSdGU4VWhFNld3Uys0SXJOV2xMMXV4?=
 =?utf-8?B?TDJGOWVhMzVjSXA5bGpHWDRmbUkvY3RmZHhKNkd4cXF4M0FwekJ5WjBRYzlD?=
 =?utf-8?B?WFByV1FlUGowTDJBQXdIdUdpNWdwZTFSRElkczJhQkdBUndHbDN2QjNLWEgr?=
 =?utf-8?B?OHNDRWdrVUIrWnRMdG5waEwvWnNLZ2MySkdUSlNzQ201MGxLMmdnSVNydEJY?=
 =?utf-8?B?N1JjZWRIeDFpdk1SdlpLc1V6Q1Y4VHFQSGpCMjYzZ292cTk3ZE5zQWVldU90?=
 =?utf-8?B?Y1lmZ2lINXk1SWZDMWR3emlKQkcyZUl0cHdHUEJySVlKcC9Id2xqTXdnb2lw?=
 =?utf-8?B?d0hDRXIyY2lYa2xXMFpYZzFxYmpyZjRxVWJxWkJPbW5vT3BpNFRzMm1EZFVN?=
 =?utf-8?B?M2hvM3MrUHk4ZzA4Nk1peFM3U2t0RlluNFIyVjZ6ZzFSTS9tNU1wdm01OUJ0?=
 =?utf-8?B?ckJDVkp4cS9PM0JoT2xhN2dIQTlTV3VmTGI5dEN2d3BWZ0ZySWxaTlVQOFZu?=
 =?utf-8?B?bGRJNjE4L0E4em9TNjNGZER0S3lrUElKeE93TVI4bko1OEJ5ZTRtaDY2TFEy?=
 =?utf-8?B?MzQ5TjB2L0h0ZElKZjVnN3RyUGJxSVUvTnJ3WnFtR1ZBbHcxaThXT3FuT2JY?=
 =?utf-8?B?WmNCaWtsYTkyMCtDQmp6Q0w2RU5SRnV0L2ROSEN5U1N5WG8ySE1HZ2tDZXpS?=
 =?utf-8?B?UWYvRUZZZVo0ZkxnN1h0bytheEx3U21sTlhrME5KMHZFcWh4RnVwU0VmMWc2?=
 =?utf-8?B?SW1jRGZ6NFA3aXdDL0ZWQkpaQnhqNVZURVU5L1QvRGt5QXQwNkpjV0cwUTBC?=
 =?utf-8?B?NzJlbEVrVTFLQTh0VTlPS3NZbEhVcE03eW04VTNyVC9helQ1OWlHSG5SS2Fp?=
 =?utf-8?B?VGhvVzVLakUrT2Zma3M4Y1RQWG1HNU4zTG03MWV2bVZOdWwvRVM3WjJVNEdr?=
 =?utf-8?B?VEJjeDJUUW50RFV0NnoxbXJZWndlTUdUajVCODlnQ3JpTERoNHZ3VG92VDNr?=
 =?utf-8?B?NEhWaVl4UFNFallOblhYUnN6VkhnRnNCV1E1QkRIVUE3d0dKcHczVVNJcm5O?=
 =?utf-8?B?M2R5dU9obkpHMG1LajV6eUdsdXJpcEVSS2tldzRQeE1YRVBZN3F3YUVxWHhi?=
 =?utf-8?Q?7+3fHvierKUpp2IeIGH97nW0NBYO8kQI94r44=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0MwRTdTaXFLRk10WWg0UDRKZm5LNDJCa1o2TTFqWVhGMXdwcTNXNGkyVVpw?=
 =?utf-8?B?OVVpL1RlSWtEcUtwd29kNElRbkFVNTd3ajZtSFpVR0ZKN3E1MDRneVYwaFJn?=
 =?utf-8?B?MDdINEZzTzRvY1lnQ01sUW5BOHpVamQrRFg2a1BselVpS0hqNWkzZXF3NERJ?=
 =?utf-8?B?bXk4LzdvMENKU0tUcWNLVkJMMmwvQzBxWEhkY1FIcnFkSEFjdU0rdit4TWpU?=
 =?utf-8?B?a0FEWExyVWhvZTZXWjI4eDh4blZRTEpzRzY4UVUxS3J1Zi85MVlZRHZxQlhW?=
 =?utf-8?B?eFR6amxlOW9sQUJLUmF6RFNUNjF5RUQrN1dsY1QwYVFrQ1JueHpLY0w4S3pN?=
 =?utf-8?B?eFEwV1pxbHpCczBnc0pYWkJ4SUdQV0JFUXJ3cEJPYUpvdjZEdVRQVmU1YzZn?=
 =?utf-8?B?akxETC9EUm10aWJXWlEra0NKdmd4b016ZCt3QlowNE55SnVKUTlaZWR3cksr?=
 =?utf-8?B?YldGMmJsOCsxMG91T0dnbTc4YkttUG11ejZqMTZNdFU1dGNKYU5uNFVXMm1y?=
 =?utf-8?B?UGpWSDE2ZW9VQWdJM0swN3oxdlIvN2JNNnJYVTB5L2RUc1VMRCtWSEFZVnlR?=
 =?utf-8?B?L0RWcXZPK2pNTzVJN0k1RitXZDZDMWhtaDF1ZExiclRaNmVDYUlNVHFFZVQx?=
 =?utf-8?B?empPUXlCNXhCaVd2dzNXS25aVC83OTNUOXlmcWMyY05EbkpsbzRPUlo1c2tu?=
 =?utf-8?B?LzliY054YzlwWXB2YzEzZG9mZEpIeUVaeEkrZ3NjZ1NsQllQNTVVbVBtYzF3?=
 =?utf-8?B?SkZjV3hxbUJsRVNXK2JPbllCT1V6OFdCV0ZJd2QzM1AwN1Q1MmVtYU5hVTNi?=
 =?utf-8?B?SC9IV2c5ajFtdGlURlVqQXhQU053YkdGWFZRRE1DL1ZrZ3pVSldkM1NOS3dh?=
 =?utf-8?B?MmJtMk15S2JmRFBaSFdkWis2YmViRktPbVhldUNLMGxrKzU2NjE4VVFTQ2RT?=
 =?utf-8?B?d1k0WTkzMS9IWWJ2UEorRG5lTi9UY1FtMTQyRUx2RUxqbnk0Z0djNFlGZzlp?=
 =?utf-8?B?SkxTSHlWandYU2U3YS96UUVNeHNEVE1nSEJDd0Zhb3dmU2lQSSt3YmxNejZo?=
 =?utf-8?B?eHB3SlZ6UXBKUmRKbGpDam5iTXdGSjNtQnFMRUFvaHZ6ZnNVYlYwc0crU3lY?=
 =?utf-8?B?bW4wY2t0VndKWG9OVklVNkN2aHlKckJ3R25lSjc1bnRsdVY4VTJranJrTHpq?=
 =?utf-8?B?NnpPQzhHMDZKL2FVM09rSlpJbUpKTWsyaTlFdm1VM3BZNEhaejdrNCtDY040?=
 =?utf-8?B?TXVaeEltbVNTYTJieWtyOUdPbWtqVENRK2VRbC9wN3hwaVl6L0FrcTBJZTNQ?=
 =?utf-8?B?NmFacGMvVGxSUU1qazJ0bzcxbS9SR2tvMStkbE9LSnE1a1FKekVSN3I0ZEdY?=
 =?utf-8?B?aXhlZjhHY2g1YUZ4OW93b1I4U3djQlREVSs5MmJsVEplVmRCblFSazI0bExH?=
 =?utf-8?B?UC9yR1Q0R0JvaDBrMy9qVnFsYzczbHJEMEFKL2Q5c0wzS1grbVBDSUNaaC81?=
 =?utf-8?B?NEViQUIyUkhrRGI5cm5sUEVUbU91NTh1VmNjV1UxY2NCTHFXMk82ODJZUTQx?=
 =?utf-8?B?Um5IK1JyNDRwUEN5bjdYTHhLT21OVk5ZM1Zid3dCRTk4VUxtTC9TbU5oSVVj?=
 =?utf-8?B?c09tU3R5aE1CTFlCWkFNS0d0ZzlWcTBXR0l1Qmx6U3AvZFpyZVR0RTl4QUg1?=
 =?utf-8?B?bCsyR1Qvd1lKcmphOWZkZEo2dDVsUFl5a0wwZFE0ejJySzdQZkl0Tk83ZGNm?=
 =?utf-8?B?RFhyZ0MvVFBnaVhCL0hSSDEzcG9xc3g2WVBxM09kb1BkZE5tTjFQWGx5TTVL?=
 =?utf-8?B?YmtQa2twUVZ5aGZyM3FISzA2NnMxVlM1d2I5bnJIOHhQcklOdHlweG1CYlNK?=
 =?utf-8?B?STk1dmZvUkprcC9zNHdjOE1FbmlDWmxnbTQrYlZvNWx0YkxhN3NPOFJmM2ZX?=
 =?utf-8?B?MDNwYUtKVWpudkxFeFh2MFlkUVdpZUh3aUJnSFJBby9TZmF0SjVjUStyL1Vs?=
 =?utf-8?B?b0hJMDV2akt0b0RzOG5nUzNTb0o3YjFMZHNrRW8wdDNCdjVUVjNDWXd0QUtM?=
 =?utf-8?B?TkdybzdkVW9JVmdwY0RxUG40VzNtYzZ4NVpqay9BYXBwWWVFNTlCd1hha2lp?=
 =?utf-8?B?c1Bvc2xoTEpmRGJUU3R1MkhadGg1NkZyNUJjaGhGVjBFOS9vWXNXRHNiWGJ5?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b63507-4f6f-4dc0-0e07-08dd9136bf95
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 09:24:08.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0rvj6zm4zi2dLbPcByzN6FWspqsbF/lqywBXvzeAU7Wt8dYsj6Gpv+fhBAiWCsquKDOWju52z1BlmhwINgQw23FiwQ08eWswmb/ML6qfVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10716

Hi Andre,

On 5/11/25 3:10 AM, Andre Przywara wrote:
> Add an Operating Performance Points table for the CPU cores to
> enable Dynamic Voltage & Frequency Scaling on the A100.
> 
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> [masterr3c0rd@epochal.quest: fix typos in -cpu-opp, use compatible]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> Link: https://patch.msgid.link/20241031070232.1793078-14-masterr3c0rd@epochal.quest
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> 
> [ upstream commit: a8181e6861fec3068f393d77ff81b2aaf4ea4203 ]

Did you use tools/update-subtree.sh to cherry-pick those commits? The 
changelog seems odd to me compared to what we usually get when using 
that tool. Modifications of dts/upstream should only be done via this tool.

Same remark for the other DTS changes in this series.

Cheers,
Quentin
