Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60072.outbound.protection.outlook.com [40.107.6.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1057770
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 15:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDOMsAo8OxlUqv8no0+lVpIzvxviJ4ioANo/CFNk4rRhYygNuSCZo6aghOimDDjplDUpunRpoDwTPx8Td+sJb2ZoWpLEm7/1WqS37RfpuBEAHUEZkZXeikQ43FE2w9IKJ+HabgD8faRjzYMRdx/b5V8RHcMBTbT9GPSVabKfkdjRD7A7DypZ2YyvjM9hl9vWu6mxeAQ4Mv/YQcQvxH0kA8YeRNhck420bu9aDaul8B6zJfeJJHMUsd8xLhzQV76cJ/Fk7IIrT85+aTRQh/kmefZuAs9/QSXn1rcuku6I7ya+B0RD7ARhSp0dTdfW2Ot4lVrUAPQtqKODQNJ5rVJhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkpLc78SAD2DilinRHfHg/EYJyHuaOkAcP68ON6TwSQ=;
 b=fAWMO22TMH4P2PzEd8YxknGWB1U3x94IibFxdlbLUCCj2n3Mal2OdqKNV+LDwQkBHzQ2mRToW/vm/7MqVXuqg8Py1PftR68Q4/wgybngZ8dyUNRWQ1aaP5D1f1fuoHeMf81cTgh4wOTogVZv8LltFF5zyuL1tCrit+82idJEz2TnIEthTEpAnAYybO/nIGssrOHtQg6Nnjnhcy/Yvqrwte6tnvLYSkMiuPHJnOubQVMNay1dHIDheJC4OrjqjdsHMdHqrgqhGrvS4bf8ig+AEP0/VFlfW6KHbLFr5BWAcQEBLNxfS5TdNeGIaLPVZYpUa2FcNx1MUatJ/MfgDKXmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkpLc78SAD2DilinRHfHg/EYJyHuaOkAcP68ON6TwSQ=;
 b=eTxPBa2vRMIm9Xuz+bdBny0UmBfr1uKL+E+cLGB+UDYRbu8KFZ3+2yL+B/+IL6DJOEXKvzb3HK3t/GSP+//cG0+xxNeAelMyo317yJP6SLnJgpEFtlM/xiatyvYEOlZFeti0FYGPth29fwjpBdV8t7HrEKukb53Ju4ne2DarrnY=
Authentication-Results: vrull.eu; dkim=none (message not signed)
 header.d=none;vrull.eu; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB6700.eurprd03.prod.outlook.com (2603:10a6:10:20c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Mon, 7 Jun
 2021 15:21:05 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 15:21:05 +0000
Subject: Re: [RFC PATCH 0/3] fastboot: sunxi: Determine MMC device at runtime
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210524003650.24469-1-andre.przywara@arm.com>
 <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
 <20210524152831.unrg7zexsdbz6uki@gilmour>
 <9f77283d-109a-25ad-d4be-4867ee47d0db@seco.com>
 <20210607151407.wjktjyvd37d27nmy@gilmour>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <8cee9f6e-7d3c-7bcc-8099-8742084c37dd@seco.com>
Date: Mon, 7 Jun 2021 11:21:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210607151407.wjktjyvd37d27nmy@gilmour>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BLAPR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:208:32e::19) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BLAPR03CA0134.namprd03.prod.outlook.com (2603:10b6:208:32e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 15:21:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4cf97d-6a73-4606-1d54-08d929c7dde5
X-MS-TrafficTypeDiagnostic: DBBPR03MB6700:
X-Microsoft-Antispam-PRVS:
	<DBBPR03MB67006FDF7C5DC8938D5CCDA096389@DBBPR03MB6700.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pILkMjyfx6aANfov2+45c3mHn+I65eifbkBDftBE1yjLddAGuw3MlFKzXgUbBRZBkaxPS/jE75cTsO7mGPE9n0WzbORHKlSqLlTh6nTUACobwXZx7twWrObIP4aR70nOjsu57nJ71USBjQ1G3xfPtYJd/ZavcA8boevSqtg88gH2JjzCSca2SiM4PtSy96jt6PxInfQMeHTluvyxjrKfRVHVZNjuN8z2n4OYw6b/+CijyvnO8Chv3fOk6cAF7gR1+7DH7rK4142IHOCNOCS3c26lv/UFAC6blxZdo9QckND+gbttJAD9qFiw7peL86obj9CfC0qNlJxkMk7emPVz4ocwAiY02zTEFm+vUIkjdJQu3J8J302n5Oestdrnkd2Fmu155/jGmlRomp2OaSXaR/7P3Lbp+yt0WeUAGFyIzq4t4bN4SMv+hQg28MUUXHwf5xU+tlqiV3JVoTD9t3yrStKwvSZbWRyVCxEv2sKzBz2ZQhJxdtlHB5341dWK4r9OQfu+hYWlC9VB1fPW1M0pDVM7jVBQ7ELeG1hLbPzeDC6aLZd2LNqZN3HGxUklTe4BxB6n2NtkKhsBl2S6tIO5NcqFbcfoxgijFGfDFVxYN4GwCl/OxSfICOGwTNA3jBU97w600ZO7QjDpaIjFw8T4EGAoZSjyxzOP/o3T60OXGxAsUtObOaJyuP6a1e9wefhk0Iv2Z/H+NYR7cM9piPcIVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66946007)(86362001)(8676002)(66476007)(66556008)(6916009)(6486002)(36756003)(8936002)(44832011)(26005)(7416002)(2616005)(31696002)(4326008)(498600001)(956004)(16526019)(54906003)(186003)(83380400001)(16576012)(2906002)(53546011)(38100700002)(38350700002)(5660300002)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?Windows-1252?Q?+fPnOVswXrGPqYVSEGnr1p66D4K9j7XAS74vGLKrnkK0BwZe362sUG0l?=
 =?Windows-1252?Q?XJ3U+Z/LTqWZ+M+l2VkqxQs6b0cEylpRiB4r6b532x86Hy7HDSgiuPhp?=
 =?Windows-1252?Q?VZ07MXZiq4yMRfxVUuhv27XE+w862EjEGhKY5POKw4P8Ex1VfLXqxbjp?=
 =?Windows-1252?Q?AfYssHlio6d30CifFUIz7qrNfu1wMt14lxqcirk4eNBOwqhaCceYupJS?=
 =?Windows-1252?Q?P2AmUlWkQ+kDaIEh+o1+nBx0UpUa01ZQuts5IJZQ+0rGBsq3r+pyA2tE?=
 =?Windows-1252?Q?uAKsfTXefrjUG8JIOW6iJUbzVkqhKulE3tqO2qt9q9CUugjQr4gThgxA?=
 =?Windows-1252?Q?Tjvtz1HT6Xzg30bKWOqDhnLSsIri4fvprKAaCoGPA0387ZInQ5y47Zpw?=
 =?Windows-1252?Q?xVgsItmHAQKptfhtOknSnHp57j/mGvr+sue1kcOdKh53oGiQtJCWP/+h?=
 =?Windows-1252?Q?5mh7IDXxflEBh/Mq+PbsS8UPLnG03oeeHdNf+sH/kNN0AwZ6TGNcRqh+?=
 =?Windows-1252?Q?Sdd37D4FjGvwTcU0N8/dKjlRkV+lyJLERMOFtTZ7+374iYwH9yHnemII?=
 =?Windows-1252?Q?3nAuy6T5g45K0+cSto31t4gbzVviD896ntYSiot8UwUNYzdqljkRONdn?=
 =?Windows-1252?Q?aoG1+HoBV5xTVVgcNknL/VqUErKDbjR9hXNouoehlorm7M4Z8I2hhkDi?=
 =?Windows-1252?Q?6Z3I1HgE73GwUPfWAQftOKqLz6YLNbfFamc1/f/BpKa0JkdLgSf+tydI?=
 =?Windows-1252?Q?e9IKXOdGrcHwgCqKgbThxgkDDF/EhChSDGHkyFdLYrTA/nmf0UAuw6tg?=
 =?Windows-1252?Q?iw3HsXAeqtdNThSg08UcR4EfRqkRb1KxfEWVIXFck8D+961VyM8QxPsl?=
 =?Windows-1252?Q?Ie/1R6VAfRY7S0K8Rey3EDVPsX8dPIlJcDQrsGRuPugMAK/H37NYLv//?=
 =?Windows-1252?Q?URHARBv+ovTHjsDGh35CPyh+pF6Nr5KTL1Ce+OjKspaJ0Npw1ZFhlW/6?=
 =?Windows-1252?Q?aMOsbAzP2YHXbZtmEjLhbii5/pi3SFQ+mxlxIP4pN1GXks7LFyljkqhS?=
 =?Windows-1252?Q?VFpNri4eSmntPDhKXJhjHXpC0aeVI0Rq1bN8x1zay+aG5t8vwCshoIT2?=
 =?Windows-1252?Q?gj+G3sO8+C8b1xtD5IZtvkF/TNahULHZpufsEPOywnKlxZwadpuJkg62?=
 =?Windows-1252?Q?zUr9DLGH2sI86hgqbn4X3pInn9mvy96xjq5agCW4WPZIonMqXnq1J3LO?=
 =?Windows-1252?Q?nato5X6s7/1e4bnhHkluKGglTm9sMQh4XbmD6Z+tj6GyhHUrVInW3i6n?=
 =?Windows-1252?Q?nnmI+Hja7tM03H8FVl5GK/1sbqcdo8z5R4pNC0ZDJC6DV8lR1fYsBEO3?=
 =?Windows-1252?Q?Vgm2O/aiAmXDx75dxc0KiGGXT36yScQFu/ECqJ3qIqaGrsD6fUjJxcQ/?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4cf97d-6a73-4606-1d54-08d929c7dde5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 15:21:04.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMkTpwt+BZ53tzAJ0eewg1zyC34qNPXorbDVR662B8UTQRY1KBRePGl0bB+FTaTy12GC+4ChO33f6pf0Bs0v6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6700




On 6/7/21 11:14 AM, Maxime Ripard wrote:
 > On Mon, May 24, 2021 at 11:43:43AM -0400, Sean Anderson wrote:
 >>
 >>
 >> On 5/24/21 11:28 AM, Maxime Ripard wrote:
 >>> On Mon, May 24, 2021 at 10:37:31AM -0400, Sean Anderson wrote:
 >>>>
 >>>>
 >>>> On 5/23/21 8:36 PM, Andre Przywara wrote:
 >>>>> At the moment the fastboot code relies on the Kconfig variable
 >>>>> CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
 >>>>> flash command. This value needs to be the *U-Boot device number*, which
 >>>>> is picked by the U-Boot device model at runtime. This makes it quite
 >>>>> tricky and fragile to fix this variable at compile time, as other DT
 >>>>> nodes and aliases influence the enumeration process.
 >>>>>
 >>>>> To make this process more robust, allow the device number to be picked at
 >>>>> runtime, which sounds like a better fit to find this device number. Patch
 >>>>> 1/3 introduces a weak function for that purpose.
 >>>>> Patch 2/3 then implements this function for the Allwinner platform. The
 >>>>> code follows the idea behind the existing Kconfig defaults: Use the eMMC
 >>>>> device, if that exists, or the SD card otherwise. This patch is actually
 >>>>> not sunxi specific, so might be adopted by other platforms as well.
 >>>>> Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
 >>>>> this up and remove the implicit assumption that the eMMC device is always
 >>>>> device 1 (as least for the fastboot code).
 >>>>>
 >>>>> I would be curious if others think this is the right way forward.
 >>>>> The fact that the U-Boot device numbers are determined at runtime
 >>>>> seems to conflict with the idea of a Kconfig variable in the first place,
 >>>>> hence this series. This brings us one step closer to the end goal of
 >>>>> removing the "eMMC is device 1" assumption.
 >>>>
 >>>> I would actually favor removing CONFIG_FASTBOOT_FLASH_MMC_DEV
 >>>> altogether, and just specifying the device explicitly in fastboot
 >>>> commands. If you need to dynamically change the device, you can create
 >>>> some aliases. E.g. you could have something like
 >>>>
 >>>> "fastboot_aliases=setenv fastboot_partition_alias_user ${mmcdev}.0:0"
 >>>>
 >>>> and then run this variable just before calling `fastboot 0` (or whatever
 >>>> your usb device is).
 >>>
 >>> If we're going that way, maybe we can just pass the interface on the
 >>> command line like dfu does?
 >>
 >> That could work, but I don't think it's necessary. At the moment there
 >> are many different ways to specify partitions (KConfig, Aliases, "U-boot
 >> syntax", GPT partition labels). I would rather pare things down to the
 >> minimum necessary ways than add yet another bit of state to specify
 >> partitions.
 >>
 >>> That way the new requirement would be very obvious instead of
 >>> introducing a new environment variable no one really expects?
 >>
 >> I'm not sure what you mean here. This alias system has been in place for
 >> a while, and it's very convenient for mapping a stable name to some
 >> arbitrary device and partition.
 >
 > I don't deny the fact that it can be convenient. What I was pointing out
 > is that it's been optional the whole time, that I've been using fastboot
 > for like 5 years and didn't realize that this feature was there, and
 > it's only implemented for mmc.
 >
 > To make it required, without any warning, would be fairly confusing.

Well, it would only be required if you need to set the MMC device at
runtime. For existing users, there is no change required. I'm
specifically pointing out that this functionality is already achievable
without any changes to C code.

--Sean
