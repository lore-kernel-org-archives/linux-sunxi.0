Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2030.outbound.protection.outlook.com [40.92.18.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1C1F61C
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 14:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW4NJnkEGUWyCi4oDGw+3u5yrIbu51wJ68N2aVsl/r3+x9krgE033cSS6wxTZJS2H3OWnq1PQ1rMsgTKtZ9rRcXjPJcdjhTATuAA0vxXe/5ADeWPOaqxb7m0vbEmcqSFtEYfei45gO3Rjcp4ZUt7QBLj/E8RVnoDjmI6uRVfuKOgKsz2ZGctts0PPWDN1JHqXJQZn5jxSY7VHC/0CgSr4qvx+z0BUECmgKGbcLEhiKctaCbHDGHmRqdz1yM7zbTWDF3tVx6pB8Zmi1bLzkJKnbmK5ChfOwsPOLzCYUC008ZKG9CnMEPLUz/IE3sSs5XJQIfiFvwarPvA/e+fYgVlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txACqyjyLiM39nOulvXxAaAhOaS6bwpgA5IqItJYxis=;
 b=TiydQIDCmiQJ7ZfZXCRAlQSclPBTq0GqmytHq8JO/z/Tm/fkHE0/1A87YllrFhMaLvHFGU9zHQWVq1syobnUe7FML6e+dz5U+VdTF4v4s0pJ3SId10UgZZmo1E2xOAAAcnIR5GWDxXzt05mgv+xfij4NWHmFCqtkE9JIZkW5YEkH2Ccsr8SqDR5iBDSYXvipVoD60i5q3MRHhTUVMn+U+blcAb6jiHj1kxl4m+HZMeFH1E4Gx+y1Iqg9l1LOuz+BIsHiiXeX9WQ4XGpPxhTGM7AdnVblFjQJnpWpZGW2nceMPFHAXKRQRU6loMfZZV9NG1jEfwrKpPaxR8vQ2tuJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txACqyjyLiM39nOulvXxAaAhOaS6bwpgA5IqItJYxis=;
 b=POOrh7lIlrcMlTwK3+Q6sVob8IDdYrtbHzc+ddg2C0kg6QoxmPMemvleOPBZpQPfXl0KM2ukvhmL+EzUzy+8AjhleZflYWAd4/ISfgCJvbbDBGaVggmltKYautQkb8F0e6y0B91rSAiOAVBeA02CzPRUt16ymYZE89eisaDIvdKi8pNDPB2GTO0075QlWEOu4U6C4lCk0JwvWAVkNSyKgptsvqIKAn/LBvGCzIf4oJNse4sUYrq81eKITBZpeqjvpE934lV1JlAAzbIKo4Z15E/F2fQuigmWLz0ntvX1diCoI1WLMnjt5VCGYSKdcHVdfiukm8S1Toz1sBc6qi5TpA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by PH0PR06MB7965.namprd06.prod.outlook.com (2603:10b6:510:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 14:14:07 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 14:14:07 +0000
Date: Wed, 27 Sep 2023 09:14:03 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
	samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	andre.przywara@arm.com
Subject: Re: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB5342313BDE341C6F17DB7557A5C2A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
 <4860683.31r3eYUQgx@jernej-laptop>
 <SN6PR06MB5342C836DCCD58AA47C7FE33A5FCA@SN6PR06MB5342.namprd06.prod.outlook.com>
 <9217807.rMLUfLXkoz@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9217807.rMLUfLXkoz@jernej-laptop>
X-TMN: [v36FSTXkmJ1mYssAJYsFz9AU9REMuJMM]
X-ClientProxiedBy: DS7P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::16)
 To SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZRQ4q914D8Scf0/6@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|PH0PR06MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 1121aab2-d2c7-4ce2-b6d5-08dbbf640292
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KCa/qGVvqxfyxXEfEWjmwHQ2Vyf/r6QtT/qQbzhxoANW/fDNbRXOhTURGIJ0AitUfZQtWcMj8zmmclLSPHBPj+7YNu0hKvg/36CWLi+EUnH2c+G36k89FotyFSpZ7chcLdmURGgvUAtTWZgi3VErp3y8v5+5+aFX/iFX+mUcmIUrgnotCZfSj7k/74Aabg4CdlEsEPiwvBFsLf88Izq0waxjjhiZt3I4lzrzULBKS1qQI/qNyxpyN2AovcBKn8p+FfE223MQdayuLew4OuSSBVYTEqkVtrODmUGqBLWophsctZfC3r+XWdqQ0SP0nmQfwOwTUG4kFOYzlZ9TE0JqdItNHOrCtdUGo70SWfLb2dA9fznHOXaOHO97gnktPSTMSuybhVeTNSfdE7CallkEE4hh46mXRwAWyQe357vGtqqxeHHlvqq1mVYr/U00U6M4oQFF4s0FtgmeCOEO1vn9JP9TZ35KBd6clYHkFLgUenh4azMJaOmymYfvoxzQpD8RH4HElizA7zhC+nveA1akhElcWQoy/aH1/wEfKXHRYk0wu3Lu7X1pbC/13ClYIrmPQny2QqPKILOgpao3shSzn1D7TsCZB1ppvnVC0Jcb9/I=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFg2ZFpiUVl2a2NMSzN5QWVBeVJIb3ZpU080UmFuRTE4QjBGZUwybFFVaEV6?=
 =?utf-8?B?a2lCemVzNm54MDNMY3B4NHBoSFdSTHdlR2JVaWhWZU9EMUtFSVpDU0pOdExH?=
 =?utf-8?B?Yy9ITHZjdFBiUlcxTEZFdnN3dmRyTG05WVRjVzhDZXYxU2dhajNCLzViR2p0?=
 =?utf-8?B?RU5OQXVZOTc3TVhWZlZHb0RvdVVveUMraUVWTDZ3K1lLeWszVjhMa0VWRmJV?=
 =?utf-8?B?RWlqRkVoaWJEclFUT3ZweHJSTkh3V3FycUh1SFc3N3lHSHVlR3pCb1dDYnBS?=
 =?utf-8?B?dDNHSFN0a1hqeGFmQnlhaHBqUEdMY2NFNUEyM29wdkM3RXFiYzdRdEdRVEs0?=
 =?utf-8?B?U1Yxa3JaNks3SWtkVnNHLzd5MmQxZW1vNTM5b0tQZWRzYjJGS1FGRXhHMnM3?=
 =?utf-8?B?SnNxK09EOEFIRC9JVVJPQ0diOXFwY3hYblpMS2R2S0xYT3h0Y3pkK0JNUWJR?=
 =?utf-8?B?azR5U3czZGNHWVozZU9sL2M3cWUyY2hxK0lJdHd0K0hTL3RVSVZxQXZNNzVY?=
 =?utf-8?B?bVQ3YlROazFRNHlqT2s0WlFYUFZZenorSGF3Uy9LMEN6TFgyTnRDeGZTLzRn?=
 =?utf-8?B?b2pFNzJlYWNDaGN3UlZFamkzSTlhb2VCOVVPMTZhcGVsZ05mQjllOXFobUhq?=
 =?utf-8?B?eFlpOXhvNGZJZGxIcm1KUnQ2ZjNKeHdvTXVtb3ZMa2lQM1RNRjJicnZTQ3Z3?=
 =?utf-8?B?RENNaXZ4NEY4V1BQT09xYTNqbHc5Mmw3cnZnNFc5K1Z4QldsQzhqb1ppLzZF?=
 =?utf-8?B?ZHdhcWNYK3Z3eFR1ZllyWmY0SUErUGhZTWlJYXpLWTVKeER3Smc0b0ZRemd2?=
 =?utf-8?B?RHY3WERPVVlxSnRKNVg0NmxwSzduYURaWktIYzBCUE5hNEVMTzRDOXdUcGM3?=
 =?utf-8?B?amN4MmZvZWY2TEhLSW9SMDF4c2o0TFBrYjI3aFJGTDNYSjBFVW5SOTc3T2Z0?=
 =?utf-8?B?cFpBZnI2eElxV1NEcnA1eHN5MXQ5Q3lqNE5KbnFLWU5vY2VrRTlLT1FHQkph?=
 =?utf-8?B?VTdSTU9UVlBZT2Z4RVRycnRpU3o4a2dqS0dRNGZVQ3E4T05VVEZIYnE5eENs?=
 =?utf-8?B?MWpEOFJFejdGVkJ3aXV4eGJpYnp4RFhFczNxWGlyQXFCTUtIaGJyMHNJNEM0?=
 =?utf-8?B?QU9zL0NOcGRMdzFjdTVxY2kyWHhnd3h5UGZyb0pIYjl3anRLdHFZMWw2YVR2?=
 =?utf-8?B?N1hrRGR2ZS9SM09ZRzZTdTM3Zk1aMXZpOWNTbDcwckNibm5TNUpORERKUHR2?=
 =?utf-8?B?UUlDRG9NUGgyRVJOUGZrV0RucmxjajFNNDlsak9lcy9ndGE0Z1p5VUtoczI1?=
 =?utf-8?B?NThXcFQvQWNDWEJTd0hkTTgxRVRrN2VzSEpPa0lEVHFMR3h0VnVFNEpvY2Ry?=
 =?utf-8?B?bXcyLzBLdnBqeVdQcUZXT1N2NmxlOVdKZnA1VE1uOXYxT2czdm1MYnQwK2pp?=
 =?utf-8?B?dTI1NmZqRHpsNm1vMWNyQnpaK0dUUHFwZU1JclkxK3FCZkkzRkFBTi9HUGxq?=
 =?utf-8?B?ZkdlRC9tdEpOMHNsNjdtY0ZLeUVWNUlWRjBmVHFXNms5ZWhsanpoSjRGTmx4?=
 =?utf-8?B?SUY4MVdueDdZeGJVTnZ0WXNJZVlJQ2hIajdjL1FtTW13RVpTM0RmMGtzYzBB?=
 =?utf-8?Q?0ZdZ5JmDDSbVwS3qerUL2HtWyRohmBq6pt/HO9oy3OQg=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121aab2-d2c7-4ce2-b6d5-08dbbf640292
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 14:14:06.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB7965

On Mon, Sep 25, 2023 at 06:00:46PM +0200, Jernej Škrabec wrote:
> Dne ponedeljek, 25. september 2023 ob 17:00:33 CEST je Chris Morgan napisal(a):
> > On Sun, Sep 24, 2023 at 09:33:53PM +0200, Jernej Škrabec wrote:
> > > Dne četrtek, 21. september 2023 ob 15:51:36 CEST je Chris Morgan napisal(a):
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > The Anbernic RG-Nano is a small portable game device based on the
> > > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > > > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > > > SoC. There does not appear to be a crystal feeding the internal RTC so
> > > > it does not keep proper time (for me it ran 8 hours slow in a 24 hour
> > > > period). External RTC works just fine.
> > > > 
> > > > Working/Tested:
> > > > - SDMMC
> > > > - UART (for debugging)
> > > > - Buttons
> > > > - Charging/battery/PMIC
> > > > - Speaker
> > > > - RTC (external RTC)
> > > > - USB
> > > > - Display
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> > > >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
> > > >  2 files changed, 285 insertions(+)
> > > >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > 
> > > > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> > > > index eebb5a0c873a..2d26c3397f14 100644
> > > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > > @@ -256,6 +256,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> > > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > > >  	sun8i-t3-cqa3t-bv3.dtb \
> > > >  	sun8i-v3-sl631-imx179.dtb \
> > > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > > >  	sun8i-v3s-licheepi-zero.dtb \
> > > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > new file mode 100644
> > > > index 000000000000..1a4429dc57b1
> > > > --- /dev/null
> > > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > @@ -0,0 +1,284 @@
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
> > > > +		rtc0 = &pcf8563;
> > > > +		rtc1 = &rtc;
> > > > +		serial0 = &uart0;
> > > > +	};
> > > > +
> > > > +	backlight: backlight {
> > > > +		compatible = "pwm-backlight";
> > > > +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> > > > +		default-brightness-level = <11>;
> > > > +		power-supply = <&reg_vcc5v0>;
> > > > +		pwms = <&pwm 0 40000 1>;
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
> > > > +	allwinner,audio-routing = "Speaker", "HP",
> > > > +				  "MIC1", "Mic",
> > > > +				  "Mic", "HBIAS";
> > > > +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PF6 */
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&ehci {
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
> > > > +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> > > > +		vcc-supply = <&reg_vcc3v3>;
> > > > +	};
> > > > +
> > > > +	axp209: pmic@34 {
> > > > +		reg = <0x34>;
> > > > +		interrupt-parent = <&pio>;
> > > > +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
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
> > > > +&ohci {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&pio {
> > > > +	vcc-pb-supply = <&reg_vcc3v3>;
> > > > +	vcc-pc-supply = <&reg_vcc3v3>;
> > > > +	vcc-pf-supply = <&reg_vcc3v3>;
> > > > +	vcc-pg-supply = <&reg_vcc3v3>;
> > > > +
> > > > +	spi0_no_miso_pins: spi0-no-miso-pins {
> > > > +		pins = "PC1", "PC2", "PC3";
> > > > +		function = "spi0";
> > > > +	};
> > > > +};
> > > > +
> > > > +&pwm {
> > > > +	pinctrl-0 = <&pwm0_pin>;
> > > > +	pinctrl-names = "default";
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> > > > +&reg_dcdc2 {
> > > > +	regulator-always-on;
> > > > +	regulator-max-microvolt = <1250000>;
> > > > +	regulator-min-microvolt = <1250000>;
> > > > +	regulator-name = "vdd-cpu";
> > > > +};
> > > > +
> > > > +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> > > > +&reg_dcdc3 {
> > > > +	regulator-always-on;
> > > > +	regulator-max-microvolt = <3300000>;
> > > > +	regulator-min-microvolt = <3300000>;
> > > > +	regulator-name = "vcc-io";
> > > > +};
> > > > +
> > > > +/*
> > > > + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> > > > + * software modified. Note that setting voltage here to 3.3v for accuracy
> > > > + * sake causes an issue with the driver that causes it to fail to probe
> > > > + * because of a voltage constraint in the driver.
> > > > + */
> > > 
> > > Can you please remove any mention of drivers everywhere? DT is OS and 
> > > thus driver independent.
> > > 
> > > Once fixed:
> > > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > 
> > This note was added due to prior comments because in this very specific
> > case we're working around a driver issue. Sadly if I accurately
> > describe the hardware the PMIC and devices that depend on it will fail
> > to probe (the hardware is 3.3v, but here it's set as 1.3v).
> > 
> > https://lore.kernel.org/linux-sunxi/20230629203410.660eb9a4@slackpad.lan/
> 
> Sorry, I should follow conversation more closely. Procedure in such cases
> is to fix driver first and then submit proper DT file. While DT files
> reside in Linux source, they are often used by diferent projects, like
> U-Boot or FreeBSD, so we can't make hacks just because Linux driver doesn't
> work.

I'll drop all but the note that "LDO1 is wired into RTC and voltage is
hard wired at 3.3v". That accurately describes the hardware, so will
that work?

> 
> > 
> > Thank you,
> > Chris
> > 
> > > 
> > > Best regards,
> > > Jernej
> > > 
> > > > +&reg_ldo1 {
> > > > +	regulator-always-on;
> > > > +	regulator-name = "vcc-rtc";
> > > > +};
> > > > +
> > > > +/* LDO2 wired into VCC-PLL and audio codec. */
> > > > +&reg_ldo2 {
> > > > +	regulator-always-on;
> > > > +	regulator-max-microvolt = <3000000>;
> > > > +	regulator-min-microvolt = <3000000>;
> > > > +	regulator-name = "vcc-pll";
> > > > +};
> > > > +
> > > > +/* LDO3, LDO4, and LDO5 unused. */
> > > > +&reg_ldo3 {
> > > > +	status = "disabled";
> > > > +};
> > > > +
> > > > +&reg_ldo4 {
> > > > +	status = "disabled";
> > > > +};
> > > > +
> > > > +/*
> > > > + * Force the driver to use internal oscillator by removing clocks
> > > > + * property.
> > > > + */
> 
> This should be reworded to avoid mentioning driver. Like: "RTC uses
> internal oscillator".
> 
> Best regards,
> Jernej
> 

You got it.

> > > > +&rtc {
> > > > +	/delete-property/ clocks;
> > > > +};
> > > > +
> > > > +&spi0 {
> > > > +	pinctrl-0 = <&spi0_no_miso_pins>;
> > > > +	pinctrl-names = "default";
> > > > +	status = "okay";
> > > > +
> > > > +	display@0 {
> > > > +		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
> > > > +		reg = <0>;
> > > > +		backlight = <&backlight>;
> > > > +		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> > > > +		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> > > > +		spi-max-frequency = <100000000>;
> > > > +
> > > > +		height-mm = <39>;
> > > > +		width-mm = <39>;
> > > > +
> > > > +		/* Set hb-porch to compensate for non-visible area */
> > > > +		panel-timing {
> > > > +			hactive = <240>;
> > > > +			vactive = <240>;
> > > > +			hback-porch = <80>;
> > > > +			vback-porch = <0>;
> > > > +			clock-frequency = <0>;
> > > > +			hfront-porch = <0>;
> > > > +			hsync-len = <0>;
> > > > +			vfront-porch = <0>;
> > > > +			vsync-len = <0>;
> > > > +		};
> > > > +	};
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
> > > > +	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PG5 */
> > > > +	status = "okay";
> > > > +};
> > > > 
> > > 
> > > 
> > > 
> > > 
> > 
> 
> 
> 
> 

Thank you,
Chris
