Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010000.outbound.protection.outlook.com [52.103.20.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0C224D1
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692733; cv=fail; b=SamtzOR61pdik27AQwXuehx3Y5TCzIYVHGkFlxbYbmCMiIX7QYG43IzNXefKpmSPw2l6pMdEs6G6bQuYwWA21UpPCi1gYcaKZsbX+3dr10DNXi7vx2v7ePD88yOXU7FQcsexp+k3XvG9L9glsi+N4bsUAF637I4YW6NfJMBqXpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692733; c=relaxed/simple;
	bh=sGmtpt09xpjAlsxY68o8tdDU/pobI9qtVF/yCkiWfBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m+JUFO02Itzu8HNnwU8zBeXKGjIqaG49t+0xliABJ8L7IEetcCAJ8e8IvNCxjgxu9RfNzUjZc4HXjzucxS67fri/3y1ohYE7z06NvCK41psggqtFLxDmmwKtMzjNgR9VKf4VQ0Mxl/EMJE5gMuv405X/iBCEXs+9Il5GX5f76Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=NnBUxS0C; arc=fail smtp.client-ip=52.103.20.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="NnBUxS0C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcQg4aCywRZbaecNzUyJXi0+9t+uuAVJTRg4INY7JPDz5tgxd1kwPXF1T9KcKxsEOk14nR+dKeV3cTzOIfVGhJR9EB+BNmNTN7goYqdtKWQsI3+srek20sEIXZYIDdsmioKl3q/7RYRlGXPZp2kth85z92O56lXG3SucwTkj6/igfwgILyw/2kYzsWug+xo4dOY2fhvLtX+EVp1wTPMmvBXzMxEUQsBlcXRb6IihKOE+6fq1r99lXbcGNLo7j2XMzQPW02XdZdeYurgDRpdD1T5W0aR8Ju1A7zCqNNmaP+HaCHnEbHnTp32woh9wje1WVaq4qGl15EnYJHXWgjQ+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7hjHB3F11i7BbV0jfTSkRtpdnSGxeNsUDf96KgS/jw=;
 b=cXg0deyCgjiBWGJyda40KmCv48tEjpTEw9rkaObLDiVz5Xsb9joXeb9aTWcewP1SfNO4b9kTtQZE/KmzgrZItikWNO7IQ6MCsMqWQgl83aSOVWJH7Hz1gWbVJ5QqyASUJSdwxWqtcXbLqqGsbv6+Hbksoe989S+TpYQcStnFyRoASHDsehhI3Kyc11Lk/2Oz5OGrs8LGKumvSdAZdsOrBHfxduBlj5tPOHRDHKao8Xzx0IjF37H/wfeE8qqLzrWQvJdBCgDmNnCasvvS2jsR3qPseUCYNGDAg6bI/r/eqf1VfVgK60FhIAN9f+5/1IZCGf/8Gyf0lmoRhx4nJfdotA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7hjHB3F11i7BbV0jfTSkRtpdnSGxeNsUDf96KgS/jw=;
 b=NnBUxS0CCtJZchgqy1gXcD4l9EkTRgnSJQBsGY3DwP3D3o19rhsm3uBcKWBY+YX2Lp5Nx3b91TJuMttAgTGGOGODCSnU9iKUGKGZ9mmT+bvCKL1XHXz35WCTHOthQmlOcpbkTR8CCBJe4RHXudLQ2OU5N/FdXAuHsH5RflEktFaVcWL46wI3YeY1ylDnwHu/UIlSDi21ZsOkekoYW7omXohS8V4KN4Mfhoqsty2vTwJdCmcaPTYMOuqiCYQfSWzdC7M1lhBUPp95L58m0meyVl1f1cl75gNhdBtRPsCeXx1b2c9k7JjcnmJfpVX/M/3UDTWdxx0KdxcKUacPkVd9vg==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 PH0PR05MB7783.namprd05.prod.outlook.com (2603:10b6:510:2d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7656.17; Thu, 6 Jun 2024 16:52:09 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::d720:e9e5:929:c7ff]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::d720:e9e5:929:c7ff%4]) with mapi id 15.20.7656.005; Thu, 6 Jun 2024
 16:52:02 +0000
Date: Thu, 6 Jun 2024 11:52:00 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, conor+dt@kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	ryan@testtoast.com, wens@csie.org, mripard@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	andre.przywara@arm.com, krzk+dt@kernel.org
Subject: Re: [PATCH 0/2] Add Anbernic RG35XX-SP
Message-ID:
 <DM4PR05MB9229FCADD3BDCE2510194016A5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
 <171768925527.3793166.1240136494594349544.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171768925527.3793166.1240136494594349544.robh@kernel.org>
X-TMN: [pBf8o9yp+M6gz9Xq1+M7OLtU9VucDgOv]
X-ClientProxiedBy: SA9PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:806:27::6) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZmHpMH9TNAQLQoHB@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|PH0PR05MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1d9c90-3bc4-489c-aa23-08dc8648fd3f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003;
X-Microsoft-Antispam-Message-Info:
	IcsyBj+VnrxR/1CoogvzQocQkyuBTNCqC6JFWQQw99R8J0sXU3xk0BHpTaiU7zzw0wGuwRepqFdOkVaMcHQ/bj21vyeTBJkV64nXufw+khA1IdOUyIlWQz/uaSd92J9h56e1BVo7RWLULJpIfLIJJYWXMk1Gqyz6KXXVUTNylu96XvzwWb+WTMB2RtOLt2TfQlECFqvMGP1nr/EHlJBoHzoAiEQSdN1c/kaqQeKPhb8dB0EOGfV+W3ldym1PAGPwTmlKVd0AV41C6lxM2GsmH3xfTZDEnEIvAj8q9kCNG86+2fwUeVxcstQ9EykG3tt2GOv4QJ6i5fSPFsz1n5Z4tsEAuuXZH5Pca06BVO4hfECWfyClJxh4vBAVlQavVwFu2CJ+78rciejQiHJkNanRlj0VyH2UZH+7RYBiS/M2OS5uNCyJPdg0WkBWJrGFQ4wdZ2l3Z4sVHiMFqJzG7WMIg//4klNjpT2wpfRoe3DXyFenFqV0kQwjmE5dtr5UNsC1rtAvCtGAPa26hNH+kNZORTJvOxiR1T+1zsb+cN9yZOv6GetdmJzH/a0s0jxFxdBggkQ6vrnvEiEOSCi5P4ssuAI7BgFW4RsbMmzq9CcH5q3WU0yVh0bhgbWq2t/5yTxsZ8u1BQ1IZk3vp+2UVp5TwbhMhFGe0vIGAeUFhUQ4/Ag=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?07yUwbgaP8LqfXDhg5ZP455pc7oGb6fIM9t0NUaCcYq0mzX+7l53RSbYDukM?=
 =?us-ascii?Q?h41TSXJ4TwZuUQTYZJWSVjHA6n0pPX1/65f7Z/rMz8h2Z11itRe4e5NMaIAS?=
 =?us-ascii?Q?copn8sDd1xaH56BJMEE1URJzAmB3IjTgzt43+YgEXG8JmLbhg4NJbw3fY2Gh?=
 =?us-ascii?Q?mRdhtGdDE0Z/FFO6/T/OK2FY78X1qRzH8E5PJIyi22U+j37QFwTpwsgjTqaL?=
 =?us-ascii?Q?dYrVXrnspuwtOtjddmURomVkijG0SzTU9IydsTAigoTmrR4JTFenXJxNI1LY?=
 =?us-ascii?Q?WMF68sGOxI23hGoAKD6Cub7UVEdFl40nm5cLVFdbJ7BjaM29wjtonRpSTXxK?=
 =?us-ascii?Q?l7HOIioMCMl/E57PBAu63yg5mwi1fbGqgCX16J48dkxo1yQs4ymkj6ApssBn?=
 =?us-ascii?Q?1BJJbeekMqDrQIZpvj+yhBKkXduEt0jtU8Y6i48HUdLwYszO/Y0HRYS3XbWP?=
 =?us-ascii?Q?p2/+aGvNsw+SUH2/S6GkvipgBAoPFLXNi1yPT6XBRG6CJHH/jld1WG07/S0H?=
 =?us-ascii?Q?AAa6gEhmnnpdneiB/y5UzZyn9hxbelOrn5VQZJggGrlzbXrqcV2WR9/CU8hr?=
 =?us-ascii?Q?iGH1XQVHcHqjOA4UpP2yvRPtVBupZTCV4o6KxeG2M8GU/xW6ZpfFew8S8sqG?=
 =?us-ascii?Q?0kGAVD3lfWjhnWok1is6e+BHsj/Kzu9ySnP8/0W8ViNUltnKmA/0Wv7CXAoC?=
 =?us-ascii?Q?u1cbuDK8GKaCjtpwIDNrIGxgXTODWTKi1ck8lk99iaFtsAbZ4jVt9MkUGpn+?=
 =?us-ascii?Q?ceKK3+3LuHLsIJ3otLqDOVhACCEooNpUhiFa012kByycBG7wMwyiBMupzGw1?=
 =?us-ascii?Q?WQ9PUiU9VkQp/Nj4aWkhlc9Jmx2ov3FOcgQQnIutnYsXLuUSdjoqYwSxlLYM?=
 =?us-ascii?Q?6SNNTpJQ2DrLldPDZ7wTaBncKDqJOEkcuj4dkSuVMhgQcCBRvDSHg+MIFaIz?=
 =?us-ascii?Q?7WUS+QkeOwk1sKsRc0N4OuK3Lg1Oz/sFkV/nG3Cce1WCc4Wvon8CCtaZvy1l?=
 =?us-ascii?Q?AhGVJ73q8hC3aTR7MB+N1+GuE3Cv/qzQ1GZuFjOmqqzPYTiAivl38x37XqAK?=
 =?us-ascii?Q?FSCrflBBEdd3A9d0NHF45b6XFZoEJaONGESIx2JacLr5ewkrdYIU+yrLaRZi?=
 =?us-ascii?Q?lKj+O9zn9Rdci3TfXjbgtwVbiafCHvZi4W0S3j5n3LQ2GtTtcHcXMcEGH/gN?=
 =?us-ascii?Q?yzovyAk6YP1VK44Wr0OFKRQQ5xfhd4mril/bt/M80shESlUceOro4aZnjdo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1d9c90-3bc4-489c-aa23-08dc8648fd3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:52:02.7853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB7783

On Thu, Jun 06, 2024 at 09:56:13AM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Jun 2024 13:53:37 -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the Anbernic RG35XX-SP handheld gaming device. The
> > Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
> > similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
> > external RTC that necessitate a distinct device tree.
> > 
> > Chris Morgan (2):
> >   dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
> >   arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
> > 
> >  .../devicetree/bindings/arm/sunxi.yaml        |  24 ++-
> >  arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
> >  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++++
> >  3 files changed, 156 insertions(+), 16 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > 
> > --
> > 2.34.1
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade

Sorry, while this error probably occurs on other upstream trees for the
moment, this commit should fix the error [1].

[1] https://lore.kernel.org/linux-sunxi/20240418000736.24338-4-andre.przywara@arm.com/

Thank you,
Chris.

> 
> 
> New warnings running 'make CHECK_DTBS=y allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb' for 20240605185339.266833-1-macroalpha82@gmail.com:
> 
> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
> 
> 
> 
> 
> 
