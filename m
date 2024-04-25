Received: from BL0PR05CU006.outbound.protection.outlook.com (mail-eastusazolkn19013007.outbound.protection.outlook.com [52.103.11.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0533101D4
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Apr 2024 01:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714010323; cv=fail; b=jYaouLIvHE0omO5Bsu4XOKmTBCvUcN82Eoz+3LzYAAj9r5HX4vC38vP4auo06wZxBhlj7831JB4mk6lTspyHpkCRbech2rbFGpNmUrZYUGJ8KRKnIPCOgTzv4P3Y93vYJ7Q9PP095xJ3V4YTIXW6W7Z8XRj6i+PN4YoeV6M1pCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714010323; c=relaxed/simple;
	bh=u8ryxBBoZLtfTMo3AGMzSB1i+2GlBPEUmK8zqAb9HiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S2xrAfW/wWeJaFjKZvfcCGyDfotOgC/1B2tc+AJhDm/uBjEglX9EUU2btSmfBG2PUZXSmoxoO2wIb2pkwUIQglTVzNzKZJm7SE1MR/HsUoUMs5pjfyx/J41joPEGQITZpK+xTzoPyrBGrSYi7OMTMA4rY1RAZFRj/8diBpz+FWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=UibnG6du; arc=fail smtp.client-ip=52.103.11.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="UibnG6du"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJlXsb9mA+dJZM3INuENfxZKvOFpugdrjaLv9WxLzG+HumWs2qSeMwah9uQ7zaz+N40kbF6q4WBOgclrZZnemiC/y4mVGwVXdGZLlKGGiqBkSM6/aQ2g9h9RVN6X5GK4pl5I07+N7ZgriN8h82kS8kZOLOBeyJU8cmlxv315/Qxuul1B58x0i+pk7PcW67yeWY7NfZwifk2KAXWtx27GB+dlUoABgYRS1ub0c8lo/1967K/whmprJXSjUlQKkUxcVSTQWcaMfu6NSSNa18D6YAnleY86QqIyoiaOlvbt4tQ4VdJ1J2wdLL5Ns+N6vHNF3CmSbQ1VEPz+5OhXsaY+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmxmgdNIWG501hY+WbBlJNZSQCEDWRF+EWD0tHNllvY=;
 b=e7Y9tQwMbB5SOIqOQ524fYEQPyZVPtESNTGEGnYKYP4tV5WTgsEj78eYbqcbcs+ESou3hzUFPwLOgskoY6o+T9/njID+oWd0xAFN7IwPK0FLQfW3ixSdbEVygR2rLbIiXoz9OY9NG6/De6V8kh8woNRo60bmjN7DFuIB8vJG8k8Z5s22jRsxkH1Mew8/1yB2vPbUMnM2fZdU2nRRkAsW50Ej1gcUWPUUAr2iZsRUE/IuxG+KLod8rekxKev6ELIG6H0A7iDIxGtL5awrpSltDdBphSi9NApf+H/OR06qxYwW1XRghcEZ0uldzV8IwMHRHZRmxOtrt62lQSZgFM44Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmxmgdNIWG501hY+WbBlJNZSQCEDWRF+EWD0tHNllvY=;
 b=UibnG6du9Ln0V29pm817bMjwlMlMiH5/THpmC1QEt6iqEkoRkxCRr8VjkO/Y68zcirZhD3icimP7JYPweP5N+naxbeypKmeFuwjBlDxYGqyjqGsFIMc7OX96+uN/rVI33CXX3G8Hiv/SA30LIr9dkrRLRfQEJOtmQGCfyqlJVYsN5wzHHoVTDWJhPixnIsw0AIs2/HQOExQjAv3Dbrbpegx+i/iT7+waMoj7BYC2etPTaijpsFaJUmhhccpRTHKZNLeUdqB3XJKklJ6qRR749Q1NNgHeaWAfnBPofh5Wb+L6nFsKlcNwQ7d+InYeF6S5DisOwHNaoiKqm+xHAEOUXA==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 SA1PR05MB8536.namprd05.prod.outlook.com (2603:10b6:806:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 01:58:36 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407%6]) with mapi id 15.20.7544.010; Thu, 25 Apr 2024
 01:58:36 +0000
Date: Wed, 24 Apr 2024 20:58:33 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID:
 <DM4PR05MB9229EE6BE60831DFD6C37A62A5172@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240424110947.9057-1-ryan@testtoast.com>
 <20240424110947.9057-3-ryan@testtoast.com>
 <20240425012559.44528ee9@minigeek.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425012559.44528ee9@minigeek.lan>
X-TMN: [Qj+TyMFdT9M49ZfTxhVkvQjmT0paypEL]
X-ClientProxiedBy: SN4PR0501CA0053.namprd05.prod.outlook.com
 (2603:10b6:803:41::30) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <Zim4ybX2SAaVJkV1@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|SA1PR05MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d44217-8e0a-4ce3-ed7a-08dc64cb3821
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DZRSmHts/UTwH8sBH5PRMAiM6VJ1QBRwEdhymYRhZiy286VdqrGSIrkODamSrxgOA1M/YtXut6tSX4R+/57h7IK5On9PaCl3JyUePjiO8TblY+pY67hXGmDJ0e3+btnsUtrc1rSA1Trkp453Fny3jfGE/ccHE6HdlYsK+Nw8uiLWudi8luHPFM6j9dP9PjUQBY84eMZVw3rVEg4cKqSO7bXHf/iGPNzB7KlvYW16eQukNPkQ/DPPgtUsX0PKm0q6iVrxVL9OCwBfWz69/wsw7p3Ziw4Dt0TPjJ0nJJf6g3UBlMZuz+GSyuFMHygjEf6WGGxAF0xlXJH7dbceBoUNmkknSykJS5LAMALO03x4YczPmZPfCYMnNCvSFh8C3ZIUStcw+zrP+ND2cqt/0Z/EQfDCmP/yyDti3XsjJPJHGukhfFrkaTa8INOpywWJIbdVfBKhEbaGeeMz4eEylUDezGZsT5t8wGS2pmBnCY1OQqimbQo+GbHPoKOtEC65OVC9KPF0p7/Wef1CFmrv0A8Rw/B2QChZ+uxK4BvOTRbeYPzg2aOVf1AUOcm/qZwQhxeXf5wT0Y8LciQUxGpT7rwa3e3sg1XsNcEHAxM+VZmLyuPgkz9iyCXLBQkxowT3nd0BtwLYCXkEzXgpjXDozukRZQaY+bSS4HA7DH++Ce3QBy859536OCP1uf2SV30lVIov/l0Bc0iWpON4pIkklDAuVw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gn3Zo+uoPTwpcGUGIUGCpsTx4F/iKqRit11dY0ALNR3nZxH+cCaVtEfFGYzO?=
 =?us-ascii?Q?+C9zh6qTuEmAFgZMHau2SXCt5f4Ar1td7tkQig1+fo1udc8hm23pWsMf7ROX?=
 =?us-ascii?Q?TpmvuzhCXzKlLGKP96JQz4o/We2tuvsPuMdouVnVbL8kTWdPafsRlzr+AyWf?=
 =?us-ascii?Q?jc505CC1+3fJL1TraJ68KW87WRLPhkM/ggKGXhlDqFShsUQ6EiTxwovZToZW?=
 =?us-ascii?Q?HmQgAaEbjP0EFDmzSwluPJ0niUkQx2yKi5zqUFj4X5QWbhI03X7aqU3N9WzW?=
 =?us-ascii?Q?5Rulwb3J2qWYINYekl9ZZES6kNeKMiB+230iNsMXRviMoZY0tRr+/RDpwYCo?=
 =?us-ascii?Q?ML2k7zuRp3gyNxPecyVkxmwqE5QXosduVxkC0fPVddTcsjRw1RQhqVuXUxXQ?=
 =?us-ascii?Q?mDl++mnNT4QuLhe4lMfgOzMFfapVFYTZVnhfWK3JNewBAdkCRtAlT9boU7Di?=
 =?us-ascii?Q?ERvEbpAXmX6GKIvbjYCRhRjWGxI2FsSQuDIWdy1UX9HaRPNjkyhOoB5zm4nq?=
 =?us-ascii?Q?+SXLxSC8NSjNlB5KrGDUTO7ALmkIFCoWwJivq6OfVQAd+PeLgJxiqfIKo13P?=
 =?us-ascii?Q?j1wEIGQv+djK7I9Zj8UQoX6kbkZWkED6p3VMkZKhUPK6OQfcQ4vonIKHfezI?=
 =?us-ascii?Q?we/PJDgxsigvVKHk2ZJQMYW50Ng5n1X7zgxmacytfcWhvFqMj7se3Eal9ct5?=
 =?us-ascii?Q?wMdoOHP459zq5OEJQZB50XqZtUNqdRpwZA25wmz1GXdhbr/SlkUBJUdohr89?=
 =?us-ascii?Q?mAszV55HyFlX6QbJC6scTjDmVzuMuPZsVBkfLJRwnBNbVjLmOrHGtg000EgK?=
 =?us-ascii?Q?mBtpc8DWYrB0KvWmLnQqAqWSu/LuVBD23GFCOdbxJE2tXo03vgZDsYArKDff?=
 =?us-ascii?Q?dusBDpzBWzwgQTGSQZfPYkW/9v2PTpKacTk/39MceOBz0Txk/HRSw7+1mL8c?=
 =?us-ascii?Q?ZWDaPLqUqR0JSpCup6f5yv95WvEu/o5iNsTK8Obqkk//ulMvjyEWFWHIsDJW?=
 =?us-ascii?Q?50hmUUP6OBZ7Zx98IWqerLkhOCmIJWEpTMExUJD8HpJyY/RFUmJWwiFGRbby?=
 =?us-ascii?Q?j4It6ENGO4FWJzBjSX/QHryQG5rndEwm5TlJGCqcpGlWFs/80RVEEByNyP4I?=
 =?us-ascii?Q?hOEM4gouQcTzoJhuYjbW//hxM9uGlaS6MlAlbIre2TR6yK2GTi3nUlUP7FbD?=
 =?us-ascii?Q?rxvhQuMBqdSEOs5vfspHfFWrhB3IoGtvtNAD4HQJ2FyofeJde+za0Z5jf0Q?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d44217-8e0a-4ce3-ed7a-08dc64cb3821
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 01:58:36.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB8536

On Thu, Apr 25, 2024 at 01:25:59AM +0100, Andre Przywara wrote:
> On Wed, 24 Apr 2024 23:09:45 +1200
> Ryan Walklin <ryan@testtoast.com> wrote:
> 
> Hi Ryan (and Chris),
> 
> many thanks for the changes, that looks really close now. Only a few
> smaller comments this time.
> 
> > The base model RG35XX (2024) is a handheld gaming device based on an Allwinner H700 chip.
> > 
> > The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) which exposes RGB LCD and NMI pins.
> > 
> > Device features:
> > - Allwinner H700 @ 1.5GHz
> > - 1GB LPDDR4 DRAM
> > - X-Powers AXP717 PMIC
> > - 3.5" 640x480 RGB LCD
> > - Two microSD slots
> > - Mini-HDMI out
> > - GPIO keypad
> > - 3.5mm headphone jack
> > - USB-C charging port
> > 
> > Enabled in this DTS:
> > - AXP717 PMIC with regulators (interrupt controller TBC/TBD)
> > - Power LED (charge LED on device controlled directly by PMIC)
> > - Serial UART (accessible from PIN headers on the board)
> > - MMC slots
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> > Changelog v1..v2:
> > - Update copyright
> > - Spaces -> Tabs
> > - Add cpufreq support
> > - Remove MMC aliases
> > - Fix GPIO button and regulator node names
> > - Note unused AXP717 regulators
> > - Update regulators for SD slots
> > - Remove unused I2C3 device
> > - Update NMI interrupt controller for AXP717, requires H616 support patch in dt-next [1]
> > - Add chassis-type
> > - Address USB EHCI/OHCI0 correctly and add usb vbus supply
> > - Add PIO vcc-pg-supply
> > - Correct boost regulator voltage and name
> > 
> > Changelog v2..v3:
> > - Remove cpufreq support (patch still pending for 6.10, will followup once opp table merged)
> > - Add dtb to Makefile
> > - Remove unnecessary duplicated PLL regulator
> > - Remove unimplemented/not-present drive-vbus feature from AXP717
> > - Rename CLDO3 to "vcc-io", inferring function from board testing by Chris Morgan
> > - Correct MMC1 vmmc-supply to CLDO3 and MMC2 to CLDO4
> > - Reduce DCDC1 "vdd-cpu" supply voltage range to 0.9v-1.1v to match lowest OPP voltage
> > - Identify DCDC2 as GPU supply - rename to "vdd-gpu-sys", remove always-on and used fixed 0.94v voltage
> > - Fix indentation
> > - Correct boot/always-on states and voltages for various regulators from vendor BSP
> > - Change USB-OTG mode to "peripheral" and correct comment
> > - Correct and add remaining PIO supplies
> > - Move volume key GPIOs to separate block to allow key repeat
> > - Alphabetically orrder gamepad GPIOs
> > - Move changelog and links below fold-line
> > - Remove USB 3.3v VCC-USB and VCC-SD2 regulators pending further hardware investigation (to be submitted as subsequent patch)
> > - Constrain boost regulator voltage to 5.0v to 5.2v to capture default voltage of 5.126v
> > 
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=d47bca77bf3ab475c33b3929c33c80aeb49df35c
> > 
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 347 ++++++++++++++++++
> >  2 files changed, 348 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index 21149b346a60..6f997157968e 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -47,3 +47,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > new file mode 100644
> > index 000000000000..3b53485019f1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > @@ -0,0 +1,347 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model = "Anbernic RG35XX 2024";
> > +	chassis-type = "handset";
> > +	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led-0 {
> > +			function = LED_FUNCTION_POWER;
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
> > +			default-state = "on";
> > +		};
> > +	};
> > +
> > +	gpio_keys_gamepad: gpio-keys-gamepad {
> > +		compatible = "gpio-keys";
> > +
> > +		button-a {
> > +			label = "Action-Pad A";
> > +			gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_EAST>;
> > +		};
> > +
> > +		button-b {
> > +			label = "Action-Pad B";
> > +			gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_SOUTH>;
> > +		};
> > +
> > +		button-down {
> > +			label = "D-Pad Down";
> > +			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_DPAD_DOWN>;
> > +		};
> > +
> > +		button-l1 {
> > +			label = "Key L1";
> > +			gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_TL>;
> > +		};
> > +
> > +		button-l2 {
> > +			label = "Key L2";
> > +			gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_TL2>;
> > +		};
> > +
> > +		button-left {
> > +			label = "D-Pad left";
> > +			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_DPAD_LEFT>;
> > +		};
> > +
> > +		button-menu {
> > +			label = "Key Menu";
> > +			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_MODE>;
> > +		};
> > +
> > +		button-r1 {
> > +			label = "Key R1";
> > +			gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_TR>;
> > +		};
> > +
> > +		button-r2 {
> > +			label = "Key R2";
> > +			gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_TR2>;
> > +		};
> > +
> > +		button-right {
> > +			label = "D-Pad Right";
> > +			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_DPAD_RIGHT>;
> > +		};
> > +
> > +		button-select {
> > +			label = "Key Select";
> > +			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_SELECT>;
> > +		};
> > +		button-start {
> > +			label = "Key Start";
> > +			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_START>;
> > +		};
> > +
> > +		button-up {
> > +			label = "D-Pad Up";
> > +			gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_DPAD_UP>;
> > +		};
> > +
> > +		button-x {
> > +			label = "Action-Pad X";
> > +			gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_NORTH>;
> > +		};
> > +
> > +		button-y {
> > +			label = "Action Pad Y";
> > +			gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_WEST>;
> > +		};
> > +	};
> > +
> > +	gpio-keys-volume {
> > +		compatible = "gpio-keys";
> > +		autorepeat;
> > +
> > +		button-vol-up {
> > +			label = "Key Volume Up";
> > +			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <KEY_VOLUMEUP>;
> > +		};
> > +
> > +		button-vol-down {
> > +			label = "Key Volume Down";
> > +			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <KEY_VOLUMEDOWN>;
> > +		};
> > +	};
> > +
> > +	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc-5v";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +	};
> > +};
> > +
> > +&cpu0 {
> > +	cpu-supply = <&reg_dcdc1>;
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply = <&reg_cldo3>;
> > +	disable-wp;
> > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +	bus-width = <4>;
> > +	status = "okay";
> > +};
> > +
> > +&mmc2 {
> > +	vmmc-supply = <&reg_cldo4>;
> > +	vqmmc-supply = <&reg_aldo1>;
> 
> This is now fixed to 1.8V, which doesn't look right. Either it's not
> the right regulator, or you should extend its range to cover 3.3V as
> well.

The IO is fixed at 1.8v (both the SDIO pins and the UART1 pins for
bluetooth). If you raise this regulator too high the system becomes
unstable.

> 
> > +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> > +	bus-width = <4>;
> > +	status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +	status = "okay";
> > +};
> > +
> > +&ehci0 {
> > +	status = "okay";
> > +};
> > +
> > +&r_rsb {
> > +   status = "okay";
> 
> This is indented with spaces, not a tab.
> 
> > +
> > +   axp717: pmic@3a3 {
> > +		compatible = "x-powers,axp717";
> > +		reg = <0x3a3>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <1>;
> > +		interrupt-parent = <&nmi_intc>;
> > +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		vin1-supply = <&reg_vcc5v>;
> > +		vin2-supply = <&reg_vcc5v>;
> > +		vin3-supply = <&reg_vcc5v>;
> > +		vin4-supply = <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			reg_dcdc1: dcdc1 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> 
> boot-on doesn't make much sense here: that allows it to be turned off,
> which we don't want. Also the binding documentation in regulator.yaml
> says that it's only intended "where software cannot read the state of
> the regulator", which is not true here.
> regulator-always-on is all we need - technically speaking not even
> that, since cpu0 is a consumer, but we need to play safe here.
> 
> > +				regulator-min-microvolt = <900000>;
> > +				regulator-max-microvolt = <1100000>;
> > +				regulator-name = "vdd-cpu";
> > +			};
> > +
> > +			reg_dcdc2: dcdc2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <940000>;
> > +				regulator-max-microvolt = <940000>;
> > +				regulator-name = "vdd-gpu-sys";
> > +			};
> > +
> > +			reg_dcdc3: dcdc3 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> 
> Same here, please remove that last line. We must not turn that off, and
> the state is readable, so it's not needed. We need always-on here,
> since it has no consumer.
> 
> > +				regulator-min-microvolt = <1100000>;
> > +				regulator-max-microvolt = <1100000>;
> > +				regulator-name = "vdd-dram";
> > +			};
> > +
> > +			reg_aldo1: aldo1 { /* SDC2 */
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc-sd2";
> > +			};
> > +
> > +			reg_aldo2: aldo2 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_aldo3: aldo3 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "axp717-aldo3";
> 
> So do we know for sure that's critical? And do we have any clue what
> this supplies?
> There is AVCC, VCC_HDMI, VCC_TV, VCC_RTC, all at 1.8V. The middle two
> are not critical.
> 
> > +			};
> > +
> > +			reg_aldo4: aldo4 { /* 5096000.codec */
> > +				regulator-always-on;
> 
> Is that necessary? What happens if that is turned off? Looks like only
> the WiFi and potentially audio is affected? I think it can go then,
> also pg-supply would reference it, so it would effectively be enabled
> anyways.

I think this does something critical, as in my testing tinkering with
this regulator or turning it off locks up the system.

> 
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc-pg";
> > +			};
> > +
> > +			reg_bldo1: bldo1 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_bldo2: bldo2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc-pll";
> > +			};
> > +
> > +			reg_bldo3: bldo3 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_bldo4: bldo4 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_cldo1: cldo1 { /* 5096000.codec */
> > +				/* unused */
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> 
> Looks a bit odd to have an "unused" comment, but also a voltage range
> specified. Judging from the comment this might be supplying some audio
> circuitry, which we don't need at the moment?
> 
> The rest looks fine to me.
> 
> Cheers,
> Andre
> 
> > +				regulator-name = "axp717-cldo1";
> > +			};
> > +
> > +			reg_cldo2: cldo2 {
> > +				/* unused */
> > +
> > +			};
> > +
> > +			reg_cldo3: cldo3 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc-io";
> > +			};
> > +
> > +			reg_cldo4: cldo4 {
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc-wifi";
> > +			};
> > +
> > +			reg_boost: boost {
> > +				regulator-min-microvolt = <5000000>;
> > +				regulator-max-microvolt = <5200000>;
> > +				regulator-name = "boost";
> > +			};
> > +
> > +			reg_cpusldo: cpusldo {
> > +				/* unused */
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_ph_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&pio {
> > +	vcc-pa-supply = <&reg_cldo3>;
> > +	vcc-pc-supply = <&reg_cldo3>;
> > +	vcc-pe-supply = <&reg_cldo3>;
> > +	vcc-pf-supply = <&reg_cldo3>;
> > +	vcc-pg-supply = <&reg_aldo4>;
> > +	vcc-ph-supply = <&reg_cldo3>;
> > +	vcc-pi-supply = <&reg_cldo3>;
> > +};
> > +
> > +/* the AXP717 has USB type-C role switch functionality, not yet described by the binding */
> > +&usbotg {
> > +	dr_mode = "peripheral";   /* USB type-C receptable */
> > +	status = "okay";
> > +};
> > +
> > +&usbphy {
> > +	status = "okay";
> > +};
> 

Thank you,
Chris
