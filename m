Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2069.outbound.protection.outlook.com [40.92.41.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E10393
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Aug 2023 02:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mThgELU9V+JkKRCN6AXLraVvjmaWNMt5k+O5W6huRk4X9xumRc/boWxXYgI4Zosu4gYWUXZ8DGVgIWfEMmnIXqPuXJa3aj2X6WtGIgF/B6VtydBM6uiQLGOmQT6v0znYP6OHUpBKpabxLi+z5LN0Gf7Y8M8tCZJx6Pj9JL4uPAGt76J8OW7jnx0yH9kZMtRLxm5PZy2YOekiUZ41IwymDMV6zNH8wjaxuSgx2oyOtXXeSMmQYJHUQFHKk6v+L1RX8cquK6Tmji5Oyv7hju1spCK3SjpqjlqGl+/d6VtJSKF600O4C9DRtoVBaVj4l3kKDrv94zUol4OEM0OklpfHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVFlvYRFiNEKL7bM4oJY/5z2K1caMJlvbYcySg7+c84=;
 b=Bi+jVC4SJ/PjnKlbrLQmi6AF1iWS9p2tdoEq6gvJJJs4k8i5B1f1+yp40Aclf4NBjdz/SaDm4KqINEyki8LGAYhvlortgXLRPlgiovScTEh0fQ68lenw95+v4dXjgM868OuYCrGYoBXaG2AxlaqCxr3yv/0ceJkhuwVJXIfk2Iqsakay4H3J4ksjc0SMeNC/mzbryWWGi9lwLKixoLh/z/WY5vRunvWESajF9P/y6P2dT9wKeR87J8+JSUKvo9wX+c6FBveGLlQzKCL1cGw2swO+R128tyJR/I6svLUJ1wvWObBUvdS1DX0F04Yuetc9QDNeW++BLUUmw2P5cdlyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVFlvYRFiNEKL7bM4oJY/5z2K1caMJlvbYcySg7+c84=;
 b=njEG2IV2TNuwoVnCGJblI5v6491AdvhYmPCT0Qm4FznK/n9GEy/RhMH+jclDNJ2PfyyfDQYxCVQffDNhaWcxR4xXDu+/XQvR3V/V9gEvv/8EEtt0ESqw4swAshRCjuTDxNaV8LyyDWUScK5KW/uOTvE2by6UrqrRum9x1rzbngwW0LBoRhszm0tsyDZCUOmKUeeZZbfcNRzQVnnbWHKSTF5Zywa14mgyGkXZQZ8oGm4yz/lWAq78IY72j3Kg5Hik9DtB97N2KPurgUfAeFdqMjwJOnpctY38tsDa/CaRUKWHCqj1EIOLFF267d0WGztXPlJ44TfocOScGN2smoMieQ==
Received: from DM6PR06MB5337.namprd06.prod.outlook.com (2603:10b6:5:102::19)
 by SJ0PR06MB8326.namprd06.prod.outlook.com (2603:10b6:a03:38a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Sat, 26 Aug
 2023 02:13:31 +0000
Received: from DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::8791:e7a4:21d0:4e4b]) by DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::8791:e7a4:21d0:4e4b%3]) with mapi id 15.20.6699.032; Sat, 26 Aug 2023
 02:13:31 +0000
Date: Fri, 25 Aug 2023 21:13:26 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, jagan@edgeble.ai,
	heiko@sntech.de, uwu@icenowy.me, daniel@ffwll.ch, airlied@gmail.com,
	sam@ravnborg.org, neil.armstrong@linaro.org, noralf@tronnes.org,
	samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: Re: [PATCH V3 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <DM6PR06MB53370269B18EB0D41EB17C56A5E2A@DM6PR06MB5337.namprd06.prod.outlook.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
 <20230823212554.378403-9-macroalpha82@gmail.com>
 <20230825233758.768630aa@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825233758.768630aa@slackpad.lan>
X-TMN: [dwaH11UnMSorFUWRrLvBOy7arnikegxZ]
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To DM6PR06MB5337.namprd06.prod.outlook.com
 (2603:10b6:5:102::19)
X-Microsoft-Original-Message-ID: <ZOlfxrdVl74lXBor@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR06MB5337:EE_|SJ0PR06MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4c961b-08aa-4de7-42a7-08dba5da0aed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	msUI/mAvTaJzZnQCo+wxc2nbWB8wfuhMK86JwGKAB94TAppn/SG6/MeLE9i8zFX8xiCSViPQdhtvzalCHOHm62mVay0sDDk/O/yLdsAdUFMD62xUEV0GpEa4UyG36Ro0v3tg6bBBDNV2uRq3mmLsWYbaC+Zl/j/F77sQEGLwsdb9vRk2SasGN/Fbx2mh5w2q+uT1VhK9lgHggFeh+4EoUWPDc4u+M47oPD32J0AZhcmlR8sjtwDLma2Cc7mKrvLgdndIK1gBL99kGJ1MTDba15f0Kk2hkknKgYSF0S1U7VnMg+GCSCbeTXYAD1S2RZ1FD5bWbZOz0a42E2Irvn4kOjmQoqWQlqUzlCNkL/2C1lAdQ2C1S2dsLuHz3rNjBsOogNwky6atNqnkxJlhWvVV83DP3ebld+TIgGKOwemA992TP9qI16GB8Io35kU8rcYCS+cmjgSpw68D6BwWeVld18qdN4YlybPou4uDv9x/9QwJT3ywvf48m9aMCESGRS3lNP6wjFTyJj4Wf3h1KZ2+1+Qwj+XgE8FyqgJjyIMGe287AYGOtt4Q1lBvbmuBw8Xm
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S4MYwQ1nogXnkrThIhWmI7vxPmGT8XWBIY6ad5vq4YT2sbQMjfrvHhCY0oMu?=
 =?us-ascii?Q?1JeV6On+bKNciZ6cdA9PJB9Are1tMJX4+MrSOzEP4DsDu7kPTOOBZwoJRZvk?=
 =?us-ascii?Q?IFTJa6/ETc6BNMT13R+8xf9f/VI11+DFmq1yTHG5bBHVd+Fi3KjnZbkd8stA?=
 =?us-ascii?Q?id9CeyGq73dfwMHbuOk8JxE3NIW754ahnAlq2821dCCxO2YtJ3+/pIS9ilmJ?=
 =?us-ascii?Q?7iKhNJ7VLUr47o/+6hm8Q95ltJdiWUsA7is1GEn7BgKB9HRQh4YdjPGLo/8C?=
 =?us-ascii?Q?0vSd0meoR0vykf+dhus8/tGwZ0csWqYBxJ+5A8tZszHhwycq40uyey+xDDV0?=
 =?us-ascii?Q?gpIpQStRg82+ZChRaTsg/OVpAdmMcRW9/vfhDBeqAyaY4bmCnT/oJH9lI9BL?=
 =?us-ascii?Q?8+BSGaK4XV/rEB+bRdEf5SkP9EdXMyQPfEWMDwLuNiZc3UDeJQSVi/K84otR?=
 =?us-ascii?Q?mhy7iVq/DethnlihbICpmyaReelFvvmiyHwwepK+HBfeWdPirJz7JHEpRYfp?=
 =?us-ascii?Q?yl4Y1JRbyiP3jKQl+Xo9XEtrO6T/bOhZAxtsITNyVhJFrHjvgBTVXDWX7GSB?=
 =?us-ascii?Q?+B4rjwdKM9TY8mYUx9t8kh1CGCGohhiWjaADTds5Dp3rO5STKozo47NSVXxp?=
 =?us-ascii?Q?9H7SCkoa9Y+ZPyx3B63oC3nhzre1ZfrZm7n5d+dkbmNeYiLFPDVXnfaczLzk?=
 =?us-ascii?Q?atE2E9cBYmOqiRbzyoNQGmdcNOh4imIdHz+zaAIRfRffCE0U2S/K4Z4jW/Lm?=
 =?us-ascii?Q?KEFMGt8tOaCOFwW2RxqA4oq5mUYyF9rPZMQDCy2R6XKXUdQ4v0w9hjkJJs58?=
 =?us-ascii?Q?2uUkAHl1aS4fHpsY/uYy3NIK04fyDBsEIpr8GwkFioF9SmV89I3nFN2w2EKE?=
 =?us-ascii?Q?bD3JiucFO7K37I0Cd8BhUsdLqZEV1ZR+2bpih4XbZgUr6hrjoC4abGtvKOb3?=
 =?us-ascii?Q?M+PNkUxosZmFMsEgulPNTYPMJQEZDcEKu0ZfyScAf4ejsiIPMVJwzABDi+2I?=
 =?us-ascii?Q?/RVCyu06k0hOEfFnR4AX6ZfqG4e0n7lUg962UNwTzURdLEhi0OWOZbrZ8XKe?=
 =?us-ascii?Q?M3dIyN0juSwGdL/SueYn40Tm9/BS9cQluHGKg3TuGUz5aHm4JwuotC9QinID?=
 =?us-ascii?Q?ccLpTrpNzse2MW4AmbjzPKcMzMmBDkHjr4QAqq/VSR8icBEiiZNpd476KjAA?=
 =?us-ascii?Q?TuGAaR5PGjP97Yx/yYdTSmI91tBNHXQNKdYaERX8Dlwpdz8bPaHfh9zhrSY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-73ede.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4c961b-08aa-4de7-42a7-08dba5da0aed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5337.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2023 02:13:31.5659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB8326

On Fri, Aug 25, 2023 at 11:37:58PM +0100, Andre Przywara wrote:
> On Wed, 23 Aug 2023 16:25:54 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi,
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Anbernic RG-Nano is a small portable game device based on the
> > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > SoC.
> > 
> > Working/Tested:
> > - SDMMC
> > - UART (for debugging)
> > - Buttons
> > - Charging/battery/PMIC
> > - Speaker
> > - USB Host and Gadget
> > - Display (at 60hz)
> 
> So this works now purely in software, by the panel driver constantly
> scanning out a framebuffer region via SPI?
> I wonder if enabling DMA support for SPI then helps the CPU load?
> Though this might be a performance optimisation in a later patch set
> (as it requires adding support for the V3s DMA controller).

I think it's already enabled, at least I see it in
/sys/kernel/debug/dmaengine/summary:
 dma0chan0    | 1c68000.spi:tx
 dma0chan1    | 1c68000.spi:rx

The idle CPU usage and CPU usage when running kmscube don't seem too
terrible, but I'm always open to improvements.

> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 275 ++++++++++++++++++
> >  2 files changed, 276 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> > index 589a1ce1120a..2be83a1edcbb 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> >  	sun8i-t3-cqa3t-bv3.dtb \
> >  	sun8i-v3-sl631-imx179.dtb \
> > +	sun8i-v3s-anbernic-rg-nano.dtb \
> >  	sun8i-v3s-licheepi-zero.dtb \
> >  	sun8i-v3s-licheepi-zero-dock.dtb \
> >  	sun8i-v40-bananapi-m2-berry.dtb
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > new file mode 100644
> > index 000000000000..c2866a884f0e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > @@ -0,0 +1,275 @@
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
> > +	};
> > +
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> > +		default-brightness-level = <11>;
> > +		power-supply = <&reg_vcc5v0>;
> > +		pwms = <&pwm 0 40000 1>;
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
> > +	allwinner,audio-routing = "Speaker", "HP",
> > +				  "MIC1", "Mic",
> > +				  "Mic", "HBIAS";
> > +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
> 
> Can you please specify the pin number (PF6) as a comment here, as done
> in the other DTs? Because reading this "5 6" is not very intuitive.
> Same for the other &pio GPIO references.
> 

Will do. Thank you.

> > +	status = "okay";
> > +};
> > +
> > +&ehci {
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
> > +		vcc-supply = <&reg_vcc3v3>;
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
> > +/* Out of alphabetical order for dependencies sake. */
> 
> I think you don't need this comment here.
> 

Okay, I'll remove it. It just looked out of order so I thought
explaining it was warranted.

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
> > +&ohci {
> > +	status = "okay";
> > +};
> > +
> > +&pio {
> > +	vcc-pb-supply = <&reg_vcc3v3>;
> > +	vcc-pc-supply = <&reg_vcc3v3>;
> > +	vcc-pf-supply = <&reg_vcc3v3>;
> > +	vcc-pg-supply = <&reg_vcc3v3>;
> > +
> > +	spi0_3wire_pins: spi0-3wire-pins {
> > +		pins = "PC1", "PC2", "PC3";
> 
> Huh, interesting, is that because the display chip is purely
> unidirectional? In any case, can you add a comment saying what's going
> on, I guess: "MISO is not connected"?
> And I wonder if "3 wire mode" is somewhat misleading here, since this
> seems to refer to bidirectional SPI over a combined MISO/MOSI line, and
> requires explicit controller support? Which the Allwinner controllers
> lack?
> I think for the node and alias name that's fine, but a comment would
> clear things up.

Yeah, I originally thought that's what it was doing but nope. The MOSI,
CLK, and CS pins are hooked up to the MOSI, CLK, and CS pins of the
panel. The MISO pin is hooked up to the RS/DC pin (which switches
between command and data mode). There's also a reset pin as well as a
tear pin that's hooked to PB1. I'll rename the node to be less
confusing and leave a comment as such. If it turns out we need the tear
pin I'll either find a way to add it to the generic driver I'm using
now or write a driver just for this panel.

> 
> The rest looks fine, though we would still need to fix the USB PHY
> issue.

Yeah, crazy thing that defining it correctly (where OHCI, EHCI and OTG
are all on <usbphy 0>) actually appears to cause it to not work. I got
a single message in my dmesg log that it was setting it to host mode,
and when I unplugged it the extcon kept saying it was host. However,
when I didn't have the phy defined on OHCI/EHCI or I set it incorrect
as <usbphy 1> it worked. Of course defining ldo1 correctly also broke
stuff...

> 
> Cheers,
> Andre
> 
> > +		function = "spi0";
> > +	};
> > +};
> > +
> > +&pwm {
> > +	pinctrl-0 = <&pwm0_pin>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> > +&reg_dcdc2 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <1250000>;
> > +	regulator-min-microvolt = <1250000>;
> > +	regulator-name = "vdd-cpu";
> > +};
> > +
> > +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> > +&reg_dcdc3 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3300000>;
> > +	regulator-min-microvolt = <3300000>;
> > +	regulator-name = "vcc-io";
> > +};
> > +
> > +/*
> > + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> > + * software modified. Note that setting voltage here to 3.3v for accuracy
> > + * sake causes an issue with the driver that causes it to fail to probe
> > + * because of a voltage constraint in the driver.
> > + */
> > +&reg_ldo1 {
> > +	regulator-always-on;
> > +	regulator-name = "vcc-rtc";
> > +};
> > +
> > +/* LDO2 wired into VCC-PLL and audio codec. */
> > +&reg_ldo2 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3000000>;
> > +	regulator-min-microvolt = <3000000>;
> > +	regulator-name = "vcc-pll";
> > +};
> > +
> > +/* LDO3, LDO4, and LDO5 unused. */
> > +&reg_ldo3 {
> > +	status = "disabled";
> > +};
> > +
> > +&reg_ldo4 {
> > +	status = "disabled";
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-0 = <&spi0_3wire_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	display@0 {
> > +		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
> > +		reg = <0>;
> > +		backlight = <&backlight>;
> > +		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>;
> > +		spi-max-frequency = <100000000>;
> > +
> > +		height-mm = <39>;
> > +		width-mm = <39>;
> > +
> > +		/* Set hb-porch to compensate for non-visible area */
> > +		panel-timing {
> > +			hactive = <240>;
> > +			vactive = <240>;
> > +			hback-porch = <80>;
> > +			vback-porch = <0>;
> > +			clock-frequency = <0>;
> > +			hfront-porch = <0>;
> > +			hsync-len = <0>;
> > +			vfront-porch = <0>;
> > +			vsync-len = <0>;
> > +		};
> > +	};
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
> > +	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > +	status = "okay";
> > +};
> 

Thank you,
Chris
