Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2012.outbound.protection.outlook.com [40.92.21.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448D01BDF8
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 15:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyM9zFzDbo7wL4ccvnvdjpu5KhwNvagV/uDnnWMHHqe1O06TEZlQSHhvKVfxjTD4+CsMIbtNB9SN84HV1sEuOAHyP03kmDc4ms1SSsqWgpkEpx1oUpMksuYQCiI83o57gSEdl6ivvHImOsmNJPEywWTg06CkvPsnx5r+MrtEDphvYdc35iY056eYKV3NlcF4nBBomn3Gj3NIGMrk5b3gmi2qYK9bDh3xVVTCBPnbNL4ufI2LUDqLIOVJJRvjxrj05YmBxKbhA5XQUPQOHsRRZ/rsXSlr+7UL7Xc3E8cV8escnvbJuKHlDt0GKvvokmv1wX2V8+9Mefo2MOs/5cJ3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQadqu36J1g47feH1q+43S+OC65x6eaSWC2OOhLJ3KI=;
 b=cWfgvwRRCtY9nKRegD9BihMfia5ZeDspf8ZSDgB2WRJwoJAR05OgL4K81dnqePQe49+j/4ejzDdiHB2PSCdiOnhx9ezkE4mFzd04VXJ2IUq8m9sgr5gexz0HH+1bcUJ02bSyhcVUCjj99AUUJ5JFfq8oBtqzaMy7B875bkWRA4k/Ihe3cHezEKz5h5patGJfAbq4DEVXu/+JSCL3mUYArCxsjNUAMZ+BC3wHcMlyWWnCpjHiAWlmAns8eCoBYhWkOJCOUOWrM8UlS9NtCjuLuC+4wYqd9Xfdg3H5l5JFA8gR6rJqPxRNYj6v/ZJbhh8vHjfCByc0ZcMFFYQotemZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQadqu36J1g47feH1q+43S+OC65x6eaSWC2OOhLJ3KI=;
 b=XVC7Ao675SLJihU1c26xXvU20egARfCwEVZ4LB2h5zaD00BFZQpq5HjuDtipQLZinyWfsT/4ZXKAZW8EilVeCWM3gwl63it0obBjRk1R9W0SObZUJ/APsoYXYIKnHiRqdYGIZIT2XdZrCrGc6RIf1Tpkay6sRXBSb53RrAkaAyT0Gbo0cvBd5gg8Ptm9IIpuuYTxssR9bdJesANI7balUtaiV1Xv4GVSGfbrvOVmW3ObDhbtoppeOyIGHv/cVLMOX2/z5zvRs+fkfskrQkZFjntu1H+SOhVoH+Wox0M5bCRTISGmEJ8/KHLsenexNNtZLugzghsd2P4aJ7+FK+00ng==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA1PR06MB8436.namprd06.prod.outlook.com (2603:10b6:806:1cf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 15:00:36 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 15:00:36 +0000
Date: Mon, 25 Sep 2023 10:00:33 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
	samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	andre.przywara@arm.com
Subject: Re: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB5342C836DCCD58AA47C7FE33A5FCA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
 <20230921135136.97491-5-macroalpha82@gmail.com>
 <4860683.31r3eYUQgx@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4860683.31r3eYUQgx@jernej-laptop>
X-TMN: [E2FuoC+jx+z9h7nE/Nth541Kx38HU/ZG]
X-ClientProxiedBy: SN6PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:805:f2::37) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZRGgkQmBaSDd8c10@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA1PR06MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da910c2-ad89-4d0a-1ec3-08dbbdd82c06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6mJwlHZHDexscnhg8FKWSWno9EHTmmtmUbG6+nqcga7ytj15DGZpK6cl1q0BF+M/+KMNJFWalCxzPdfJ2VxeyTPbB2Kgs9CNDLUQ+4QD1yLttRPR5vAWiPeDNB0dcFQw5l0zKycMlCIGscfhjRsQst/NraiMLUwpkhR6JTSHDil0h+uvhjyXRqH0HuiPYaGlFG7EbNcNcj3inIOcLZ2mggCeH44+aHdAtJLiNMtkkEHsAYO3uH/zDnVV4R5ITJc2NYnTVC1jjwdIA8UGOgINtqqtnRmePKmx3vEFg6x99ZJ7L5ztL3+f6xyI31XedGtdyVfN/rN99QOyl9xVLmgzER+i4R1HtT5cKJOGt29Ry1QkR0+a8ZmHzmyaevUUE+q9t0VZ6P4c1G3T4Cvm7AusILB0MzyC+9xJKL7nLD9KegBWUFASH+p6pQ0dVL1KOUMjtWXDIzxVpJeURltRr7GOKcZkMueaSZ8QyfoB/CuVama/Gh8B+q8jrDY3FGimLk19nDZfsZCU7PJNAH2uhm+pVgMwKtV5q0XnIxx2+f47fYIlMR0lKSqg13tWLJk/dfiJKlRAIfT9UEykdQuvoh/JXVWVz08Xd7U4BPXhuYaK84Q=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS9MSmFLVDhlY0lkcmx2Z2pFZzlDaVNGRFl1eDdERFpZakVBWUUxTnB4Wmgw?=
 =?utf-8?B?eDJlVWxrYWFuYUpNUndIRUJpemh4czlNK29JSkp0MEpmYjBBNThWOGd3NUwy?=
 =?utf-8?B?NE5yYy9TMkhjVXhUMnEyQy9JcElBbmJydjkvZVhsdzBURStENXNyWmMrT2d5?=
 =?utf-8?B?NUpocFRwckVwbGhLZVoybTNJT3crN0taUGtKN1lVNVhBR1N4S0lYQUVySVFk?=
 =?utf-8?B?QUF2SXdCYXpxTm1KU1Y4Z1BOY0ptUFl2K2paNGJOQ2VEOUVDNDNuOHowSzVS?=
 =?utf-8?B?RUNwWVFlYUpsUXJQeG9KQjBCMDgyQ01zZWs3KzF4MjFRcFNWRzNMZjZCcHZN?=
 =?utf-8?B?VU9QeDdUdlcxdG9TSGxiMFhsM1RnZ0d4TkxWYjZjTEs4TmFnM3dnZzB6d1cx?=
 =?utf-8?B?d0ZHSUR6WVlWNml3aXIyaDFOdE16czdtOUd5RUpOSWdJdml0SzBHcThXYlVN?=
 =?utf-8?B?TjhZVlhFQXZvcUU5QmEwRTFzUU94VUowakhWd3MwN1F2WlJ4MmJYb3VHeXgw?=
 =?utf-8?B?dGYxKzVYZThCeW95b1NuNThnUm9ZeEpXMjRpbGJ6QTJmVHcxNlIvZFg0dWdM?=
 =?utf-8?B?QzNISW5KWFduN1BuZXplN1FkVGY3czhCVnhIazhtZm9zS2pVUEFLT1dFVnM3?=
 =?utf-8?B?OE9kRldLZEJ5Mk0wRW5IdHNPQ20waG1UeCtoaUtXcUl3cDFMc1lCaERSU2tR?=
 =?utf-8?B?aWdjMlJ3UjlTN2NpMmNVSVozY2R3b2J2L2Rralk4WENPendwdUx1SGJ1emZE?=
 =?utf-8?B?eGkzZkRZVmhjUDFPcjRwMGZ2K1g0QWJCcGtLK3dNUnZmNkZYcjdFeERHVWZQ?=
 =?utf-8?B?RFZZZW1iaUVmOXNsVG5WS1pXekxXeklZS21qOTl5d25sQWhzZHRxOWVNeER2?=
 =?utf-8?B?Zkg5TWhYVDhSZFJkMGlhYXQ3UEFHdEprU29pbkkweTBXRUdPZUpuTUJ6K3J6?=
 =?utf-8?B?Vjh1M25vUlJORStIYis3VElaZGRvMjhGeGhDaUlRQlE5d0xqRlhBWmFUbHJG?=
 =?utf-8?B?cXFibHBvY2dweTZxSWpHcVBnYmtxYU1mMHk2b3F4Nll4UWdGTVhEYW93RDVz?=
 =?utf-8?B?dGM4REgwZUFRWHc5MVFhTUpXTWNqaDlacjk1TXRENTZxRTN1cUdtVWdUNnZu?=
 =?utf-8?B?K21YNTFMajZaaXBVNGJycG51R1g3V1V4WUo1VTQxTnYzTFFSUldTbXhqNXFF?=
 =?utf-8?B?UWkyY3dlL0RSVjBPckR2ZENweFB0OVpKNWJnWU8rWUN5emd4bXY0OFBhT3Ni?=
 =?utf-8?B?alJWS09JczlNZnlVUDVWVzBkVDFYV2FPNUhHSzhkRm44QTc0VmxzSzllWXp6?=
 =?utf-8?B?VEUyc2ZhQW5COTAySldid0d2RFVxYmFsa1ZaNk8yeTI0MHRCOHp1cHM0Z2dH?=
 =?utf-8?B?OHRRTkVzWjZ2NGRyRUE0Y2NCNFBWZ0x4QkpIMjd4c1pQR0I5UzF6dzN3VjNO?=
 =?utf-8?B?Uzd6V0YxR3RCTmR0U0dBYWY0SUlQNFZKL1RCVjZYcmpuYUlwVUxWOUNiRW1I?=
 =?utf-8?B?aUMvZXNMaHpvT1Z3TEkrVzVYN1NsZkkxdG56OGV3bC81M0Nxa2l1RlBKd0R6?=
 =?utf-8?B?ditRR2NlWVVsSFpsUU8remxUMEZ5L1ltUlJSWVMxNFhZOUtRMkU2WmZzOTZq?=
 =?utf-8?Q?P20/LPEjzKM5ZIsQcNzjd2kaWfsPnZ2225TH76sfKuTI=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da910c2-ad89-4d0a-1ec3-08dbbdd82c06
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 15:00:36.1860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR06MB8436

On Sun, Sep 24, 2023 at 09:33:53PM +0200, Jernej Škrabec wrote:
> Dne četrtek, 21. september 2023 ob 15:51:36 CEST je Chris Morgan napisal(a):
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Anbernic RG-Nano is a small portable game device based on the
> > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > SoC. There does not appear to be a crystal feeding the internal RTC so
> > it does not keep proper time (for me it ran 8 hours slow in a 24 hour
> > period). External RTC works just fine.
> > 
> > Working/Tested:
> > - SDMMC
> > - UART (for debugging)
> > - Buttons
> > - Charging/battery/PMIC
> > - Speaker
> > - RTC (external RTC)
> > - USB
> > - Display
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
> >  2 files changed, 285 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> > index eebb5a0c873a..2d26c3397f14 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -256,6 +256,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> >  	sun8i-t3-cqa3t-bv3.dtb \
> >  	sun8i-v3-sl631-imx179.dtb \
> > +	sun8i-v3s-anbernic-rg-nano.dtb \
> >  	sun8i-v3s-licheepi-zero.dtb \
> >  	sun8i-v3s-licheepi-zero-dock.dtb \
> >  	sun8i-v40-bananapi-m2-berry.dtb
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > new file mode 100644
> > index 000000000000..1a4429dc57b1
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > @@ -0,0 +1,284 @@
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
> > +		rtc0 = &pcf8563;
> > +		rtc1 = &rtc;
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
> > +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PF6 */
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
> > +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> > +		vcc-supply = <&reg_vcc3v3>;
> > +	};
> > +
> > +	axp209: pmic@34 {
> > +		reg = <0x34>;
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
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
> > +	spi0_no_miso_pins: spi0-no-miso-pins {
> > +		pins = "PC1", "PC2", "PC3";
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
> 
> Can you please remove any mention of drivers everywhere? DT is OS and 
> thus driver independent.
> 
> Once fixed:
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

This note was added due to prior comments because in this very specific
case we're working around a driver issue. Sadly if I accurately
describe the hardware the PMIC and devices that depend on it will fail
to probe (the hardware is 3.3v, but here it's set as 1.3v).

https://lore.kernel.org/linux-sunxi/20230629203410.660eb9a4@slackpad.lan/

Thank you,
Chris

> 
> Best regards,
> Jernej
> 
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
> > +/*
> > + * Force the driver to use internal oscillator by removing clocks
> > + * property.
> > + */
> > +&rtc {
> > +	/delete-property/ clocks;
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-0 = <&spi0_no_miso_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	display@0 {
> > +		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
> > +		reg = <0>;
> > +		backlight = <&backlight>;
> > +		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> > +		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
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
> > +	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PG5 */
> > +	status = "okay";
> > +};
> > 
> 
> 
> 
> 
