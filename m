Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2073.outbound.protection.outlook.com [40.92.19.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEC3C2E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 20:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiiRX6ITBoAb0TmKnkGHVCWiF4ToglmuoDXXG9qiPCd69IaDCeP0A6UFBxojvnW3+1ck1JqPiHGxzNRDpwKBFWj+7/m019Oh3mMeMmAk2C08aNmfgkDzMVmZUa1vQ66vpNYNaX6VFBDGfCPzYmHv2DPYe6tqL/hK4Ns3Uj1/8X9OeR1LFzO54GwIpbBQ0p/V6TYrogBvUrjYzxAgnkfj5GIh5Oz+fpr2qmVa6tQvm9jTRU/gjhpSS8fANwbBmWZRIBIT24500JV5Rj7NOF21r3kA+Y0OfS5v0pR6AWtcRR4ra+427yqpWrFWP3QnRW9kG6Cr/BvY1bhUFHpcZ4ugkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNp4Lq4SarILEd05oddlBMkSo+BV/4+bHTZbF9976W4=;
 b=kkPQa3xfibf9/VHKoApcfqsZb7J9bCxo65O1ikXYaFOXfCPTWxgMZarTpSz6Hg4+M9yBCamEjQ+xO3eVb4Rnjklk6GHIdySC9oNmr16UUmJQbBFT3YQk+GHxTWYGxTH+eMTizTYwK35vp4JsblVNP5/tvmqRyZ8KYvz/WnZe0+ULCGtM836lhvUh9+GGd04wktIpe1pjNxqy0yaB2prkDyVrjJoeVsbADAHcRhAKS2UNyRMsN6Qb9JDfSdV1yJZV3gtZThOA51ijL9JuPscTZhV1XmuGepByIqCEtff0qmX8aZ+zt0M+8jmeKNKrvQbzAKoVc/9kCxayyddLHyU2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNp4Lq4SarILEd05oddlBMkSo+BV/4+bHTZbF9976W4=;
 b=hHq7njgAk9RLyiZEljsN7lS8P9S8V3TmGmRGFDtN+wqVzPOQ7v0r1KEZEDmiJ8zCsVkMaVRUGPFD1xz9bi+BvyErszy/nz+TrH333EPKWoP1s7bRZ7m6B7EWUIFSGw5Kyl93wLyF9C2W4k+8k/Vi3wT+58zP1Sll7c3/rTq1K7G0I0sy71lEXrkuvH5maL7VhSzWub8eOLHQ2FQUmZIr6+4B7LeAE1AribA4XywmtjGpqQbu1OedJIliWCdxDVEA25BJ0bh/XghTytXgwX31ppmoxpRyoy+jcZxNx71kPvh/UnmbtDE2CG29W0m3GW4Z2G6nnGF/KQexYF1ha1aSUA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by LV8PR06MB9546.namprd06.prod.outlook.com (2603:10b6:408:18f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 20:00:22 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f%4]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 20:00:21 +0000
Date: Wed, 23 Aug 2023 15:00:17 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	devicetree@vger.kernel.org, mripard@kernel.org, me@crly.cz,
	uwu@icenowy.me, samuel@sholland.org, wens@csie.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: Re: [PATCH V2 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB5342A90C12C2F1BB07F9A9E4A51CA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
 <20230819032105.67978-5-macroalpha82@gmail.com>
 <3244887.aeNJFYEL58@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3244887.aeNJFYEL58@jernej-laptop>
X-TMN: [/VBRwMli3ujCdNDtYmClX1JLBABvthdx]
X-ClientProxiedBy: SA9PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:806:24::15) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZOZlUZhvBz83/IHF@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|LV8PR06MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8fec03-9011-4b3a-1c2b-08dba4139457
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GKEwXO811M8F3CLsZJhQLcgvmCxNOxijxdxrKe9KnUxf+FE2UBDpZLx8gnxZZt+l0VFi37Ld0fw7t41hxy1AsprTdkYncv2vOeGtPcBkFJ7HzAXFthv3tz0u+RuYmnwRxpYGmjFUbrcYIZk/mF/H+lL46vHilZ3RvT1u6yqIhre94fme1JLM/FGfHusFMVio8hK50wpOU32o1U0v9f6tsODwRLW6r8ZVNDjDfy/1xUSq2omE3X8m9YFyPkxrjkLJQqF7ksjdk0zRp9cB3dgFyniycWQhGtsmsjDJumTdfUcxkHy9PpPpkztLSEr5ejCMiK20o8M90rIDo/rTeBCPfewyeyaUDZHt5AE13XRyAHbSIJIU3+0cDqkS+mWN+MKbQJIGUjHtC29N78cUUXKGZZFiVPgV0b7JRIRg8aR+mPfPe96oLzJIAaNxG8BExtI32dypFB0PLRhGUPybkKKHBrGhYZjYdKazau2GB9guKkATOUuMaKwZZgoj0TknlcTHFvDjb+2O6G0lnMh/5/I/+wa402xCRGNXAwJABF0f25sWMh88h67CR/QEfTwaDa42
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE10cGpjOWx1VFdONEhFcUF6N05zZFB4V0VqbnJ5RmxoeWRsdEZsallOYVBv?=
 =?utf-8?B?NUY3SjJxN0NjVnplRHE3QllQNTlXdHMyZE5lWlpXYlpuSFpoUGVSZEpWL0dN?=
 =?utf-8?B?amswSm5GZjhCU3NWVExsNkppWFVYYS8zQnp4WjdBdERHVEo4a0tkSVlIbVox?=
 =?utf-8?B?T2N3SkhONkd0V09heE9VeUlkTG9VMWlMUHRjNWVnYzlBczc0Y0tBRXp6bnBQ?=
 =?utf-8?B?SWo2ZTNDRGcxRW8vSW14cW1JQXE1ODNoa3I5TWRLMHJHTCtRbXJTNytpMjhw?=
 =?utf-8?B?SVQ0QXh4VDlQa09kSmZVdDVqMnhhTFVGNmVaVGZVd095aVNrdjV6bDdESEFw?=
 =?utf-8?B?VitZYjBuamNWRXdPdCtYNHBNMnM3Q0N0ZFR5MXlGeDRqcnFEWjVQb0lPekJt?=
 =?utf-8?B?SVM1bXVkY2F2TDgrQmFHdlhaT2hIZUZZNVMwVjIyVlpRNDdHT3I2T1c2QllJ?=
 =?utf-8?B?aWNqYnFndjJ2bDRPWks0Wk8vd2loWDFQc3NHSW9aTGRna1dNdFpIa1IzNVkw?=
 =?utf-8?B?dHRrTTdiWStoN251TzdPZ3JzWTlTMWxSMGx5TVNPVGk0eEhwZ0ZDcTFKUUNi?=
 =?utf-8?B?TXRZVld1S1k4OUtzZVpsT3E5dHh5RUwybGlSTHdPUVJLWlN0SVVINjhUNUJY?=
 =?utf-8?B?K2QxVmw1WGdQTXhvTEN3VjNVVVZGbDM4eWEyNENmOFYyREZNRWpXTGVFRDJj?=
 =?utf-8?B?SzZXQ1NXRzFFYWNWUUcvbmJUdWlOQjRDaVJnOFkvZjdpSzRMb21vVVZVbi94?=
 =?utf-8?B?THRsS2dUNjlnY29odW5OQStQU0oxVTNpdHI4ZTFFQm5RQUM2TUhxTGd6WE04?=
 =?utf-8?B?Nm55MUlFR1ZvbWJMZlV2MC9Ub1gyS0JVUSs1Q083NmpFYjBZMWpFSXZLbTU0?=
 =?utf-8?B?QkV4dTBIU3VFYTlzL1MrbXRyTkp3T3hUL2tFbUk2cHdsSkcvSTdES0YySlNM?=
 =?utf-8?B?RFBDcDZJVEpIbmxpU2FaZzBFSDNjLzlRYXE4TXY3M3hNY1Z4VCtVRFY4Njdy?=
 =?utf-8?B?NWl3b0JOdEs2Ymw2bmZRMkRyaC9TeFNycFBRRXVSWDlrR3NmcVNmUlhmZ2Fh?=
 =?utf-8?B?SERPTkt4emxmaFlsM09JVHYrU2ltN3N4V05HeE82RFhIMUxscnUyMmh5VkZS?=
 =?utf-8?B?UWcxZ3IvbmRyaU83ZlVCMWR3UXFoenNZak1TcDJISEtwU3pHY2tjRmtWcFM0?=
 =?utf-8?B?anJaNGFReGtWUm5YWHI0R2c1OGY1LytsbUlOZFo0R1oyWlBVSHB3VDVQRXFq?=
 =?utf-8?B?ekdvbXNLaEpzb0JqYWlFRjd4NXJBSFkvVTdwS1VIREQ0NDR5ejVDVjhjcTho?=
 =?utf-8?B?VkhUbkJkWmdwM2Q4czN0SmJMUWZoUW5yZTB2WUNlSWFkeU1TK2xab2loOHlN?=
 =?utf-8?B?ajhmWWZWajkvcElrOUVIM1ZTVHY4OXZ2em1CYi9HTFpiY1l3U2xNS2tGQnFX?=
 =?utf-8?B?akZwTkcycjlGRWtHeWpJbEJUYmF6WHp3b1hKdlo0NCtKZ3FqMUc4TlVTWWFP?=
 =?utf-8?B?RlJERGRrUHZ1STl4NC9PSEhJaXFsWW94QkNYSW5uU3dnN2hRMWVTVjgzZEFk?=
 =?utf-8?B?SXdJVElqU20wc2NSVDJTT1F5cHZqdW1Vcm1TSGlDVjJqTi9veGZQQjBmQ0x3?=
 =?utf-8?Q?XtWQRJn/2oMyEEsv+6ZeIOKZDuS3dV09Ji+ClbiLSL74=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8fec03-9011-4b3a-1c2b-08dba4139457
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 20:00:21.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR06MB9546

On Wed, Aug 23, 2023 at 09:32:10PM +0200, Jernej Škrabec wrote:
> Dne sobota, 19. avgust 2023 ob 05:21:05 CEST je Chris Morgan napisal(a):
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
> > I plan on working on a tinydrm driver to properly support it. 
> 
> Remove above text. It doesn't belong to DT commit message, but you can put it 
> in cover letter or commit comment.

Understood. It's also moot, as I figured out the panel and have it
working with a driver that's already in upstream.

I'll submit v3 soon, since I think the last few bugs got worked out.
Pushing these changes upstream got some additional eyes which I needed
for the last bits.

Thank you.

> 
> Best regards,
> Jernej
> 
> > The USB-C
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
> >  create mode 100644
> > arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile
> > b/arch/arm/boot/dts/allwinner/Makefile index 589a1ce1120a..2be83a1edcbb
> > 100644
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
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts new file mode
> > 100644
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
> > +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-A";
> > +			linux,code = <BTN_EAST>;
> > +		};
> > +
> > +		button-b {
> > +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-B";
> > +			linux,code = <BTN_SOUTH>;
> > +		};
> > +
> > +		button-down {
> > +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "DPAD-DOWN";
> > +			linux,code = <BTN_DPAD_DOWN>;
> > +		};
> > +
> > +		button-left {
> > +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "DPAD-LEFT";
> > +			linux,code = <BTN_DPAD_LEFT>;
> > +		};
> > +
> > +		button-right {
> > +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "DPAD-RIGHT";
> > +			linux,code = <BTN_DPAD_RIGHT>;
> > +		};
> > +
> > +		button-se {
> > +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-SELECT";
> > +			linux,code = <BTN_SELECT>;
> > +		};
> > +
> > +		button-st {
> > +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-START";
> > +			linux,code = <BTN_START>;
> > +		};
> > +
> > +		button-tl {
> > +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-L";
> > +			linux,code = <BTN_TL>;
> > +		};
> > +
> > +		button-tr {
> > +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-R";
> > +			linux,code = <BTN_TR>;
> > +		};
> > +
> > +		button-up {
> > +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "DPAD-UP";
> > +			linux,code = <BTN_DPAD_UP>;
> > +		};
> > +
> > +		button-x {
> > +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
> > +			label = "BTN-X";
> > +			linux,code = <BTN_NORTH>;
> > +		};
> > +
> > +		button-y {
> > +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | 
> GPIO_PULL_UP)>;
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
> > +	clock-latency = <244144>;
> > +	operating-points = <
> > +			/* kHz    uV */
> > +			1296000 1200000
> > +			1008000 1200000
> > +			864000  1200000
> > +			720000  1100000
> > +			480000  1000000>;
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
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <1250000>;
> > +	regulator-min-microvolt = <1250000>;
> > +};
> > +
> > +&reg_dcdc3 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3300000>;
> > +	regulator-min-microvolt = <3300000>;
> > +};
> > +
> > +&reg_ldo2 {
> > +	regulator-always-on;
> > +	regulator-max-microvolt = <3000000>;
> > +	regulator-min-microvolt = <3000000>;
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
> > +	status = "okay";
> > +};
> 
> 
> 
> 
