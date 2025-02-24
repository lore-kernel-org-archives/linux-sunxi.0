Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2074.outbound.protection.outlook.com [40.92.19.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543462253EE
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740421070; cv=fail; b=rKy56jjcszNmQUmUHmw/CiYuWdf3Iu/P4pK0EFSRUqRJcya0zDfuU4q6GwTTXhKcaNRkKrpR3nVTCjSRkrP/j0QnvQhcMX7nP7hUnzp2oni8c3cT1/Fj1sKPhBcJE4BZ0o30PF6nGzU4lu6OkXkasZia/iQcfeOUdSfPjIsVS+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740421070; c=relaxed/simple;
	bh=gVF9YtpGgrWOB8OpzwZklcoEOZTOj1xZTtf8hw6+3AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iv1zXVT3kWES9dn+6tHcGFY4IR8XJEq97vODu8kRkYjzZfGXImqsXnf+xPkhbogtmK7jC+F8zNDlfV+ucOn7gQQCpCK+ZJ3XJzm7u62KLKpEeLj3GyCy3HVjvFBWOgHqZT8poIGpHRYHICfPv3Ial26cZi+Il+WqNopA7j4XBfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=o9UxoR3L; arc=fail smtp.client-ip=40.92.19.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="o9UxoR3L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgNgK7kauCxvMrh1iOjlnZAkGKmESchruQJMu9JVp3z0OwSmXlW0VKYeEwNOx9+0s0+qQ8aRcs+KEqUbe/+t3HyequQTpo0oNOEkztitgcgW9M7h7M0EkyM05t1AqjMpuw6ru3k+FfbgGF0rFC2fp8pfUMo/YWiblm4ZK7f6ixwsFfGoL/mELNiPOioun+Ltu97r1oBISnnAoztWjLtMGMJaD3XGr74tDi/c10FgKorykDRMKNgvi27qLAZ9R8kQ5x7nzcrM/N1tvqH7c23hRWVtxw6XSUiHI4O8V46U1TyRbzdX3JPT+uHYjefbUKIn9dmm08dHU/e4i7XU1iRtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpaK5S1w7F7GVxXvtF0J36zKEC5YGDdFancCaemPeMA=;
 b=XcbgDkYi6CCi4Np8KaOHUXoSt2BR9yzkOR4Rn6qvTUUeqNrW4YDfqhy46HN7x6m2tkFw8DfrHA1Sg6zuo3jbucDgsAvmDtVn0TIm4ogE1k5Yzzw+Af4Eg77ymgCjh7drIbwCVSinDt5ZsHYBLj0+loCRFFdrXjVBC42gQ7ScIGLe4lB7G2JJC9brLmyi0w036Q34+9NnaRxS/za2VWPfLG6dyWQc24hmS8EK7zPevtAzzk0+7+l55w2W49pDjW45rSQvIg9oVuUMOiAr/IxRmS1YBxAXKLRRCNVT248swxQnN9pU3EUcRShvZg53ORV5lOsB4bwDVcK3zOWCZGuxnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpaK5S1w7F7GVxXvtF0J36zKEC5YGDdFancCaemPeMA=;
 b=o9UxoR3L3PAMClESoxdGKfgav3XKo7Rcj7A21aTeH9r8Ll3PQQSTgl3SdEpN0coHCFgX2OHafmz/vnVzGcH157RW4cImZcXgRCNuEq4NQU0aLJMAtWPsILfXMtpIjHWFrDbJU/fQrqhTa6FqcAjFCrGbp3PCQs0Qf24IdQDo+ygaiaUWmYjU0Tp6iqq/RyJaBb9ToXP+61zu6cOZn240WsaRhuaSUalr2/Oa11+fcPvbpc6PnGEoNam8eOLC8vai6DQXtAMVgWxbsNezpVpJ1xf7sNwK2fVKhB66joFSJw/wrTAyDSUWdbtBb3L1ARsPho+2GvhPaH9LutV1SECBMw==
Received: from DM6PR19MB3722.namprd19.prod.outlook.com (2603:10b6:5:205::25)
 by PH7PR19MB7145.namprd19.prod.outlook.com (2603:10b6:510:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 18:17:45 +0000
Received: from DM6PR19MB3722.namprd19.prod.outlook.com
 ([fe80::bcae:8341:5687:fb8c]) by DM6PR19MB3722.namprd19.prod.outlook.com
 ([fe80::bcae:8341:5687:fb8c%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:17:45 +0000
Date: Mon, 24 Feb 2025 12:17:42 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	devicetree@vger.kernel.org, samuel@sholland.org, wens@csie.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h700: Add MMC2 for Anbernic
 RG35XX
Message-ID:
 <DM6PR19MB3722684AEFDAC7C57927F58EA5C02@DM6PR19MB3722.namprd19.prod.outlook.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
 <20241018160617.157083-2-macroalpha82@gmail.com>
 <1884930.atdPhlSkOF@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1884930.atdPhlSkOF@jernej-laptop>
X-ClientProxiedBy: SA0PR11CA0206.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::31) To DM6PR19MB3722.namprd19.prod.outlook.com
 (2603:10b6:5:205::25)
X-Microsoft-Original-Message-ID: <Z7y3xgMPm33jLqDp@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR19MB3722:EE_|PH7PR19MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fa6cd9-4820-41f9-effc-08dd54ff88e3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|5072599009|15080799006|19110799003|7092599003|461199028|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEl2aXl4c2ZFdkF1MFo1Z0p4L252M1ZpNkE5UjJDVjNrVG1YWFF0RDgyTHRj?=
 =?utf-8?B?c1hCZmJveTNUNXNxNktpRkdWVG9pblU1ampPeGFwYnJrNGVrU3RtdHBvazdi?=
 =?utf-8?B?U09jYXVjVE9oSUl6ckFuR2V4bUMvZnRMRTh3azhya1FHUzFyNFA3MmYzcFVn?=
 =?utf-8?B?dlJUWXpCSlk5Y0FkRThBMlRFdHZxSUNOUW4vWVpHdE5RRmdTVFFHQ0o5RlZn?=
 =?utf-8?B?dXpVeFoyQmdvZjlGSDc2ZGk3clYwQWVURWYzWDJha2ZQMjhlNGh2TXErQ1hX?=
 =?utf-8?B?Ny9DRUpmQi9mTmN0VzVSUlNoRndybGFhelBRdHhzc3N0MjVFZ0kwY3Z1NGtI?=
 =?utf-8?B?U21xWXN3SHE1RE84bEVVc05zcm9RQk5QRmZRVndJQUROTlZPdWdKRmY4MW04?=
 =?utf-8?B?dzVJY1doNC9HOFZTUWwrWFR4YlBBb3hMTWhjMldvNzhDbE9EOC9rZTV2VnM3?=
 =?utf-8?B?YmZTQWEzdlhhbmRIenE2UHRqRmhRRFR3eW52SXMwVW1TbkIzZ0FnQU5XOUdS?=
 =?utf-8?B?UFJTZ05xRTNqZXc3MDZFOUErRU5VcWJpRE1pM1lFODRXYysrcXVMeCtQL3VK?=
 =?utf-8?B?MkNDWlJkUmI1a1h4WlRWSHFPQTRldlVZTmdFakg5MzhnZUdxN3hwUkUrZzcr?=
 =?utf-8?B?eWJmaG9Uc2h1dzAwOHU1cXBHSERldjhCeEdBcEw0dUtrcEtFSDg0SnZaV0VC?=
 =?utf-8?B?ZlZxMjNMT3lXSEJqY3kxOG5icFFCSml5dThVaHBEQjU5d3lrdnlXQ0FYQzlZ?=
 =?utf-8?B?a2tvdTRXUUExbUsrRDRNRjJXUGUrTDloNjc4Skc4V0dLa3M1SjF6Skhhd0V2?=
 =?utf-8?B?dUpNYlNnb2J0d3MwdVl1Nnk1K2REOUVkcWpQTitGM2FwNU9XSlVnZFRnamcw?=
 =?utf-8?B?dmYwUi9pRkQ5c0pjcVZPdG9CNktjd2tjVkJjRmFRSzVid05HV05URm1wL05N?=
 =?utf-8?B?VGhrRTBxM0NtRWlHLzFzd0s4MysxS1hld2NkRzhtTjZIYmcrem5IeGdVYk5k?=
 =?utf-8?B?L1ozbXdmUmZDVkVXMWw0bjM4QTI0ZFo4M2g5Q2ozVkFwdDdob2lqSVVHTmJ0?=
 =?utf-8?B?cWdxSDE0OUJPZE1sTXRRSTg4YnlWWnFjUDJyZEExUXlPUjRIV2loTzFIVTgr?=
 =?utf-8?B?YnEvZXNTN21IZ1lsZ0UzUW5wSHlsN2dYUmY2SFR4Q013Z0lyQmwzSVlUbU84?=
 =?utf-8?B?UFM0MEpDbTROMFJDTHhXak02bkkyMDJCKzFrNU4rVVAzYzdWVVJxMmdsMG1n?=
 =?utf-8?B?eDNkbDBnWE9yMkczb0pOb2poS1BCKzF0cWo5MEtQNlRSUWU5Mm14aWxDZUcr?=
 =?utf-8?B?N2VyRkFldW43bDA2YlNkdTQ1Y3B3amdyM1pzckNMZnFEd0tRbFR5MnhidHQ3?=
 =?utf-8?B?MUYyRWd4TFFaSTRBckVJeWhodXpRT1lzN1dVb3czYlFzRGlMb2hhY0VFU3lD?=
 =?utf-8?B?UzlIS3Z4amRvVS9aU0JWcDA0NEZBTytSU0JaY0JhVFdmVjFDdVVaQThEblE2?=
 =?utf-8?Q?OFi5/M=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDcrMFlBWkVkeTZQa0dTN0xzSGxZZzZyMjQ2WGdzdjQvT1N6VEp1WmJHUHpy?=
 =?utf-8?B?ajJ0cWxLa0dGMkIycDNWb2Z0Tis4WnM1NFN6WmpYSlUzRHdteXZaY1ZhWW9Q?=
 =?utf-8?B?MkIwRk8rc0NaR0phb0svN3ZweDI3L1dCSUZ5ZHpmVXhxQTd1SFZSbUJuaE9p?=
 =?utf-8?B?bWJCOXk2OUdvNU5MMExDNzAwNUlKRnNDMmFuSWpwZUcycDZYWFFYRWtrUFph?=
 =?utf-8?B?SUtxKzFoaHZNVDVVUStXV0l1M3BjOUY2a1VycVdwRitFZEF1ZXZmbXp1SGM5?=
 =?utf-8?B?Y1piRzVYMHc3VHZyenFnMFJEejF6bDN4a1pIQmhocDJXSjBZa0hvR3VPR3VN?=
 =?utf-8?B?Q2pKYzhZYzNqdDZ1NUZXbmt3am1adjRpaW1jNlpTaTBxbEM2eUxXeGFlUU5D?=
 =?utf-8?B?VnBGZ016VUh0MHJrN0lQeEJOSVVxcExuVlhOTUZmN1dCK3V6RHhhdXFyeUZq?=
 =?utf-8?B?S2RmcmZxeW5xb2RoTVhFME9Jam53OVNtMXNSK0xsQ3B2MUREaC9ab3FrMVZo?=
 =?utf-8?B?TDg2djlMUWV1blJoMDB6c0dtUmJOODZWNzNRbkZjN0pVSWtQdTBUQ00zUVVq?=
 =?utf-8?B?akFBcGxlTzdWSnZ1cjVvYUxvS3RkQ2JHUk9CeEJsVHJ6Y2UzU21Kb29nT25Y?=
 =?utf-8?B?Qk9rZ1g4OCt0c2V0bEwrYmlGMlpDaEdXVHdQUTFZa0ZtUkVsVGRldTJvdlFk?=
 =?utf-8?B?dWpYU29YZ3ExbzJqcXFXcHUyZzcyRDV3STgzMXhOUlhmcHFyNnFJNXQ4d3Fn?=
 =?utf-8?B?S2xlSEdjOVlpckN6VFFIaUhmVkdMRUVMOC9mSk42UjZRMGZMai8zWHZjU0Jq?=
 =?utf-8?B?ZGUyb3piSU9NamxKSlE1bUhLMW9hYkxRMGI5YVA1c2RKb2o3RjNJOStJSUd3?=
 =?utf-8?B?MGsvRWc0YnhCMEl6eGtITk9sc3pGYlovbXQ5M3M5RXd6RCtzNUVCdEE0anBa?=
 =?utf-8?B?L0dLY1Q5eStqZXNaNFc4WWdMMEdGTStkMGs3QVZoS1BwTWxScDhUVlA4a294?=
 =?utf-8?B?bWs4aE02L0U3SEY5czFURWQrQXZabWd0eENmQTlUVnpzOTVPMlNmdTM0Z0dS?=
 =?utf-8?B?Sjk5bHpWTnA1bVdFeFBwcjF5TU1OQnR2VWlNeUVTWG1HUkp0ekZIQmJMNDZV?=
 =?utf-8?B?VzEzVWhEUnRVN3d1SmgwaVpibWtseUNwU1pGTlJSQVZMbEJLYTlEMGM5NEpq?=
 =?utf-8?B?ZUp4YWtadXlrWkNsUHBCNUZzb2VPZHU1dzNRR053OXlOTVp6U25kcy9NVjR2?=
 =?utf-8?B?b3JjeTcvYTVOdkpkeVVXMkZ5L05rVWJrb0x1dEp0TDVhMFJBY29UanRCdXB2?=
 =?utf-8?B?UmhwMkRaelQ1Vy9TcGtwOFJyWGZCOXVTV0MwcGlidE5wSFk0UEsvNjlGVDB1?=
 =?utf-8?B?dStsL1pvdkFKNVFsY3cvREp6Q0cxSWtmYVRjZUg2bE1jNngyYms1VUFGVXFV?=
 =?utf-8?B?SUtaZE1oTTFrZk5NU3JPbDJBNzdCWURudTlMQzQ4WnFqM1pTZ1M1K29iSHlB?=
 =?utf-8?B?enBKd1BLelZ6S0RGR21FaWg3bFlwRUloS2xiaE4zRXo2S0JxK2JSTi9HL29R?=
 =?utf-8?B?YmRhcWNBQkg0aXV5MUFRazl2SmgzeGY4bzZsWEdiM0F2VHJUQVN6U3lsa0lm?=
 =?utf-8?B?ZlltaG1UTXRtd1Q2cVYwemNvWTNXWUJnQVRMUWJyYW5WNmdxRXNua21wcmdi?=
 =?utf-8?B?eWd0aVVRaFdBdkhFZDh6ZFphR3BRSndGVWxJMXBIZUZBQWh6Zi9DYUprdkEw?=
 =?utf-8?Q?gGy1SPc/mb9kVHN0rpmeLbl7hQNgsPQCS0qBTdL?=
X-OriginatorOrg: sct-15-20-7741-18-msonline-outlook-c907d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fa6cd9-4820-41f9-effc-08dd54ff88e3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3722.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:17:45.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7145

On Sat, Feb 22, 2025 at 11:44:39AM +0100, Jernej Škrabec wrote:
> Hi Chris,
> 
> sorry it took so long.
> 
> Dne petek, 18. oktober 2024 ob 18:06:14 Srednjeevropski standardni čas je Chris Morgan napisal(a):
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the second MMC slot on the Anbernic RG35XX series.
> > The second MMC card is connected to MMC2 (WiFi if present is MMC1).
> > The MMC logic is powered by cldo3 via the power domain to which
> > it is connected, and also has an external 3.3v GPIO controlled
> > regulator required for functionality.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 27 +++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > index 80ccab7b5ba7..e2039fd76b3d 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > @@ -18,6 +18,9 @@ / {
> >  	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> >  
> >  	aliases {
> > +		mmc0 = &mmc0;
> > +		mmc1 = &mmc2;
> > +		mmc2 = &mmc1;
> 
> Please drop those. As a rule, we don't have it in any DT, since there are more
> universal to identify root partition than a relying on device order.

Would it be okay at least to keep the mmc2 alias mapped to physical
device mmc1? Confusingly enough, this device is such that mmc0 is the
first mmc card, mmc1 is the SDIO wifi card (not always present depending
on device), and mmc2 is the second mmc card. That way the WiFi at least
when present is always predictably at the mmc2 alias. 

> 
> >  		serial0 = &uart0;
> >  	};
> >  
> > @@ -175,6 +178,15 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
> >  		regulator-min-microvolt = <5000000>;
> >  		regulator-max-microvolt = <5000000>;
> >  	};
> > +
> > +	reg_vcc3v3_mmc2: regulator-vcc3v3-mmc2 {
> > +		compatible = "regulator-fixed";
> > +		enable-active-high;
> > +		gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-name = "vcc3v3-mmc2";
> > +	};
> >  };
> >  
> >  &cpu0 {
> > @@ -186,10 +198,21 @@ &ehci0 {
> >  };
> >  
> >  &mmc0 {
> > -	vmmc-supply = <&reg_cldo3>;
> > -	disable-wp;
> > +	bus-width = <4>;
> >  	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +	disable-wp;
> > +	no-1-8-v;
> 
> Please leave properties in same order to minimize patch size. From
> what I can see, only above property is added, which is not needed anyway.
> 

Acknowledged. I just figured I'd alphabetize them, but you're right
it's a bit anal.

> > +	vmmc-supply = <&reg_cldo3>;
> > +	status = "okay";
> > +};
> > +
> > +&mmc2 {
> >  	bus-width = <4>;
> > +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> > +	disable-wp;
> > +	no-1-8-v;
> > +	vmmc-supply = <&reg_vcc3v3_mmc2>;
> > +	vqmmc-supply = <&reg_cldo3>;
> 
> Is this another SD card slot or eMMC? You configured it as it would be SD card,
> but mmc2 slots are usually used for eMMC, which needs different configuration.
> 

Physical bus mmc0 is the TF1 slot, physical bus mmc2 is the TF2 slot,
and physical bus mmc1 is the SDIO wifi card (which is present on most
but not all devices in the 35xx series).

> Best regards,
> Jernej
> 
> >  	status = "okay";
> >  };
> >  
> > 
> 
> 
> 
> 

Please let me know about setting alias mmc2, thank you.
Chris
