Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19014008.outbound.protection.outlook.com [52.103.13.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406CC16F84D
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713455961; cv=fail; b=MOKh3VTEISBZPegeaDxk7HZjFKADYgcEvcvteZJBC+jOAyL3WLCKRDyH+KlSenjzwZuNLCgrS/tQYK4PxsRGvLHE3WTt8x8Ftj/vKQchZH1sIhR7Kj1RW2IRntw78/O1IqqbftuVQxEIf05ERd2iNMsZTOqGirQ83lK13hL/XlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713455961; c=relaxed/simple;
	bh=D+jCSnQo8Y64bvZRaLpV989UIxjkwcKdbR9sT0dgAQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X9nWGPck4LpuQMRcNXtW9gAbSI5qVY3byHV2o4Tj4dFU2GAAMdeSTz58JJUmke6cHHZsa4tEx6CVJKq+ynQAlIjxOQtmr2tmiN1ZON2TheNb/7Pxd9oiIae1B5BVGyJ1JnjcS+x7V5+JR6iAFVl/PUmeqeFMmbXBPVzlPHNXPsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=CF3k7WAF; arc=fail smtp.client-ip=52.103.13.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="CF3k7WAF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHsKoCEfL6HQwRoftWJo30uwXL3Wk/4tmQ3sxLmlDoHqybFu9wBJNn7K31Y5w7THs8fyvVtf7XPWPIqqsU4q/W9MW1Su9ex7HgmnLJSv/0ZMrjcWAv+kv+pb5uZdQpSj0EMgJFkxI4GxQMLX710kz+QrsGCPwDWmV80Q/NolBYzkM8b/wYqOkWfuMoSAd/XaBnGtFNKzLiti66YgFy7KykdiLCofolsRySBqXXrtSwDZNH8steMy18GD+gNNWjUcvqCcjrO/upgCTkx2oBImrqHgRx72I5ZT5o7Q4TNuTihGzNdb6A5p8ySugqMxUHpOzacpJ/5lkBWr+i2kPcKcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6ZIBIJCb+uHRxFNSN6ENWdJuWX0bNab2b4j7psk0rk=;
 b=AuRCAfL2hyptG7bpGS047W2UKcI96Qb5wUrLFRop10sT75XTajH8uoqPozWxukf/XDBik8iFz6i2C4r7vAqn/y6Tkrwj4RWql4KLmw74ausowX+TFnUOzdyyjhc+xJZQKicMDc/TNLCRGuN/0Ish4bAISYtTuKAYzi9Jq2oR2557OjqykH+Ga9DStZRbKpQnTAqM0QutfxRfqdYNwyxTRkJqOA/8Gg8eobNTctOpRxvAAR216DJlUF+UfMG1A06kazubJejy+l8Hd1SPwJZJ5i4FpBHbPVpCrkSKU3RH3obFmcajZte+OfiLNTlTrWwVnXscfTf885N86qCrGm7TYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6ZIBIJCb+uHRxFNSN6ENWdJuWX0bNab2b4j7psk0rk=;
 b=CF3k7WAFgoZL7hm8Cfv+385UHgZzN74Xyf3D6m2bIKeibWvoiRBtbfp4wW3n84TsF1TZHn9XsNnr3Z6UsZXZsNduS59gu8BKlsmjhZB+H/dWMkDaxLAaudAmFn04sBtRcs3ZyYvGc38f778ZoAoi+e+6ZapkJ0fs80RtOAUuOpC2eVYBI+20FJdjXWEQA1RGIcnhPo46ESpSes4y/BVLTiUy7m1RnlFETIksVM1ekpb3L+PplxpD+FM3P4ZWTQSmyN/SaR8vKuWL9C4XmAHp+nEtUJdJmM+HV5G7E1xj6BC37GWykCxzE6nd6qUsmvGkKqEiPWpeoZ+d0GJKxDq5Jw==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 SJ0PR05MB7472.namprd05.prod.outlook.com (2603:10b6:a03:285::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Thu, 18 Apr
 2024 15:59:17 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407%6]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 15:59:17 +0000
Date: Thu, 18 Apr 2024 10:59:13 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, samuel@sholland.org,
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
	ryan@testtoast.com
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: Add NMI device node
Message-ID:
 <DM4PR05MB922973D047EB3BE774EEB943A50E2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240414170424.614921-1-macroalpha82@gmail.com>
 <20240414170424.614921-3-macroalpha82@gmail.com>
 <20240415003740.666759d0@minigeek.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415003740.666759d0@minigeek.lan>
X-TMN: [LOHw+rWztHpOpYnmIox+BqcNbFuwHkBz]
X-ClientProxiedBy: SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::20) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZiFDURvRh1tU6i9o@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|SJ0PR05MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0696d670-ae93-4442-c500-08dc5fc08042
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iQIFsC41co+LuHFBmyb+QooTmVs63IMbDoxmyhxb6nyPGXlHwplFvxcaDguXSELqZ7qrJ3YNOeE1LtSSlwmpL9jzRiguOXzRs+low6Fx0GGo3hdvMDjNcH9Gdo2vQmvhTimjEmhXxcLFHrko2WgVKEsK/hjLZ6NpqN6ZbG/s9dtYWnIZiKlHlEK5EIW7GZRr4JJk6n2aLH8BeA1fI39LTclKGkRXgx2xRy8AHFWQxndCCR6pT+sHW8fBzBqVOywbN9hlrb8pbrusMnWqI0hFGKP6QUFeMEmDoEaAmS2h09c6aLtFJ4+haLO5V3XiG/yElYGsBf8vhrWgIpqLwofuQjcd+ImPvTPIYbPKZczfR4OoPOZxzj1goXZpA8B8dNFnHXE12NIMRbQSTGefdUx+k4F9g5aBHfv1w1BRrF1dQA0MWxaEqCUfsWB963rhj1QyiNI3Pb9n4jCriXtbDoo3ASdSNOzUQ6mBAlKlsOEu5g1iKc3sk9hJ0y9y7cSOkDO6DYIvq0kP7l7P7zOMcsHYbPxioOqQZ1K3mxaEHa4Nz+jf9gU/uZoLOyKBavulMbpz
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B7dqex5Oi02LoTNQGgB4fQQq+DJgofLslNF32sG8hljKEIvspeq84lfZOXpn?=
 =?us-ascii?Q?mJHO4qVSj5mhg07jxh/19ON1lFLkFvf/b+AHNvZ47Od98uiz7PWDipM/pzP1?=
 =?us-ascii?Q?54uhCBd4f8QZbY74bo5dfxBhL4JC4D81JpiFlAFI4Vpm7xELmYJ93bSe5/fN?=
 =?us-ascii?Q?UAY8X75id3r8TfPR1F6k6POu/Gdmgi0ZG/HlpesuB+4aulDsoP8ieWbBGzDY?=
 =?us-ascii?Q?8l+jSXlC0wJIfv+aFbPvXd6E/fScimkLfYjMO2J5xpLLGebzzRemJzk/JOgW?=
 =?us-ascii?Q?z3pVbj0F0uOcGQgGmCnfzjOQsx0ycOESiEZ6UpODSlDTfW7A71UyHoGiH+qy?=
 =?us-ascii?Q?Nam5jvjbPZkVvl1aVZHOzPkG2CG9g/RUnthZ7G4b2gheWAg77TYgFbPcbVh0?=
 =?us-ascii?Q?k/lnJk6ElGa95PqyuIUq9t4uJCr+cdBuFGcb9fJAH1hfiAifLTmZaTTVSPHV?=
 =?us-ascii?Q?exA951A5pY0dpijhGdEZH60YiqR9JZt+0iBqgEcJPAXtYpc2e5wPluEZtGyE?=
 =?us-ascii?Q?RMuw21wQTCMncB00MPjYyODBqd+Op+BbZUlanCMM8YjR15SrVF82zjpYUY0o?=
 =?us-ascii?Q?JJxAUtOO77oqimu54yaZBMqS7hvKudEFi08sT13r3rMLHpHgqNQXeAtfqID4?=
 =?us-ascii?Q?tc3VPEBkEMiWjqt8Z6bdO3Ndec0EMJX7wSaX1HKtYN5cIkyF+sV09y7cq+VK?=
 =?us-ascii?Q?/7Uc7SzVnsGdlxpSV9EL8ncvvqI/hgZnlPErGziBcoirPFPvGny0QQPok/+w?=
 =?us-ascii?Q?AB7lwolyHDtRb6moAS4OSxSTlbXaBLVvDGngz8SF6B5qCscozEoQWm5xEYXx?=
 =?us-ascii?Q?QX6FB6u/v4WefAatzrPqqUxhDl8JCpRfO1XMGho0bYanIC2+togTaIYdZ18F?=
 =?us-ascii?Q?e2bUWb9N8ixXfjQ8A06sfOOKPCRelqgVHk3p6jCTNqx5JfuhTCgB7DwrowUI?=
 =?us-ascii?Q?JxEq6cafgpXTAzRaeV/1gIUBJRXD/jANyQT3pZrSWw6mnYzguXGByBGsGYLJ?=
 =?us-ascii?Q?IOpUTAjVJ9frtQzO3VMuMh+DWlu/V2tUqNHepfUcAUqXpq6e2Dpmj8XDpyVu?=
 =?us-ascii?Q?JhUzhdI5rt80ag418lKrTnR6Vhv9BHGdYEgJiTkv+Q5yMU85U/zCjYGauUun?=
 =?us-ascii?Q?Y2yFUHWEBrBiEahtjcmUSJB+dzOEuE9l82unmeRN7uk7iW8K9yfhQgTgaOsX?=
 =?us-ascii?Q?YWX6KuWnMHj9EHm/qibjrRg4QN/+tGhHjKhPzuBw1mQSor55NDWHv4JV9bM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0696d670-ae93-4442-c500-08dc5fc08042
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 15:59:17.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7472

On Mon, Apr 15, 2024 at 12:37:40AM +0100, Andre Przywara wrote:
> On Sun, 14 Apr 2024 12:04:24 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi Chris,
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add device node for the H616 Non Maskable Interrupt (NMI) controller.
> 
> You might want to mention that the NMI pad is not exposed on the H616 variants, but on
> the T507 and H700 packages.
> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > index b2e85e52d1a1..1e066f3057be 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > @@ -775,6 +775,15 @@ r_ccu: clock@7010000 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		nmi_intc: interrupt-controller@7010320 {
> > +			compatible = "allwinner,sun50i-h616-nmi",
> > +				     "allwinner,sun9i-a80-nmi";
> > +			reg = <0x07010320 0xc>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> > +
> 
> I can confirm that this matches the manual, and the registers behave as
> described in the A80 manual. I don't have access to a chip with the NMI
> pad exposed or used, so I cannot test this fully, but Chris'
> experiments with the AXP717 PMIC connected to that pin on on H700
> board seem to confirm that it indeed works.
> 
> So with that small amendment to the commit message please take my:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> Cheers,
> Andre
> 
> >  		r_pio: pinctrl@7022000 {
> >  			compatible = "allwinner,sun50i-h616-r-pinctrl";
> >  			reg = <0x07022000 0x400>;
> 

Since the H616 doesn't have this functionality but the T507 and H700
does, should I change the compatible string? It's all the same
silicon die with just a different part number printed on it, but
still...

Thank you.
Chris
