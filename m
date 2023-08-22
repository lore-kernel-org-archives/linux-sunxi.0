Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22F410E9
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 01:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgpahN21F21lzdj+1CKtlFBdg97ZHNwK4bvYx6glScS4w1t5HzBRamt2EzqHZsQbxSlgJ7ZpgLQzoX+6VcWBvj+Nyg6b0ZLhYl4Y6TY6adYSXCWk48Y3mGmLsIRALi1ueEPU+iYqZB9pN0UDDxQjy5Z8xc0oQHw4idiDgsWZb6hNfHVgCTjlno8PM8AnAuYzsKOYjCA8tKkhH9LLmPBCsVirX4tikR8Ae9a0FhDtMycKr195pTWfM0aZDcApnpFjYWXIoqZj6imXczJTtbNDnxEpNZhbC252jfN5E3mGPbTXWRDmK1nFDHW4M3LCWs381eV+ommuh+S0CED/+4hZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQjx3V/wwxBG4eFiNVg5gh+qushP4MLls7MvwRTb2h8=;
 b=jBZwAKza+Ab+gpChPxipbv6qvm9BeYt5bW8iCtFRIlPeZX/WncDvZ6acx9RG+iuZ93IHbUBkpsQ1Au2pMClHVC+s+om5TLfXfyBZcnS6LXo2l2cokiR4ESf+TVxepPpUosPW3P0O2jqS6/wspN5QgHeoL6ItMhWQQ1s9g2P28Iie6peMbw5g/FUSC2TU7Ixo/F+l+QU/pksRohNdsQ4Ge1X2l6sb8IjDPRcJOU9RB3Z1TuEClQbwfbsLDd22ANeiwLoLXuzEGbrUaNKtTkm1bIAsApMe3P0zWEO8wl0oO9SoOrn6drmwq6oNOs2WgER9L0km6ett+nkWsjZX1WulQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQjx3V/wwxBG4eFiNVg5gh+qushP4MLls7MvwRTb2h8=;
 b=eEgzC9yYl5l9wVJNbP8d62mWn/AIvXDvgopWAiLbWbO7pktCKK9snN4iEc2E36ChjIorY8RAMMxqIHdpaOhs1CBN+dJKHV+iKp59jhvuQOmoH4UbLoJxBSgcOUdLcIRY0mBP+G+f2+DsveA4tjbM+o2QRgfuk7pHO6daMkasGMBbsO+x0KlGk4EWm1JSxKjCTNwD5mubjUSOiE64V/tG9OJ78e/rLhHnwGzsS36UbpEV03Mn7jcGfdhrNLhg/ntDX+n04DxNbzlVI2ns1VozLo01wM2CJMzYIHKDTp0kjKrZgnJrcSX+kenP5ZFOpt/VJ6ovtqKx5Fes0snFK6v5qw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA2PR06MB7483.namprd06.prod.outlook.com (2603:10b6:806:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 01:18:17 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 01:18:17 +0000
Date: Mon, 21 Aug 2023 20:18:12 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: uwu@icenowy.me, Chris Morgan <macroalpha82@gmail.com>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	mripard@kernel.org, me@crly.cz, samuel@sholland.org,
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V2 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB534246706706B72A68BB162FA51FA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
 <20230819032105.67978-5-macroalpha82@gmail.com>
 <20230819230335.45ad16de@slackpad.lan>
 <SN6PR06MB53425735CA49EF8C30FDCF4DA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20230821180607.26cf73ca@donnerap.manchester.arm.com>
 <SN6PR06MB5342BEB778837A389F943C2FA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20230822001739.4ce579a7@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822001739.4ce579a7@slackpad.lan>
X-TMN: [TQKWJkz0WUc7Oe33jd7qovhxm50zqJiI]
X-ClientProxiedBy: SN1PR12CA0052.namprd12.prod.outlook.com
 (2603:10b6:802:20::23) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZOQM1G+QRPYV/f8H@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA2PR06MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b87b921-9cad-4629-b267-08dba2ada9d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DDGpLKt6f9Mr1muMiBW0au1Rn0GJilj1aaLGh6C1V3J8+Yj9FBM/dYR7NoaFWNO1e2y4IEfN/2p+RVEFmRJ+to5SVLamNgl9StNOhJfpoFI2w3VRFuIqcwaVeL3v8fQLumFis6ur0je3457XRPVt4+rbkM1Lx7l4tqfS4jhYCDrAIg4BN5V2vSvA92qIrVAu60QMZhmN8aXk8MH4zuMWaHnH+eCgKCxivZveKtxBRMsDSOxcEr+B4BGBmSwz9BN8tx4j5ha1+r3pHSTSFMf9A56nG/ng2SSKP6c8pPejy+NdB361b3b4ClIq7TsNeDwD4SDJzUy4cnUOmcbuAj/XExoVWXFZDAoIHXYhUXz7U1nvbHgPfzbP3Z8T345IAJ4tKYF6IDarT2KqOVtodXzzoZ3nGwcdrvG1hJXTV/KX1/YZKHGVlx5FlL7+X4uQUAzvBMzlsADlXa2mjWWIsVWQ9iFtyTfJvJx/kzGKJ8dudI6p+IdDKniYzklGI9yKXT5fR4CT1R4bnAoNz58VqyCamICW6/tHjJZIeki98s3ymP89Id+zdnQ6kR/cbuzLVUk0ZzMnz9J6/SWetiXi19dY2w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KgTJ1Lc+bRQYRwprvFEvMvK2tR/Ju7U3YNrj4C9Umzjwig39HwYMz1TiHIxr?=
 =?us-ascii?Q?aZH7ilRJk23OIlBE40r2rNCk9hvmvnxNhNJAnhQtY01PWL53+qBGiUHbCa1U?=
 =?us-ascii?Q?v2O6zixk1wkqIm0z/edlc+ezH3TmYLpoh35XHf7QqxIodaOtA1TamsMBQSpQ?=
 =?us-ascii?Q?KR5SBZlpRIx2YjzEiaysBVMcC0uxqiYuf2IznFJOh6w1DJdo25hHPaWp4LOV?=
 =?us-ascii?Q?S4Omk6uBDiPZBkK0rZwYMfTFrXmfxjd5QyNlfBQHNIGXv2tWQ6VET8GPjG4b?=
 =?us-ascii?Q?N1h9MUqL8sUIvFo5t24T0v54x+x+0r/gAXOu8RYgG18Kyjyw+jHDgrDiaUzd?=
 =?us-ascii?Q?S680XSYKQsXE6tj1wcIdnPWIdzNsrEXhccfIWQO5QuUYcRsA8c1Pcwis/Wky?=
 =?us-ascii?Q?z5A7V3V83Aj9dxd8uvkfe4z73fpy0oCV/zSbroC12NmpBtR66+LpxK3fB4hS?=
 =?us-ascii?Q?eDZvjjHtpwtjFqWehVm0NKAk1R5d5o4sx5OXKKuZes4aYES9h0LLZn4OQyxX?=
 =?us-ascii?Q?+nhVhJrR2x/D6EoHdzhXcnJbYQY7i7+BYU9bEHvarIXwQekTT3uWnmxOSK7b?=
 =?us-ascii?Q?W71hCj2qDaulS6qbsh0jSLJ8XuTAj55Wyp1uvgrR09uv+dLmzdaA2mOaJ+5m?=
 =?us-ascii?Q?kNfswWP4qGvmiOWKrqMcyUGDpUFxSzf+Al5STM0VcLRqFGBzGw+3yQMD39UQ?=
 =?us-ascii?Q?bRRkIaY8ftt4twpxAO9l25uH5TD7HvWaaotnNLeRJTZDhmOlB3KPHbKC31HT?=
 =?us-ascii?Q?BKUb46r92E8BvtimYM37He6idVLI0IEyMw/aSe+5r4cvexJhdLqyBxWPzvHn?=
 =?us-ascii?Q?fC55NZyKo1fr54yuPCb+rKUUNJD3qqI20kG3PRr5LgLywpPKoGdJLsHiXqyV?=
 =?us-ascii?Q?UaggBagOb3iLIAkjTwUjdOXjqYm9l/RnNwOqYQ7y9Ay2XspgNcxcWXd/p6JU?=
 =?us-ascii?Q?+FxgZD0R6ZnfS9t2EW0EtD9cEAfMQMPUPpIKEn/V7IiS171OWs/5DVc60uUD?=
 =?us-ascii?Q?98ZVM1u7Pv4xbOPll4jTXxGrQV6SdsimTJQoGCSPTwYuTKzw/c6ROniuI8Kn?=
 =?us-ascii?Q?fKqEEtkRZoIocARULtjaOMhqN4EDzkSBusejrPLy9dU22V7WUVYkLqSrQRR2?=
 =?us-ascii?Q?L/+9Ye+a7iDNaVNRJ2CrnLJlJkpmp64imVppoUZIcy8zJDl7NSmGcpuF/gil?=
 =?us-ascii?Q?maJYlITPK0yYVopHTzjvaGzwUR6W0ILHj5sm9BM4rF2Xlb6xb9SMBD/9QbM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b87b921-9cad-4629-b267-08dba2ada9d7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:18:17.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR06MB7483

On Tue, Aug 22, 2023 at 12:17:39AM +0100, Andre Przywara wrote:
> On Mon, 21 Aug 2023 12:43:13 -0500
> Chris Morgan <macromorgan@hotmail.com> wrote:
> 
> Hi,
> 
> > On Mon, Aug 21, 2023 at 06:06:07PM +0100, Andre Przywara wrote:
> > > On Mon, 21 Aug 2023 10:38:38 -0500
> > > Chris Morgan <macromorgan@hotmail.com> wrote:
> > > 
> > > Hi Chris,
> > >   
> > > > On Sat, Aug 19, 2023 at 11:03:52PM +0100, Andre Przywara wrote:  
> > > > > On Fri, 18 Aug 2023 22:21:05 -0500
> > > > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > > > 
> > > > > Hi Chris,
> > > > > 
> > > > > thanks for the update!
> > > > >     
> > > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > > 
> > > > > > The Anbernic RG-Nano is a small portable game device based on the
> > > > > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > > > > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > > > > > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > > > > > SoC.
> > > > > > 
> > > > > > The SPI display is currently unsupported, as it will either require
> > > > > > a new tinydrm driver or changes to the staging fbtft driver to support.
> > > > > > I plan on working on a tinydrm driver to properly support it. The USB-C
> > > > > > port currently only works as a peripheral port, however in the BSP
> > > > > > kernel it also works in host mode allowing included USB-C headphones
> > > > > > with a built-in DAC to work.
> > > > > > 
> > > > > > Working:
> > > > > > - SDMMC
> > > > > > - UART (for debugging)
> > > > > > - Buttons
> > > > > > - Charging/battery/PMIC
> > > > > > - Speaker
> > > > > > - USB Gadget
> > > > > > 
> > > > > > Not working:
> > > > > > - Display
> > > > > > - USB Host
> > > > > > 
> > > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > > ---
> > > > > >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> > > > > >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 219 ++++++++++++++++++
> > > > > >  2 files changed, 220 insertions(+)
> > > > > >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > > > 
> > > > > > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> > > > > > index 589a1ce1120a..2be83a1edcbb 100644
> > > > > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > > > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > > > > @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> > > > > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > > > > >  	sun8i-t3-cqa3t-bv3.dtb \
> > > > > >  	sun8i-v3-sl631-imx179.dtb \
> > > > > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > > > > >  	sun8i-v3s-licheepi-zero.dtb \
> > > > > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > > > > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > > > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > > > new file mode 100644
> > > > > > index 000000000000..c49b5431d04e
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > > > @@ -0,0 +1,219 @@
> > > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > > +
> > > > > > +/dts-v1/;
> > > > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > > > +#include "sun8i-v3s.dtsi"
> > > > > > +#include "sunxi-common-regulators.dtsi"
> > > > > > +
> > > > > > +/ {
> > > > > > +	model = "Anbernic RG Nano";
> > > > > > +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > > > > > +
> > > > > > +	aliases {
> > > > > > +		serial0 = &uart0;
> > > > > > +	};
> > > > > > +
> > > > > > +	backlight: backlight {
> > > > > > +		compatible = "pwm-backlight";
> > > > > > +		pwms = <&pwm 0 40000 1>;
> > > > > > +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> > > > > > +		default-brightness-level = <11>;
> > > > > > +		power-supply = <&reg_vcc5v0>;
> > > > > > +	};
> > > > > > +
> > > > > > +	chosen {
> > > > > > +		stdout-path = "serial0:115200n8";
> > > > > > +	};
> > > > > > +
> > > > > > +	gpio_keys: gpio-keys {
> > > > > > +		compatible = "gpio-keys";
> > > > > > +
> > > > > > +		button-a {
> > > > > > +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-A";
> > > > > > +			linux,code = <BTN_EAST>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-b {
> > > > > > +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-B";
> > > > > > +			linux,code = <BTN_SOUTH>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-down {
> > > > > > +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "DPAD-DOWN";
> > > > > > +			linux,code = <BTN_DPAD_DOWN>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-left {
> > > > > > +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "DPAD-LEFT";
> > > > > > +			linux,code = <BTN_DPAD_LEFT>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-right {
> > > > > > +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "DPAD-RIGHT";
> > > > > > +			linux,code = <BTN_DPAD_RIGHT>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-se {
> > > > > > +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-SELECT";
> > > > > > +			linux,code = <BTN_SELECT>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-st {
> > > > > > +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-START";
> > > > > > +			linux,code = <BTN_START>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-tl {
> > > > > > +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-L";
> > > > > > +			linux,code = <BTN_TL>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-tr {
> > > > > > +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-R";
> > > > > > +			linux,code = <BTN_TR>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-up {
> > > > > > +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "DPAD-UP";
> > > > > > +			linux,code = <BTN_DPAD_UP>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-x {
> > > > > > +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-X";
> > > > > > +			linux,code = <BTN_NORTH>;
> > > > > > +		};
> > > > > > +
> > > > > > +		button-y {
> > > > > > +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > > +			label = "BTN-Y";
> > > > > > +			linux,code = <BTN_WEST>;
> > > > > > +		};
> > > > > > +	};
> > > > > > +};
> > > > > > +
> > > > > > +&codec {
> > > > > > +	allwinner,audio-routing = "Speaker", "HP",
> > > > > > +				  "MIC1", "Mic",
> > > > > > +				  "Mic", "HBIAS";
> > > > > > +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&cpu0 {
> > > > > > +	clock-frequency = <1296000>;    
> > > > > 
> > > > > I understand that the kernel complains when this is missing, but I
> > > > > think this property is some ancient legacy, as there is no such thing
> > > > > as a fixed CPU frequency anymore. That becomes evident with the OPPs
> > > > > below. So please remove it.    
> > > > 
> > > > Okay, I'll remove it. I always try to make sure dmesg log is as error
> > > > free as possible, and yes, that's the only reason I put this here.  
> > > 
> > > Yeah, I hear you. I actually pushed
> > > https://github.com/devicetree-org/devicetree-specification/commit/c2cdd4a0db1d79f
> > > into the DT spec, so we have some leg to stand on when trying to remove
> > > the kernel message. Just need to find the time to make this patch ...  
> > 
> > Good to know. I'll drop this then. Thank you.
> > 
> > >   
> > > > >     
> > > > > > +	clock-latency = <244144>;
> > > > > > +	operating-points = <
> > > > > > +			/* kHz    uV */
> > > > > > +			1296000 1200000
> > > > > > +			1008000 1200000
> > > > > > +			864000  1200000
> > > > > > +			720000  1100000
> > > > > > +			480000  1000000>;    
> > > > > 
> > > > > Don't you need a cpu-supply property to point to the regulator in
> > > > > charge of providing the core voltage? Otherwise I don't see how the
> > > > > kernel would be able to adjust the voltage, to program the OPPs.
> > > > >     
> > > > 
> > > > I'll add cpu-supply. Based on the schematic it looks like the
> > > > cpu_supply is the DCDC2. DCDC2 is also hooked up to some other inactive
> > > > pins according to the schematic but I can't see those pins on the
> > > > SoC datasheet (so maybe it's just a schematic quirk?).  
> > > 
> > > Mmmh, what are the names of those pins?
> > > 
> > > In general I wonder if you should enable DVFS if the vendor firmware
> > > doesn't do that. Especially for a retro gaming device, I wonder if some
> > > code relies on the CPU running at the same frequency all the time, so that
> > > timing loops stay stable, and other real-time properties are still met.
> > > 
> > > On the other hand, without DVFS the chip will run at at constant 1.08GHz
> > > (as set up by mainline U-Boot), which might leave some performance on the
> > > table. And it might affect the runtime, since this is battery powered. What
> > > frequency does the BSP firmware run with?  
> > 
> > According to the schematic the names are vdd-sys[n] where n is between
> > 0 and 5, as well as ephy-vdd. I see in the datasheet there are 6
> > different vdd-sys pins, so I assume this is those.
> > 
> > BSP U-Boot looks to be basically mainline forked from 2020.10, and
> > doesn't set any values for the CPU clock (suggesting whatever default
> > U-Boot uses today for the v3s is what it's running at).
> > 
> > I'll just drop all this for today and we can iterate on it later if it
> > is needed.
> 
> Fair enough! Out of interest, what is the voltage for DCDC2, when you
> boot into Linux? U-Boot's default for the AXP209 DCDC2 is 1.4V, which
> is too high. The Pinecube sets it to 1.25V, which sounds more
> reasonable.
> So given your OPPs mentioned above, can you make the range 1.0-1.2V in
> the DT, and use CONFIG_AXP_DCDC2_VOLT=1200 in U-Boot's defconfig?
> You could still put the cpu-supply property in the DT, but comment it
> out, with a comment about this being untested and potentially
> problematic due to the shared supply.
> I think this should be the best between describing the hardware and
> sticking to the (better tested) BSP behaviour.
> 
> Alternatively you could add the OPPs above, but use 1.2V everywhere,
> this would give you the opportunity to adjust the frequency, without
> disturbing VDD_SYS. And add the real voltages in a comment.

I actually see that the value isn't set in U-Boot at all, which is
interesting. I guess it will be what we make it, and in this case I'd
like to follow the schematic I guess at 1.25v. I'll just set it at that
and make sure when I do the U-Boot porting I set it correctly there
too.

> 
> > >   
> > > > > > +};
> > > > > > +
> > > > > > +&i2c0 {
> > > > > > +	status = "okay";
> > > > > > +
> > > > > > +	gpio_expander: gpio@20 {
> > > > > > +		compatible = "nxp,pcal6416";
> > > > > > +		reg = <0x20>;
> > > > > > +		gpio-controller;
> > > > > > +		#gpio-cells = <2>;
> > > > > > +		#interrupt-cells = <2>;
> > > > > > +		interrupt-controller;
> > > > > > +		interrupt-parent = <&pio>;
> > > > > > +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>;
> > > > > > +		vcc-supply = <&reg_vcc3v3>;
> > > > > > +	};
> > > > > > +
> > > > > > +	axp209: pmic@34 {
> > > > > > +		reg = <0x34>;
> > > > > > +		interrupt-parent = <&pio>;
> > > > > > +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> > > > > > +	};
> > > > > > +
> > > > > > +	pcf8563: rtc@51 {
> > > > > > +		compatible = "nxp,pcf8563";
> > > > > > +		reg = <0x51>;
> > > > > > +	};
> > > > > > +};
> > > > > > +
> > > > > > +#include "axp209.dtsi"
> > > > > > +
> > > > > > +&battery_power_supply {
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&mmc0 {
> > > > > > +	broken-cd;
> > > > > > +	bus-width = <4>;
> > > > > > +	disable-wp;
> > > > > > +	vmmc-supply = <&reg_vcc3v3>;
> > > > > > +	vqmmc-supply = <&reg_vcc3v3>;
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&pio {
> > > > > > +	vcc-pb-supply = <&reg_vcc3v3>;
> > > > > > +	vcc-pc-supply = <&reg_vcc3v3>;
> > > > > > +	vcc-pf-supply = <&reg_vcc3v3>;
> > > > > > +	vcc-pg-supply = <&reg_vcc3v3>;
> > > > > > +};
> > > > > > +
> > > > > > +&pwm {
> > > > > > +	pinctrl-0 = <&pwm0_pins>;
> > > > > > +	pinctrl-names = "default";
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&reg_dcdc2 {    
> > > > > 
> > > > > Any reason your dropped the regulator-name property? This would help to
> > > > > identify what this regulator is used for and would explain why it needs
> > > > > to be always on.
> > > > > In v1 this was "vdd-cpu-sys-ephy", are you sure about this name? I
> > > > > guess it supplies the CPU, but I wonder if there are other users of
> > > > > this rail, which would possibly throw a spanner into DVFS. So what's the
> > > > > "ephy" doing here? And can you adjust the voltage, if this also driving
> > > > > VDD-SYS? What does the BSP kernel do?
> > > > >     
> > > > 
> > > > This rail appears to supply the CPU (vdd-cpu) SYS (vdd-sys) and
> > > > vdd-ephy. The ratings for each of these according to the datasheet are
> > > > between -0.3v and 1.3v (CPU/SYS) or 1.4v (for the EPHY). The BSP kernel
> > > > has this as variable between 1v and 1.25v, but it doesn't appear to
> > > > have DVFS enabled. I can change the range back to 1/1.25v since it
> > > > supplies the CPU so we can enable DVFS; the datasheet isn't clear
> > > > what vdd-sys or vdd-ephy do, but in the case of EPHY we aren't using
> > > > that feature at least (and these voltages are within range).  
> > > 
> > > Right, if the board doesn't use the EPHY, then the voltage changing
> > > shouldn't matter, as long as it's within range.
> > > As for VDD-SYS: I am not so sure about this, I only seem to see GPU
> > > and SYS coupled together (in the mainline DTs), but not CPU and SYS.
> > > And VDD_SYS having the same range is one thing, but its voltage changing
> > > at runtime is another topic: I don't really know if the chips can cope
> > > with that, or if the system become unstable.
> > >   
> > > > Do you think I should keep the cpu-supply and frequency stuff in place,
> > > > or should I drop it all instead?  
> > > 
> > > If the BSP doesn't use that, I'd rather drop the DVFS nodes, or maybe
> > > deactivate them, so users can bring them back at their own discretion?
> > >   
> > 
> > I'll just drop it for the moment and keep it simple.
> > 
> > > > > > +	regulator-always-on;
> > > > > > +	regulator-max-microvolt = <1250000>;
> > > > > > +	regulator-min-microvolt = <1250000>;
> > > > > > +};
> > > > > > +
> > > > > > +&reg_dcdc3 {    
> > > > > 
> > > > > Same here, please provide a speaking name, or a comment explaining
> > > > > why this must be always on. There is no need to enumerate every user,
> > > > > just "vdd-3v3" seems to be a common name for that regulator.
> > > > >     
> > > > 
> > > > I'll go with vcc-io like the BSP, unless you feel strongly otherwise.
> > > > The regulator appears to power all the different IO pins on the SoC
> > > > and basically everything else that uses 3.3v that isn't the RTC.
> > > >   
> > > > > > +	regulator-always-on;
> > > > > > +	regulator-max-microvolt = <3300000>;
> > > > > > +	regulator-min-microvolt = <3300000>;
> > > > > > +};
> > > > > > +
> > > > > > +&reg_ldo2 {    
> > > > > 
> > > > > Same here, name or comment, please.
> > > > >     
> > > > 
> > > > You got it.
> > > >   
> > > > > > +	regulator-always-on;
> > > > > > +	regulator-max-microvolt = <3000000>;
> > > > > > +	regulator-min-microvolt = <3000000>;
> > > > > > +};
> > > > > > +
> > > > > > +&spi0 {    
> > > > > 
> > > > > Can you add a comment here mentioning the not-yet-supported display?
> > > > > And you should specify the pins used here.
> > > > >     
> > > > 
> > > > The SPI pins are defined in the main v3s file.  
> > > 
> > > Ah, right, sorry, I missed that.
> > >   
> > > > Additionally I have a
> > > > TE pin (GPIO PB1) and a RESET pin for the panel (GPIO PB2). The RESET
> > > > pin looks like it has an external pull-up to 3.3v. The RS pin on the
> > > > panel is wired to MISO, otherwise CS on the panel goes to CS on the
> > > > SoC, CLK to CLK, and MOSI to MOSI. Everything but the RESET panel
> > > > is pulled to ground (I think, still not perfect at schematics).  
> > > 
> > > Those other pins would be described in the (upcoming) panel DT node. The
> > > SPI pins should indeed be already activated, courtesy of pinctrl-0 in the
> > > .dtsi.  
> > 
> > >   
> > > > > Cheers,
> > > > > Andre
> > > > > 
> > > > >     
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&uart0 {
> > > > > > +	pinctrl-0 = <&uart0_pb_pins>;
> > > > > > +	pinctrl-names = "default";
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&usb_otg {
> > > > > > +	dr_mode = "otg";  
> > > 
> > > Just seeing this: if you have "otg" here, wouldn't you need to specify the
> > > ID pin (usb0_id_det-gpios) in the usbphy DT node? Because otherwise the
> > > kernel won't know when to switch between host and peripheral mode.
> > >   
> > 
> > I've added it for v3 and gotten OTG working fully now.
> > 
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&usb_power_supply {
> > > > > > +	status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&usbphy {
> > > > > > +	status = "okay";
> > > > > > +};    
> > > > >     
> > > > 
> > > > Also, I did another comparison with the BSP kernel and realized I was
> > > > missing the OHCI/EHCI and now OTG is working (at least the extcon
> > > > shows host when it has a device attached and not host when it's hooked
> > > > to my computer).  
> > > 
> > > Wait, that's odd. What OHCI/EHCI? DT nodes? I don't find any in the V3s
> > > .dtsi, and normally you don't need them for OTG anyway.
> > > There is some oddity with the PHY switching code, but I think what
> > > should work is the OTG operation, with an ID pin.  
> > 
> > Check lines 254 and 263 of the decompiled BSP device tree. Basically if
> > I add an ohci and ehci node host mode works, but without it then it
> > doesn't.
> 
> Ah, right, I mixed something up for a moment, looking again this should
> be the story:
> The V3s USB PHY is a dual-route PHY (as set in the Linux driver for
> that compatible string), so the driver will try to switch to the HCI
> controller pair for host mode, and will not try the MUSB's host mode.
> Curiously we don't have the OHCI/EHCI nodes in our sun8i-v3s.dtsi, I
> wonder why? Was that just not needed so far, because the USB port was
> always peripheral only?
> 
> Icenowy, can you shed some light on this?
> It looks like the V3s is like the first USB port of the H3, so we
> should have both an HCI pair, plus the OTG node?
> 
> Cheers,
> Andre
> 
> > 
> > https://gist.github.com/macromorgan/e1f9e8e2275ae7e53c45fa864148ffed#file-sun8i-v3s-anbernic-dts-L254
> 
> 
> > 
> > > 
> > > Cheers,
> > > Andre  
> > 
> > Thank you,
> > Chris
> > 
> 
