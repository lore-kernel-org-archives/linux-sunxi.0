Received: from BL0PR05CU006.outbound.protection.outlook.com (mail-eastusazolkn19013006.outbound.protection.outlook.com [52.103.11.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824C168B06
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713462778; cv=fail; b=RtXNgMJv0daPxOVq58qCnlZ8aGQK0wj/JzA4QehUUEMDGJyt8Z4/Px4XiCE3Fj/EhS5vhO30eWliGRrphMvSPUaWUAALyFQPqG5IbUP4Rw3OQMQC8ayPv/A3Pllv0fH1JJtNrYS5Vh/tMKeb+lZGbqVyeNq675cBZiKNya/KE3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713462778; c=relaxed/simple;
	bh=LnuLhPmkPFSy1dcxqO+G5UssOnoJUnEYdzB+QG35rOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ub4i5BoOXG2ok6FdC8eAtTpLWgRRFIG500dCkUh8vTPzW6I+8cMJ5N0ZYgIBB8lhd7jSg5xj/peN/pdmlpTCjWrBlsYuKKsK/YAGsUtNBAYeiiHDS1fdsQoc2nr5y2DMQkAzYsnFinxBYDZcLu8plIbE3tlxk2nBoO8++lUMttQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=KTNEB4VG; arc=fail smtp.client-ip=52.103.11.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="KTNEB4VG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA+jVHpsZ3apiGmxt8l2pKUndrncMe6Q3u7nvBYqDIphygftVkofGgEDLuEIZKXlNzNvoSKw7C9Blu2gjrh0CrkdK62KGEUyUhsD+EXFZr4bA7a4yxfFQ12yOMNOR6ggonadfeFMMaROYh6/WAkE5VASa0CQAJrphnA5RtXWvenRQyjwDJpcWAwKwagBsilEf847Ruw8DhVy9AzYZe4PvJ2+jpYIH448TbSZOjtn2XUgEt2yuNVEGAa1b1LxkT7OCvdJXhvkZstOGVUg8kzCYbcXaU4HlVTFT5ISn2sXYp3XwWogVv2NAg0cXsxMFe+LZwDNebBuHkbveQ820ABcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih1r80xYl1qdjjMokb0pFtJLldNuBCFKSrFju4bhhS0=;
 b=VW+7y84fgqCbM56eqDp0w+oc263bS1enVINojf1VJCNlDXnij31cCDR9uqSzbxuoDlArjdDQAhnb4U1EgxnMXmxOgbIvr2klUdEnkHIzldt+C7pkpUNlTKVh6xed5xY+MQOd/Ast/yDvDoK74ACUyhowyOUyikeSVouskL/VfnvxhTHqPI2gGd3q8qb5fXtCHtXJ41LnbtAT9KwQjSwftFMeii6Z6647jj8CWKmQxTvWM5YlvUoWbrt+L9okFw/W6MXM0qavZtxBfWW1L+Aww0MefxWhu9zItx+ZGViOtfuXaxf7Pm8c8rz3m+7kqS9avUsxNzVKRmw3aGF9mk87ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih1r80xYl1qdjjMokb0pFtJLldNuBCFKSrFju4bhhS0=;
 b=KTNEB4VGGglTJGgZNDsvSUQ1oqZgGGVw10RrBHeyTFK8Xk4tni2xbm+sR++5+KZtpZOiCVrJMSPHO5bwu2+6K690ncmLhsj6LoFGx0f4OfpihE7jhAPqWPFJwjCv8eXXw6AA8gP5V5LfchLmjcsvatGinKHngMiJs7poJ4ZHgr1gnVIlcFpWn/kvl0AcB/r4lgdQxGN8ehhAJXUX2vlv+Q6ZLyH88Kwm04I+1ZISzZuBrnJAp6wK6y4AQ84Xn5Uv1Rit3XxyX6l+gdO9+1u72qzVqe07r6UiOxWzcZ4BDSxpAT3qgj4Jt2EIy5iOKvldNCBcBoqSBSPYsbJWY8Wydw==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 MW4PR05MB8906.namprd05.prod.outlook.com (2603:10b6:303:132::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.39; Thu, 18 Apr 2024 17:52:48 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407%6]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 17:52:47 +0000
Date: Thu, 18 Apr 2024 12:52:44 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, samuel@sholland.org,
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
	ryan@testtoast.com
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: Add NMI device node
Message-ID:
 <DM4PR05MB9229EECD9B39729F8DE0F786A50E2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240414170424.614921-1-macroalpha82@gmail.com>
 <20240414170424.614921-3-macroalpha82@gmail.com>
 <20240415003740.666759d0@minigeek.lan>
 <DM4PR05MB922973D047EB3BE774EEB943A50E2@DM4PR05MB9229.namprd05.prod.outlook.com>
 <20240418171907.27c0ef84@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418171907.27c0ef84@donnerap.manchester.arm.com>
X-TMN: [kpzDmTb2yyrO8macCD7W6TpaOljRKRou]
X-ClientProxiedBy: DM6PR01CA0016.prod.exchangelabs.com (2603:10b6:5:296::21)
 To DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZiFd7NZGPRvCjz1D@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|MW4PR05MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da6c6df-2198-4b76-484e-08dc5fd05b76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bKCFF0GwftlQ/y8I++GCdpm7ivAeXhUf7oEuUrEUqQ0HR4lb9lhxVju6bWQ2Wsu0TlDcgdayj/6+7SgDHe20C6jXXVpD3dEpAfTwuRz7SqCGQovldAToW76tm1TEtCXrcHxEJjhnXQgnny3aa+bTlOnsVUzS4lyM1Q6R7hsOoglF6z53Qlmkh6lqlsv3wIiQ64WFaTRpeDxH4Qa+tVMT8SMHvRfHkiaaMiP0ymYMykTGbS6Rzn6L00xJj+PJHhGx9mx/HDa/E9Fr8j0Hcaxh3Tad44JBolt6yA1JhV4kKLAYpOJJ/VnyOoPfzerZ+EGrwmx6fDEde3mFaONcVumXFlz0L1ZNJUEGotjztw0+NHuKimUMPqbNHWqWUkDojAsHWD/HPgrpduAyfuvbuybor+yHHZBypQjMOeBgaSxQsp7kWzpBlF4zAFDmTYJmqq7rni2/1y8c6C5ltCGnU2X+uaeGv5j4mjT61315sP001TjCiLbn/Z/23hBDfG1ldhTFJDPVyWI+CveQNYSRa4rRvq/gxylRHdYe0M7pe2Mw0R7JJHuTvnroiiOq4B3Ob8I7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5+vuZqxDNhIMc7nT3d++k83gxlnbST6DA7L+SX2QtwHErPMdr9KZGrvSboC?=
 =?us-ascii?Q?xuYUhdZLytZjbmcPZuaVKVfkT1uHpqAI10hilk9azAPz0ZX0UuaAvVOQF2v8?=
 =?us-ascii?Q?aT3CpYeCOcAS7d2Bip1jd3CuR5owEyFuQgEXZUAqHWqyz/O266eOzG6MExQg?=
 =?us-ascii?Q?8mnBc1aa0K9BH6V+7LUDSdZkPVKodlFqSwRo+AF4wNoQExMuVfjrQcYu2kta?=
 =?us-ascii?Q?LUupDTTzMH9YZn5bUTdCofOz3FyGlmnSiT6Yn353V6uYnmNjZxj+2TfBBVHX?=
 =?us-ascii?Q?SiNBzAOBJntNxppiuMuaoc2duofhV4B/20hNgN1mNpmVmT9u39+t2EYiEn3P?=
 =?us-ascii?Q?oCvYTQ4jFmUXG7qbAWi/ApunZqJ8vmFUv/O2wBSnHmxTZUmn3sWjXqbG/KP9?=
 =?us-ascii?Q?kcwtZJ3blCQedKKXQ0SGa/KFlp1ei+J7sRvFRFv4YxXopgILdejzSTCWs/nW?=
 =?us-ascii?Q?6nRDiweVKpQOWo+heArrkMbEiRGbFqC6AHfe0TTznE9xVEE3fOILVTog3xeo?=
 =?us-ascii?Q?mWD3DRaysQSOJQLC1u1FYNRQpSPUEQ2BAOytKYWjB8aEevPo37DKFM04QaKI?=
 =?us-ascii?Q?Ddb7ZeQ/icLqInSDK+q1DvUArnPsMKBe8fYMUwhM5A71syrLReTndeLV8G2k?=
 =?us-ascii?Q?2nuYykBhXoM/IuqgpELOeVr/erbmRAZt0OQ12K2czyxD3e1wOYDLVJxEKpgn?=
 =?us-ascii?Q?6pRS/5VRSWMiurTuup0exbyn2c0yntYKj7PxlfipDZwlfSSCGwb6pCvkhwLi?=
 =?us-ascii?Q?PGvHPCsNpgAvdie5ysJBqL3cu4QDJJwur2sQCOvCODRmXoJhlL2Bqn9IZ19C?=
 =?us-ascii?Q?gfrP3M/GVTximNa4i2Ea0NQWQfZ3a4VqJy6ze24oyIK728blPYX5Uk3Hkpm2?=
 =?us-ascii?Q?A/3kSHYvqrj18Ouj4tRfE+lSvfoF4FZR1rCRLg1Bq8CPjCbKoYUnL5u2DmRE?=
 =?us-ascii?Q?n03BQVlhYNJOhqcIIiNqMEkb5SJv9IxEthjuROZIqu8QkSo7FeW88BpfP8ip?=
 =?us-ascii?Q?sib1gfwXDtgX11cp2UN/ikP1ExQRP2/ue/NHlVanlFPZyTLdTsxReV7STeoX?=
 =?us-ascii?Q?llR2z3/lAMEEF1ct6v9gpOBZ8glhpeXZ5fxOJZWWM+ffzTh6b7q47Hkcr4t/?=
 =?us-ascii?Q?CGs7I0iQ9Ibo8jfiEZ9vAd1wdP8jT+qIe9B7fb2OZjoZrRwHTdEKq9nUkFzA?=
 =?us-ascii?Q?cUT/jadQE4euemWYGaXxUmYqVGlSjystIUFfsul+PoIg1f9U0aNnQ+9gmJo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da6c6df-2198-4b76-484e-08dc5fd05b76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 17:52:47.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR05MB8906

On Thu, Apr 18, 2024 at 05:19:07PM +0100, Andre Przywara wrote:
> On Thu, 18 Apr 2024 10:59:13 -0500
> Chris Morgan <macromorgan@hotmail.com> wrote:
> 
> Hi,
> 
> > On Mon, Apr 15, 2024 at 12:37:40AM +0100, Andre Przywara wrote:
> > > On Sun, 14 Apr 2024 12:04:24 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > 
> > > Hi Chris,
> > >   
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Add device node for the H616 Non Maskable Interrupt (NMI) controller.  
> > > 
> > > You might want to mention that the NMI pad is not exposed on the H616 variants, but on
> > > the T507 and H700 packages.
> > >   
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > > index b2e85e52d1a1..1e066f3057be 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > > @@ -775,6 +775,15 @@ r_ccu: clock@7010000 {
> > > >  			#reset-cells = <1>;
> > > >  		};
> > > >  
> > > > +		nmi_intc: interrupt-controller@7010320 {
> > > > +			compatible = "allwinner,sun50i-h616-nmi",
> > > > +				     "allwinner,sun9i-a80-nmi";
> > > > +			reg = <0x07010320 0xc>;
> > > > +			interrupt-controller;
> > > > +			#interrupt-cells = <2>;
> > > > +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > > > +		};
> > > > +  
> > > 
> > > I can confirm that this matches the manual, and the registers behave as
> > > described in the A80 manual. I don't have access to a chip with the NMI
> > > pad exposed or used, so I cannot test this fully, but Chris'
> > > experiments with the AXP717 PMIC connected to that pin on on H700
> > > board seem to confirm that it indeed works.
> > > 
> > > So with that small amendment to the commit message please take my:
> > > 
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > > 
> > > Cheers,
> > > Andre
> > >   
> > > >  		r_pio: pinctrl@7022000 {
> > > >  			compatible = "allwinner,sun50i-h616-r-pinctrl";
> > > >  			reg = <0x07022000 0x400>;  
> > >   
> > 
> > Since the H616 doesn't have this functionality but the T507 and H700
> > does, should I change the compatible string? It's all the same
> > silicon die with just a different part number printed on it, but
> > still...
> 
> I would stick to h616, since we use that for all the other devices. Also
> the H616 *has* that NMI controller: I can confirm that the registers exist,
> and I can trigger and acknowledge interrupts. So in the interest of
> consistency: keep using "allwinner,sun50i-h616-nmi".
> 
> Cheers,
> Andre

Okay, and I'll just resubmit then with the notes you mentioned and
your tags.

Thank you.
