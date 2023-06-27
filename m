Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04olkn2108.outbound.protection.outlook.com [40.92.47.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E571308A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 17:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoV9+eWXGEWiaqFFELzFON0cKlidAzMRxNJX2iVxUI6lHjJtA46UeTjmHXGticGLoN/1qtaWHxXdcjyQq8ESRdUhhFPxJ5K5gBdSA4qoLlXdN7nTHl6RYHdLkuTDlUZEzHVUyA5LFBdHieH+obluVbRf59F2rKbcOYR9jwrI2K2v6Jpc3E1nBLiU/7dNzryj6JDdeDGwnRv8ReaVJrv4WALpoLHQ1dw+Y9CzcdYGbR9x0jekQalhu+IAeAPJCoJKUAFzCdBs5tc9VhZpMpw5GJAMSkBZPYw7FYWVHVe2SUBQRPO65RUx+KJ+1t0f6uohyDTBqUU60poQe+uddzUfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LBazGaFpLploPi3ms0hpIsu7P7Z7eOZarBvFFSzCN4=;
 b=MP33lWUUkMit1Nmfl3Lfu1xiSCTvTACLH2lowRz1T8jm1jLmoSzAyFKnYuq41h01ulQWLD+HTek8TXERHmkQjHIxjRyB+IKq+Zbt/cHQShJPYVJLsZ14xhIGdZ/6TaAMEPVhIX+w71ZJryBTHjav/QlQoszi9KZHxchgVxPq8LQGPUNgdxEJNpc76hpFPqdYE5RBBjauuUDOgqx4UBgX0O6uYv3OmwiEIobnTxlnmeFjVD4qVxBS3OdAlfmS45CO1rSY6raGH1NvNizoU+lnp5Z1PGK/fKqkTVdbMEReQd5U7p9AwXrwWdH8Jt2YT8VTVc4b/A/ZvDa4zAncOH7l3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LBazGaFpLploPi3ms0hpIsu7P7Z7eOZarBvFFSzCN4=;
 b=Tvfai2MAO4ONnihJpTUPgKEomQGKpPbpzUUWxGM3/+29rwpGPwnjw3zucDEQ+KVYx3/S31uG3Hx8oT0i4Wb70CnuRExxiHP2mY1ouLSBSAlyPTUbZ1HAAdm8cM4u/83+5jmbPQjO/ZukQeY3eMavkGLXyiSukYH7pl9kdNya1PBR0d4IXs7ffdHx3rxs6xnccjBE9RRt0liA2pdZWIpba0wGw+KOv5FIV+wCClGyn+mtyIZOVwMhCB2aCeJ+uRQftYOmCfBQCP8XornZxWm60VUnGwEFLNyL0zvfXdHBmdsxJV3XmXNWsrdxPwcvsPW70brEY5hRFo9kKtCZy2qZrg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW4PR06MB8316.namprd06.prod.outlook.com (2603:10b6:303:12b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Tue, 27 Jun
 2023 17:49:51 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109%3]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 17:49:51 +0000
Date: Tue, 27 Jun 2023 12:49:46 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Chris Morgan <macroalpha82@gmail.com>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com,
	wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/3] arm: dts: sun8i: V3s: Add pinctrl for pwm
Message-ID:
 <SN6PR06MB53426CD2F0FCB98A48E6DAD2A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
 <20230620200022.295674-2-macroalpha82@gmail.com>
 <20230621005000.558b660c@slackpad.lan>
 <45cfb4dc93de59a539d48a37b9becffa4d2d6278.camel@icenowy.me>
 <20230626095005.4a95c151@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626095005.4a95c151@donnerap.cambridge.arm.com>
X-TMN: [fatqUxcljNJ9jWN1f1Vy/8rncMLDd+km]
X-ClientProxiedBy: DM6PR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:5:337::14) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZJshOp3yuTryMkuC@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW4PR06MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: aad2d5e8-05ba-4dbf-827a-08db7736e7ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X2ggYgF2fh7CyQFTrFIQpPr4eMwCLo6uOpfnbbH+ztV+48HlNQ89c0BwRe0nkvX9W4E4BQgkYGTwF+b47iTy0vu+o8kABmJZb5zJyoifxqQVaMUBAkxW1rvI/YiLf0HMCb1NIYZxagT+qaeuhDRMzdhzYyRZc+njyOls45QumJshNZUeApIxCME0E4593H219spyANrXGLd4eY7B81Tp9bV7CZfSbgxcn2biuWDGs/fbtWPpzM0Uc4+6Ux+Asc1IZpKwrjZIQ2iTLkqpYhirutX/4vX9azDllu4dJLTzwRneDJZBKbEfH2bsFBksilD/3+ZR84o7a6+KJNT3cViWyXvPp+DP6NiFUsvld9NsTdbovZgm5ATeMen4lWiOxderNmMREkskeO/67CZi3+CCOJxgrddYg5vslz2R/9NQBGbwf6lzpQEc18/KoRbYMCVmzjBbAp0iYN+RT7/wyA16vjb7OuSiof0cg/9jirW4xEmjhSmAWi7sURNBCyDCcRW3eviz4PDeOVZGSIbkW0mpfzktdHeICQMJNumN2Sr5NewAlDdm9WFB7+hzEHeRKN2c
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEJTdmpSTzhnaktHYXNWMndVQjA3cFZISHI1bDJCK0FGM2EvYkloOHpOYVMx?=
 =?utf-8?B?RTNJMFNZdUhCb0kyOGZSUXJSYng2TnZvVDh6dmk3aW5FaE15VnlSTDFzVlds?=
 =?utf-8?B?RnNWSCs2L3hrMysySER4M2hWQVVTMkZweW81UElJQVVaU2VIMVBLOTVhbEti?=
 =?utf-8?B?OWhqblNwT2IvdU9KeU8rdmd0YlE5ZUM2Z3pBcmNXd01wckR6UXphQkl1bm01?=
 =?utf-8?B?b25HRVpERHd5ajRJS2UzVnlDNCtjNVR3MUpOS3FFUWowdVA3TWNmUWk2anRH?=
 =?utf-8?B?TnhwbWJ5OVd4Uy9KcnhKUVBSSE00T1hXWFVLZThwR010Z1o5WWZZeUF2UlFH?=
 =?utf-8?B?a1doYzdWd2g3U0xVV1pPTHExT0IxVDZkMGlzMmgvcEIwWld3QTJYNVI2T05P?=
 =?utf-8?B?Z004K2JRMVVicERrUUdwdkNONnJTWEdJWW0rbmZURjRVUCtSbjVHL1F2Y1ls?=
 =?utf-8?B?STVZMjZ4R3d6QlplWXR4OGYxcDZyTnpEVlJYRGVGRDJUdmhKYUxmbTF1aVY3?=
 =?utf-8?B?RU92UnNVMEVxUEUybmw1ei9ERFdLZmU4Tm4xTlpzMCtsWkh3YlBNWnhyOVll?=
 =?utf-8?B?ZEhKYWgvRjdPcmM2eWZvOXM4TjlnVlZPODZUemcxSk1ibEN4WDBualovTDlI?=
 =?utf-8?B?ZWdBT2d2VG9oRzNnTldKZmdJV05nd1BQUXpPdE8wYmlYbmJTb002Y0FlSWZn?=
 =?utf-8?B?WTRDR2RpWm5FbVhUY2xBSU9PUGJWN0k4N21vRzJjTmJEVG5MYVhOdjBYYXJr?=
 =?utf-8?B?L2Jxb2NraktiRWxkOWkxOUFtQzhIMmNWVlJ6SEVXN3lDcXJMSDNMTjUzM1NI?=
 =?utf-8?B?c280TnRXQWVGWDE1MFNML3UvV1ppOHM1ZC9jdk5aS2o4MmExT0p0MGRHVFYv?=
 =?utf-8?B?V2V4SlpMcEVxUU5tWkhySk5wQ2V6RDNaV0ZXMFd1RklCMjRIMWVaUUVSRHZL?=
 =?utf-8?B?SlRkYWRORUN1cThjd0FJYnJodUcxaCtMNFpRM2tNN0oza0dWZ05sRkNBNmNa?=
 =?utf-8?B?ZCt3ZmtyY1JvWklESGoxZGRKRzg5RDd6ZnVYaHNMNWRRMTVlZmRzNENTOUxE?=
 =?utf-8?B?OVNyUDgzVHpsUkQyUU9TbW0xV3NtZlZ1SVBFdEZDWEw1Yjh4cGU5Ukw1eEVT?=
 =?utf-8?B?SDFNZVV2aDFWNnpQamFPWnZWZ3JVRmd3TTdxUDZHVVNzTEhYQlFCM2FyTHhp?=
 =?utf-8?B?dkQ2TDRjTFRMSkJUU2dlUDVMVjBtOWVaVFdtTlhJODZHTTJqNzVTY1ZHVkJa?=
 =?utf-8?B?Zis3U2pNTndJWDJWOERoSFE4ZXoxNU5sVG1LYitSUXRmbTBySCtPUnZOYXQ0?=
 =?utf-8?B?M1hpcjBmOXdmR2ZsVnBkS2R1bnhJZzBpRkROT3pYNjQ2cVZOdVRIb3JhRGNo?=
 =?utf-8?B?UE5NV1A1aW0waWx5WmU4cUhBa2FnTkF6QUJER1hYZll6c3ZWbVRPTG01SFJU?=
 =?utf-8?B?V29lRmcwbnZNUjZaWFkwQnhFL0kvMHJDVUQvNnZWY3ZiaU5tREVZdTNVdzZV?=
 =?utf-8?B?REV1L0VEa0RXd2MxMXh1b0ptQ01LOUd2TGNLK2xUYm90QnZPUk9OWS80dGRK?=
 =?utf-8?B?QTQwM1l5bm5pRFJXNUlQOThwY2hpR0xMZnFzSXRYbjRYaGtyc0hGUExndHVn?=
 =?utf-8?Q?W0FNPIclebBW7S30nHTgSXfx2gK+x3JbIozVdiY+ZP0Q=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: aad2d5e8-05ba-4dbf-827a-08db7736e7ef
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 17:49:51.2167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8316

On Mon, Jun 26, 2023 at 09:50:05AM +0100, Andre Przywara wrote:
> On Sat, 24 Jun 2023 12:57:49 +0800
> Icenowy Zheng <uwu@icenowy.me> wrote:
> 
> > 在 2023-06-21星期三的 00:50 +0100，Andre Przywara写道：
> > > On Tue, 20 Jun 2023 15:00:20 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > 
> > > Hi Chris,
> > > 
> > > thanks for taking care of upstreaming, cute little device.
> > >   
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Add a default pinctrl for the pwm function.
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>  
> > > 
> > >   
> > > > ---
> > > >  arch/arm/boot/dts/sun8i-v3s.dtsi | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > > b/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > > index b001251644f7..e5977524abe2 100644
> > > > --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > > +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > > @@ -414,6 +414,11 @@ mmc1_pins: mmc1-pins {
> > > >                                 bias-pull-up;
> > > >                         };
> > > >  
> > > > +                       pwm_pins: pwm-pins {
> > > > +                               pins = "PB4";
> > > > +                               function = "pwm0";
> > > > +                       };
> > > > +
> > > >                         spi0_pins: spi0-pins {
> > > >                                 pins = "PC0", "PC1", "PC2", "PC3";
> > > >                                 function = "spi0";
> > > > @@ -441,6 +446,8 @@ pwm: pwm@1c21400 {
> > > >                                      "allwinner,sun7i-a20-pwm";
> > > >                         reg = <0x01c21400 0xc>;
> > > >                         clocks = <&osc24M>;
> > > > +                       pinctrl-0 = <&pwm_pins>;
> > > > +                       pinctrl-names = "default";  
> > > 
> > > How is this supposed to work with multiple channels? There is PWM1 on
> > > PB5. If one wants to potentially use that, we would need to add a
> > > reference to those pins here as well, and they would all be muxed to
> > > PWM upon the PWM controller probing?
> > > 
> > > So while I see that it's the only output pin for PWM0, this might
> > > still
> > > need to go into the board .dts, alongside the status = "okay"; line.
> > > So
> > > each board would specify exactly the pins it needs (PWM0 only, PWM1
> > > only, both or none).  
> > 
> > Maybe we should have two PWM pinctrl nodes, pwm0_pins and pwm1_pins,
> > and then enable the controller (with the pinctrl property) in
> > individual board DTs.
> 
> Yes, that's what I meant: keep the pinctrl node in the .dtsi here, but move
> the pinctrl *properties* to each board's .dts.
> 
> Cheers,
> Andre

Okay, I'll add a pwm0 and pwm1 option. Thank you.

> 
> > > Otherwise I compared this against the manual and Linux pinctrl
> > > driver,
> > > it all matches up.
> > > 
> > > Cheers,
> > > Andre
> > >   
> > > >                         #pwm-cells = <3>;
> > > >                         status = "disabled";
> > > >                 };  
> > >   
> > 
> 
