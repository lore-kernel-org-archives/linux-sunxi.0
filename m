Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2083.outbound.protection.outlook.com [40.92.19.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85BA79F7
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 15:11:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCFozfbuK/nWPNKr6Ln0kCFKJoTPuFG6P81JvJSee3pKFbNOwoPfe+In0dG/qban+AfUEExGqhxLvRvn5CpTYCkIqc3qwa67LjqVU53dx5IYqAYjBnTyvWSUCP3bt1dh2Dy/iUnKgM3C3ZFWtfm/PMDNkg8sUIWTxZZz3iRz3cC7pI9IrWUW3I/bcyOyKbetOEs6G7MkBJlKPx3pjWUjifnyyt/3W0xm4MStQP/st3cTFc/fctl17MRdLJTef8dH5TdT/ulbbPMfJigxS3Q6illTOmxnBcGlrNc0ASHPkaEfV0jBnByGA7+oAa1JOda2vcOMJDvZrGKp7UD2F01RjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xoiyv+FUwhRwBSyCs2mHYLdPJ5ABkNy9Gh5xux3sX10=;
 b=eTYyUMg2Jn7mGjBdXZYwqGx2z0nWDfPe08LG5pBUDAw2sekqUF76oeg++M+fs4469zjyBtHrmMADQNFn2zd6DMHuzIeLR7xeLLRQAF+MpTJQKSq/rKh3p8FeIlNzIV1Ka+gFGH9RHu2bQGxjfgoKkCjk4GGPNJXAYIPsdrz7rkJXMTjOa08HN0uXiIuklzs6CrUyeU9ZjvKGAL4UoZGI6Lv+JrtT/eIcL119ahfK8CjCuuyOPDTX73l9jQvtwg5+5ugagQIKFRIpxlcjGY4tk/EoDaglBF5Pzv/n448Z6sI8UD1xBaqmHOFgR4vIp3vhA8YELOgtrrcbOoQS9CZ7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xoiyv+FUwhRwBSyCs2mHYLdPJ5ABkNy9Gh5xux3sX10=;
 b=VZkrA3+TijswiqC0ItnEPfVDWpXwjDacNfYoQzW9ENBwiT3kdVUaX+GzonmPgK3T+4KcWN40up7xYvskG61griat9nb+fA3Dui1hvTm+KdxhabA3UH2GK9ey1Wmr2hxlZ5+rwBxGpHV4i9NR61rTkBYQVoVX1ak3JizMiuZ0aKzl6J19VUZu4rz2587mPIL/l0IK5aHCIN5j7mHWoD/XMIxCX+dYgpd7EXNdy5Gn/XyYQqXDVJJrWVrwZbH9VnJSHoeAyz2k88/rTP/wJ3OQFBDNoIS1CP6SWYg1+n/Rere3OTRIDDGt1osuNEtX8ipaPQt0gSWSIrK3TfPaxB1sqQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW5PR06MB8908.namprd06.prod.outlook.com (2603:10b6:303:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 15:11:07 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 15:11:06 +0000
Date: Mon, 21 Aug 2023 10:11:01 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, me@crly.cz,
	uwu@icenowy.me, samuel@sholland.org, jernej.skrabec@gmail.com,
	wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V2 1/4] ARM: dts: sun8i: V3: add alias to cpu node
Message-ID:
 <SN6PR06MB5342D4DFCBE61F04348AE87DA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
 <20230819032105.67978-2-macroalpha82@gmail.com>
 <20230819230059.3cdc246a@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230819230059.3cdc246a@slackpad.lan>
X-TMN: [gIc5VlzmONNRWUyF2p8E9YYb+bDg5oui]
X-ClientProxiedBy: DM6PR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:5:14c::28) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZON+hbP0QX7rTMh3@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW5PR06MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: d202bc25-5453-4724-0e53-08dba258d762
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r70bLtTysN/cJ4Qj/qrmbyfN30HSXKIVfq90tLKN9ol4sX0fNREJew3CN9ggqsE9iMUhu48Vfk9nVY8GOnzaNIgcEtyWINtKciI/+c3h+1siLrSXSx9Aj1aCus24/63qYo62Kni1ODKbOVi+35R+IijTFnWuvnOPSrKQAF4+jrT2qfEueXwLaIK6YfBwN6sBBpWeXaNeW8inqvRVCtNGE4frO0DjYycU0q+wNqoT8z+aEHTc1xNxYnmK72LtLMSJikRri6a12hjUydqY//yRS73BLF4HR7bRm5k0tJ9lPz8rcpqc55eIvL8sLTy4+YhlseP5jfInh91TxjzgjM2vRkNZDLSdzLNLXCNw4c03BLGKLQmkTUQ/KhpXNqwh7VuEJdRI2mlWO4vNUzY03ieATX6pZjMUPXiuxWLEy1qMzdABlf/SMjt0j/HuZaBlIlKukTykSC3xGJYBjofF4yYjlC7ZsZR4UCfSM+Ohw0b+FmXRBap9Wr/C36D4+X5ewyeO0EdJ1o2B2n4F/zyYvzS9ueKMp3buT+IBqMAgPO7mPiKvY2rjkBDjBqaUfQK7nJsD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZbH9OMQUMTDUAeCcsX7TsbXLipzbz8FYlQLsD1ClwGuHHNmxD941HtnqpvFL?=
 =?us-ascii?Q?AlxIJciLEPwdUnOh1RV8D0MBo8c1N3+veq5OxNN0Agjfz1lFZWPoU/caYwJH?=
 =?us-ascii?Q?+lHZqq9FpLpcHJ7jez0q4jaYfNlc28VoSCktBOIinXyoh/sy/03Kue7UiT9j?=
 =?us-ascii?Q?OzFcdxhzf9jhTcx/6R8EQ2TnZ9YFeOmBNW99hXJpJSPI7eeqqztdIRB3F9ob?=
 =?us-ascii?Q?MD2HtkYK5sKbh1zF9n25dSl0+wBoUwBd9lWR2D7nKfVesZu0FpbMgFXAWgYl?=
 =?us-ascii?Q?4HPcGNVix5wz9S1x/Sqj99e3jaHsgDai5gAKNtcTTMOu60gyutLpNGnDcnJf?=
 =?us-ascii?Q?8eadk3A8yK2NgfL8EyXhtMbRvhMpkNAfmao5z5th+s/7mt0k/KOZLnFwkCdU?=
 =?us-ascii?Q?OMHmoHtZWosKmh30W9wonJtVFheuiYbn8y6ka4HI2v5QTY7NzcK9HTHIFCeo?=
 =?us-ascii?Q?P8VbeTcQXtJKBQ3etBUkB0PV00qrUdmEprnBQvELzx4RGSyq/XpqPaoVDQCM?=
 =?us-ascii?Q?l8JDPw4o/t4ott7+b3Dd0/AVTxltl7VOQ9EqlGyMYTpLjqd55SYUVGs+VmsY?=
 =?us-ascii?Q?vyJ/pXfsWZ9UDn+i5otRoRdIKbvwa/CTfpomDLuE9XszOFvcuT0GU3feTEsP?=
 =?us-ascii?Q?7SVAS/vU3t7Eaf2ZPs9fnGHBYD2g5Gzg13dLf+t9g+RAaD8PIEOr66Id0eFU?=
 =?us-ascii?Q?CkW899ii09a+dbj1BV193NTcy6xtUpnII2DJVD/iA5dHsZ7zZVcvQZi5Dsqz?=
 =?us-ascii?Q?KFEzMFjtRlz2tXQU6ET/EMMTzhGib6akRuWLZimenPbwDKVApQw2UqPB4LGa?=
 =?us-ascii?Q?qV7ti+85tmIIiHrDkEk6ibSpXYULMWGD5J4EWzKyWLN54OZUlZ7Dr7cBVH6N?=
 =?us-ascii?Q?p03+DfGLnpM//r18DjW4xaK7vaXJiD/jDx5FD7ZoyJZZAOnd7TAUvn0a+m9S?=
 =?us-ascii?Q?K2blS83aXUMD2b35sqtRsEZnXqBOa610y1xtAbOSG7jdLfeat3dMcU0UIyXN?=
 =?us-ascii?Q?5Dc7iE8rNL4AIcDF8T1g9y8hTd+MDdyvJNEcEd51qRGEKCAanBXaOf5vANAd?=
 =?us-ascii?Q?hojhSI+1HpSG5BbRd6pWj9KY/Cb+Si42wgNJs0fKIZsYou0TiZ1MmF8eI4ub?=
 =?us-ascii?Q?RDAOesiinE47rzmPXlhmzr6hW/dc6gE43ETkhFjvflKHwB0t37Y5aeXt8eR+?=
 =?us-ascii?Q?CuyQ7pwGXOpwIxYwW2c6w0L0UBwVO9z+Bx6fY7mDsjiJS+VsQ9bvRNszHPY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d202bc25-5453-4724-0e53-08dba258d762
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 15:11:06.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR06MB8908

On Sat, Aug 19, 2023 at 11:00:59PM +0100, Andre Przywara wrote:
> On Fri, 18 Aug 2023 22:21:02 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi Chris,
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add alias to CPU node to allow board specific CPU information to be
> > added.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > index 3b9a282c2746..2b76a5b8ec19 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > @@ -71,7 +71,7 @@ cpus {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > -		cpu@0 {
> > +		cpu0: cpu@0 {
> 
> That's really a nitpick, but the V3s is a single core, so I think we
> should just use "cpu" as the alias.

Will do. Thank you.

> 
> Cheers,
> Andre
> 
> >  			compatible = "arm,cortex-a7";
> >  			device_type = "cpu";
> >  			reg = <0>;
> 
