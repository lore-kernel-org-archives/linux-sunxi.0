Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19013007.outbound.protection.outlook.com [52.103.12.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE022315
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693621; cv=fail; b=gzy4f/cE+9toZmbMvdzFhwUKAVnQAVRIqxGe1QQQWr2Drux/EKs3QLBTtSnQI+3dplvVAbeT2QLpRmBtZY8Eaef7u4M6FHG99aFo2W79r2dsnROuR8eoRb8q8sGrKBYuDIHoTW5hrHAeE7eM6WbN/am0l9nVRqL1UNvI59tj+qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693621; c=relaxed/simple;
	bh=0HJsrS/hRh2Oyi6C30r5K1ALKRp1NBdmWVdJV5W4B30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sSax8ak8dVbvMsnhf4VAZfm78rzF9TMnZ1i85U8qJOgDrscPiJmMcy4EXZ516cavDGg0IToqllczU6CLrcacPq3PkCDaULARo7GBpQmd1nxyGsO64Fs55qfSXofIWdEr6/R+ld2NYWn1by2EsRqlzpNKjxf12qRFH8hfPwxuaAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=H+MTNx/q; arc=fail smtp.client-ip=52.103.12.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="H+MTNx/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jE+3NK+lrE3gzCKIBkarzuD4zl4yqKKcP7sPLpYAgxbc6i0VCiX2HDdKlJ88RQahafMgZ5whFpF6JZGkrzZVkXVNdcn3KorWikGaqUItldOKjYWn13zCz5+bKodiE78mqILE2vXSUwiF3NPLO4j53I8BxtuWvV1H4B3o7l/foK0Sf+yAdu5v/2jrCq366UMr4QRZH/04HjzxMD9/cOfNhNl/CEB1Erat9y28jXmfLQImxMUiATKyOnS4N4CxHctnMEICIX1j7rmZvhJdYhtOmQeqLjwXs1jwQlD881+GfSuG3Xp3qYxE6Off6/KKGwzYRiRVFmeqsvc+8gIvY3GIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCQRq6XM5baVGLSZmhVmCftIwGZQ1u5ZBqW5/xLSOeE=;
 b=gPjemmXPjfd7huImDQIAY+UHFbwTgnWviXCrbPzwJ+Do4JKzC/OVShu/OSh6ZyRGYTIdEkaXxH6REM9KYYqlChn3m/DhuKo3Kkz4V3YnQIuZzi6i8ZGmhmVMEu1xDLEfmBV06Crk8FHqMQUyQQ91icm7+X9yJqRScVy2taGfWbENzDt2t0UWz9MVKQVuf7nUz4efqEV89Iatp0x27sNM3NiLmEI/JJPSMD6FppyjMGINzPPAFbRLUMymKAWXfRIXapANR3fbIwHgC30LwRtE2xaE6st/ozaQpcMrfeocwBITqVd7OC/Q8zrcUosiD2aGwPpsLNXCUiPOATl8h1WI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCQRq6XM5baVGLSZmhVmCftIwGZQ1u5ZBqW5/xLSOeE=;
 b=H+MTNx/qCuv4rORtNQf8tvUof/94B+21Wy7meCqxwAo5UHuhmDyfZjD1nGarLSNKY13uxuEJp9HFFJyn11XGfjgsJQ5YAP1p8m6zX187koXaE/K9QGodZDiWcga7LM/JB3+iWak6+K5SIRGKMDCqlvH8LeaV1/f7Z1cTuSninDWNuTJ7KayaVr3+oaTaKDvDMedUPoXGgGJXWsmC/aopHZPvifEbtcgzBHhzTB38oDJiIVubdJQZD22Fps+YJ/zEEI8ZUu1nAukXHzbQhByYgtRaJqXCEmYR/YGwQesgqlZlz4+LfkYN983Hpx8/UVcQ3ssYy4u+1e3tPTsEBclZLA==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 CY8PR05MB9474.namprd05.prod.outlook.com (2603:10b6:930:99::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7656.8; Thu, 6 Jun 2024 17:06:56 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::d720:e9e5:929:c7ff]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::d720:e9e5:929:c7ff%4]) with mapi id 15.20.7656.005; Thu, 6 Jun 2024
 17:06:56 +0000
Date: Thu, 6 Jun 2024 12:06:54 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Chris Morgan <macroalpha82@gmail.com>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	mripard@kernel.org, ryan@testtoast.com, samuel@sholland.org,
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
Message-ID:
 <DM4PR05MB922995CB8DE2589E025E486FA5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
 <20240605185339.266833-3-macroalpha82@gmail.com>
 <20240606105159.33a2b917@donnerap.manchester.arm.com>
 <CAGb2v64uCCZSc0aY-gtcMNAhJAqDhb5=sPBJC=q0+nKwMO3f+A@mail.gmail.com>
 <20240606133515.223b9c73@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606133515.223b9c73@donnerap.manchester.arm.com>
X-TMN: [p7FZoo+HKoZr0UmvUK6MsKtyDDz/W8qg]
X-ClientProxiedBy: SA1P222CA0147.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::11) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZmHsrp9p0bMSADJw@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|CY8PR05MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0fd3d4-7aef-4ddf-eedd-08dc864b11b1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|1602099003|440099019|3412199016;
X-Microsoft-Antispam-Message-Info:
	ijPKv2Ezvi0ScjHfHcSta4YE3kVcHq//IT7H/YaY+IbC05KmVy9jLFmg2hojtxzGp9pMeTOrRH/E4utAYMQy/7tfkQY785zfUbmkNepQVnTOgPPIGoGMXKpLZ5w6PhlzZI7YHnEOTZlpeV2emYsQVzY2390wVu21gb8+zDYLBXm3nTjfYkDS9yOvXiT+Bz+Lrq6AYVqW+T9tzvsFn0sKwYZ14ff8Z5vy4JT9YGV4Cb5t0HkZCUnCnYe4OTNHGKOgQVIhoLVx8dtCMaE7GzvUbJkFYg7Tyy9Z8PlTh9volOkyOsghhc9A55iKPweYG+zyq7RE8IQQnQhs4C5z69AIFtaCgeceBq4RTkVWdROqoyX9+Rogm8eHK5HY3k3IpFWQPqRRlWzcV8iAoACrmLvI+g8sxblBxubNGB5/RXx5sFLtzJTDuG9NwkQGR2iWB6WkaPqw7YPWGHyPh2lKHUBU8+J1vMFndFRIBkI3HOkW+a3XO2qFHCr7EDLND9A1pNi2L6pUAUN49343qzkY4eWi23UEoGmq9V2ubZOnf7lcOSV8te7+1urRbiJzq3iZISWhZGcbxAt4jhDH9rvg2sf3a2BmNoBH3qSL0Yp9ooPJyfJQM6qccx0IUbwR22efF4m92VdL36YpMnh6qNZwyORctuS7hRfVeVdV+Eoo5UeYKMU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2xoL2xadzBwdnZTekNzTnpDUUxYM0ZkZUpkN1VWVUI1cE1GNXZiNUs5ajRV?=
 =?utf-8?B?RzdKMXplY21MQURQNUdwa04xNnQrb3R3NkljWmxtbFYrUkNXZXFhcGVmQWlM?=
 =?utf-8?B?SlZKbXFKNjBWbXJnQ0FPWmVyc210MDE2QkQ0dXNZT2ZTdTFJUGU0MHlBQnVa?=
 =?utf-8?B?UzVjbFNxcXpwYkVxaHYxY05uMlhjQk9XSVJIWS9UU2lpcm5Pc3d0NS9zQUw5?=
 =?utf-8?B?UGtiSHp3ZkxFTXEreGJ2cS81SzRCU2N3eG50NUVDY0loTlNMZVE5NnBha1Bu?=
 =?utf-8?B?MDZXUUptQ2wvN1pueE1rYll4QUFCVitVTkxTUkFDaHJiMk5GVkZBS28wVGdp?=
 =?utf-8?B?ZlVQM1JjZUhiQzlHUXlmdnNoWFVJb3cvMk1QNEk3Tkh6VnE4SlBMd1drT3E4?=
 =?utf-8?B?UXNwUEhtdGE0UUpsMUc2cmdRKzY0ZlIyckFKcFd0VHJWVEhoc2VzMHlxbEZR?=
 =?utf-8?B?aVNlUlkya3hDZTZwOWZNaDgzdU5mNElhTjhORzE3N2NCVDE3UWUxWTNkRE4z?=
 =?utf-8?B?dWR6YjY3SEwyU0czYVZJazFsOXJEeE1Ibkc0SHovSHFNQktvQ1FIUDRVWXhD?=
 =?utf-8?B?NEpWT3U3RHZ3cEFwRHltT0pUeDJaM3YvdkczV0htYjM3aEtsQkJ4Nk9PVXR4?=
 =?utf-8?B?cTBnVXlKd0xiN0N6VG1nRnppaEppYkhFY0J5dG1KTHJmcDhvVXp3SFNxZjV4?=
 =?utf-8?B?SlQybFJrTDZlRm5UVEhOdnhrRCs2NWdXUWpqMng4RnB5Z2RibGhxZlRVTUhN?=
 =?utf-8?B?WlNZRmc4czV5Qmo2cmYxSEVxa3VLRTBlV1A0eG5RUEh3Yy93NWFJSWhoZnZx?=
 =?utf-8?B?ZGNBVDZyNzZvclJJS2RsSWpIYUN0dURmMmNqMzV2S2hTTGd5S1pOZkdJcEY5?=
 =?utf-8?B?cTZSdXhmN050MlZYUGlOZDJLeitycGxKSUgxeTRYL2VMUGYzZklPNkVrZWlq?=
 =?utf-8?B?V0VpZXk5R2VreHVONVR2WUtDOFlkMXdUZ1Y1U1FXWjNUdTQzZ2ljSzdLcEhv?=
 =?utf-8?B?VllGdGxndGFubDBPNVd2UkpBSlA0QkpNeWgyVXJTZTR2cUdDellpWHlRMmNk?=
 =?utf-8?B?Qm9hZGg5Rk1vYzRsY1hNVnFMZXc0QWdyekd0R214Y1dQSyttL1BUZXB3bkpX?=
 =?utf-8?B?SEZQeEFxR2pDRGxoR1dNYndkb0taeE5kMEZ6K2E0cm5BWU1MNDVFaXFGSXVy?=
 =?utf-8?B?akRWOTlZcWVIZlVua2RQaWZoMGExQ3I0WG9lcjNFVitqSmQ4bUdGWHFjZ3J6?=
 =?utf-8?B?UGtDbzJ5UnkrU2dvQXFkSDRia0VVR0xWZzRNU0p3NGFQdHlYMjR1YStWRmhu?=
 =?utf-8?B?SlpmM2pKYk1CMHNnWGdRa2dMQngrN1g0YUwvdnVOQnJUWVBLeWtwL1VTV2Qz?=
 =?utf-8?B?VndUR25hSnFrbm1aS2pyeEFHQnRXOHZCY0VNaE10QzB5K0RwQUJ6RVVBWjE4?=
 =?utf-8?B?WkpEUnVuMVRDYlFOK0NTMFNsd2h0ODZhZFdaL2FZS2xBQUNyK0dnc3FBaUxa?=
 =?utf-8?B?a0lQdVQzY3dMMXduOWIwNUxkYTRWbE8rZEFVdWNJWm8xSHZRTkVnM1prZ1hi?=
 =?utf-8?B?RFcyNFZBMnphNndNQ2VaSm5FTEJvNTI4eC83NW1yTmM5ZENtL0xvQU5QMTJu?=
 =?utf-8?Q?btMd8p6BmyDk95SjO7J+OzWsrwRBNgdXRS4LWXP02Rqw=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0fd3d4-7aef-4ddf-eedd-08dc864b11b1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:06:56.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR05MB9474

On Thu, Jun 06, 2024 at 01:35:15PM +0100, Andre Przywara wrote:
> On Thu, 6 Jun 2024 19:58:07 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
> 
> Hi Chen-Yu,
> 
> > On Thu, Jun 6, 2024 at 5:52 PM Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > On Wed,  5 Jun 2024 13:53:39 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > >  
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > >
> > > > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
> > > > clamshell form-factor. The key differences between the SP and the Plus
> > > > is a lid switch and an RTC on the same i2c bus as the PMIC.
> > > >
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
> > > >  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++++
> > > >  2 files changed, 147 insertions(+), 1 deletion(-)
> > > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > > > index 0db7b60b49a1..00bed412ee31 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > @@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
> > > > -dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > > > new file mode 100644
> > > > index 000000000000..a1d16b65ef5d
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > > > @@ -0,0 +1,145 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +/*
> > > > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > > > + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> > > > + */
> > > > +
> > > > +#include <dt-bindings/input/gpio-keys.h>
> > > > +#include "sun50i-h700-anbernic-rg35xx-plus.dts"
> > > > +
> > > > +/ {
> > > > +     model = "Anbernic RG35XX SP";
> > > > +     compatible = "anbernic,rg35xx-sp", "allwinner,sun50i-h700";
> > > > +
> > > > +     gpio-keys-lid {
> > > > +             compatible = "gpio-keys";
> > > > +
> > > > +             lid-switch {
> > > > +                     label = "Lid Switch";
> > > > +                     gpios = <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE7 */
> > > > +                     linux,can-disable;
> > > > +                     linux,code = <SW_LID>;
> > > > +                     linux,input-type = <EV_SW>;
> > > > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > > > +                     wakeup-source;
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +/delete-node/ &r_rsb;  
> > >
> > > I don't think deleting the *RSB* node is right here, if at all, I'd expect
> > > status="disabled", and then maybe deleting the axp717 node within?
> > > Or maybe factor the AXP node out into a separate file, and include it from
> > > the -2024.dts and from this one?  
> > 
> > Doesn't quite work because the unit address is different.
> 
> Ah, right, good point. It's a bit annoying because the node name itself is
> mostly irrelevant, but I see that this wouldn't pass validation.
> 
> > > Or move every board to I2C?  
> > 
> > Doesn't this depend on the bootloader also running in RSB mode? My memory
> > is a bit foggy on this, but IIRC we did a conversion on some other boards
> > before?
> 
> In the SPL we use I2C only, mostly because we have an SPL capable I2C
> driver already.
> In U-Boot proper we use whatever the DT says, that should work like in the
> kernel.
> In TF-A we used to have one hardcoded transport per SoC, and that happens
> to be RSB everywhere at the moment, but I have a patch series [1] to
> determine this dynamically, via the DT. As it stands, that chooses the
> transport by looking at the PMIC (I2C for the AXP313, RSB for the AXP717
> or AXP305), but I think it's fairly easy to check for the status property
> of both RSB and I2C, or look at the parent node of the AXP node to find
> the transport protocol to use.
> I will sketch something up.
> 
> Chris has plans to auto-detect the exact Anbernic model in U-Boot, and
> switch to the right DT then automatically. IIUC I2C devices play a role in
> this, so switching to I2C for all Anbernic models would make this more
> viable.
> It just leaves a bit of a bitter taste that we now model the DT after this
> particular requirement, and not after what the hardware looks like.

I honestly would rather simply have the Linux tree use i2c for all
devices, to be honest. For at least the Anbernic RG35XXSP device
as well as a device I haven't started yet (the RG28XX) there is an
external rtc on the same i2c bus as the PMIC at 0x51. This device
does not appear to be present on the other devices.

I'm thinking that with U-Boot I can use a single bootloader and load
one of five device trees based on what happens when I check for this
RTC at 0x51, when I attempt to communicate with mmc1 (wifi), and when
I check GPIO PE11. I don't need to actually use the wifi in U-Boot,
just find out if it's there.

This means basically:

GPIO PE11 - RG35XX-H
RTC present, wifi present - RG35XX-SP
RTC present, wifi missing - RG28XX
RTC missing, wifi missing - RG35XX-2024
RTC missing, wifi present - RG35XX-Plus

Regardless of this though, I will find a way to manage no matter what
we decide here. But for the RG35XX-SP and RG28XX (not yet submitted) I
want to run the PMIC off i2c so I can use the external RTC too.

Thank you,
Chris.

> 
> Cheers,
> Andre.
> 
> [1] https://review.trustedfirmware.org/q/topic:%22h616_pmics%22
> 
> > > What do people think about this?  
> > 
> > "disabled" in RSB node and deleting the axp717 node is probably the right
> > thing to do.
> > 
> > 
> > > Cheers,
> > > Andre
> > >  
> > > > +
> > > > +&r_i2c {
> > > > +     pinctrl-0 = <&r_i2c_pins>;
> > > > +     pinctrl-names = "default";
> > > > +     status = "okay";
> > > > +
> > > > +     axp717: pmic@34 {
> > > > +             compatible = "x-powers,axp717";
> > > > +             reg = <0x34>;
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells = <1>;
> > > > +             interrupt-parent = <&nmi_intc>;
> > > > +             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > > > +
> > > > +             vin1-supply = <&reg_vcc5v>;
> > > > +             vin2-supply = <&reg_vcc5v>;
> > > > +             vin3-supply = <&reg_vcc5v>;
> > > > +             vin4-supply = <&reg_vcc5v>;
> > > > +
> > > > +             regulators {
> > > > +                     reg_dcdc1: dcdc1 {
> > > > +                             regulator-always-on;
> > > > +                             regulator-min-microvolt = <900000>;
> > > > +                             regulator-max-microvolt = <1100000>;
> > > > +                             regulator-name = "vdd-cpu";
> > > > +                     };
> > > > +
> > > > +                     reg_dcdc2: dcdc2 {
> > > > +                             regulator-always-on;
> > > > +                             regulator-min-microvolt = <940000>;
> > > > +                             regulator-max-microvolt = <940000>;
> > > > +                             regulator-name = "vdd-gpu-sys";
> > > > +                     };
> > > > +
> > > > +                     reg_dcdc3: dcdc3 {
> > > > +                             regulator-always-on;
> > > > +                             regulator-min-microvolt = <1100000>;
> > > > +                             regulator-max-microvolt = <1100000>;
> > > > +                             regulator-name = "vdd-dram";
> > > > +                     };
> > > > +
> > > > +                     reg_aldo1: aldo1 {
> > > > +                             /* 1.8v - unused */
> > > > +                     };  
> > 
> > You can drop all the unused ones, unless you plan to include *this*
> > file from another one and use those nodes/labels.
> > 
> > ChenYu
> > 
> > > > +
> > > > +                     reg_aldo2: aldo2 {
> > > > +                             /* 1.8v - unused */
> > > > +                     };
> > > > +
> > > > +                     reg_aldo3: aldo3 {
> > > > +                             /* 1.8v - unused */
> > > > +                     };
> > > > +
> > > > +                     reg_aldo4: aldo4 {
> > > > +                             regulator-min-microvolt = <1800000>;
> > > > +                             regulator-max-microvolt = <1800000>;
> > > > +                             regulator-name = "vcc-pg";
> > > > +                     };
> > > > +
> > > > +                     reg_bldo1: bldo1 {
> > > > +                             /* 1.8v - unused */
> > > > +                     };
> > > > +
> > > > +                     reg_bldo2: bldo2 {
> > > > +                             regulator-always-on;
> > > > +                             regulator-min-microvolt = <1800000>;
> > > > +                             regulator-max-microvolt = <1800000>;
> > > > +                             regulator-name = "vcc-pll";
> > > > +                     };
> > > > +
> > > > +                     reg_bldo3: bldo3 {
> > > > +                             /* 2.8v - unused */
> > > > +                     };
> > > > +
> > > > +                     reg_bldo4: bldo4 {
> > > > +                             /* 1.2v - unused */
> > > > +                     };
> > > > +
> > > > +                     reg_cldo1: cldo1 {
> > > > +                             /* 3.3v - audio codec - not yet implemented */
> > > > +                     };
> > > > +
> > > > +                     reg_cldo2: cldo2 {
> > > > +                             /* 3.3v - unused */
> > > > +                     };
> > > > +
> > > > +                     reg_cldo3: cldo3 {
> > > > +                             regulator-always-on;
> > > > +                             regulator-min-microvolt = <3300000>;
> > > > +                             regulator-max-microvolt = <3300000>;
> > > > +                             regulator-name = "vcc-io";
> > > > +                     };
> > > > +
> > > > +                     reg_cldo4: cldo4 {
> > > > +                             regulator-min-microvolt = <3300000>;
> > > > +                             regulator-max-microvolt = <3300000>;
> > > > +                             regulator-name = "vcc-wifi";
> > > > +                     };
> > > > +
> > > > +                     reg_boost: boost {
> > > > +                             regulator-min-microvolt = <5000000>;
> > > > +                             regulator-max-microvolt = <5200000>;
> > > > +                             regulator-name = "boost";
> > > > +                     };
> > > > +
> > > > +                     reg_cpusldo: cpusldo {
> > > > +                             /* unused */
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     rtc_ext: rtc@51 {
> > > > +             compatible = "nxp,pcf8563";
> > > > +             reg = <0x51>;
> > > > +     };
> > > > +};  
> > >
> > >  
> 
