Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2089.outbound.protection.outlook.com [40.92.42.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690F46AB
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 15:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGdwHulSKiawBiXJbdsoTC4DwdOYkgYDXznIcC7h4El7DpwUUWk/ldaEEccFJitTh58e/0zvxE994sXC0S/PnAIP8dNqVmeJ7dJa7i4k63aveccoB+DnCwHcAVEBMGAXWkofkVQSZlmwBfR2dM9Wx0HjvL54nX1kMeOp57uIhyZmfc7G9fdU4do03VlIVNFFlE8Td4cDMc0jX6Qf+tar02frsNG1JknGiJ8SSKaRgvYgxgnoGvCZnNL8Si0s/4JbJ/HsfMBt/g8mbCigcQ0PusGvPWg5AZrDZJTZG4vy9AeVDwenctPTsKQgQdjGTV2IXNWc3zIJwS1/q5aEI+C+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmfODxk4lbXlExpOIS5sVR3J8iX+waRXmAPMWJqkLvo=;
 b=NGS9SA1+P6rnkcSNvBUix+ah2VJhxtQ0XVtyC0ZJWXwpYiJkCTe+9hJo/iZgoNRoHpDEkeL5xMWZ0WaYeqxneNvaGWaMvat+yRmMyxq9c5U6bMT8pWtROND10CfpZ4kN6UTh+gc9I7s6sQsVF8kcFacTIfcCn9EkwgW35IVBm1m7HJUXdM+MoYdP9d3HO0bm1wc7BvLQ7v3lrgrrnxnJEoL05eiIj0J081e2e0E4POZPQoHTB5jL2JnJUdXSz4eHwNHMNwFeWPg/nKfT54Jjrr8IncdOg9CJ+/PVQJ1PM0ZBWlaHwfgfP4oL2dT+WXlAMrwJQkJwzIhz619cYDa/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmfODxk4lbXlExpOIS5sVR3J8iX+waRXmAPMWJqkLvo=;
 b=Wv9LZSNBdglk29UAF+anT7bbftdUyXmB0OsNr6i0cQrgxyxCSWQf3N+cxoujkBhBLngYcqYVAPo+duJ4QMB5zGzb86LBbyGsRlbtchQYG8KegUVJEy09Se4pcJ710y3qlgLYol31HctyIuJkKOnXbr1QU1r5hQ9N1PvKMrlyDchSQA16wYi7bcy2eXX5Kt6d+QN1rWsojSYURcAOzz1mA5YYese0UBQOh76AtJoW3YrDyQa1GquNNArEpnm0aKwN+TDbKSDMueFAkz+2URD3F69+CrBDCP0k98uqB/RoYx958AUj3xVpHGUcwUw7MexqLYpa8ZLbD6wJc5xanwIrSA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SJ0PR06MB7424.namprd06.prod.outlook.com (2603:10b6:a03:322::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 15:17:41 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 15:17:41 +0000
Date: Mon, 28 Aug 2023 10:17:33 -0500
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
 <SN6PR06MB534214EB4F1DC05495373034A5E0A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
 <20230823212554.378403-7-macroalpha82@gmail.com>
 <20230824222150.5a0d16e3@slackpad.lan>
 <SN6PR06MB53420D67BB7E11486388637EA5E3A@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20230825225326.613d0052@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825225326.613d0052@slackpad.lan>
X-TMN: [gjwEzx6iX/WqaddH1AnXCny8Zn3SdHtj]
X-ClientProxiedBy: SA9PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:806:28::28) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZOy6jbYcCCR3e50L@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SJ0PR06MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c298a4-2e9c-474e-b27f-08dba7d9eb91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bTC+FLlPdKN95hqTdEE35fzo/kWVKl+wfKYQTS+etXD6b5gzepHECqqgAHg8Rte+36s0o1flAUXFyZceFV0lgBco/HaHbjZENgxCQbLTYeR/Y8ExEl1A98/vQO7kAIab1r2OPzGk6VNa+Y1cc5aOTQCiTA9JF0o/45ilaKAv/5rCsdedwW/8QkiU0HFHsr4zB3jCG3vkOVCoQoGrXnomolEBI5TR4jx8ucPEy94EoQJ0Pr0MQaT+zHL6J4JZLvQYh12ROgTbmk4b14rO7nKOt4IR6cj2kjY7PxXRpGkxdZSAsDi7fVppYizW54tQt+BkX/tfo98bPQdFeVsI1LNXGbqo6apwdWN4pvjvMQnzYF35UX1F/IJvFnXQBEohiof8R/yx+indWmBuSYhxNJpLSng9k/cnJnn5cM6prXFeZD06wt6CEisKcD/brM4kNufnPUSpNCzZuxaAn/4EEV2JN9TAYtQ/jIR+KtVU7rXgxrSS6ZSkyW8zgtEz0YzliDm25Z7ZDQeg2gfXi48c/5/9gQR+hRaoB9y/5+uRaiLzF0eP2iRHMhQi5UV72+rdi9AB
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lndK52HmRpkho9YYn6pG0Hr0erAhpNF4EbqvkeBkHn9AggnUEGdiD2oVK9gf?=
 =?us-ascii?Q?j/stbgXS7ZmIX/Km+sGcA7PQEx9r2F4VAtzcOxStCr3a7fgDbavcgJWdjPlE?=
 =?us-ascii?Q?1NcW52WJodPpnHG2pTZeOlnYA5WxS/fhjx9UNBjfemjsd5GLQu4DhvVsADR6?=
 =?us-ascii?Q?F0DmMcoCrUJIzHNPiZHWyJGWnl8ydg6FH9wyVzgVI01VrbUsQsMqrak/Ww1p?=
 =?us-ascii?Q?2Ohi4eeI8JHfR3laWl2c1xboXCynUcuf+67Mv4buX3PmoBdgFxVN4d75wNe5?=
 =?us-ascii?Q?1fLFRH51hz/jXAEEN+Nq1Rd80144DOjyllqQKuw9GwELfMwB7NIWbH7UNbmC?=
 =?us-ascii?Q?1W3Dx4X8OK3gBGS3c9QDiEdCtilQzDMzq82k5NxUrrVEC8kT3wkjS0aUOMN1?=
 =?us-ascii?Q?ZMI6se2k367/GVmt1eu/DFh2Jvyi9y5BIYGf5HTDLByRMlm0XMOV+tmph1Ob?=
 =?us-ascii?Q?//JqE7cZMd1iKLQY8czAecVyIRiNZP8FNfceHN9GHH1MQh1QGka5W9ut3rkB?=
 =?us-ascii?Q?DWw0OPzw5t3QtkZ2iBAWketNzRLgDBKQWAlbLfc9EBOlGNzSYP4z/O86DdyK?=
 =?us-ascii?Q?aYW+Od2lSejgr0qB/Vx7ks5xSBDU43PCXfxHwF9WfulyOnBU7VFomVKsQJsD?=
 =?us-ascii?Q?5sh88xqhR14qdNPmTlOjeaBWU8c86BZ/5E1lrMvZ2RqsodGxHSvsaFmJQ8cg?=
 =?us-ascii?Q?ilY9b47xE9YbIK24evrtkNOR2mmmr9I6GxX2PwgU4jjlCoCDKw8E73JILHCm?=
 =?us-ascii?Q?L6gwPQ/JYpuX9AJ4gPyjTE+5iXDba+I2re9ChkGGc1aih1ynM4xiPzZhSpeK?=
 =?us-ascii?Q?jzMElSQzPJo6qZe08pYvhJK1rkImtJsZTcwW32QtXAKyRiToEqgqANVHld+4?=
 =?us-ascii?Q?DDo37HB3loWGu+HFLHgSori0OHiXzE7G67695/uLJ5mZSuFiW0GlHYvC6QQu?=
 =?us-ascii?Q?pdo2kGOGqzk55PCLrvr64xX+WwGQ2V03d7AW8RUIvRB7/OzoxzmKI5tVGniR?=
 =?us-ascii?Q?GwB/N97e1JCY4z9abkCnMLv/FGJ5gnSpj61e8Q/q4qotiyI54OG0yN7GtCy+?=
 =?us-ascii?Q?tHWDki/JHh7NiYrw05MtYdjn4eA8uy1jfQg5/GSICbW0gBAdJ5cbv1zf/eD/?=
 =?us-ascii?Q?a8XHKHxex8UoWg5nHg9x1NC5EAb+MuuyKIofuBJiliODOgqYjD+EZyXA4OjJ?=
 =?us-ascii?Q?H0MGIx7ZebHoy3BgKWSayy0BIVo+hzk6SQeyk7j3mcnTxbtlWxrubjDBFHw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c298a4-2e9c-474e-b27f-08dba7d9eb91
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 15:17:41.2578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB7424

On Fri, Aug 25, 2023 at 10:53:26PM +0100, Andre Przywara wrote:
> On Fri, 25 Aug 2023 10:58:00 -0500
> Chris Morgan <macromorgan@hotmail.com> wrote:
> 
> Hi Chris,
> 
> > On Thu, Aug 24, 2023 at 10:21:50PM +0100, Andre Przywara wrote:
> > > On Wed, 23 Aug 2023 16:25:52 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > 
> > > Hi Chris,
> > >   
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Add the EHCI and OHCI controller to the Allwinner v3s to support using
> > > > USB in host mode.  
> > > 
> > > Alright, so was it really that easy? I was afraid we left out host mode
> > > for a reason back then ....  
> > 
> > Can't speak to that, but it is working for me as both a host and a
> > gadget.
> > 
> > >   
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > > index c87476ea31e2..eb63dd274305 100644
> > > > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > > @@ -319,6 +319,25 @@ usbphy: phy@1c19400 {
> > > >  			#phy-cells = <1>;
> > > >  		};
> > > >  
> > > > +		ehci: usb@1c1a000 {
> > > > +			compatible = "allwinner,sun8i-v3s-ehci", "generic-ehci";
> > > > +			reg = <0x01c1a000 0x100>;
> > > > +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> > > > +			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;  
> > > 
> > > Please add the link the PHY here:
> > > 			phys = <&usbphy 0>;
> > > 			phy-names = "usb";  
> > 
> > usbphy 0 doesn't work, but if I do phys = <&usbphy 1>; for here and the
> > OHCI node it does work. Is that expected/acceptable?
> 
> Well, that means it doesn't work, because the V3s has only one PHY, so
> "1" is invalid, and will either be ignored or rejected (any hints in
> dmesg?)

Nothing in dmesg that I can see.

> 
> > By "doesn't work"
> > I mean the device is always in HOST mode if I use 0 and switches
> > correctly (the extcon shows HOST=0 when unplugged or plugged into my
> > computer, and shows HOST=1 if I plug in a device which I assume is
> > the desired behavior).
> 
> You mean the latter part was with <usbphy 1>, and that's the same
> behaviour as without the property?
> That would mean that this part is still broken - I think somewhere in
> the PHY driver. But this is a generic issue, and not specific to the
> V3s, and your patch is just revealing it.
> 
> I will try to have a look in the next few days, to find the real
> culprit.

Yep. <usbphy 0> means it stays in host mode; no phy or <usbphy 1> means
it works in both. For now I'll set it to the proper usbphy 0 and note
that for the moment otg doesn't work. Unlike the problem with the RTC
regulator this doesn't really harm the overall experience; and for now
anyone making custom firmware that relies on OTG can simply delete the
phy property and it will work.

V4 incoming soon. Thank you.
Chris

> 
> Cheers,
> Andre
> 
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > > +		ohci: usb@1c1a400 {
> > > > +			compatible = "allwinner,sun8i-v3s-ohci", "generic-ohci";
> > > > +			reg = <0x01c1a400 0x100>;
> > > > +			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> > > > +				 <&ccu CLK_USB_OHCI0>;
> > > > +			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;  
> > > 
> > > ... and here.
> > > 
> > > That would be definitely the right thing to do, but please check
> > > whether it still works, especially OTG operation.
> > > 
> > > The addresses, clocks, resets and interrupts match the manual.
> > > 
> > > Cheers,
> > > Andre.
> > > 
> > >   
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > >  		ccu: clock@1c20000 {
> > > >  			compatible = "allwinner,sun8i-v3s-ccu";
> > > >  			reg = <0x01c20000 0x400>;  
> > >   
> > 
> > Thank you,
> > Chris
> > 
> 
