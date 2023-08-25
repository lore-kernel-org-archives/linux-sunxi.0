Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02olkn2032.outbound.protection.outlook.com [40.92.44.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4152571
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Aug 2023 15:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=of8CbPhzmoHrfvbZqkSXw/mKU3CKO9PXpXSdoO/pFEeVYFChc/xsGFequcXJ84BPZo2LxT0egyk7yHHp4uqTnEyiXGHDEgreCVOqiUpgOfiqK7Ch6IyDUIURLcBetB0vVkoCNW+fWX7uuDwR5bZF+kXlUTO+S77kunoDOVB0eutjUGKtMb1BnuSMihUuBcFN7TEbRqI3aBfosHaCQ9kHEkzau4vEmJEGAP02ZYM1rXEj0b3UQoB4m8pi9InIZOcrV4RzPW7IadpCkiIW3LqNM2nSPrxFWmj6fklZWOOY1TPST5+lVyFlQQeT82t+f+a4P5iQ3DBwn7dZSPCogD7NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brncIlW6JYhMOPQSBLPg9Jq95vO2hb0QYyGuSVM8bX0=;
 b=kuH+CDSX4BNA/lgGsyEBLpXhymOBCljP8SBoTjMLPbt8cIR9eoYUKxfCHzQQPFoTYLnRUt9hcePwzRfo3zfbY78MI26B6Ipsow01ssmjCOKmXn4a1azzdMBjjX/QqxQvJcytkSgAwrxeBUAZEXgqbADVUhcL4h0sz4trA0+Pi9Yv4hpYJb3PRehewBQGx+8Yqu6E2DEKgq2mQ7s9bHat9/ibJvfnhXrwH34t7wk+s1dXF/d/+bc5850Nve5qUwe9t1cJBinLxp95PDXjbnehztyAqkvjN1iNz/J/waS5g7V8zNG2SwbNvEllYEDkASIWoZFnyglZctFPoBH+l5PFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brncIlW6JYhMOPQSBLPg9Jq95vO2hb0QYyGuSVM8bX0=;
 b=LtqT/chZ5tYf7hpGkTQ5oOmKace/Li1RPZXF2YekNb1TODHLSCnOKpWni3jH4PENHgyxrl/rJ6clDUtluvrCYxibk7g6WoOOANqm4U0VvK70d50WzMcamUcmYuBjIkxuSOH3iKjJ/84NGnnOOAo8O1htgm8linieP4QUnMtueg2vPrKnrsVxR8wJSrLpiL7j7QETgE7Yfh0iB3xoDhUGodHFu3iHmn7JGmWiW1TbJLF5Vi9XRMxURP8hmR4qjTzSYPMjNHQgc9u3GvCGq5EcMBIWuwp9daDYnf7YECQnXEx8YjUIc9bGoFSzR9V0jePtnhzV1TkOFczULoXnzApRVw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SN7PR06MB7152.namprd06.prod.outlook.com (2603:10b6:806:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 15:58:05 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f%4]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 15:58:05 +0000
Date: Fri, 25 Aug 2023 10:58:00 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, jagan@edgeble.ai,
	heiko@sntech.de, uwu@icenowy.me, daniel@ffwll.ch, airlied@gmail.com,
	sam@ravnborg.org, neil.armstrong@linaro.org, noralf@tronnes.org,
	samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: Re: [PATCH V3 6/8] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
Message-ID:
 <SN6PR06MB53420D67BB7E11486388637EA5E3A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
 <20230823212554.378403-7-macroalpha82@gmail.com>
 <20230824222150.5a0d16e3@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824222150.5a0d16e3@slackpad.lan>
X-TMN: [Tw23LzFkVDhEdVAcj1MJbmginMfDFa+5]
X-ClientProxiedBy: DS7PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::18) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZOjPiANPzjkEQ+qw@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SN7PR06MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: d06df98f-189f-4c36-b77e-08dba5841126
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jh1GsE7va4xSJ+VpM/EO/gbRHojbdJDRXSleMo9a8kzUp9y4bd2gyOxaaXhLStW2Cakr12AjQjk3QXK/CNxNwkZS9dIHr3O4+/dzqj043iih153eaS1kWw2jYHwsHgR5hJAa5Qv7g617LT+HWfm/JZg95MtqFMqmxd9YHJg3+s+glUVhSn0HrnRhf7OppTTdlcgMIomyza0+5KrelJpqoeG9KGsttZ530I4eq6W4Y4+XK+vCC04EIbRdMFmB6/ithFYL1AddkcY3OYeVHAvY+bzwFwLTer/KNPJ9SStr3E+wWQ7JCaKEiIoPnh82rY89ZN9oJYzc3X+QWTAqcoiSjdgSHkXS08X8o/MSxk06AfKuybpIAVWoJsZYSzy8LNR9wf+yk2dm0tOmt5/hrCjY2aStJZEhhoAHKtApISZ2b63g6mPOiOm5YkZiSPkH45yg2rAZr+ecZJeIO7PN1R0OYqZEwej4tg+x1OLnSoQlSAM/aUmahOcNrqznUgL00AqwophruMbjXYflRrLYNti1l6ni9Vk5thyKo5um/eA823oIJTL42Bo1uj8NwJcG011+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wPmxocLcdtxXrI982J2kOVoCXEMGgyJLR/SsZyeMBpSvFTPHziPOHjFZCAsc?=
 =?us-ascii?Q?AG/vxmbKjZQltV8wFgeauettDs8r2s7kt3gOkpuh0amceHo+Of2Ibj8GhEDW?=
 =?us-ascii?Q?Ci/c+kf2WvZHiPR0ceSfWK4h7Zffq223yTLIf3NhOLlSbqzzPlXlv4osSokp?=
 =?us-ascii?Q?A+tew+WHTxAad7KOzCRt6nBseQpUWBbKky/MlS1f1Kw8rV1hePwlUwOj6Z4D?=
 =?us-ascii?Q?+60WsmZmix5CjdI3fUjSkNWghbD+ocZKDHU9VKY6mlUnZ1Yt9+JrRumQ/clP?=
 =?us-ascii?Q?hEy0CqOu2Rdk5ZCMGWFIb01YwRJt8aSjM2tKrVycLc/w5hljaXh64pajg+ls?=
 =?us-ascii?Q?3x3k60jmpcMLsCZ44aBQUOTmLwYQS2RQialIuCYtLrblGXlUj3wUKRXYy5Kc?=
 =?us-ascii?Q?DQt3YmGTlFZiqKEWBMJkI+P74E4AP0K3GOVQpdcJM9Ft5xRwQn8Is+z0usTz?=
 =?us-ascii?Q?Tpo16vB9cl7tdpjBVjwSJntigMISxo4XUXJaN8FSOvNQZQA9K6maPVOT2qgA?=
 =?us-ascii?Q?PB82G8x0BfwnfW4M1dAdlb83mMt2uV5wQYH0SNpTNrtBE4RK9o+sWXYLEbUm?=
 =?us-ascii?Q?JRjyyLG/HdPBcHOdCNxS4xMG9E1mbPAh3hQA+sZSGl3/wxeTGrAxBM8/jkWQ?=
 =?us-ascii?Q?9+c3JRFyc/CzXZXZ/OFMRlklnQjgi81eXRURA+AWnEhvyTCvGKZczv4mzPSe?=
 =?us-ascii?Q?Vs7AywP2E0yoZcJ5UpEubjd1iDcnxA8lMfy9DA6Mc4HZBsMFoTp6cx9v5vEG?=
 =?us-ascii?Q?/ne/Nse2/5HYbMgcajtbeewQ6ANQwCP22EAV21lu9lanrgYcBDsoChVsRqPe?=
 =?us-ascii?Q?ECpW0OpGP9Mn+ldcE4gRQD8Qr6FFzy8dLk+S8gg6XDIi2CrLn1F/27PqSTvP?=
 =?us-ascii?Q?hFfC5+jldLbfhymP0EtzcjZaxZAs8p69bC/zhULYKDqFisFo0r7nky1PnlNO?=
 =?us-ascii?Q?o4fl0dIGGVDvjhcpPZQEF9M9MqfzwAznXeh16U7X2AXc/+TJxcBmRogJEM3k?=
 =?us-ascii?Q?zzTc2cLZ5Kq9U9r8jK7Ceox+So0GJjs2qv1Ga0bVB45uscA/SF+PyndRAD6S?=
 =?us-ascii?Q?tW0rPrdqzWLM/qSxqTiZYsx7lsMEQCVIDPtS6J6cd0wcrKdYa+rdju+5Dqv6?=
 =?us-ascii?Q?FlH71/DwKMCCqwBD+jgKUuwMYrvJbq0gvCcKec7Qq/mSgt5p5paha0gV8he4?=
 =?us-ascii?Q?hlvhCq84oAtn+4+kjm+vD1M6VHLejMb/iXHvxrH/SFD6cdjMUc8CqQsxdCw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d06df98f-189f-4c36-b77e-08dba5841126
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 15:58:05.2241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR06MB7152

On Thu, Aug 24, 2023 at 10:21:50PM +0100, Andre Przywara wrote:
> On Wed, 23 Aug 2023 16:25:52 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi Chris,
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add the EHCI and OHCI controller to the Allwinner v3s to support using
> > USB in host mode.
> 
> Alright, so was it really that easy? I was afraid we left out host mode
> for a reason back then ....

Can't speak to that, but it is working for me as both a host and a
gadget.

> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > index c87476ea31e2..eb63dd274305 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > @@ -319,6 +319,25 @@ usbphy: phy@1c19400 {
> >  			#phy-cells = <1>;
> >  		};
> >  
> > +		ehci: usb@1c1a000 {
> > +			compatible = "allwinner,sun8i-v3s-ehci", "generic-ehci";
> > +			reg = <0x01c1a000 0x100>;
> > +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> > +			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> 
> Please add the link the PHY here:
> 			phys = <&usbphy 0>;
> 			phy-names = "usb";

usbphy 0 doesn't work, but if I do phys = <&usbphy 1>; for here and the
OHCI node it does work. Is that expected/acceptable? By "doesn't work"
I mean the device is always in HOST mode if I use 0 and switches
correctly (the extcon shows HOST=0 when unplugged or plugged into my
computer, and shows HOST=1 if I plug in a device which I assume is
the desired behavior).

> 
> > +			status = "disabled";
> > +		};
> > +
> > +		ohci: usb@1c1a400 {
> > +			compatible = "allwinner,sun8i-v3s-ohci", "generic-ohci";
> > +			reg = <0x01c1a400 0x100>;
> > +			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> > +				 <&ccu CLK_USB_OHCI0>;
> > +			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> 
> ... and here.
> 
> That would be definitely the right thing to do, but please check
> whether it still works, especially OTG operation.
> 
> The addresses, clocks, resets and interrupts match the manual.
> 
> Cheers,
> Andre.
> 
> 
> > +			status = "disabled";
> > +		};
> > +
> >  		ccu: clock@1c20000 {
> >  			compatible = "allwinner,sun8i-v3s-ccu";
> >  			reg = <0x01c20000 0x400>;
> 

Thank you,
Chris
