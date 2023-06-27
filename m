Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2066.outbound.protection.outlook.com [40.92.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B391308A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 17:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXSNkYEfh1t0jzKY8jipaZI8buL2QyePB7DYh9gs1ACUV8aqDrYhGUEJ/nS9W/UHSwXx9ouulP7j6sjAKz4xGtiVs80l9bNENLNYpyT8F2pTZxjd1ny1/+Selv+BAppiyYoIGK/XGylPoZru5AXpxJ8UVEtLRci8hG9QkVmj+hNBy123JcHYuTXDkb+peYVompssBe1PSm4seXD4/gNMQiQAqKzchSQqWwhkywc3L2wGkHXx+KXb35r5uTnxsDgssypPPYRwQ+coxZCGNf3VmR3Qlt6M/GUBitv/I69YuRoeW86sJvk1Fn03NsHPm28xNie6CS21PORNkTuNWzePAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGiDqfKAtg/4hAzp0Oo9IfTSipyUA1523XHA/CfmcdE=;
 b=BXVFBYAXq3b729QebJwm6zw0I4o78m1mUIF/KYGbyQTUFkKJ8UNOt0MihVxt+V70/d7zrz5KZ133khIzC2GeSSTFH8SOIn7HZB5R+w44hKBQKAInALHiB/+WVr/ibv3prSbFQCF1AhP43RZseOTZea+wzFoFXTK+CdDtRaeOJq8MJs3dPYfFzk2GKFhrorjBiREO8OmobsFHPr+VVTTP1cBwaaOQleAl6MJuSAveCK8oRIHgiP+WU+zjrjl3vnqOky5LZC/rNlG8MBw/PtEuLH5xI2twwYrk+NHtLrg2hot2FQI2cscN5SbgBa5RUdV9xMCy5IaeScYEaqHJClphTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGiDqfKAtg/4hAzp0Oo9IfTSipyUA1523XHA/CfmcdE=;
 b=YYIkyPCO0sP9RdwKGzQDNBiJx+6Jo2DJIXZyOXoUW5TAnbTMFq6zb4GGlIM5Un4F7BZF9/hg6u0OAE6zimSbrjJEh6gl6pekaW2IMK01r5ipzbFH3WQiKPXF+6brbIJLYgwjzJoBM0RfAoq6pIkbdQiO3/pxKmn4yurgeIIOMxhlqgWG21ordg9/qQUtngsptaTF/pb3zRgSznCQwsH4GUQflbqExTj68dMYUOYMy710IqE6ViaT/EBv0VNeUvgotEKeCOKfbcRtdsnpG8fYfNzlQ9cJhANp9/GBz+EaAF0lWtEG2NEpzdHCLmbJwzvFv6wDcDgjiw8HTS6qwvnCcA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW4PR06MB8316.namprd06.prod.outlook.com (2603:10b6:303:12b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Tue, 27 Jun
 2023 17:49:08 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109%3]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 17:49:08 +0000
Date: Tue, 27 Jun 2023 12:49:05 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
	samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB53426B6D9456C68AAE8C51B0A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
 <20230620200022.295674-4-macroalpha82@gmail.com>
 <20230621105228.41ca9fcf@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621105228.41ca9fcf@donnerap.cambridge.arm.com>
X-TMN: [kOqZTintp2z96qjd4gwo+oPbV8zg8fvE]
X-ClientProxiedBy: SA0PR11CA0191.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::16) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZJshEf7b3Qp2GQJ8@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW4PR06MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: cabe386d-2427-45a0-a2b1-08db7736ce79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CotATP0iUsOWq1Zl/9EgHu2DsmWEH5dxD67OF+X7L2MgnfgxHXD3JXh2nirOibW1zJWj24d6rW13ZZD3e7PzG2xuEYlFlE5Al8kcGfw/xFfgvL3PDrgbqsXEMiPv0VHAWFAimgDkFIgxxjPDzBlEZAjLA40w2ciKdr9VAaeL5Aw68eC35kT0lbLy4cLZFNiczPM3XZJ09SJlE8XKazr5n+5uipcQv8OOnuVYGPvTQwxXvFFkQ3eaJ7zaeHEnIUUp2TlBYy5f6tbyxiIDZNtjv07sSFavQjND+YBjQ9jK6TSj9NrDJ5x9emcLV/iln3nanFg1rK2D1r2q28E+/l+Jf6/gWWcWH3HhXPbqocPNXseTNBAlMVVSJVrderZ8gr++yoIkbjoeLuBV3R1+GtxaHqGDQ3+oiUJ+/tDlw+8L/DnhPZ1FGQfX16YTCBWBv1S18L14ZZbfOsoYx8vw4RfyMpitqplOqMTl7PSqs3TIFCeOdJB4E3JTZrvORNR3eDH3JU19A/eaVQA2JVALyxGvwB1oxPO5X5SB7MNIwAzXQjQ3wJHreNUUs4rVjN9Uy+Hy
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jw7MrcryeJ/HxO+TR+6FrnzL1m+bqMLb2p4VFj3QU0r++/BOm1MFbTICFh7x?=
 =?us-ascii?Q?rD6Dzvo5rpk91H3tqh+EGHaD7q2yS4Ql/zJoyuYmod11qB3e4h5UnVQKjgIL?=
 =?us-ascii?Q?IeCKzPXrWF0Nb2XUH02BFgDxgABx2M/3m/ybFDzSCENeNu1HMuUiiy+nK5S+?=
 =?us-ascii?Q?7l5yoxV+T/tcZ4XGjshCf1WpR4H8b771B6x8jtmmPMKPgOwpRwsyz5i0Z2mb?=
 =?us-ascii?Q?jJLTR9OUdfDoLuQbgdKpumZT9f+PVtS43EaS1qOhzx3F6LmpUT+j4I9oVSAP?=
 =?us-ascii?Q?8jddHDyRR3gp/pG3TNvQ4wamQjN3pD+PsSYz0HtnJvKcs49/gPLc8TyfETxG?=
 =?us-ascii?Q?8xRMWCeWRl5O/8kr384N5fhuyUHElU4tU77tWVImua/xUmQZ67/ulF4v59Lh?=
 =?us-ascii?Q?qTWtHd/GrZwVrJi/m6eXYyvXDXxSYGWkqQGrOD5RJ+HkD4cCyeDR1JeGAP4h?=
 =?us-ascii?Q?br9goyg1s9Iaxb6bvsTF0pmC/w8ODtW4BYwm4+l9StRvGClF0NVaRfKPnEjy?=
 =?us-ascii?Q?RVaVlMP/ks6rV+RFpGOVkG8M9LPaVz6mdZTYjsFITdeA2O7Q6Ietbveh50C/?=
 =?us-ascii?Q?DpJtrbnK7APZAJTOsKHdMUXVxGsBNG6T4OODpw/1jwi56HGoLVlPVjE3th/Y?=
 =?us-ascii?Q?nwtBylJm4X2PDN16z1si+6ojn9SWXLOq6kwlFJ2a4x1eilX1S1tfUWBHteId?=
 =?us-ascii?Q?HO9EX20dAobXYkHMAoEJbW/gIqQ3XkrzgkpLjnO/q+BAC7Z6XJ9Ju0jwmdJL?=
 =?us-ascii?Q?5G48K9xfeMDLz4wTsSrk+/E52d0UwW80V/3MHyEIKsVXJX++u45SB86WiCxA?=
 =?us-ascii?Q?+QEV31dIG7IgMPsQ01cXA3MwLwRf9vvwdRFyzcghOeFUZAFRCuI74FRvwLEg?=
 =?us-ascii?Q?/iiltDW+yomHN9lmWWkO0A0tYZHuI7eHhgUcA1Ln36dfkSjA/TyLD+raOb1R?=
 =?us-ascii?Q?IC1E3c2N0R5yBFB8wN4wl2lDn7yiRvdwzO8vdBQ0e9LWcR8S0BRQBhyQggVA?=
 =?us-ascii?Q?LpG+EvjodLvhSKBku+bXEbH8C1m2W/z6SkMZrIIHlUVFG7UJCNsL/mlZXlCl?=
 =?us-ascii?Q?2unl7KbyA6BDf1dEPl0gmlFtBsT9bLDpxpm19m/PWH7DYj2JspVd8t1VvAkO?=
 =?us-ascii?Q?G770+S8Ol7lgiyIOU022ciz3FO24+uyqkOfRUZmNvpL5NrGfwthJ77pznC/F?=
 =?us-ascii?Q?Nuo0bcjqdlyQzCt9M/W97TqM3XBZmYRKBcvCXnq3B2/0nUdXW/7+y6VTEjg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cabe386d-2427-45a0-a2b1-08db7736ce79
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 17:49:08.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8316

On Wed, Jun 21, 2023 at 10:52:28AM +0100, Andre Przywara wrote:
> On Tue, 20 Jun 2023 15:00:22 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi Chris,
> 
> thanks for sending this!
> Is there some schematics for this somewhere? Or was this based on
> information gathered from the stock firmware?
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Anbernic RG-Nano is a small portable game device based on the
> > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > input, a single mono speaker, a 240x240 SPI controlled display,
> > and a USB-C OTG port for power. The SoC includes 64MB of RAM and
> > an SD card slot for booting.
> > 
> > The SPI display is currently unsupported, as it will either require
> > a new tinydrm driver or changes to the staging fbtft driver to support.
> > I plan on working on a tinydrm driver to properly support it. There
> > also may be a missing mux in the audio path that must be discovered and
> > defined before audio will be fully working (internal speaker does not
> > work yet, external headphones untested).
> > 
> > Working:
> > - SDMMC
> > - Buttons
> > - Charging/battery/PMIC
> > 
> > Not working:
> > - Display
> > - Audio
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/sun8i-v3s-anbernic-rg-nano.dts   | 209 ++++++++++++++++++
> >  2 files changed, 210 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 59829fc90315..31418b594222 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1414,6 +1414,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> >  	sun8i-t3-cqa3t-bv3.dtb \
> >  	sun8i-v3-sl631-imx179.dtb \
> > +	sun8i-v3s-anbernic-rg-nano.dtb \
> >  	sun8i-v3s-licheepi-zero.dtb \
> >  	sun8i-v3s-licheepi-zero-dock.dtb \
> >  	sun8i-v40-bananapi-m2-berry.dtb
> > diff --git a/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > new file mode 100644
> > index 000000000000..ead315e8fc38
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > @@ -0,0 +1,209 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include "sun8i-v3s.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +/ {
> > +	model = "Anbernic RG Nano";
> > +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> 
> Is that serial console actually usable, so are there pins or pads on the
> PCB? Have you opened it up?
> 

There are tx and rx pads exposed, and about a cm away a gnd pad also
exposed. Sadly I ripped the solder pad off of mine, so remaining
debugging is going on via ssh over USB gadget mode.

> > +	};
> > +
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pwm 0 40000 1>;
> > +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> > +		default-brightness-level = <11>;
> > +		power-supply = <&reg_vcc5v0>;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	gpio_keys: gpio-keys {
> > +		compatible = "gpio-keys";
> > +
> > +		button-a {
> > +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-A";
> > +			linux,code = <BTN_EAST>;
> > +		};
> > +
> > +		button-b {
> > +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-B";
> > +			linux,code = <BTN_SOUTH>;
> > +		};
> > +
> > +		button-down {
> > +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "DPAD-DOWN";
> > +			linux,code = <BTN_DPAD_DOWN>;
> > +		};
> > +
> > +		button-left {
> > +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "DPAD-LEFT";
> > +			linux,code = <BTN_DPAD_LEFT>;
> > +		};
> > +
> > +		button-right {
> > +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "DPAD-RIGHT";
> > +			linux,code = <BTN_DPAD_RIGHT>;
> > +		};
> > +
> > +		button-se {
> > +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-SELECT";
> > +			linux,code = <BTN_SELECT>;
> > +		};
> > +
> > +		button-st {
> > +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-START";
> > +			linux,code = <BTN_START>;
> > +		};
> > +
> > +		button-tl {
> > +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-L";
> > +			linux,code = <BTN_TL>;
> > +		};
> > +
> > +		button-tr {
> > +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-R";
> > +			linux,code = <BTN_TR>;
> > +		};
> > +
> > +		button-up {
> > +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "DPAD-UP";
> > +			linux,code = <BTN_DPAD_UP>;
> > +		};
> > +
> > +		button-x {
> > +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-X";
> > +			linux,code = <BTN_NORTH>;
> > +		};
> > +
> > +		button-y {
> > +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +			label = "BTN-Y";
> > +			linux,code = <BTN_WEST>;
> > +		};
> > +	};
> > +};
> > +
> > +&codec {
> > +	allwinner,audio-routing = "Headphone", "HP",
> > +				  "Headphone", "HPCOM",
> > +				  "MIC1", "Mic",
> > +				  "Mic", "HBIAS";
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	gpio_expander: gpio@20 {
> > +		compatible = "nxp,pcal6416";
> > +		reg = <0x20>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		#interrupt-cells = <2>;
> > +		interrupt-controller;
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>;
> > +	};
> > +
> > +	axp209: pmic@34 {
> > +		reg = <0x34>;
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> > +	};
> > +
> > +	pcf8563: rtc@51 {
> > +		compatible = "nxp,pcf8563";
> > +		reg = <0x51>;
> > +	};
> > +};
> > +
> > +#include "axp209.dtsi"
> > +
> > +&ac_power_supply {
> > +	status = "okay";
> > +};
> > +
> > +&battery_power_supply {
> > +	status = "okay";
> > +};
> > +
> > +&mmc0 {
> > +	broken-cd;
> > +	bus-width = <4>;
> > +	disable-wp;
> > +	vmmc-supply = <&reg_vcc3v3>;
> > +	vqmmc-supply = <&reg_vcc3v3>;
> > +	status = "okay";
> > +};
> > +
> > +&pwm {
> > +	status = "okay";
> > +};
> > +
> > +&reg_dcdc2 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <1400000>;
> > +	regulator-min-microvolt = <1000000>;
> 
> I think since it's not referenced anywhere, and it's always-on, it should
> be just a single voltage, so the same value for both min and max. I guess
> at least this voltage here needs to be fixed anyway, and it wouldn't
> really work with a different value? Does the bootloader set something up
> there, or is it the default value that's just kept?

It's always on at 1.25v according to the schematic. I also plan to move
this devicetree to mainline U-Boot, so best to get it right here and
there. Do you think just setting 1250000 for min and max works then?

> 
> > +	regulator-name = "vdd-cpu-sys-ephy";
> > +};
> > +
> > +&reg_dcdc3 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3450000>;
> > +	regulator-min-microvolt = <3000000>;
> 
> Same here, I guess: a single voltage.
> If in doubt, you could pick the current voltage from
> /sys/kernel/debug/regulator/regulator_summary and use that.

This is a fixed 3.3v. Honestly I think this is output for the entire
"3.3v rail" if I'm reading the schematics right.

> 
> > +	regulator-name = "vcc-io-ephy-mcsi-usb";
> > +};
> > +
> > +&reg_ldo1 {
> > +	regulator-name = "vcc-rtc";

Here's one I could use some advice on actually. The existing driver
has a constraint holding this at 1.3v, however I need to run it at
3.3v since it's hooked up to an external RTC that needs 3.3v. Any
thoughts on how to tell the regulator "always be 1.3v, unless a
voltage is explicitly specified")?

> > +};
> > +
> > +&reg_ldo2 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3300000>;
> > +	regulator-min-microvolt = <2800000>;
> 
> same here.

Fixed 3.0v, again if I'm reading correctly.

> 
> > +	regulator-name = "avcc-pll";
> > +};
> > +
> > +&spi0 {
> > +	status = "okay";
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-0 = <&uart0_pb_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&usb_otg {
> > +	dr_mode = "otg";
> > +	status = "okay";
> > +};
> > +
> > +&usb_power_supply {
> > +	status = "okay";
> > +};
> > +
> > +&usbphy {
> > +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> > +	status = "okay";
> 
> So in the commit message you say "USB-C for power", but this here
> describes a full featured USB port. So does that work? Can you use it as a
> gadget, but also as a host?

Yes, it's an OTG port with the ID pin pulled to ground. I have it set
as a peripherial on mine so I can ssh via ethernet gadget (since I
broke my solder pads for serial), but it also acts as a host for the
included "USB audio dongle" which is just a simple USB DAC (and not
using any analog pins).

Also, I noticed that usb0_id_det-gpios is wrong, so I changed it.

> 
> Otherwise this looks alright to me.
> 
> Cheers,
> Andre
> 
> 
> > +};
> 
