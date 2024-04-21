Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19014009.outbound.protection.outlook.com [52.103.13.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B0182B1
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713718426; cv=fail; b=rSEOpr92YeNBfJiY6oZc4eg3KH/IZFOhFYax1kKp18ZRpYKdJM5H63Pv/mzQ/rkX0+fnmCEyHI8wMJFF34ndXxuFA8kG35CdBgOKMYF7QR69B1jBCI6WLTmI530XqX7UPrWpyuD3zg50ktY6FUxhB54R8h86UVHYuK+yVjAjrJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713718426; c=relaxed/simple;
	bh=njf2a21/UJDnpEW2DIa1AOYrMo3+qe8Zu+kqGTQkwI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SnWyyoKiN4mSFx1tKCHy5PnKpNafwXLq4cOGgoWx7vBU683OSyY6W4WUcdktmGPC3bkrvPd1t0Qz1OETUQvc3kdlhJXOhp6FQK7OpA1X3mX0qjjN5z5U6YLYtQkkfd7rVY93u2Pkz9eYyTVwaOBP1ZV74+NhArXtHQ2Gg0T+jUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=QSNLCLBW; arc=fail smtp.client-ip=52.103.13.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="QSNLCLBW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjHry3jthjAMClZHHalOugTrvPCzwMDic8NkyMgRElOk7DYsauK4E7CXmfwdGjoZFRM5BoaEdGhi6QjhUG/P9gSzFKXhb+Wht+CE5u/iC2W2s8frnEo6n+2Ios6RURNRKqtu0AfeDAVUze6EdI3bQKEaujVPuSnle34PdSsmOtp6Shm+pvUTaeJEfj1QTRL/ZX7ON7aWy3sPxEsg2c+Oze4z2RB4B7/vmNlzGAHiZlxnqAMhFbuKTDQYgd59LXn+y9EvtzVEX5xQpByUY3+nRd98NIxBzDeGDgtTgt+1YHA53a50PXI1xGpp7O8mGaCvUu1okhRtI1ez2SYR7PAgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkMQE7okN4nt6DaV/SaS+Bbxk0w+rkjhNdmCY/qWfM8=;
 b=gKa58ucGNXj4E7iQ0DdinxRNQzuHgHJFSnV8XxhcnMFXIxrtLGH/sUOKPEGU3BIkq/PNQrCziPiC+HwrdHcsrWHHUB1JzID88Jp9huefhjHb/Q3T6zqJ3JwXypgmg3cRC++pS0e+1lGk27zz6pywEJ9CfMAIN61JYpAtklMOST6MJEWxk7yE9VP3iX/BwO320vAN1K9ySof+/X1Z+S3rRIlSBJLRQg0IjrtYgPDqbjcVHtWHDoXwQCp0+CCexJ5pXtUtTTn8vv7uzCf77ANeVL6UvrA+IsKji2BLYbg9b6g6DetpzRq1B26LYDEExD5Hm0gWZ2iGxcYlXAqX21ExWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkMQE7okN4nt6DaV/SaS+Bbxk0w+rkjhNdmCY/qWfM8=;
 b=QSNLCLBW23LLUplAJyLncUGdnIfDXRoebDuPDuHWAK+0ao0aFhBz5Bep7hMaM6rn6JDw8JefWuDXPORoVqQWocdkR7930CAMkerXMl8hMxLHx3K/jIaqURG6sc/Td80pAsU3QXhTzYDlLLmgWNCTt9AriXonBBbpgVIUqMi3YzO+Xj7B81eoAVlWBovXyg+p4bwub30TQLcpizrFUQ+y/bK8pVlmkuh21NTosI1wZxcneUYjfq5jb4YD2DS8oOLr1mb4wXY7f9w0xcVoRhHemDdtuo5RvsmUTITFGmtUeMser0yy2ZMYBIfl5o0srpUAecvnm3oC18YZRlwVP3somw==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 SN7PR05MB9625.namprd05.prod.outlook.com (2603:10b6:806:348::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Sun, 21 Apr
 2024 16:53:42 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::12a8:4f88:32b0:9407%6]) with mapi id 15.20.7472.044; Sun, 21 Apr 2024
 16:53:42 +0000
Date: Sun, 21 Apr 2024 11:53:38 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Message-ID:
 <DM4PR05MB92292B18E05B16834DE41B5BA5132@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
 <20240420104354.334947-9-ryan@testtoast.com>
 <20240421015317.4a400e31@minigeek.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421015317.4a400e31@minigeek.lan>
X-TMN: [KWHmxnHYii5gneH1qV5UAR5tvCCoaGob]
X-ClientProxiedBy: DM6PR06CA0075.namprd06.prod.outlook.com
 (2603:10b6:5:336::8) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZiVEkiOmu4YPVKSh@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|SN7PR05MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: bcee40c9-e5e4-43e9-5587-08dc62239880
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3BT0Fsv2Y2BNfcXMPkfNhJcnhBiyDW1UiruYPH2EuTASm8Mu4p14a/2i5ikWprOOOUZhhIjPBRaYnBlM7H+oSLq7gMVrOpyNVbHF7njEt+V1WUt5qdJS8lk8DjLPD3XArYWuD0rjUlMZRpB9jlYZ0H7NWmH2HpJr/NQbLWaSk2KoteYMILBUUtip/c+0U46fk5qhXcHXwg89yg7g/JFwivO2xkv/WSZOVgrcjrW9ZDjAIbqtq40BqQ3LB6y5PD4oo0+T1TwMVUa+ltHRttQvBukrFxqOXbl9VvjUJHo0jjBFf5YAAQUJRlu9eLJ3T3okDmKXCGFNstenME+6mDMrn/GaGN7gkpwJi6K8FzeKvob0589X5T7/LjrC+RF98GSeylyT4i+eGBPKZv6lsPVLLlK1ol0x5Zh4rB5mOC4LgwHrCTmaeCbtAXj5ssy5/CuRgblJWNuccRb5PbzwRtqwnKR+jt06U2IORLZDJYUXkRnhJXoRSfgra5O0XD4+UKMepUIfE/WjN9hEO3yfONOZBffsnZexco7L9wjbOH1kLDNRShb0WtJH0SsaCajDExKu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mIDKGrOM92wsnfnxqOCTb+HeWOEmPg+p2ZBBExx+gz3PMjB88a0Ex0FAK7q/?=
 =?us-ascii?Q?1XRfhHtlXGnojVTzMdMi5teZnlnoEZ23xcnsq/fROekVe+HCSMRv7Sk00xWB?=
 =?us-ascii?Q?/FhWxeRMlI4blmAqUWPwgmct1siA44xAL1UJKe8kpS3UUPBZ0kw+UR1Byfz2?=
 =?us-ascii?Q?ukc1tn145ywbUkum0W9QhtveDFO30+ldtzcnBkyftACE/q4edn5JcJr6jEnO?=
 =?us-ascii?Q?qrK72HjdcHLJ29mBTeU5U8VjXlO6AY11rbAxgVWB+M7LmqocxXtiduGKwivO?=
 =?us-ascii?Q?KKgkL9hSaOevHMEaw2ZAxi5lFtkC4etIkuHB3Ky8oSCuQhUhwq5KMBptbrWX?=
 =?us-ascii?Q?bpzzKVVO0Katb1Pu6jTQYCsEj/J3U30FMasT6p9WLD6/3XV7oqywnTwwgH2x?=
 =?us-ascii?Q?roALNVu6ywyxbPkgZKurp61a3la/kKVF/F6fgXOQSr4nGAPZI42/p36iVY65?=
 =?us-ascii?Q?OnlbtDMq8PeYfIzgtQ34CcgQ0HeKdkkwDKcTIZFXvRG5nsHzcfcSQrsno9WP?=
 =?us-ascii?Q?znJAtQ+ebDGnlxlag0IHOmJtp9b8cONPROeg5YcBlsaTzUpj6/bpYLub/NX2?=
 =?us-ascii?Q?hTAEp4FvLWRaN6L63wQWYw0A68zuzZi1bzDYsxSmQEbxZxnxpgEOZ9+nj190?=
 =?us-ascii?Q?Eh0EEJG3xICCCMOvKa31lPB8+y4ZKF+BKXfsVAnePbJWb9wK3GKmVRcWN710?=
 =?us-ascii?Q?Q/COXLAr8f6stn62kGkqNhLegMg2XgvY++BtbS1AVEyKFeGlUgdihwN1ZCEr?=
 =?us-ascii?Q?6I9WEDeB5jpybrXY25//UL2/jlXqiX17FGUSon+o7u/ZYFtp1wdSYt+lASEY?=
 =?us-ascii?Q?4oCtA7cucEbHI1rgrj1R34A6emCpHeeQT39b1pY6ZS6MufRKZgxhCL2mF/uf?=
 =?us-ascii?Q?tc2ESXtpt3aWhVH1r+be56BmcHrUHSckQuygQNfyVWtG/7skFhyV490CO96a?=
 =?us-ascii?Q?m4kXGUgH4i+dO1QU2nhrYbHnnZSus+o+Uzg2ZZ3CZauIM9mp6VpCyXTOSb83?=
 =?us-ascii?Q?jyzMY0Crfcg784CH5+9v9pZlnQ4HCCFOmFSiMSSoPoAscNIyAzCpi1C/OKNB?=
 =?us-ascii?Q?4N+Xvg4w0Ujp3B+NJDsK6WLLT0o55S/XQZQhdZaNiq2nps/PrbY4a/oaLEG4?=
 =?us-ascii?Q?tDsedghDG1xQTeXx1vz2SxR3n/2L3vakB7SB6/9bxgWKF4WuOS0x7f96xJVV?=
 =?us-ascii?Q?bqNOxJgvnAzMM/+I3DwDpb0w00bkHJr8EjnBBD/56OFv3s6erGM+PcbDmcQ?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bcee40c9-e5e4-43e9-5587-08dc62239880
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2024 16:53:42.1347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR05MB9625

On Sun, Apr 21, 2024 at 01:53:17AM +0100, Andre Przywara wrote:
> On Sat, 20 Apr 2024 22:43:57 +1200
> Ryan Walklin <ryan@testtoast.com> wrote:
> 
> Hi,
> 
> > The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).
> > 
> > Enabled in this DTS:
> > - WiFi
> > - Bluetooth
> > - Supporting power sequence and GPIOs
> > 
> > Changelog v1..v2:
> > - Update copyright
> > - Spaces -> Tabs
> > - Remove redundant &uart0 node and DTS version tag
> > - Add GPIO bank comments
> > - Use generic pwrseq name
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> >  .../sun50i-h700-anbernic-rg35xx-plus.dts      | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> > new file mode 100644
> > index 000000000000..67ba1c7bb3ca
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> > @@ -0,0 +1,53 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > + */
> > +
> > +#include "sun50i-h700-anbernic-rg35xx-2024.dts"
> > +
> > +/ {
> > +	model = "Anbernic RG35XX Plus";
> > +	compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
> > +
> > +	wifi_pwrseq: pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> > +		clock-names = "ext_clock";
> > +		pinctrl-0 = <&x32clk_fanout_pin>;
> > +		pinctrl-names = "default";
> > +		post-power-on-delay-ms = <200>;
> > +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> > +	};
> > +};
> > +
> > +/* SDIO WiFi RTL8821CS */
> > +&mmc1 {
> > +	vmmc-supply = <&reg_cldo4>;
> > +	vqmmc-supply = <&reg_pll_dcx0>;
> 
> It would be great to confirm what the I/O voltage for MMC1/WiFi really
> is, 1.8V or 3.3V? Is someone with a board able to measure this?
> 
> The rest looks good to me, thanks for the changes.

I have measured this on my 35XXH and can confirm both the mmc1 IO
voltage and the uart1 IO voltage is 1.8v. It's supplied by aldo4.

Thank you.
Chris

> 
> Cheers,
> Andre
> 
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +	bus-width = <4>;
> > +	non-removable;
> > +	status = "okay";
> > +
> > +	sdio_wifi: wifi@1 {
> > +	   reg = <1>;
> > +	   interrupt-parent = <&pio>;
> > +	   interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
> > +	   interrupt-names = "host-wake";
> > +	};
> > +};
> > +
> > +/* Bluetooth RTL8821CS */
> > +&uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
> > +		device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
> > +		enable-gpios = <&pio 6 19 GPIO_ACTIVE_HIGH>; /* PG19 */
> > +		host-wake-gpios = <&pio 6 16 GPIO_ACTIVE_HIGH>; /* PG16 */
> > +	};
> > +};
> 
