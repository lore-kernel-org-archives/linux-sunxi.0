Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2068.outbound.protection.outlook.com [40.92.45.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D61C2AF
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jul 2024 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.45.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720198099; cv=fail; b=WaKm9x9RgWQ569Fen7bqeLfA0rmtpgJVHeWn6cjj09GYLV87yN5lwaK1q72cRnGzhH9azD0UH8D+k3SVdA/jh+cGgh9b+dNltAGXCgdTmDJNtvsz8GemzMNPu/2iSSEJniEjSPNak1uRgovqzSPi5LOtW7Wfaau7/OLcokHotyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720198099; c=relaxed/simple;
	bh=TygWUajtGXaWzZilWhT2nLvUgNXRGPjJMI6Wfst0yLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XsxxCAN2LGjEO3Fvbsy9+411p7Z20b2UDpFQyQ//wlKHwg/398nBnnXayWymu3no5rJ+ZZET/v7h6KpavWAGHzHSNPBGDvalV/bCXpzUqVTlOMv6vh6F4qSaUlW8tN67FcTSv02++RMj1nI0cCrjvwNYWnzSVNyZJ3CVXh4qgl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=LXF4mp4j; arc=fail smtp.client-ip=40.92.45.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="LXF4mp4j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLyCr8gLf3xMAIwpMGu3K66njz1qkhFQ7iXLnUaN/uKywUcblpw1ZipCDAGqpVUmhqMLJv0fmmjUFxXUfu3VUpS7Mgm52FuuP2zlzYDpbLrQxGrkAlSJz7l75+9NxQfY7f4/ZlLMG9xlmqh7KN18Oq9L8gUXbF7krR9xnwy0blWswQfHNPn/AtrLkhVS1ieecqBe0kdcnCURrz1fdGtPrfGJCc3dXjwKb4w9OvSl7IXxsmvRTvx7L9IONvrNj5DkbENignywUa81NnQRLihP6ugbkZnmKA/nfH95HPM3/lM2O1ZeRqwqclMFzmnIGRwFyR80Gp/CCvrdEEf9VoNIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FljIydSTfcBqASK0qPFDJF+VYaO358D0jjWwuFonC6k=;
 b=FTc4b87lj/poWL3zl5setjCtp/7e3LfqGPa8FU3MDq8X85eY601BiizRdfKO0ld4trmw/C2KmjAU5P8JG+3t19Mf8J2CXc9bhGnkf+EwLYUNGqW6dOajRMiTSosXviGg9w7qIPzzTz1q0EymbjRD0wGQwph+EHEpnJ9VsgEwB/+YwNsIjyu24/9LvPyPmQ3F6hlok9DiXlh7PYKASkKG3PA2QLJCmIgAhu//SLoLiq6UgHYUVHAha0ZT5oOtZk1zL52baQIyL1eS81JdnwZ29mIOetY6XMV83cj22w8Wmkf0zxnF/MtGO1wRueXwKWwaXQQ7xKkTXr0D9nPCqTwvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FljIydSTfcBqASK0qPFDJF+VYaO358D0jjWwuFonC6k=;
 b=LXF4mp4j+ExS/kK1NcHeegi39b1cAF8+37OF+g51/+VAdpNBB6q/mxNIvoqmIQKBab6VnRTztBLzUmGiEIdOVMT9DkipT6Spd2ikAF6hpim/17pmJ+pr7JNLfvmqCMS6v5dw2mjqZWQsTwT7AuRMBAWfhh//VucdeBC4K0PhS9FLBEXdXFAnuvHYMst9nPtf6Y+vgXrPEuiqHmy1t6i4x4efzjxADKOgk+1AUlumOadJu/9UobJ1Tpfd3iGn+52Ty7Lp5KZYuGM5NXumvZEL8VnlzznHvD53M4fq5A/o6aIqdGHTcHpPp/IWj6VDD3e9+lMRNLAPL8SjkANqF1PZsA==
Received: from MN2PR16MB2941.namprd16.prod.outlook.com (2603:10b6:208:e1::15)
 by MW4PR16MB4768.namprd16.prod.outlook.com (2603:10b6:303:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Fri, 5 Jul
 2024 16:48:14 +0000
Received: from MN2PR16MB2941.namprd16.prod.outlook.com
 ([fe80::9d62:95ae:c373:c490]) by MN2PR16MB2941.namprd16.prod.outlook.com
 ([fe80::9d62:95ae:c373:c490%3]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 16:48:14 +0000
Date: Fri, 5 Jul 2024 11:48:10 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, ryan@testtoast.com,
	andre.przywara@arm.com, samuel@sholland.org,
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V2 1/4] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
Message-ID:
 <MN2PR16MB2941C4F2B035C2A0A2303C11A5DF2@MN2PR16MB2941.namprd16.prod.outlook.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
 <20240702193414.57461-2-macroalpha82@gmail.com>
 <29c95f4e-f075-405f-935f-6fd5c616595f@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29c95f4e-f075-405f-935f-6fd5c616595f@kernel.org>
X-TMN: [m4cP9O6x3LH0s801eZi92/CcEzEVTw2QkQ9a9lRAiG4=]
X-ClientProxiedBy: SA1PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::11) To MN2PR16MB2941.namprd16.prod.outlook.com
 (2603:10b6:208:e1::15)
X-Microsoft-Original-Message-ID: <ZogjyuV+LEWrq+yi@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR16MB2941:EE_|MW4PR16MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fd8d21-4e8f-4b02-075d-08dc9d1242a6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|461199028|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	TeesAyWPwYkRCSySmnpo5sKbXMD+u9X3RG8+cIfHY008jlNoqvGpCK9YTzgWoTv2b6x0BU1dhFfIXxotIKAT96UbSEysuwGUhmbVyy+OsFk62+XpsvBKXg/kQiIuIlPI2BJAXpeRtbJBa+1opLeLN1390Qv1OXwlGrQhSvxP8JN2lPtnst9rZk2ToTs7e7xZEUGL+cACbV4MZK8LQvr68EI/kwuElitbKtAMr1IGUsOrTh5rIDzv4xLREydwUbiy6RFOPhbaEsn/F+4wH5Jkjz5jXolTmKrT7tfFYtMu8mTKHKDEF0fgBgvtOtXe7FDtt6xYeHNF+mdsZa/OjbI3Lptcj6E2BU3XY+dPOADtkSKHjAvWJM3Lk6d0f3eTRnU/u++ZpFYybnjMWyC/LXaS1Z5KiJhJumXiCC9ZNFsq/KNKgV8Dc9G33l8MSSjiabzkiElb2XKHj1hlgFfXP1VLN5VvOrDZvUq190mJNQRp3skja2Z09TFDm7UMckt0si2Hpn8z3skrBEyjal3zzrflhmyC7VjzljqvNPx09iEjus9SK4iblB7x4KkLepeGkzCrtpqmBRunev1ezgafQ4igcrmcAg026sSySRZptyuJow8PZQ+Z4xsV+6QHfAn+x8ZNIuwWSFcMRLShFTVI4RGoHg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HHPitXcFOo22x+KeMYMAwIGQGkZ9/OSNednh7OkzGFjS2CuTiEDeFo3m1cPu?=
 =?us-ascii?Q?XDezD0jan/6rvyI70qHW13VvdS752imCDKtjJKu+J0EuqiFvW8YS+EBVBTQF?=
 =?us-ascii?Q?DFZfnW3MY97nC5xGMz9dJl2ifXdkztKTG6GNANd7ZDRgyEaAt5sG5s7qJT4v?=
 =?us-ascii?Q?Ehc1/R11zlBeEE/1Iep7fttFubcxepxcX/Mc63MFo6uPO+JizteDiVb8HUQj?=
 =?us-ascii?Q?j6x/hgqZdDaXnrCApJSmTTRaWTHf4ZpEuxmaM3NFFe2dP4dfyyjhwQ+OOm73?=
 =?us-ascii?Q?Sthxv/GtyDdue1LQreH7RfWrjFfUECxZjFia3bLtaGkV0tdjn78YMQI0/Mal?=
 =?us-ascii?Q?jBxme7oqgHB2sgbezGBWyRkL9kWdUk0x4yMoA1JT77+uisIEnw/ohv2tS7Nv?=
 =?us-ascii?Q?K0ZSTTAc40ZtewAWlI4tfj/Li4X6WDG1uf37j7r5ZTObmKuKpYM098PPHphR?=
 =?us-ascii?Q?is8hgBDwxrVe8kZhaYBqvk69um+nCrH8cKPgJ78SM49DvhW2sadRahIP+Qd4?=
 =?us-ascii?Q?pJLhWa3rJT7AUZ/OUzdbJLJBSRy3HcoWNQakR2bxdi4d1Av/CeKtqK1v4e43?=
 =?us-ascii?Q?gXOxMzfpd7W3njJS7F5lHC2/JLrwkwaSsfzbi82erm+mIy2cE2GaaDPgWlYM?=
 =?us-ascii?Q?joWZEIc5N5dUjilZwEOSA+BpzFDxFDo1ip4UgPuLWxhiEH5BRKjke6Rf5GYj?=
 =?us-ascii?Q?gG6QwN9J+H3HWuvX2WtcCw1N/G3+AKsgk2+vcGr7I2inxVIZaKdIPTvlrRR6?=
 =?us-ascii?Q?9WYpiUs/rEH+kdXXnhsDHGZ8d9xUxO9piYb0ftSIYXZt8buzfQlHnuckWknw?=
 =?us-ascii?Q?KXSfima9OSLmwbvAiZ1joUklZfZaT8bAvsyEaihRSUhkGfNm7Xqm6BFkZ6Cp?=
 =?us-ascii?Q?MhZDeu34EmYnf7b5Tjn1lsgsyI2KRmU0DY8fdR3TGGdZy4wIMQPJK5dV3vpJ?=
 =?us-ascii?Q?y+yUHhwLrs28/eWt0xcPnBTLM6X8hrM4bnH+bwx9uuiTP09XaOpU6SakICxn?=
 =?us-ascii?Q?ZJ3Er+FbtA2qePaPXumKX/xQHUKSZZLn0uI2t+Gkqy/n3l5BiwhcZDH98pOE?=
 =?us-ascii?Q?UTBMBzCiRmLbyYu6ewbK1FFlddGHN79WLY5Eqz7n+eEzd31rjuZ9Jl+sNs5v?=
 =?us-ascii?Q?KC6IHJBoQ/yhcXpQdPeo/h0kS5oVsECX9OOPMpwxcgi2AfA/rjV7YxZPu0dL?=
 =?us-ascii?Q?YpSfP4G9r4fqGrlchpfbyuCOZBfGSuLJfvIQyy9rxiPSeNMEcDGCbx7UPaRt?=
 =?us-ascii?Q?K1GTue0F69WY4HlHDyZFW8fLbkRS6SskbtKCScULVQ=3D=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-559fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fd8d21-4e8f-4b02-075d-08dc9d1242a6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR16MB2941.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 16:48:13.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR16MB4768

On Wed, Jul 03, 2024 at 07:11:10AM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2024 21:34, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add the Anbernic RG35XXSP variant device and consolidate the Anbernic
> > H700 devices.
> > 
> > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
> > clamshell form-factor with an external RTC and a lid switch.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > index c2a158b75e49..60b11b289535 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -61,14 +61,19 @@ properties:
> >            - const: anbernic,rg35xx-2024
> >            - const: allwinner,sun50i-h700
> >  
> > +      - description: Anbernic RG35XX H
> > +        items:
> > +          - const: anbernic,rg35xx-h
> > +          - const: allwinner,sun50i-h700
> > +
> >        - description: Anbernic RG35XX Plus
> >          items:
> >            - const: anbernic,rg35xx-plus
> >            - const: allwinner,sun50i-h700
> >  
> > -      - description: Anbernic RG35XX H
> > +      - description: Anbernic RG35XX SP
> >          items:
> > -          - const: anbernic,rg35xx-h
> > +          - const: anbernic,rg35xx-sp
> 
> Where is the consolidation? All this is supposed to be in an enum...
> 

I didn't properly edit the notes when I posted the v2 sadly. I forgot
to remove the text about consolidating the devices, since that's how
the rest of the Allwinner devices are done today. I'll resubmit once
I have a few more views on the other patches in this series.

Thank you,
Chris

> 
> 
> Best regards,
> Krzysztof
> 
