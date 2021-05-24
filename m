Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80047.outbound.protection.outlook.com [40.107.8.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A117F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 15:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIUIsJnUw3RLV8YL/1T1VFVbo/QVrZMTLO4En3Zo6Yt7+egKemb66OJ9XmETk3sXpNC4Yfp7yYGzFOwJiXRFf4HDBMz8hvXAR/bzPo/bL1LVEWz6N0ZbdNWKn6aC98/GRTjD1x55o1FnYNnm+tUBiWo1WZvGHT416Alru35ZItezvpexuv+Druf+wnFY59c0WAlymMVeBVgm0BEy8VTb07YVZ/99hmj+5T371Jk0oXjx8tB115E2gLn/Pcvb4IO76tNBNRRgev/uuXDfLQsagKv0EX4vknlOWIvjyiqIuYupTmz8DSqm0Dc9SeMt2fSDNjzpe5bDzpUsSlhv36B3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUI2T6cOBye7WyJxPNMn0XKm5XVoVc7gIxhB2sTiFyM=;
 b=ewNLXnYZNuOosl7bfs9GwUwALipyCBbCxA33L4L6xYcWeOUT7XxessZfKgzKX6Za3mCkOCNZ/Y871yd5tBuf4/n3HTzWHnQ25M7x8U23rMa4N3Jig55uQyHwoW+/7PDQpJ88VXB38FLDtgcYaBM6EJ9nwT+cmG12JCFZiamSioi99X4WjIjtR0O9qAGq+4VmiZUlB7TkDEICUwSDpChx5mUofwQ881v7nph/d+WIj48YiWeYB5Gl5M+KYhLTypASSRWPGKtnG2y4X3qMfm0V9etWaiJmzVfW3zqEnIRkk6SnVs/k2jnHZkOpaajDv5worqvDL1/Bwnx4EQdAtv6xhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUI2T6cOBye7WyJxPNMn0XKm5XVoVc7gIxhB2sTiFyM=;
 b=48qPFYjiYAZYkqFWLNoulcXPqK8NhC2V4DyCTII2nN5bD1HGolS/EmIqjyEP+9h3N/cMKW6WLbD2TyCkLOyzM4TKUWiTIy23mH1Vd88W2mTP3LMajeHTj7epNrtVzqvqq/vDUTS4xfKLld75Ixv1yokJ3KfVpny0SMvNpJnNGII=
Authentication-Results: vrull.eu; dkim=none (message not signed)
 header.d=none;vrull.eu; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4522.eurprd03.prod.outlook.com (2603:10a6:10:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 15:43:48 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:43:48 +0000
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
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <9f77283d-109a-25ad-d4be-4867ee47d0db@seco.com>
Date: Mon, 24 May 2021 11:43:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210524152831.unrg7zexsdbz6uki@gilmour>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR22CA0027.namprd22.prod.outlook.com (2603:10b6:208:238::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend Transport; Mon, 24 May 2021 15:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 991e7e0b-3c22-4cfa-0766-08d91ecab8e3
X-MS-TrafficTypeDiagnostic: DB7PR03MB4522:
X-Microsoft-Antispam-PRVS:
	<DB7PR03MB45220DDB6ABA885CDD06D12096269@DB7PR03MB4522.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iFTHDPEcgmLBFRl6XU73CZ9jeRTb0ieWNjKvb+e7hpa9JVA/JF/cs2D7n1UksrCjZoGvvJl3Tpj6ijB77ynP/4hC843eGe26h/r6w5WlNU1GNEqCSLGcZi3uhaxKPPmjCjGNo9h+ZfBcyvLA2b07Myr1hOQsvl+q3D5vTO08grZ2Utr1RYP/gKsI2wqmWFzujijFolO1Nn9UIt0vuauqTJb0hJH7ItMUQ1N8jEzT3BrqDdi1yuyXEoI11uTNQZJnJoHoKGseK10Qk+fQAS3P8IO0MD4XU/bwo9xCttXIeKOerORtZpXP5cLBrk38N4xOaukDZB0WfWsp0P5XgOkdLzjvVhwwa7e+AYrj3OcMXKPVZ0tariVDI//0iUEvY2bVn8Jei/KNbLTzm1d6S2gBOvIuDOxeYw/OdQkNbZWvyt1SfoT5Rd4hMqaZvBFOXi7iLdgNb6v9JrTRKwuOPWtNcfW1+QTaWRXCpQcdcfomRECqp0vgD6FgKHW1IdyGgeHDEgOvVL4goS2xmIuiHREliIbrBhHiuAtL8Khk4O/bNBRG8YOpukmxFxDnVzV5wHyGv76UHZ7lu3sn6Dzu6dDOajfQNmy6q+UnrEfvUFWio3wtrqCNgdC5C+RmWKWuhFgf7aELVvdDsWwPWv/0vJP8/Pts7mC6Omug7r//XK4ih6JTSPjNzm8IuWNBdyNwuMRieZpHqEh8W2lE5znYJpKTSLPrrVIhCj1zTzDFK6Fe6WQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(366004)(396003)(376002)(346002)(136003)(478600001)(54906003)(4326008)(53546011)(6666004)(86362001)(2906002)(31696002)(7416002)(5660300002)(66476007)(66556008)(186003)(16576012)(6486002)(52116002)(66946007)(16526019)(44832011)(316002)(83380400001)(38100700002)(2616005)(31686004)(8676002)(6916009)(36756003)(8936002)(26005)(956004)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?Windows-1252?Q?mAhX097kMPTUkXn8vF6HcfSW9qpeWMmXhTzc9WpjAubuw9o4dMyAPBeG?=
 =?Windows-1252?Q?HqdnmIaTeLzLPFXb2gYeVIdy2dtGzKJExoVGBcZZjS4xf47jVBI8AHKn?=
 =?Windows-1252?Q?6regcJUF2lFJZw3o9rPd5kTwOshDn9GInKN8/JsQkSLTYdSoJ72XIiJ3?=
 =?Windows-1252?Q?FPROJvdlyx7NiPZ6Y5giMdolDELOBHf5Jh4wCznzqI9wMH4oBDD+yCAx?=
 =?Windows-1252?Q?K+iyk8QkJmBxUU9klP9HSz+A/qkw/7Nn2XQ2hhlkuTCaTBVB5fsLj1h8?=
 =?Windows-1252?Q?jfw6ckySbpy9C0K1dw5fTksvsT9eLMHB2Es4kyUkp3YnHQcPhUvcwWw1?=
 =?Windows-1252?Q?ZhAKMSaoEHECf5KgrabpXPBnQBqRa+YkVzG4yxBMHX/G8hytO2DWhYX1?=
 =?Windows-1252?Q?Wb7zUPKeaglH9Jwj3K8dRYWqWVT4jB1MaJ+x5HpIXidKkhg8Zg3ud5Fb?=
 =?Windows-1252?Q?vp7TAlWAZROsSwNmWjOav92HP2ywsNoKfg5pBnfOcPaKzXmPIbdVdObZ?=
 =?Windows-1252?Q?5oQxzHZjmzka6IlNIjn1qnMqZElwmx9G8kth3DM03pZWgk5WreXs4X90?=
 =?Windows-1252?Q?a1jgGEG7CcXd6WBODINttxrW2DDPhurxtthpEJ8k3SM2HAFpfBj4Y1cf?=
 =?Windows-1252?Q?rD9YAFX0+hWO4nstcQP8REz+2LrJchwK3/DLVtLMXhLLi7vu/cSXd/6K?=
 =?Windows-1252?Q?Faxnaw2uekN/lj3VtCE9nbFEJATrDceDmCmaKvKLpitBeSv2pHvGqTzl?=
 =?Windows-1252?Q?FXZ8S++fPQxRGj3MFPGaUfnFFNajPTW4Sem//OGprH/NhVOIMQuHMnhn?=
 =?Windows-1252?Q?c6kELS030pqug9ymWNPa/ACHovI3MxWDFXAC+TtacJ06TCc6aKGmAKM1?=
 =?Windows-1252?Q?JGsr0EMa6xXBNoEvOrp70gVtbqhD4FmGlr08miwshBYH32tDBBLCywxW?=
 =?Windows-1252?Q?YHrDo3oOU0x5LJXRjebv/3b2+NAgqv+dQt2/uA5keI1OrQ94zKyl0DjC?=
 =?Windows-1252?Q?1lagWXtjKyOudzA18ybKx3XJFHm61eEYrNi2+Mm3JW4Z/bt/8bLsrJf4?=
 =?Windows-1252?Q?OrnCRr+DtbFpUxayARKYRDINgXyNjB2TMACfzfZ3lITKyrwh2xpmwd+0?=
 =?Windows-1252?Q?Bu4sOEKf0uLs8jrHaXEcB+Xygc1wDYJvjypGbgKaDeg2tXMxNkeTq2Ep?=
 =?Windows-1252?Q?kKhLH0UyhNIU1oP1VlrFv3OM8BJRcX7pjp2cI35EKST8AfAyTid+2/DG?=
 =?Windows-1252?Q?voamMNnGpxgLQ34oHHahJwoXfj+GOFSLlRqephw8rwhV+cONyoPmwjl7?=
 =?Windows-1252?Q?ox7dDn19TPlUDJRc2SzjV/lYig4buS3bMX2NRh8zaXFxB2EReBnAwMzh?=
 =?Windows-1252?Q?lbYWgNEe0sdoQ+rRsFmhyokPUZwvE0JJAuC08OoeOQh4reqVKVzO2MwL?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991e7e0b-3c22-4cfa-0766-08d91ecab8e3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:43:48.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70mXYHHrhhB3PCZ9zHjmTGlUd1f60VikgXSu/qnjJGyjMYpXG01MLrzSdouoTk0PgDzVjz3efXHVflstKbDNcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4522



On 5/24/21 11:28 AM, Maxime Ripard wrote:
 > On Mon, May 24, 2021 at 10:37:31AM -0400, Sean Anderson wrote:
 >>
 >>
 >> On 5/23/21 8:36 PM, Andre Przywara wrote:
 >>> At the moment the fastboot code relies on the Kconfig variable
 >>> CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
 >>> flash command. This value needs to be the *U-Boot device number*, which
 >>> is picked by the U-Boot device model at runtime. This makes it quite
 >>> tricky and fragile to fix this variable at compile time, as other DT
 >>> nodes and aliases influence the enumeration process.
 >>>
 >>> To make this process more robust, allow the device number to be picked at
 >>> runtime, which sounds like a better fit to find this device number. Patch
 >>> 1/3 introduces a weak function for that purpose.
 >>> Patch 2/3 then implements this function for the Allwinner platform. The
 >>> code follows the idea behind the existing Kconfig defaults: Use the eMMC
 >>> device, if that exists, or the SD card otherwise. This patch is actually
 >>> not sunxi specific, so might be adopted by other platforms as well.
 >>> Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
 >>> this up and remove the implicit assumption that the eMMC device is always
 >>> device 1 (as least for the fastboot code).
 >>>
 >>> I would be curious if others think this is the right way forward.
 >>> The fact that the U-Boot device numbers are determined at runtime
 >>> seems to conflict with the idea of a Kconfig variable in the first place,
 >>> hence this series. This brings us one step closer to the end goal of
 >>> removing the "eMMC is device 1" assumption.
 >>
 >> I would actually favor removing CONFIG_FASTBOOT_FLASH_MMC_DEV
 >> altogether, and just specifying the device explicitly in fastboot
 >> commands. If you need to dynamically change the device, you can create
 >> some aliases. E.g. you could have something like
 >>
 >> "fastboot_aliases=setenv fastboot_partition_alias_user ${mmcdev}.0:0"
 >>
 >> and then run this variable just before calling `fastboot 0` (or whatever
 >> your usb device is).
 >
 > If we're going that way, maybe we can just pass the interface on the
 > command line like dfu does?

That could work, but I don't think it's necessary. At the moment there
are many different ways to specify partitions (KConfig, Aliases, "U-boot
syntax", GPT partition labels). I would rather pare things down to the
minimum necessary ways than add yet another bit of state to specify
partitions.

 > That way the new requirement would be very obvious instead of
 > introducing a new environment variable no one really expects?

I'm not sure what you mean here. This alias system has been in place for
a while, and it's very convenient for mapping a stable name to some
arbitrary device and partition.

--Sean
