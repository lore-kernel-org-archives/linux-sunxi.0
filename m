Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F18FBF1
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Jun 2023 22:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKJ0nWk+cP/YpCsF9KvY3MrXzoMmBjKIo6EWyGLGX2AUUBSn1C8Q33W0g4fapzKU0Vs5eaGxH0CibE+nHbOyeodN798+HqCyHG06SGk6WjwpVEvglpwibBBpfhBPcaxr1pod4xCNdUYqM0HKmc2LaSXWlkWDYSjzRKinBOSaxvi+nKcUmCxbXu5o9YWPEkVrbdDHwmuHboG2IQaBA4FnKLDvTIgDwMc4sJznBNP3zwaXAoQFHTen1i+B9GINGnXa7LYzVlD0+UwBl02DnhEEygXsYQkBssgK8adcJhX80fkD0VPP5d6aiHnSa+tVcDnPpYR3MSUMUv6peNJO/Bl2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/uIwHtSh/0/Q35HH97rPY1VVMVcBwYh1jfp3Kq8ayQ=;
 b=SQHLQGpSywbeN1BGiQnvVm6iQ9VRwOXBvbnJvkMuPHVQJD62R/FtAm0iULAziNF/aAIyXwnGosiPPPcqfgs+bgIm4foMP0fby8Kxm1/XgTSUuJk9HiOUlhVmozR5aUIqHFwX4kdozeUyHLQCtYxEE2dFpr4T3i+2Z5dxgVlq+4ewWRrcfJgrdEJSWDuJ9PpLcNfbYJZxNGNAe8cpwuABpu3OueIX0uxkon/7vdoAVtsStvlBZMdqMWaviTKDZp3eNz9z6ELs1LPwaCG2lxpOnh5Agx7IS/tetHfMVvtu5KZwAAKSIS8uWZutcdJCeCECtltxIzsieVmUvL9P2102XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/uIwHtSh/0/Q35HH97rPY1VVMVcBwYh1jfp3Kq8ayQ=;
 b=tf7Y6gPkVL+zpUhgnDyPUrknN6O23q4eU9u/UyPDVOWGTAXeF9VvJuWJ71Eh4pzEWR9zYOY3EdpwHCF4jnWP16WLIrTCN9iDIRRZCH+Yh7rMMOtV36y3CqxJVBNLty7WG2uygo6FcUfVnKrOdCje58ltE8Em+rRNZbEYYuO/wtWBjbwQJ93NXewaiZzkHtQ5iocUMqnTcu6094qgL2yFuWro3Ea09vmCDwFy/cgDXodjNUA/O2cMeOLqK8MBQ+Rhbwa1hcIg+aVrLBpPYcy9omsAsbdGZdW/sDP9yPnD3NF3Y2SH48UBN90iBP+Le5kQCrt3eG0hIX20XL0xr76vOQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA2PR06MB7340.namprd06.prod.outlook.com (2603:10b6:806:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 22:21:57 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109%3]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 22:21:57 +0000
Date: Thu, 29 Jun 2023 17:21:53 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
	samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB53425FA486E62A8428CFFEB7A525A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
 <20230620200022.295674-4-macroalpha82@gmail.com>
 <20230621105228.41ca9fcf@donnerap.cambridge.arm.com>
 <SN6PR06MB53426B6D9456C68AAE8C51B0A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20230629203410.660eb9a4@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629203410.660eb9a4@slackpad.lan>
X-TMN: [HImPdF6xPQAgS62xdwqTcLFcZ37LAb5f]
X-ClientProxiedBy: SN7PR04CA0076.namprd04.prod.outlook.com
 (2603:10b6:806:121::21) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZJ4EAR0IdzLR4eMG@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA2PR06MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: bc40a0f5-10de-4f7a-16e6-08db78ef4003
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l6httV+STIo6rQ/XAhFvAm+P9jJIDTxa3O6ZPU67EEf4SIlgdzJTmyVPQbUrEbFcHc3MYwhlPYaveP7ZdTbCLiO1u9VrhG5yca+w/ulgsEgIE4HJAtbcCMCB7hvcEl5ERIqe88MavWgzn30kQ8Upd/r8qAWHjnwzWpNHNdYGZB9bh46x/R8eQkq+3cWiVdz7d6UbTfFfWdTV31s4YwItyWyCHNOTkaciJuxMgKKT4iPsd2B295HPZBb7qqDCci+s8gE4l8ab+kIiWhxb3341xtua9CpQXp9rXFZ7ipBVkDFLXidd0HbJEerDuyoH3tPvLMsMrqU2JW7CDCslIkknv9tG8fILQzpgP6Zf8tozduQBBSalFjWOMv7e0E7wkFtufDXd5+SVHEfQeBVE7+/qAxiRY5TzHcy++x3SpRtqyYS3Mo3RjVu7epNkah/iib/rGge3sRKQBS7ukT2IJsn7Q0MkksO3PPBCQGKS1SzYneUBiM3S0wJyjO18HES9MzlcHUfJo87zbGA8lq+1Kp511VwXqXzEQPcXRyoENqq4Bi3Koix8NA0xEceilGJbZnJ0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qwaw4exwvrmSnvlWdtp4gc0UGobeCR8PnZN+KeP4mSAsu9nNpTUristnnge+?=
 =?us-ascii?Q?GcVBeAqah/G8RQSjhPxG3cW8E1u6/t5h7iUfvppAZiDCVk0WY7MUO93UfwVf?=
 =?us-ascii?Q?enqFJ5/6TlVlwyzN1SGLUpEYY98RnLsoxQq8+iA+H7XFh1uVNBXr6kXF4h6y?=
 =?us-ascii?Q?3hA76bQwZ9nP0kmSnWERejcIsr8Rr6WTCCe07cvUbYdufVMsjVAEH4VdswlW?=
 =?us-ascii?Q?etWIwwF55oPTm2HMzYD1Wiz8Maiwp+HpekiEWSQmk1rP8c9Br5twQSjM5mkr?=
 =?us-ascii?Q?66D0sATOpeubwIEOuTRn11z3xchDTekGkSE637oe2dnsyVva3dybc8TME1pF?=
 =?us-ascii?Q?NUjslHoFrMHNkfNsH7ixw3CWFbCHiJcd3VDy6wKLYfj2O+STcA+ZDEUsTN7U?=
 =?us-ascii?Q?Cm7hF3PsNwLmPN7FI7KqGyuul1CrcdzoEp3XxbdoHl5mPfyrfmHkAlQnpd3Z?=
 =?us-ascii?Q?po1IU5L/9TPC+HE0SyyD6EtCJ7AL4UzWy5tvUl1JLKNM1awzXC+tSPFjzmBC?=
 =?us-ascii?Q?ITF7ITvSSkcFMevzVHhObcLnFZbJtMKAXE4ofBkrUmZ0isdprplCkcgmtHAF?=
 =?us-ascii?Q?mX5g1ZOa1bLkGllqNnsEfoMJ75PbVQFpvz3GXpAKvkkxzTtUqFxJZ3PoipJA?=
 =?us-ascii?Q?sev2rfqdY+/tFgOMfpbynzupCrhR8oPcmbaXDihbYJ/AxCW0UgwBaGKTNeGn?=
 =?us-ascii?Q?AlfxthTp8yG6/yFmjbb3MzZ8fOuQ7VP2HBHSctj8dPPQC6ihxTtbtKCWpSJq?=
 =?us-ascii?Q?aqJdAJApQI3gO4YkLCYzSuJxLtDIiAWgeoS6BS6YBYbdT5XDBDkXtXtcAIWy?=
 =?us-ascii?Q?FuJwdwMTFI6rddukWfkAe1p3ND80sp3N7400ohU4Loh+XfB9q5Xem9noygZm?=
 =?us-ascii?Q?G/qeBQOWlV9if+wUqyd4K1/DEcBz775IxeJQkdi444SWZncCq0KcRaLGTDTA?=
 =?us-ascii?Q?jdbTZGabs2VhtAjSByK2jyj6XHynj+8bInZPkzFWL0SJVx0LuFUyJx7cwsHM?=
 =?us-ascii?Q?vvur0lz2sWNjU5ZmWWZa//d436d7Oz3CApJHNE5mUy5L5OPcO0BOleR8PbJ7?=
 =?us-ascii?Q?TBW9kOuePZo6g2efmdoLkP6Hn4HGZ0g4GOg48/lrqw2KXs/kvDSRrekdbsxV?=
 =?us-ascii?Q?gB+oRyEdx9gixQFsjjlhbW9DGwezj3zjtymqXiNF73AScQuJ5AYQ4g3E6STv?=
 =?us-ascii?Q?BazuvnCJf1Y/DzzeSz3/VwhbcxvrGzLYAkBMIYgA3W733OiwitaJbX0Hi1E?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bc40a0f5-10de-4f7a-16e6-08db78ef4003
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 22:21:57.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR06MB7340

On Thu, Jun 29, 2023 at 08:34:10PM +0100, Andre Przywara wrote:
> On Tue, 27 Jun 2023 12:49:05 -0500
> Chris Morgan <macromorgan@hotmail.com> wrote:
> 
> Hi Chris,
> 
> > On Wed, Jun 21, 2023 at 10:52:28AM +0100, Andre Przywara wrote:
> > > On Tue, 20 Jun 2023 15:00:22 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > 
> > > Hi Chris,
> > > 
> > > thanks for sending this!
> > > Is there some schematics for this somewhere? Or was this based on
> > > information gathered from the stock firmware?
> > >   
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > The Anbernic RG-Nano is a small portable game device based on the
> > > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > > input, a single mono speaker, a 240x240 SPI controlled display,
> > > > and a USB-C OTG port for power. The SoC includes 64MB of RAM and
> > > > an SD card slot for booting.
> > > > 
> > > > The SPI display is currently unsupported, as it will either require
> > > > a new tinydrm driver or changes to the staging fbtft driver to support.
> > > > I plan on working on a tinydrm driver to properly support it. There
> > > > also may be a missing mux in the audio path that must be discovered and
> > > > defined before audio will be fully working (internal speaker does not
> > > > work yet, external headphones untested).
> > > > 
> > > > Working:
> > > > - SDMMC
> > > > - Buttons
> > > > - Charging/battery/PMIC
> > > > 
> > > > Not working:
> > > > - Display
> > > > - Audio
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  arch/arm/boot/dts/Makefile                    |   1 +
> > > >  .../boot/dts/sun8i-v3s-anbernic-rg-nano.dts   | 209 ++++++++++++++++++
> > > >  2 files changed, 210 insertions(+)
> > > >  create mode 100644 arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > > > 
> > > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > > index 59829fc90315..31418b594222 100644
> > > > --- a/arch/arm/boot/dts/Makefile
> > > > +++ b/arch/arm/boot/dts/Makefile
> > > > @@ -1414,6 +1414,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> > > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > > >  	sun8i-t3-cqa3t-bv3.dtb \
> > > >  	sun8i-v3-sl631-imx179.dtb \
> > > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > > >  	sun8i-v3s-licheepi-zero.dtb \
> > > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > > diff --git a/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > > > new file mode 100644
> > > > index 000000000000..ead315e8fc38
> > > > --- /dev/null
> > > > +++ b/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > > > @@ -0,0 +1,209 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +
> > > > +/dts-v1/;
> > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > +#include "sun8i-v3s.dtsi"
> > > > +#include "sunxi-common-regulators.dtsi"
> > > > +
> > > > +/ {
> > > > +	model = "Anbernic RG Nano";
> > > > +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > > > +
> > > > +	aliases {
> > > > +		serial0 = &uart0;  
> > > 
> > > Is that serial console actually usable, so are there pins or pads on the
> > > PCB? Have you opened it up?
> > >   
> > 
> > There are tx and rx pads exposed, and about a cm away a gnd pad also
> > exposed. Sadly I ripped the solder pad off of mine, so remaining
> > debugging is going on via ssh over USB gadget mode.
> 
> Good, thanks, then it should be indeed in the DT.
> 
> > > > +	};
> > > > +
> > > > +	backlight: backlight {
> > > > +		compatible = "pwm-backlight";
> > > > +		pwms = <&pwm 0 40000 1>;
> > > > +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> > > > +		default-brightness-level = <11>;
> > > > +		power-supply = <&reg_vcc5v0>;
> > > > +	};
> > > > +
> > > > +	chosen {
> > > > +		stdout-path = "serial0:115200n8";
> > > > +	};
> > > > +
> > > > +	gpio_keys: gpio-keys {
> > > > +		compatible = "gpio-keys";
> > > > +
> > > > +		button-a {
> > > > +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-A";
> > > > +			linux,code = <BTN_EAST>;
> > > > +		};
> > > > +
> > > > +		button-b {
> > > > +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-B";
> > > > +			linux,code = <BTN_SOUTH>;
> > > > +		};
> > > > +
> > > > +		button-down {
> > > > +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "DPAD-DOWN";
> > > > +			linux,code = <BTN_DPAD_DOWN>;
> > > > +		};
> > > > +
> > > > +		button-left {
> > > > +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "DPAD-LEFT";
> > > > +			linux,code = <BTN_DPAD_LEFT>;
> > > > +		};
> > > > +
> > > > +		button-right {
> > > > +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "DPAD-RIGHT";
> > > > +			linux,code = <BTN_DPAD_RIGHT>;
> > > > +		};
> > > > +
> > > > +		button-se {
> > > > +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-SELECT";
> > > > +			linux,code = <BTN_SELECT>;
> > > > +		};
> > > > +
> > > > +		button-st {
> > > > +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-START";
> > > > +			linux,code = <BTN_START>;
> > > > +		};
> > > > +
> > > > +		button-tl {
> > > > +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-L";
> > > > +			linux,code = <BTN_TL>;
> > > > +		};
> > > > +
> > > > +		button-tr {
> > > > +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-R";
> > > > +			linux,code = <BTN_TR>;
> > > > +		};
> > > > +
> > > > +		button-up {
> > > > +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "DPAD-UP";
> > > > +			linux,code = <BTN_DPAD_UP>;
> > > > +		};
> > > > +
> > > > +		button-x {
> > > > +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-X";
> > > > +			linux,code = <BTN_NORTH>;
> > > > +		};
> > > > +
> > > > +		button-y {
> > > > +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > +			label = "BTN-Y";
> > > > +			linux,code = <BTN_WEST>;
> > > > +		};
> > > > +	};
> > > > +};
> > > > +
> > > > +&codec {
> > > > +	allwinner,audio-routing = "Headphone", "HP",
> > > > +				  "Headphone", "HPCOM",
> > > > +				  "MIC1", "Mic",
> > > > +				  "Mic", "HBIAS";
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&i2c0 {
> > > > +	status = "okay";
> > > > +
> > > > +	gpio_expander: gpio@20 {
> > > > +		compatible = "nxp,pcal6416";
> > > > +		reg = <0x20>;
> > > > +		gpio-controller;
> > > > +		#gpio-cells = <2>;
> > > > +		#interrupt-cells = <2>;
> > > > +		interrupt-controller;
> > > > +		interrupt-parent = <&pio>;
> > > > +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>;
> > > > +	};
> > > > +
> > > > +	axp209: pmic@34 {
> > > > +		reg = <0x34>;
> > > > +		interrupt-parent = <&pio>;
> > > > +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> > > > +	};
> > > > +
> > > > +	pcf8563: rtc@51 {
> > > > +		compatible = "nxp,pcf8563";
> > > > +		reg = <0x51>;
> > > > +	};
> > > > +};
> > > > +
> > > > +#include "axp209.dtsi"
> > > > +
> > > > +&ac_power_supply {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&battery_power_supply {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&mmc0 {
> > > > +	broken-cd;
> > > > +	bus-width = <4>;
> > > > +	disable-wp;
> > > > +	vmmc-supply = <&reg_vcc3v3>;
> > > > +	vqmmc-supply = <&reg_vcc3v3>;
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&pwm {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&reg_dcdc2 {
> > > > +	regulator-always-on;
> > > > +	regulator-max-microvolt = <1400000>;
> > > > +	regulator-min-microvolt = <1000000>;  
> > > 
> > > I think since it's not referenced anywhere, and it's always-on, it should
> > > be just a single voltage, so the same value for both min and max. I guess
> > > at least this voltage here needs to be fixed anyway, and it wouldn't
> > > really work with a different value? Does the bootloader set something up
> > > there, or is it the default value that's just kept?  
> > 
> > It's always on at 1.25v according to the schematic. I also plan to move
> > this devicetree to mainline U-Boot,
> 
> This will happen anyway: we only *copy* DTs from the kernel tree into
> the U-Boot tree, minus some minor changes (for include paths, for
> instance).
> 
> > so best to get it right here and
> > there. Do you think just setting 1250000 for min and max works then?
> 
> Definitely, especially if the schematic says so, the DT should follow
> this. Ranges are really only useful when the device attached requires
> or supports this, for instance an SD card with voltage switching, or
> the CPU supply. Since there is no reference to that regulator, there is
> no device that could request a change, and the kernel has no clue what
> to actually set it to, it just makes sure that it is in range. Where
> does the range come from in the first place? Schematics or vendor
> code/DT?

The ranges come from the vendor code, the schematics have it hard coded.

> 
> > > > +	regulator-name = "vdd-cpu-sys-ephy";
> > > > +};
> > > > +
> > > > +&reg_dcdc3 {
> > > > +	regulator-always-on;
> > > > +	regulator-max-microvolt = <3450000>;
> > > > +	regulator-min-microvolt = <3000000>;  
> > > 
> > > Same here, I guess: a single voltage.
> > > If in doubt, you could pick the current voltage from
> > > /sys/kernel/debug/regulator/regulator_summary and use that.  
> > 
> > This is a fixed 3.3v. Honestly I think this is output for the entire
> > "3.3v rail" if I'm reading the schematics right.
> 
> Quite likely. The AXP209 datasheet mentions DRAM as the typical
> application, but I think it's used here for the main 3.3V I/O rail.
> Many devices work with 3.0V as well, but if the schematic says 3.3V,
> we should go with this. Can you check the values when running the BSP
> kernel?

Not currently unfortunately. I can't get the output because I no longer
have serial access on the device due to the solder pad I killed. The
schematics have this going to every 3.3v rail though, so I think that's
what this really should be.

>  
> > >   
> > > > +	regulator-name = "vcc-io-ephy-mcsi-usb";
> > > > +};
> > > > +
> > > > +&reg_ldo1 {
> > > > +	regulator-name = "vcc-rtc";  
> > 
> > Here's one I could use some advice on actually. The existing driver
> > has a constraint holding this at 1.3v, however I need to run it at
> > 3.3v since it's hooked up to an external RTC that needs 3.3v. Any
> > thoughts on how to tell the regulator "always be 1.3v, unless a
> > voltage is explicitly specified")?
> 
> Well, that's one case that the driver doesn't really cover: this
> regulator is always-on (by hardware) and has a fixed voltage. Which
> one that is is set by the LDO1SET pin, so software has absolutely no
> control over it. So any value you put in here is actually irrelevant.
> However this is used to report the voltage, so we should relax the
> driver code to also accept 3.3V.
> What happens exactly when you put 3.3V in there? Does the whole driver
> refuse to load, with an error message? Then I am tempted to put 1.3V in,
> plus a comment about the problem.
> If this is just a warning or non-fatal massage, we should use 3.3V.
> 
> And push for a driver fix in both cases.

It's set to vint which according to the axp209 datasheet means it's
3.3v.

When I put 3.3v in there this specific regulator doesn't probe. I get
the following in dmesg:

[    1.659577] ldo1: failed to apply 3000000-3000000uV constraint: -EINVAL
[    1.671718] axp20x-regulator axp20x-regulator: Failed to register ldo1
[    1.678418] axp20x-regulator: probe of axp20x-regulator failed with error -22
[    1.758489] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.

So not only is the regulator failing to load, it seems to be causing
issues with the rtc. (Also, thinking I should disable the built-in
allwinner rtc since there is this external one, yes?).

> 
> > > > +};
> > > > +
> > > > +&reg_ldo2 {
> > > > +	regulator-always-on;
> > > > +	regulator-max-microvolt = <3300000>;
> > > > +	regulator-min-microvolt = <2800000>;  
> > > 
> > > same here.  
> > 
> > Fixed 3.0v, again if I'm reading correctly.
> 
> 3.0V sounds about right for a PLL supply, so yes: please use
> min = max = 3.0V.
> 
> > >   
> > > > +	regulator-name = "avcc-pll";
> > > > +};
> > > > +
> > > > +&spi0 {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&uart0 {
> > > > +	pinctrl-0 = <&uart0_pb_pins>;
> > > > +	pinctrl-names = "default";
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&usb_otg {
> > > > +	dr_mode = "otg";
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&usb_power_supply {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&usbphy {
> > > > +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> 
> Where is this pin connected to, in the USB-C connector? One of the CC
> pins?

None of the above. The vendor tree has this wrong and it's actually
connected to the speaker amplifier. I've corrected this in the next
version to be upstreamed and can confirm audio is 100% working now.

> 
> > > > +	status = "okay";  
> > > 
> > > So in the commit message you say "USB-C for power", but this here
> > > describes a full featured USB port. So does that work? Can you use it as a
> > > gadget, but also as a host?  
> > 
> > Yes, it's an OTG port with the ID pin pulled to ground.
> 
> Do you mean both CC pins? IIRC this means it's hardwired as a
> peripheral (UFP).
> 
> If I ignore the ID pin above, this looks like on the OrangePi Zero2 or
> the MangoPi MQ-R. In those cases we put peripheral in the DT, as this
> is what this connection seems to indicate. That *can* be used a host as
> well, with the "right" cable, but it's not really a well supported
> configuration, so we leave this up to people to change this locally,
> should they really desire so.

I... actually don't have schematics for this part. I'm working off of
the funkey schematics which this device is 99% a clone of, but this
device uses a USB-C connector whereas the Funkey S seems to use a
micro USB.  Sadly I'm flying blind here because not only do I not
have schematics but the BSP device tree is wrong. For now I can confirm
the port works perfectly fine as a peripheral port, however I know
the BSP also has it working as a host (since it came in the box
with a USB-C to analog dongle that is basically a USB sound card).
Hopefully once I get the screen working I can debug it a little easier
without serial.

I've made the necessary changes on the tree otherwise, and can update
the axp209 driver to remove the ldo1 constraint. The last piece I noticed
is a missing clock frequency/clock latency/operating points that dmesg
complains about. Should I add that to the parent sun8i-v3s.dtsi or this
device specific tree?

Thank you.

> 
> Cheers,
> Andre
> 
> > I have it set
> > as a peripherial on mine so I can ssh via ethernet gadget (since I
> > broke my solder pads for serial), but it also acts as a host for the
> > included "USB audio dongle" which is just a simple USB DAC (and not
> > using any analog pins).
> > 
> > Also, I noticed that usb0_id_det-gpios is wrong, so I changed it.
> > 
> > > 
> > > Otherwise this looks alright to me.
> > > 
> > > Cheers,
> > > Andre
> > > 
> > >   
> > > > +};  
> > >   
> > 
> 
