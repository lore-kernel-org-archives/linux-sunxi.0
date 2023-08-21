Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04olkn2062.outbound.protection.outlook.com [40.92.47.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9DE79F1
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 15:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdFUag2J/g7GZ1NccwrBAS337iOcRBiqj21p2p1H6aAJl/81mJ4UeyoNkNnnfh0XWxtpN4p5ejIQ9tzxNBunGXX0Id0K+YvtYLWqP0pGMOAu5kPoXXqdP7Aljy7JXePvjNX5r9lD8bfEWV/26ImBVfFtG3PIzraJzWZgIAtnDRV8XQTPQCkXaeexYmsT0WOhLlpu6qgxaqlKDWo359Rt7yPcy1B41lpb+1cMPhTCNYjNjj7J1BoMezgSuimBvtgxHv/mvK++M4jLOptFqsy2bY3vWJ3XZoouWkDr+X6v2rvjA+Ht9AZsaK/IckCqZwkNwBuQkqilBrGV8pbVhaSy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQg0+tuiKbLpOsO1t0aPOYNuFANnmJSTP5mQD0gYz8E=;
 b=CvminmzCDRhXaNI82Wrk9GbrdeuFxvIa+EWMp48SHTf+XO1Rv3qqbwk0nrxW0zOw7IQkZZM4yR/IeHvkJrIdbeDkWoV1A9mtpc9vW7W2PfoEVrX8OjTr+P4hXcLqu5OYt2j5DQG45dhasB0oqvZDjRQvqWqAmjWqHAqOWYxOdM1DJ7l21GkPz0xQQpNIrQCerV+O7FvCJS1XW9skVUWTSAB/giyd6B62JlodqNhM9LAr+P/Duvn7zDZuZUwRySM2c17nnwIxg4VhtNC2GJB20bkmcsc3Cp6EycY+X5HXiD5Tl68kDHpsb/QG2Hq0CsnYwXUqLZEskHrW70k1bhaGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQg0+tuiKbLpOsO1t0aPOYNuFANnmJSTP5mQD0gYz8E=;
 b=Ef896EBLDt9oW6MAxKhzh7Fw90y7LA5r3osykQBicqepiOC2KxFr2Grrekr1g7TIp/pH7LiqMEaAtQKjJ59pu2fEWfew5mk2qUDsGVQdLSH+nBXkgkbfY4LWhKhQ8sgiUED9G9JS6wrdS3PHlnCVYBxSf8gglNz/7+JYo7wvHemTk4w3SCngOXaF/ufzWuqo7vNwTc1cJCAaGzDTMKyOj+rVcb7a0tYta+Q4Yf4y9T7r4yAlHWMaCB9Qs/lXZoUAePryQFMqOxWNh/PqdQIej2ZcE0Ytf4XAeP6fMAkL2edfR9X5GhY/VFM9MKl7jZWH5DXti9Edx8Tq4iyNvgp4hQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA2PR06MB7530.namprd06.prod.outlook.com (2603:10b6:806:140::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 15:38:42 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 15:38:42 +0000
Date: Mon, 21 Aug 2023 10:38:38 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, me@crly.cz,
	uwu@icenowy.me, samuel@sholland.org, jernej.skrabec@gmail.com,
	wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V2 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB53425735CA49EF8C30FDCF4DA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
 <20230819032105.67978-5-macroalpha82@gmail.com>
 <20230819230335.45ad16de@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230819230335.45ad16de@slackpad.lan>
X-TMN: [zkUAm4BtbheDS5qaaJRINxDJQvA3lWbZ]
X-ClientProxiedBy: SA1P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::26) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZOOE/iZYufQ8dHEG@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA2PR06MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: f514db6c-350c-4ee7-0320-08dba25cb24e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GfEZ0oqbEiW7wG/v47tHXpRg27F3urMmc3fiUGyzvwh0fBrhEryCRNomjX+zXjkVBBcXpMqrkoCi9p3jA2m7bzPydltMour80jRGowu5CTtFfs7GPC1Dqdr4aNnZ120BSvhfNOMVJTDgJaHQStTOVtsREJn4dDtdpq880p0XyYeDFsPwofAuinJNjUOFzpOzMVqVzpagWzH6ZinOwqZO9FUqTuZ2ryr4gkkTlZs7rrAmNkiJixqiyrgE8rXJjbcoVf3jQEzbU12b5d9AILlzolIT0Ubv7vfQ829SXUVQAwWQvuTui5AB0Rxom8kAUn8mPIgH7B1jxxEo1rK1bjBkKPEoXzA7uu2L6rdKuXffnzurwEuVXDC6kIKE1WwUWzeFf+JoenuvJtVj1iDjSZjXJSwavFUI2eAF4pTyvLNYaa3OAcEZaAe+0uqZu8ZO+zelhy5qdtXfCFUbxbHeP7cf0UVRGBBmrcyuNh3aPDHymTqmmi5PIadUi4gqkFRwSBvrWI+6tybHwutlizdoTtS7Unb/uaUwwF/Bstlq/1mPJ3bHAzcR1NY+FquFQTSuTTeu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/kNJesktmCc3wPkdOHxQCbDJ9K0slhetV/9wVJm3HVNCu9TII3bRI7uIynJc?=
 =?us-ascii?Q?BR2DFOgElnR+ffCa4qVgMlcRoKbmsXftIWsh/x9f42JBxPkwdo2Ud9/87owx?=
 =?us-ascii?Q?OtPw8kBTXqXoEhenmnSDAy4yUdBCRgJzYJ0gmpQrPY7AQ4v5wrdm8PGqPLyo?=
 =?us-ascii?Q?GqjOH6CkW0B97pDtwiPo2VSisjbAupixDPdmdza+TsVEQ2ZtwKcU+N9MXN4G?=
 =?us-ascii?Q?k+qBmRO/K2HUjb+uOZXecBdr9pvtVyYSUsqses6MiMOi2wR6tqDK2MkZmCyg?=
 =?us-ascii?Q?lHwMOAYleXtMnEArIi84J14yNHjEwNHU0pU9rtWz50pYuncf+V6TAVwDlUvU?=
 =?us-ascii?Q?DOiDdPoI0PrsoGNeAemL4/EvBZ+IMt7iewKFiAXCzliV+24+RFFvF3j+yUgz?=
 =?us-ascii?Q?YX8hJyzAhtaeBL7GNDlUb6twgfCvxfeC2IvJanCVMuanIZ0C8QkIWGMBtv+Q?=
 =?us-ascii?Q?g5ygCwQki49lnKlYd8XthLQHr+tDdo3LRPTonfIvk6BKULQwBSGWEMqeufAk?=
 =?us-ascii?Q?yvUacTH/jnc7aIx8/IJQySfgUIbzKjQnTnJkp0vbteIEpBJiYvePEAtY0eQR?=
 =?us-ascii?Q?1fx2EMfWoEXUvjkvhxFahO9xcZ6Z7p1hxZoTlxIvpuzJp1xapCKYSb0OuPsc?=
 =?us-ascii?Q?hb5LNsC7WXdGoMjdsJpCoX+v9GxOOdiOt3xayzIgO6ttgycS2x2T2+qHpa/2?=
 =?us-ascii?Q?mRkCKMtSozypSSXK1fntFZzZaCnUG8pePOPDUBABOlxV86Bo3Zekohh5KWx7?=
 =?us-ascii?Q?JC3ybBcIOMR/38RDPAhlEGpyuGPu1Pkq5UAMHQHhzuIXm3pm7uZcS7yYG1Mt?=
 =?us-ascii?Q?bG/e21WLGLDVRZCqix+YhytZzDLXE0FUM54i4zOAdB6y41w8ktaMLxvc4HiV?=
 =?us-ascii?Q?1OBgikVkyM88DJOiK/bXagOdH0AfV6M5rG7yb16axFnStxVHYRWQ3uJrrjdP?=
 =?us-ascii?Q?0sGMkmlsKlJCPRUdtuCrf/BVwP0ihXVaO7Del1/bv+reDVT48df7fox4ocdS?=
 =?us-ascii?Q?CO31jbDXQWUen/5hphYqFFy1Mduv7I29EjFqx237vw0U3ZodgWVJgZl2b97a?=
 =?us-ascii?Q?Q+JqN8atzmMpUK9r60Mbr4N7Qv+4LW1+5wp9LvrRwlzH7Re9kP+e04JI9J7B?=
 =?us-ascii?Q?6rHIvZI+44l3qQPxz4tz5AlryTEpP25eTUxOm/GrR9DIte603PIRw2SDWdyt?=
 =?us-ascii?Q?rByskgalp6O7c2JrA5Fnf67/BIskiiQ5y5/nA4BsFolITtgz72/nQUQky40?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f514db6c-350c-4ee7-0320-08dba25cb24e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 15:38:42.1437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR06MB7530

On Sat, Aug 19, 2023 at 11:03:52PM +0100, Andre Przywara wrote:
> On Fri, 18 Aug 2023 22:21:05 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi Chris,
> 
> thanks for the update!
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Anbernic RG-Nano is a small portable game device based on the
> > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > SoC.
> > 
> > The SPI display is currently unsupported, as it will either require
> > a new tinydrm driver or changes to the staging fbtft driver to support.
> > I plan on working on a tinydrm driver to properly support it. The USB-C
> > port currently only works as a peripheral port, however in the BSP
> > kernel it also works in host mode allowing included USB-C headphones
> > with a built-in DAC to work.
> > 
> > Working:
> > - SDMMC
> > - UART (for debugging)
> > - Buttons
> > - Charging/battery/PMIC
> > - Speaker
> > - USB Gadget
> > 
> > Not working:
> > - Display
> > - USB Host
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 219 ++++++++++++++++++
> >  2 files changed, 220 insertions(+)
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
> > index 000000000000..c49b5431d04e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > @@ -0,0 +1,219 @@
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
> > +	allwinner,audio-routing = "Speaker", "HP",
> > +				  "MIC1", "Mic",
> > +				  "Mic", "HBIAS";
> > +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
> > +	status = "okay";
> > +};
> > +
> > +&cpu0 {
> > +	clock-frequency = <1296000>;
> 
> I understand that the kernel complains when this is missing, but I
> think this property is some ancient legacy, as there is no such thing
> as a fixed CPU frequency anymore. That becomes evident with the OPPs
> below. So please remove it.

Okay, I'll remove it. I always try to make sure dmesg log is as error
free as possible, and yes, that's the only reason I put this here.

> 
> > +	clock-latency = <244144>;
> > +	operating-points = <
> > +			/* kHz    uV */
> > +			1296000 1200000
> > +			1008000 1200000
> > +			864000  1200000
> > +			720000  1100000
> > +			480000  1000000>;
> 
> Don't you need a cpu-supply property to point to the regulator in
> charge of providing the core voltage? Otherwise I don't see how the
> kernel would be able to adjust the voltage, to program the OPPs.
> 

I'll add cpu-supply. Based on the schematic it looks like the
cpu_supply is the DCDC2. DCDC2 is also hooked up to some other inactive
pins according to the schematic but I can't see those pins on the
SoC datasheet (so maybe it's just a schematic quirk?).

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
> > +&pio {
> > +	vcc-pb-supply = <&reg_vcc3v3>;
> > +	vcc-pc-supply = <&reg_vcc3v3>;
> > +	vcc-pf-supply = <&reg_vcc3v3>;
> > +	vcc-pg-supply = <&reg_vcc3v3>;
> > +};
> > +
> > +&pwm {
> > +	pinctrl-0 = <&pwm0_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&reg_dcdc2 {
> 
> Any reason your dropped the regulator-name property? This would help to
> identify what this regulator is used for and would explain why it needs
> to be always on.
> In v1 this was "vdd-cpu-sys-ephy", are you sure about this name? I
> guess it supplies the CPU, but I wonder if there are other users of
> this rail, which would possibly throw a spanner into DVFS. So what's the
> "ephy" doing here? And can you adjust the voltage, if this also driving
> VDD-SYS? What does the BSP kernel do?
> 

This rail appears to supply the CPU (vdd-cpu) SYS (vdd-sys) and
vdd-ephy. The ratings for each of these according to the datasheet are
between -0.3v and 1.3v (CPU/SYS) or 1.4v (for the EPHY). The BSP kernel
has this as variable between 1v and 1.25v, but it doesn't appear to
have DVFS enabled. I can change the range back to 1/1.25v since it
supplies the CPU so we can enable DVFS; the datasheet isn't clear
what vdd-sys or vdd-ephy do, but in the case of EPHY we aren't using
that feature at least (and these voltages are within range).

Do you think I should keep the cpu-supply and frequency stuff in place,
or should I drop it all instead?

> > +	regulator-always-on;
> > +	regulator-max-microvolt = <1250000>;
> > +	regulator-min-microvolt = <1250000>;
> > +};
> > +
> > +&reg_dcdc3 {
> 
> Same here, please provide a speaking name, or a comment explaining
> why this must be always on. There is no need to enumerate every user,
> just "vdd-3v3" seems to be a common name for that regulator.
> 

I'll go with vcc-io like the BSP, unless you feel strongly otherwise.
The regulator appears to power all the different IO pins on the SoC
and basically everything else that uses 3.3v that isn't the RTC.

> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3300000>;
> > +	regulator-min-microvolt = <3300000>;
> > +};
> > +
> > +&reg_ldo2 {
> 
> Same here, name or comment, please.
> 

You got it.

> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3000000>;
> > +	regulator-min-microvolt = <3000000>;
> > +};
> > +
> > +&spi0 {
> 
> Can you add a comment here mentioning the not-yet-supported display?
> And you should specify the pins used here.
> 

The SPI pins are defined in the main v3s file. Additionally I have a
TE pin (GPIO PB1) and a RESET pin for the panel (GPIO PB2). The RESET
pin looks like it has an external pull-up to 3.3v. The RS pin on the
panel is wired to MISO, otherwise CS on the panel goes to CS on the
SoC, CLK to CLK, and MOSI to MOSI. Everything but the RESET panel
is pulled to ground (I think, still not perfect at schematics).

> Cheers,
> Andre
> 
> 
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
> > +	status = "okay";
> > +};
> 

Also, I did another comparison with the BSP kernel and realized I was
missing the OHCI/EHCI and now OTG is working (at least the extcon
shows host when it has a device attached and not host when it's hooked
to my computer).

Thank you,
Chris
