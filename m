Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2017.outbound.protection.outlook.com [40.92.23.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206D156C7
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Jun 2023 13:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wyn458sxoGVZ6SA9qwgaUcW2UGuHG5L8si8Ey5NwvAOvjrd3aET6npn36tD/6L8As5OX879E8QTW5FDIcGOgOg5phebacZOf/Z6Gw38fMrwW80cvNRg7sf3WpLSuRlbyzJpchBaLWOe1btohJcZgYgUEtFuwauBIC7Nega82mlaJ2xoyD+joiGNWqUNOazpKqL8+y19BKlNcT9nYi/+bPPrIx+hH6HNTf3GfSKMzRciWCwmHBhvySxHJdBoDZegMrajY/XKZm/Uk2nHrs4eRbG1Ps99NDQ3CBnA/RGilOlm2LnU6KjalvzTTc911TMePcUHv1b5RNkXLoJrT7pwfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7gNiORLF7WuYNT4+h+ocy7YvpkaGp7CGlEnqwzZUqc=;
 b=gse7+mitllNV9wg+54eUcu69RR958nxcc4qUz5hmDKiG/JaYgxA7ZIm9VYv1FtGLpWEVwEDDWb81aGO+LwXR+oLgi1Rl11WuRcYn65sFvE28JyNkJ2aaScBwCqpR7Yusu94dwVjYvBTTWBXkAeAKiDjPhvCjhTIUZdBz4x6iHjIDyTXLFHyB9pJpWGI3Sbqpu7Qir74cViBSDaQHz30LqOCd+cJ8tY3HeTRdmYSlT7Sfc15eukmfaOuf67JQkyTgBV9Z99cU+/j/upoFsqeMHpUEfFiVQwUReVm5gkc2e8aLdNb2MBGJX7eFvGLBHzjgfN1AWIqBn5OFT/tUBmylGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7gNiORLF7WuYNT4+h+ocy7YvpkaGp7CGlEnqwzZUqc=;
 b=VJ0wPHIjdMNuuvUaSWf4f/hccSPP4cAh6bZunWpT1UWgsLWgr5+EElRhnH8KsDYYfwl6qhaWtAoAcgPlD0Tben5VOVYumKFfs9XAPfP7ga0cyBOb8yYNCLnnn3BP12FPrEwB6t9SlnsiI+Ax5DyPCT5uVvuUxq9DKxYIUz4oCCcQe4zTWX4MazkN5y4GqkRiozdYWFIhh7ZxLgOYR21dTi+IoeVr9y5XqtGFswbFHQTMjWFoTW1LqP0JbUfRZPzKiS6K2y8HEp/2s65ByEy7BZLydgqdt5ypaPdnrdRj2620ySDFoI6DpztObzC2xw+C8QorV0/rWr5FjthjINpZ+Q==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by PH0PR06MB7676.namprd06.prod.outlook.com (2603:10b6:510:e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 13:34:44 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109%3]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 13:34:44 +0000
Date: Fri, 30 Jun 2023 08:34:40 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, uwu@icenowy.me, samuel@sholland.org,
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID:
 <SN6PR06MB53425C2FA1D4F34AD5B81273A52AA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
 <20230620200022.295674-4-macroalpha82@gmail.com>
 <20230621105228.41ca9fcf@donnerap.cambridge.arm.com>
 <SN6PR06MB53426B6D9456C68AAE8C51B0A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20230629203410.660eb9a4@slackpad.lan>
 <ytgchgmhgegjdqe44yamcgh6ovk6yxbpj2oxgrtslqle5tskvl@np2oxx4l6a5w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ytgchgmhgegjdqe44yamcgh6ovk6yxbpj2oxgrtslqle5tskvl@np2oxx4l6a5w>
X-TMN: [i2jRLCtCPDNe5hzzMbMZPHU4yRjVwDu3]
X-ClientProxiedBy: SA9PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:806:20::35) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZJ7Z8PcrN1wMxQMp@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|PH0PR06MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 72865eed-6867-4946-7203-08db796ec2c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iIH9KVVPIBYlvREAkxJxSnfTD/f9Sy3bvafiW8/tXcf8zqFw/qkuHcb42aqyPlVFK5z29fYMMpnJej28xFZA8i2uVNic5+xmIIQW+cxmjX6ReSYlov30Szsq0caJUCFrjzTC5yXAyAWnHuzqwxnkbTai1ldr6vZ9YQ1/eyrgXmFJCSqVWBZFwdlowdl451ZHnsqaWu/PsRIqA1nH2dTdcbcwm8mc8nbtm2JBrvrB2FilLc4YstiqzhJ2nlKQmluftfKOdLat69+A2Tq65ZmRjpSaOcl93a6J7zxd9GsIqhYudx5pQ8Z+HvNuuenqm8ZWv5dobcjNZgBpCF4pU4G7txm92IbV998qKWjD/RWmc+t0XqRUnUHLwVmS9niBa3F+rQ/nnqr/tEXUReRg38XrWu3FVJC0wTbLuHr/zpyLn/sLabQjL6MAsUpCYASnhdy9IjjWBgV22t08zBJzqiKjPWUYtH54FwBz1FIlDubJuCpTP8wLgDRR1ElEpdJRrNJKEEFgP5m9lpox/mNJ3xYTShdBBXMw5P9fG8B500EOgvsJh7BTr2oLhM+Q3EIzdX99
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GQPDdIERp55eMyfYCWiZHtSRqv5k5qDo0dlu6NvRq1YlHdlhO0yD0LjPtnzd?=
 =?us-ascii?Q?wPNoJQFqaKR9WofyJzmqz4ZhozqplYgOCMSZtmdjLNwJmpvG9MvLZdDetOnP?=
 =?us-ascii?Q?NCLSbDXK6lsRQXuFv37Ck06iHm9dOrBWsItDuuqC8uIxHbURbedp1j7O4dwR?=
 =?us-ascii?Q?LD1lN5Jeyu++zFSRTMEBUHm2LpMRoltRFjMJzYvXKa3/7gTb7zb3fCODntfk?=
 =?us-ascii?Q?G+1mbtegafO8Bu8kzCn0Lz0bSt0XneAHgog9luD16G/ckIP95TL2tMYs289H?=
 =?us-ascii?Q?WeoMp2VfWrF39sF/uITigujy2BXN5n0C9pInjJswAwGXlzgeG61/S54dqFGN?=
 =?us-ascii?Q?5WbtMuXuopDrEzFeKaKHdl3xK+8wo3mPRHEPHax0pmShalQS6KZHr+mEq869?=
 =?us-ascii?Q?lyN4cSQdtrSgIOKNxCL3HC9/KLg9vi3WuFNZowrShhZeimsVEaruc8j0BeMJ?=
 =?us-ascii?Q?+Oy4fHyQVB79PI7mg8iJ5c1jLfhYQ42HoFrm+oETlO8wQYVkGaDxLPHOpRi9?=
 =?us-ascii?Q?mEBkXX+woZkrX1QVglgZtraXIETLlptMi+YXj37VED/6jV6d4V/B27o16/oV?=
 =?us-ascii?Q?/iLLcvUopGVrR2PQBJw3f6z7vBX5Nm0ouzJW4SgBxwJ2lGxUfWlNTVrtHBfO?=
 =?us-ascii?Q?WKvJbP9fArTNM2k1Bmkl/EPpRhWxN1VfY9q4VV5NzUBAwx8kJm93B/Vdv80L?=
 =?us-ascii?Q?LtpLKPUHH3eU9w4mPXmFE8X4GJAs33mWk5YPlLceiIZPWYE3dYpla/Wc2P/e?=
 =?us-ascii?Q?96QMFxijF6zSe+0MpXKDF79/sUdn2Thx0NvPxxSstmWctd8LS8fXF3PbrefH?=
 =?us-ascii?Q?N9/9hTusda9IiW7x4jqowRf8iWQQvtAo3S5vBpVe2IxELRlzTuHrQ5iPHi+r?=
 =?us-ascii?Q?1F/lqqm5oszW3oErqZlD9OZy7ZHhPw8qvZ4lhcTBZi2Q3MESYvda/kCd6BQX?=
 =?us-ascii?Q?GLsr1PkExOmZ8DfxZzI4eCJ9CVXtvhKe93mFbDDV2Loh6w+SgNvZRLEArEmO?=
 =?us-ascii?Q?Rd4L5C/9Hw4+Xap8WuPPyfNo/FgZqvw+0ErgXcPooZ2csDxqRsmM8QvqIn1c?=
 =?us-ascii?Q?RkRZ1QJPwdV32AINZCvdM6eJfFmIWCRRiuDAzH8TbUD494yhQ0jEct3/2Pg+?=
 =?us-ascii?Q?vncg3wWUqaOHqAK8HVCnlrKiTjVdgpaMv1de9nWivKynShvyrRRoc1TlkDUJ?=
 =?us-ascii?Q?jH1FR1QsabY2IvzDYuMGvA4zYnVyetMU46lg6qSSm4YiqTSVJUkbwID9C0g?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 72865eed-6867-4946-7203-08db796ec2c5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 13:34:44.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB7676

On Fri, Jun 30, 2023 at 10:16:35AM +0200, Maxime Ripard wrote:
> On Thu, Jun 29, 2023 at 08:34:10PM +0100, Andre Przywara wrote:
> > > > > +&usbphy {
> > > > > +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> > 
> > Where is this pin connected to, in the USB-C connector? One of the CC
> > pins?
> > 
> > > > > +	status = "okay";  
> > > > 
> > > > So in the commit message you say "USB-C for power", but this here
> > > > describes a full featured USB port. So does that work? Can you use it as a
> > > > gadget, but also as a host?  
> > > 
> > > Yes, it's an OTG port with the ID pin pulled to ground.
> > 
> > Do you mean both CC pins? IIRC this means it's hardwired as a
> > peripheral (UFP).
> > 
> > If I ignore the ID pin above, this looks like on the OrangePi Zero2 or
> > the MangoPi MQ-R. In those cases we put peripheral in the DT, as this
> > is what this connection seems to indicate. That *can* be used a host as
> > well, with the "right" cable, but it's not really a well supported
> > configuration, so we leave this up to people to change this locally,
> > should they really desire so.
> 
> The ID pin above is exactly what makes "the right cable" works:
> depending on the state of the ID pin the controller will act either as a
> peripheral or a host. Dual-mode works just fine, so if the hardware
> supports it there's no reason not to enable it.

Right, I'll have it as dr_mode = "otg".

Since I have neither schematics nor a proper devicetree I'll have to
expend some additional effort on this port, just as soon as I get the
panel working. :-)

> 
> Maxime


