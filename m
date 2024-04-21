Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2083.outbound.protection.outlook.com [40.92.18.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23817E9
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 03:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713668993; cv=fail; b=twxaUCZQKnm980bU2I/AjKNhJwQhMlmEYefXHi0x1XEGp54oyigKuJnj1tLmki5joOoY96ykAIj/SwnKvTaV0a3+RkOlpzOxSXnztqoFRZL7rHkYLkCUpqoaGIPcZoNnqXc3xFNrxrbhUtpaYzeADTEYDKLV51lq67smJo2fguw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713668993; c=relaxed/simple;
	bh=2m+WjXAGJpNsvXO3+7cCPj+CMB/iazlhE+xk616MZMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kq5dDp6+sjYU35OaPoMA+JHbmvyk+0xq1opUm4Pg8oopKi3++vcxPS56T91pG1t35f3ydBAGshB+YQlOPNMY9YSIaaIti/0cK4gNU6+j43QZtEK+c7VYB2ClVdUOntqKdxjR5V48cREBCHK4b7oSjqiRyL94CPxG2cZF+jQ8F6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=ZqAby0m/; arc=fail smtp.client-ip=40.92.18.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="ZqAby0m/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXqHdvSubc5M9pyo22MazFXBAATWqfyhunFDvSgdSNf/vLNC+cbZr5n31z1U7c7P8QwIjD5GhOUYLAFbDRefdpamGzsAwiauy6yAt96AV1iZ5iuReGyvwxdXBbsauB9l3T/n6ardePlbF9HBomvOVOYIQk+BBci1sZPeoH3dj958LeC0YNhNWCB8T+JxX18siiQBZ4Tg0/Mu50vqUJFkouHxURm9mUlOOR2kREeLofDubMV43xX+OaQ2i+0oSm7a+ZRZ9FPh/3RYPTHndprSqVR8d7hBX9B4Z50QfuS9YEADHBgU0SMCjZV9JrAdecRO88QlzE0LsvnLHWMXM+Mj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg4gTLm9gCUPuc3RAGWth6YFI7OSKa7aRyZ08k/W8A0=;
 b=avb3pZ3tmwQBBDx71opuNVKV7dFLFe6+MhHwjKprCauPshy43qFGaqa9n01iKuzAMjtc9q8EHtq1S342f49XogW+WRVzvANPN93onZiouGrRFWXHId0uBWEgOHd3dAwEeGI5EdnsrwrwzYev9MYvkAYlMZaaysmeIOvdFz3nOzap1JzIt8hUTHXNBXeKznAQjiUDw0VzX90NIezFEIXp6hkXfwmOWB8NqvfxOTcTHLzzIdC5dJ2YR1fWjFfjGsV2PYr3DTUlPRwRXzRw+f9nFSdUna6bjJDcVdjL609TUWGbtr2Vd3HBaQxTMRX81YnytXeMJ4Z9EkOaD8G96rK8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg4gTLm9gCUPuc3RAGWth6YFI7OSKa7aRyZ08k/W8A0=;
 b=ZqAby0m/WtS6/CiUeiauuaI1iB6jWcv1wlGv0gDZEZ2wNCnPYc1mHQmNzzwb/MJ2JJtfT1p9YwJdu5/Vhc/mbus8mXAnlHCd7M7GBIjHUVn1PEGpO2XLM72+ucJrVir9S4oqddFtfTix5LEJ4qn419hsceC6fmfW995cQIGufM0k2qRuYYR5gfygXUe3D8yCeThdGVEjTRJFvlUOuFVQ928xXTYyAMGRnJaAr6/RJ047TnyHLmiAOMxP9bLwuWG74bSOq9eG1kmBpMkiGXxd1PJrc5MO2ITKjvmJNgOkiwqRbXMkh0qwDcKSpoziGCIvBYMWB+yipazQa8A2xm1iCQ==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 PH0PR05MB8415.namprd05.prod.outlook.com (2603:10b6:510:ca::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Sun, 21 Apr 2024 03:09:43 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407%6]) with mapi id 15.20.7472.037; Sun, 21 Apr 2024
 03:09:43 +0000
Date: Sat, 20 Apr 2024 22:09:40 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 4/5] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Message-ID:
 <DM4PR05MB9229B7D4654478D28D1BC2B6A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
 <20240420104354.334947-10-ryan@testtoast.com>
 <20240421020627.6d186f8f@minigeek.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421020627.6d186f8f@minigeek.lan>
X-TMN: [vXIg1AqbCbOOxR47jkLEiWsvKsAjEmdb]
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZiSDdKnR2PWjxqb5@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|PH0PR05MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: d75781d1-f575-4c09-2731-08dc61b07db7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1LB6nPjHHgNU0/NDsFYDSv/owX7xRJnqCfxLrYEqtSlZXzoAaXOkpHaJvoLF47GpUH53bQoCrWsK4mLfFQvV1My+zQPIX8gnlXu3+QrSL/XzKIsBlSvqy1uSBTttlAmNXBtwxbcRemjWK6MrFFSS6daZ0G56DAbMvXEnmlv0emDaC3b1doagqHfCbOUF9qALUo4zV7IYf9vku4L+A0hpNsZgVTCIEUTQB+NFZLh2aPM7vDZrPPIwhr9R9G/f5BZ+g/iQnrTjSwu5NWs1Gq7HOOI7PNfq5dhlgu1Hc3A4JvU8CCbxV8STtA/H8ZA7d20TK/8bP15LqZOwrzdPLo+zAxxmsNJAqLHeiFj37x0TggsTrk3m4X9bsd+burwu342fF+KJD/3RDt/GHEdCHGEZYPecW4BsS6+SAyAGP6UngEqkGCt30EUDcDRDExv6EolW6cy5cY8KHNVs5CMadFcw7zX46SOhr6lNlzTkoGcLyZ/pp3ZPhnCA8MFnV3jWMLy/R2t+f90VzzFIIPJxi+IwY8xT1W/LzksDZ2Z/z5mki3zjwpoxtpYfUR4hFc8T0+2QPpT+MOEnq1qj8uCRhevWDsrF8wtqKkO+7QAUYHqVC5K4w0POEB/EWyo2033uJ4A3TeEvnaMBU3k2/EEu1l5TbqFk69WbKR8a1V/yISJOEU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JQX1BGYe41RfRbBfibbMs25iCQLJ2VOJ1fr/VJ+ZFefpqskscAH5GwgRpy4S?=
 =?us-ascii?Q?XUXFO5D0oezBSd/Kz2DfuHXVAIv3cEbYisUEdrHCF0rQeY+UrXZx+x1BWiKy?=
 =?us-ascii?Q?ty6e4E8kqvwRxGkzXbbh1eYL3vYKj2O1uGo0unrjfli+3nV95KXmSDPllQ7+?=
 =?us-ascii?Q?uiI2WjNF09W7f9STPYE7fbXiIKXc7l6OLUqr8gLv7jdPvGOyPKNuF93S+klo?=
 =?us-ascii?Q?xx9eIHpTpfV+xuv+/reY8nA+UCabvvmSC0/CCyzkzmKFn2JI33rNdoU1jKu5?=
 =?us-ascii?Q?LEmUPsh1DbXznQ8XRxn/vZb+5Y9jOxvOjHY1TzBchVEAmbHQvPSFJFEc6bI7?=
 =?us-ascii?Q?n4AHEsmAn9qa2YQUeGVn4NzhPp0FEppUpT7NuzTrEY+Xgk70BNvn74NpLy0C?=
 =?us-ascii?Q?DasM19PSwlxc9p/iM/4UttKXZQnf4RtQkMGtt6maIX1ccoDNp8O6/jnV67vA?=
 =?us-ascii?Q?y25QQXm77M7RjZ65xuF7S3/FpQwPVuuud3J3Oy2+DQGyVABX0YcRc8ie1mDc?=
 =?us-ascii?Q?ApNRCbjtEtey503ZX7PRzmYdWiX7z9yZ9ZLNf4pbSDeyErHIXSBjiL5EoEBC?=
 =?us-ascii?Q?mDrQUUmKovaH/QhA0q3olPcRdfmWX2z+ohv7IoRMUw2gl03o9RFyysYwHkaq?=
 =?us-ascii?Q?JnyUwRfneDNnCGO10Kep+mOAFCpKbMPkWEdwxPtPeh0A0G09qbEJdza2EKY+?=
 =?us-ascii?Q?iaBbrtAITFvwcR+3HTD4lbs3g6DoYNUHdObT9Wzk379kFPKVUj90ueEOATjK?=
 =?us-ascii?Q?g9ATJJLAu4ln56ulRg8Y+0guH7ziE+C5/IAh5r1qn4ED31dYuTTixM2FhHZY?=
 =?us-ascii?Q?dwNAvDjmylryzIao/LQzGY4zNzG4lLIc81yllZkpCPuwSW0EtuAhm2XKy5L6?=
 =?us-ascii?Q?oHTYL1gUuPti01lA89LiFF/n1HccHn5Vxdzohb63/YsmJal5ndOqGSDFVy7P?=
 =?us-ascii?Q?Nt1N+y5R93qoayv2OtBQxPYSDXR5l1xXTrQwnqbdD8AWdk+bv44OmZe5O4lH?=
 =?us-ascii?Q?YC4xScFxiVYGbVJkzxJ5mTwCkBxFCGJXVGVNKjkpyare/UcCmbGW1MK1j7Az?=
 =?us-ascii?Q?XUPr2dJGQEDNKgvrALdiVMOB+Ji8YV2zKiD+babCst3B/2Qhz8Add1WQX6AU?=
 =?us-ascii?Q?NWAZn8ITDNNn/6GUfyMGgiBIxzOJefcoBPlS2ZZKMSBt/+7w01n8tx2UQKFk?=
 =?us-ascii?Q?ysDY9EmQ1R44mevwi0QGeeVHFLfShf7XrgKvrnIrkZ/OrjE1frb+sT6zk3M?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d75781d1-f575-4c09-2731-08dc61b07db7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2024 03:09:43.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8415

On Sun, Apr 21, 2024 at 02:06:27AM +0100, Andre Przywara wrote:
> On Sat, 20 Apr 2024 22:43:58 +1200
> Ryan Walklin <ryan@testtoast.com> wrote:
> 
> Hi,
> 
> > The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port to the RG35XX-Plus, and has a horizontal form factor.
> > 
> > Enabled in this DTS:
> > - Thumbsticks
> > - Second USB port
> > 
> > Changelog v1..v2:
> > - Update copyright
> > - Spaces -> Tabs
> > - Add GP ADC joystick axes and mux [1]
> > - Add EHCI/OHCI1 for second USB port and add vbus supply
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > 
> > [1]: https://lore.kernel.org/linux-sunxi/20240417170423.20640-1-macroalpha82@gmail.com/T/#t
> 
> As mention on patch 2/5, this might be better an optional dependency,
> so the GPADC part might be a separate patch.
> 
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> >  .../sun50i-h700-anbernic-rg35xx-h.dts         | 126 ++++++++++++++++++
> >  1 file changed, 126 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
> > new file mode 100644
> > index 000000000000..d62cf5cd9d9b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> > + */
> > +
> > +#include "sun50i-h700-anbernic-rg35xx-plus.dts"
> > +
> > +/ {
> > +	model = "Anbernic RG35XX H";
> > +	compatible = "anbernic,rg35xx-h", "allwinner,sun50i-h700";
> > +
> > +	adc-joystick {
> > +		compatible = "adc-joystick";
> > +		io-channels = <&adc_mux 0>,
> > +				  <&adc_mux 1>,
> > +				  <&adc_mux 2>,
> > +				  <&adc_mux 3>;
> > +		pinctrl-0 = <&joy_mux_pin>;
> > +		pinctrl-names = "default";
> > +		poll-interval = <60>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		axis@0 {
> > +			reg = <0>;
> > +			abs-flat = <32>;
> > +			abs-fuzz = <32>;
> > +			abs-range = <4096 0>;
> > +			linux,code = <ABS_X>;
> > +		};
> > +
> > +		axis@1 {
> > +			reg = <1>;
> > +			abs-flat = <32>;
> > +			abs-fuzz = <32>;
> > +			abs-range = <0 4096>;
> > +			linux,code = <ABS_Y>;
> > +		};
> > +
> > +		axis@2 {
> > +			reg = <2>;
> > +			abs-flat = <32>;
> > +			abs-fuzz = <32>;
> > +			abs-range = <0 4096>;
> > +			linux,code = <ABS_RX>;
> > +		};
> > +
> > +		axis@3 {
> > +			reg = <3>;
> > +			abs-flat = <32>;
> > +			abs-fuzz = <32>;
> > +			abs-range = <4096 0>;
> > +			linux,code = <ABS_RY>;
> > +		};
> > +	};
> > +
> > +	adc_mux: adc-mux {
> > +		compatible = "io-channel-mux";
> > +		channels = "left_x", "left_y", "right_x", "right_y";
> > +		#io-channel-cells = <1>;
> > +		io-channels = <&gpadc 0>;
> > +		io-channel-names = "parent";
> > +		mux-controls = <&gpio_mux>;
> > +		settle-time-us = <100>;
> > +	};
> > +
> > +	gpio_keys: gpio-keys-thumb {
> 
> Is there any reason to not just use the existing gpio-keys node?
> Either put a label on it in patch 2/5, and reference that below,
> outside of the root node, or use an absolute path reference.

I would also second just putting an alias and adding these to it.
I myself as a preference tend to set the GPIO volume buttons as
a seperate node only so I can enable key repeat on them, otherwise
one node is best.

> 
> > +		compatible = "gpio-keys";
> > +
> > +		button-thumbl {
> > +			label = "GPIO Thumb Left";
> > +			gpios = <&pio 4 8 GPIO_ACTIVE_LOW>; /* PE8 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_THUMBL>;
> > +		};
> > +
> > +		button-thumbr {
> > +			label = "GPIO Thumb Right";
> > +			gpios = <&pio 4 9 GPIO_ACTIVE_LOW>; /* PE9 */
> > +			linux,input-type = <EV_KEY>;
> > +			linux,code = <BTN_THUMBR>;
> > +		};
> > +	};
> > +
> > +	gpio_mux: mux-controller {
> > +		compatible = "gpio-mux";
> > +		mux-gpios = <&pio 8 1 GPIO_ACTIVE_LOW>,
> > +				<&pio 8 2 GPIO_ACTIVE_LOW>; /* PI1, PI2 */
> > +		#mux-control-cells = <0>;
> > +	};
> > +};
> > +
> > +&gpadc {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +
> > +	channel@0 {
> > +		reg = <0>;
> > +	};
> > +};
> > +
> > +&pio {

After extensive testing with a multimeter and fudging the regulator
voltages up or down, I've been able to figure out the regulator
assignments for each of the different power domains. Schematics would
have helped, but sadly this had to be done the hard way. Based on
past experience with Anbernic I would strongly suspect all devices
have this assignment, but I know for sure my  35XXH does.

        vcc-pa-supply = <&reg_cldo3>;
        vcc-pc-supply = <&reg_cldo3>;
        vcc-pe-supply = <&reg_cldo3>;
        vcc-pf-supply = <&reg_cldo3>;
        vcc-pg-supply = <&reg_aldo4>;
        vcc-ph-supply = <&reg_cldo3>;
        vcc-pi-supply = <&reg_cldo3>;

On my board the reg_cldo3 is a constant 3.3v output, and the reg_aldo4
is a constant 1.8v output.

> > +	joy_mux_pin: joy-mux-pin {
> > +		pins = "PI0";
> > +		function = "gpio_out";
> > +	};
> > +};
> > +
> > +&ehci1 {
> > +	status = "okay";
> > +};
> > +
> > +&ohci1 {
> > +	status = "okay";
> > +};
> > +
> > +&usbotg {
> > +	dr_mode = "peripheral";
> > +	status = "okay";
> > +};
> > +
> > +&usbphy {
> > +	usb1_vbus-supply = <&reg_vcc_usb>;
> 
> This is the dodgy USB supply chain. Any chance we can narrow this down,
> to maybe one GPIO controlled regulator? Also, where does the boost
> controller come into play here?

I haven't figured out the boost regulator yet, but for the host port
I've been able to ascertain there's no less than 2 GPIO controlled
regulators in play. PE5 must be driven high or the USB host port will
not power on at all. If PE5 is driven high then the port kicks on, but
at 3.3v. Once I also enable PI7 the port then reaches 4.6v. I'm not sure
how to get it to a proper 5v yet, I'm still working that part out.

Maybe PE5 is a reset of some kind that's active low, I don't know. I
just know so far/for sure that if PE5 is low then nothing registers on
the USB host port; if PE5 is high but PI7 is low the port sort-of works
at 3.3v, and if both PE5 and PI7 are high the port works consistently
and at 4.6v.

> 
> Cheers,
> Andre
> 
> > +};
> 

Thank you,
Chris
