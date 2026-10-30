Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793376524;
	b=weNZwZ50O0cHRdlZd6tkUF9QXaN12t9ThPCJRRlnR7mgJo7xs5IfIwA4ieMSDClMqV/V
	 Ty9zohGIqZwqgiYpZX+0t6pyZ78PI97o17tNHJai71MYXHYwPdFBxVttT/SeSv/B3yZGQ
	 RMuMmizCDgIqNIilcn+75TiJl8m0//lQnX+us+Xe49upvZTKdjhv/gEMYEPbtnrZ1N3S0
	 UDaFgNtCy877BhafbZxKpDlKI47cUSIUqPctvblZUgOliK7gMq5xPkO+oI/JiXIW0VPMM
	 jFJen56M6Xnr2kcopKAvb1MmXcPwdMISv+AtUp57hKm+DR6147mtFEcMCD42a0y5hCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376524;
	h=DMARC-Filter:Received:Received:Message-ID:Date:User-Agent:Cc:Subject:
	 To:References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fOv31sjVqpmYa53862069hZvoKW6lq32LoPJHxT+VoY=;
	b=zAgHTGlZrJj/jqo2t3EORd6sbAUr5tn3bzG1pKbJpClqOvMWFG/OZKKRAwVADt5lMM6i
	 7pFGC0/pebeZfSie1QOkoxj4jnIbxfLqOL3mhS0j6Tg+Hmg9yR1FGXykAb1XPEHLU+bvS
	 /DlZ/ij3IL5gZnAkJfSmMkNZmUNSloV7cgCV/NtBU9jtSUAbNy8rVN6Hp4NdhCxogulKh
	 etmw7oGbZO0A/JPsRgif475li19h62qSJWqMbUyTHyBByk3rE0yMiufJoTWOn010I+I6E
	 a1MWR2c0gIRFuy9SnBkrb12hCda6QlW8SK8u9D1s0tChS1sNgJglN51wUqaLrJeUqYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=linumiz.com;
	spf=pass smtp.mailfrom=linumiz.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.78
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023078.outbound.protection.outlook.com [52.101.127.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCECD606A325
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 16:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCECD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7zYsbe5n+XPqhHzHFhku8drvc13C+7TQUGDDK7n8Qn7NDFZhzjZr/iNV8MksEFIDezvsFemTfjxZtHndOv+wZM34PAIDx1sC/zgQaCg82ZQhXZIFXopUnq/hNhH4DCfQ+ET9qXuvttz+rlaPV9heTHhVF8Gh5e+sTVjO4xA2CczXc/RXg8rEz4ARPlwfZCst5iehDVV315djFTfMWSb6BCLd7Z3D7PkbepfBbtr8X4jvQKRIcIxFNsEoUornfF+24hVzc3ggxl1hDWmqSUhmJuZLVA1yLBFKjCVALc7A6BGUUoOJ0RSQ6T0JJEsTSchAhZvSWkkIxoUPj71fPnPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOv31sjVqpmYa53862069hZvoKW6lq32LoPJHxT+VoY=;
 b=wrHDDwoNICF/vSyXc05WPuhvDs1jtUPdgjqUsryUFbCaapfZ5cobXY2WaJylJmPOaqMXp/Y8dd/jN8p+J5Ku872lKPVuDpohRJxMFq88aVbwADkijJPCFML4C/YDsI//aBXJuefl0+YKd8yN/ya+FgLY0GYGrQBxFV4qDtBnBGBZt3XxV6gSiMJ9HCEMmMVZuC3DBwAIP5bzqI22cn9AG9ukY5etnpthgPS5eek9l6APSB9gwgk171H5RweuQDlfJ8384JNw3tnHifXtrdNZLV2Wn6stbrRGOOeAoDBhKhb/rR9QakCKIqdhnuD+Pn4g7Uf4qUMc9HG7X9q1BZfEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by TYZPR06MB6894.apcprd06.prod.outlook.com (2603:1096:405:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.4; Fri, 30 Oct
 2026 16:08:35 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%4]) with mapi id 15.21.0592.003; Fri, 30 Oct 2026
 16:08:35 +0000
Message-ID: <8033d7f4-86df-411a-be71-9be936675f69@linumiz.com>
Date: Fri, 30 Oct 2026 17:08:32 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>,
 Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH] sunxi: a133: adjust TF-A load address
To: Andre Przywara <andre.przywara@arm.com>, u-boot@lists.u-boot-project.org
References: <20261029233720.8411-1-andre.przywara@arm.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20261029233720.8411-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|TYZPR06MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c142c7d-f454-4d9d-3863-08df36a00ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261009223027099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EYYOOQeSoeKdTmO73eMLvHD82X0/d25ssbTBaa0ali866ovbfYsDeGBY/COecmX14BADvF1iJW6qZQcNB1zgRM4x40rFI5AOgl3oDbyPwK3zwaWCdQKmnR8T1sZePfIG2WANfIy5lfYGW/WDDBzKYzOhY6DpkFcbQePRm3OZJ+hhkiYgbll+TtyLp0Y19GwuhcgjdbURdyAwimb17nlnwG3kCXFoxqT6HXl8k17uzh+MHGqk09ddLJaGa7UkPARjTDFj4ZcEkIXWQMXToiBtfmukrtrh07Rm8bT8lAGD5o1RUozM4HVXc1KZPuHytLGVCxeylKVK5jjdYQeN3UXVcNSHisoRMOlkGPoJi7UmNal3bx5AvmxwRYgHPNdJvS8wXbeFPYo2Rx8GkqIc/KJ2CpLvUusW22qc+muVnEBi0QPhx6O7kIgmBCm7c9hupC4eCu1L0+nmN8IahfpgcfqiITcgOn+q0m3jQim0ZsbbhsnSpEUouvRlhUl1W0pLWk7RM5RPlQ3qfwFYJrh6002DysEEtqsNfznbyWk82/qr4Prhu6h/2of2rkcLQsBhpwB2acGRO6Fvlwi1yuQqivcTG3YrVqcT7e4wAejyINwqlhd1kd2ShKXR0dAO+fohN2hgi7x90MTiz7PVmqUCKFS30SlJvTYa5BMBXRgY07rgD8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnRNVXBjOHUyTFRGUUowQkUwQWZTdkw2dUNDR2NhYVRFT29vMVZRQmgzRVJu?=
 =?utf-8?B?L0lnSGhEN3VIbm1NYksyUnFKUnBGMCs1VDluSzAyVU85N1lCdXNlRHhyMHg5?=
 =?utf-8?B?YTNvQ3VwU0hNeXdyMzFsK3RNdmY5WEs2SVpoc3I5STF2QVZiWEorMGdjZFpD?=
 =?utf-8?B?TEtYM2FoUUVHZDBVTnpHQjNiMzlIYjRvOHRBL2l3RkwwUUg4MVh4M1RkaytG?=
 =?utf-8?B?VkhIS0FGNnUwVjFtUU1qVk84eUkvTGRlR0djNjh4Yy8xczVGMEFLT0xqdllK?=
 =?utf-8?B?ajcxV2Z3Smk3SHMveVRVODVXZzVNdS9aOWlScWJoTytQaHRnT2swczhsM0p1?=
 =?utf-8?B?TExGYVUwZ044SW5OUkFSN0Fhem1kY0h0WElsTWtSUjV6TkZackprSUNqRVJs?=
 =?utf-8?B?MkZtVk15WTVDZE9GMFN0K1UxTkNWTFJIMHdYeXV6bGdpeHFIOEg1c29Weld6?=
 =?utf-8?B?bEM4TlBPWmpnaWxWVlV5ZnBhdEdFSHBrMDh5c2puaEJvNVZ2Wkp0dGJ1aFg1?=
 =?utf-8?B?VysvWXJVU3hkMjBlSWdZYWcyT2JwRDB5S2h4TDBXeUVvMy9RbmxBS0YyMW1t?=
 =?utf-8?B?RHhJMFpzUFJZUENTc0JFQWltc3JGZjU0NUZGZllCelJDelJCVEE0aVdhTmZI?=
 =?utf-8?B?T25md1V0a3d2R0JyQStGZWtjeUJKTzZBVm96MnQwY3d0Zy9IdERXNWFOc1Fk?=
 =?utf-8?B?NW9wRUEyTFRDQ0NLODVEaFFwNkNFQ0F5NDNwSWtPUjZESXgzaWtyZlNaQzVT?=
 =?utf-8?B?N0JyRDRZdmgxRmIxYU03dzBpTFlKMmk3SzA2SENVM3RtWnFScmFPNFpxY3pL?=
 =?utf-8?B?MmtJai9zRUZDUTNOMUdwSkU4NnRaZytQYnR6b01OSFArK2lSUVNPSTNBcDFF?=
 =?utf-8?B?em1MeUhyL04zQVdhNEpENEdoaFUvQTd0UHVYakZMM1llOG5ycFdOSEpaUzFL?=
 =?utf-8?B?dnVUNmJ4dGdJSWhFUlNmZ2lKMWZmZWg5VzBnejJlUk40cWlMcllEcUdBWUsy?=
 =?utf-8?B?QWM5bzEreU13QkpHc28zcWh6ODVUenI1Sk1BMXNBUVhoMmVsL2ZxbjMrK1Jp?=
 =?utf-8?B?UjNOamlTa01JMUYxajRtcnY0UG0vSEY3NmM3aTZIMHJTSVZseGNIa1BWMWtt?=
 =?utf-8?B?Y05hTTg4L0JOcHIxWlhWMmhZQzBQRXplb2VNVk13bE5Db3pSYmt5Mkp2RDdn?=
 =?utf-8?B?WGlrNUJCYVRwb3FJSm1FbjZPSERVdWxIKzhtN21Mb0FFa1pZVzVNUTVrOGpn?=
 =?utf-8?B?Sk8vK3NBVkhnamxIQ0h4aEs1aTBRWGczb2ZNcmpDVHlTa3hBNzlWYWZ3NUpK?=
 =?utf-8?B?dmdKeXZ3RFRTZmdlZWdQYWRoUTY2SjlXTktWY3hqcXhFbU9NYnFlbHI1dEZZ?=
 =?utf-8?B?UjhLeUs0NTU1bkZmZ0tLVVZUa20zbFlORERnNGhpbkIweWF2M2g2eFlWL2xQ?=
 =?utf-8?B?WnNFbVF0c0E5amF5c0FoTTdxNXFLQkM0cXB3Z0p0cG9wZDlkbFVNOC9jRHZw?=
 =?utf-8?B?M0FFVDExUEo5bkhtS2NFYlgzK2s1ak1VQ0dKa2JBUU8vYm5xNFdweVFXdERH?=
 =?utf-8?B?OExRTng2VEl6dVZVaUREYjVkWnoxVFZDN0p6QmQ3MWVNK3gzT0piQTJ1U1Z4?=
 =?utf-8?B?SG1DS1FrUjFjYS9hcVdlWEdPNTljK09tNG1JMkozdGlIdXVkU1ppbDZrWExK?=
 =?utf-8?B?WE4xbnlBSDJ1a1Q5RWJpb3pMSzVFZy8xL2xMWlhVZlc2QWZOVTVIa3NpU1Fo?=
 =?utf-8?B?L1Y3Nm5yR3hwU2NvRFpXamx4OTVtSll2WXpzTDNzYWF4UjJkYnc0aGl4Yno2?=
 =?utf-8?B?YUYzS1VMQlJCbFNrRmpsUk0rNWozYnNkeFRZY3I5Vm1KUHZ6ekk1cmRUWWh2?=
 =?utf-8?B?Yi8xTzd3c3RiNlFhWXB2QVhWeFMxZWEwNlZnMnI0L3hDbkcwMkd0elpmcmJz?=
 =?utf-8?B?UjhLMk5RUGNiSndRbDB0ZXllRGtkUnNncXJoUHRMaTJTSnNXQTVNTXltTTFv?=
 =?utf-8?B?UCtqNGZvSUNSRFFlOGU1eUJQOGp6SnhUVUx5cHdPQ0xMN1dHWEdWS3p4Vldv?=
 =?utf-8?B?cnI0b1FHOHZvT1BhckFTOXZQQVpMQ3ZQeUtiMnJHTlp2dHM3dklha01IUC9y?=
 =?utf-8?B?dWFRZjVCU0U5ei9OTktvUmxMWXRGcWJlaGgyNHNMdVJiTU4rK0hqN0FKZElz?=
 =?utf-8?B?Z2VsNklIUjlMSXQxNGY0WTVqcVJTZTVGOUhNT2VRNDI5M25PY2o2OWVNV3I3?=
 =?utf-8?B?MHcxYWFYdkFRUUtBYVQwZCtmVkFyeWpXQS9DbWlBcnZvYVQ3aC9UeDBMSzVn?=
 =?utf-8?B?cTdobzRuY1dWUXY1NllwVU5KaHRHT3hEZHdxWVFnbzVoWEhLUklEUT09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c142c7d-f454-4d9d-3863-08df36a00ce1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:08:35.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0BeWD46GkcrNLWRcOlKogHilIT61GIzUldCh0vmm42hHFr44FOawiXYvbjopYRYtvHnhpGuXnCAtsCe9qNHRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6894

On 10/30/26 12:37 AM, Andre Przywara wrote:
> When development of the Allwinner A133 TF-A port started, BL31 was put
> in SRAM, like on the similar H6 SoC. Consequently we used the same SRAM
> address as the H6 in the Kconfig stanza of the A133 U-Boot port.
> 
> Later we realised that the SRAM space will become too tight, in fact it
> was already spilling over into SRAM C, which we cannot use any more at
> runtime, once the display engine is used. So the mainline TF-A port
> eventually put BL31 in DRAM, which of course requires a different load
> address.
> 
> Adjust the BL31 load address to use the same DRAM location as the (almost
> SRAM-less) H616, by just adjusting the match pattern, to not let the A133
> fall through to the SUN50I_GEN_H6 symbol.
> This allows U-Boot to use the now merged mainline TF-A port for the A133.
> 
> This is unfortunately a breaking change, but there is not much we can do
> about it, and since U-Boot packages TF-A in our booting scheme, we have
> that under control.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index b0c5d3cd903..b7ee14c6678 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -267,7 +267,7 @@ config SUNXI_RVBAR_ALTERNATIVE
>  config SUNXI_BL31_BASE
>  	hex
>  	default 0x00044000 if MACH_SUN50I || MACH_SUN50I_H5
> -	default 0x40000000 if MACH_SUN50I_H616
> +	default 0x40000000 if MACH_SUN50I_H616 || MACH_SUN50I_A133
Thanks for the changes.

Reviewed-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban

>  	default 0x00104000 if SUN50I_GEN_H6
>  	default 0x00054000 if MACH_SUN55I_A523
>  	default 0x0

