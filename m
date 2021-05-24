Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BD17F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 14:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ7StRapibEI6eUqQLYhkjiMT7/1bNVikZYfL0HOLrRU3nViuv8v9JYA7Bcb/6CHA9HKvHGxzLoWXOppjsSChS/jEL4pqxQP6HLgyrKG1EpCKoqJGj1RTf+UuTtgBOJ2rJzPw3XFC5GgmhIsddpjsn29+u4RfzS/bZ2FBCxxo5DsUFGQvbZhl5oUwak7h/fFl942K7xdc83flZUAssv/k6MdDEYH1RMIwAO837r/EYDwgXvKWB016j/rBHb74jCx4+jD7s/h5//a0ntlW0mMHpIj5+wl681356tXYbD8B4bN5Ql6WOtdjoxt9tpnxnH+6ZbVliyUXNfD4hNL7+aRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/Y/5otUhfw+Y4SV6PVsA5zwxYgYljZ+j4Q39R2LmSA=;
 b=ZJwXx1n8lqpDIvZP5JXLf8Y2isCdg3lEfjvyZQ8c6OIApzxXfOncG1cNRIC5Gpa3xKvLWUT3K7lEd5CDLdFU4FDPaYY7H5cD8nIEvbptLstUNvvt5a3xnX4mrzxuOGMonmKhVwUPx1/+5ozbKgSI9T2h937X209F5vyYgrSd3QLBi84KLDAW7NF1NBJw/B/NBxsqKUdcbxKO9QPMDijyiBsPIMFYENL+CrMcXaEDn9C6eTMDhV//qtbK0P6BCbGEbuO8a9Q1WCY819jgcprAJl4Me5WjP5HyOyhmN9z3I6pN7Nl4z/F3We2FUJnqy2sNzMuqWCkwvAjJRinCjZp8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/Y/5otUhfw+Y4SV6PVsA5zwxYgYljZ+j4Q39R2LmSA=;
 b=RwBiVfl3IoeMGP6SGb0DtIFjcM7FmvSkZO2bb2YDHuabJsWllCrbjfTxVLaMsWUHhRwht2oeVrEk8T5iGHVoXyqviOuccg7J5jYD/HBrZpGh/i4KPob9suqHXZDXp2SPW4jTy4Jupizp/KF5AzFSSuj+xX8L6zInDyF765+6MCw=
Authentication-Results: vrull.eu; dkim=none (message not signed)
 header.d=none;vrull.eu; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB5673.eurprd03.prod.outlook.com (2603:10a6:10:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 14:37:35 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:37:35 +0000
Subject: Re: [RFC PATCH 0/3] fastboot: sunxi: Determine MMC device at runtime
To: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher
 <hs@denx.de>, Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210524003650.24469-1-andre.przywara@arm.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
Date: Mon, 24 May 2021 10:37:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210524003650.24469-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::7) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL1PR13CA0122.namprd13.prod.outlook.com (2603:10b6:208:2bb::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend Transport; Mon, 24 May 2021 14:37:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 658667fb-cd54-425e-8978-08d91ec178fe
X-MS-TrafficTypeDiagnostic: DB8PR03MB5673:
X-Microsoft-Antispam-PRVS:
	<DB8PR03MB56739D86B7F5FB3E36496A1D96269@DB8PR03MB5673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jr78AXSolLkgbc8UcC09PIhLHpP7X1cvK6F8roQ3aCmQrtZOQe+sAmYT3PWxdXKltCPmu3k86jfgyya/maiURESXWg6i0ex8Eu9iN3be/CBHD2guE9s8gOep+Q0GGwtD3cgYajwylco2iGe9sEVj9bGVgPyCFTpg/79Q3DDwsvigTWWDpJKTtdQk5OTp07c4Fm1fA49WYzPuKsaMTNXRx9D++SOBS2jw1RKzZBxTd/m9jpyMRNT+vWzvxjJgqts8w1cME/iwWf0FjBVaFigsTQs48HRouuxo0NC8g45SzExakGLBNoVRkGhZ0ksNWl4VggwhqscxyOqaqcJmGvxyZ2Y270Mu/ctt7nHwCa4ZRyvKpZoAe4NKJx+VpF2p3MJCw9oNTbKagwpTzw/b3jm3C9JyUMaXg+oyrFs/NN64jNIYiM+xjQG1hMHg3AA0yYYDSwcLYr74q98sM2iqFIT2Clz+Vx/lNOEZp3oUZlSalUKJl4lIxsljsaP5p+GNE0cy4f+CZjvSYVZMH4jaiftWyxO64i0kWCi3SvQ0W7/Xo3jEyTPO+TgP4Mx4N7YcjOtGASIlxdtczwwLyO3JgCKk/61oHQf3rjMgXdIXwTyPi8NKtNXnt19f/EFq2Nnksd5KAT31/G8cb6JieEDuIGDUu1AaxEaSZ6x0Ar+yLvFULV1URs/KZ+0G46/QkZWs14tv76B0an32I4KDdEagT4J23GmP51KZU72JZvGFQgCehiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(396003)(376002)(346002)(366004)(136003)(5660300002)(6486002)(2616005)(186003)(38350700002)(110136005)(38100700002)(54906003)(36756003)(53546011)(16576012)(316002)(52116002)(26005)(31696002)(16526019)(6666004)(66476007)(83380400001)(66946007)(2906002)(86362001)(31686004)(8676002)(8936002)(66556008)(4326008)(478600001)(44832011)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?SHdEc2hSeDFLcGh1MnRBc0JHQlpzUktqTjZJcEF3c3lSalhRdlN0Z0pHempp?=
 =?utf-8?B?cFZhdmNCc3BwNWx0Tml1RzV4VFB1OU5Fb2p4KytEVEtja3RrTFBEdlF0YTB0?=
 =?utf-8?B?MGE5ZmRYTXQ1STZoYTlCMnM1U1R6TjhFTXBzM29LdUEwdDdES3NPdEhzekMz?=
 =?utf-8?B?d3ZTQkVDTTd0NEkvWEUreVhMOEh6ejFhakIyS0Nob01ueXpSNXAxZm9WVVFa?=
 =?utf-8?B?SzQwU0lXcVVFL3U0bXQ0VjRWemtzb3F3ODF5VGdXTktEcm82MDZxN0wzMDQ1?=
 =?utf-8?B?QkVFSDJFR0UxVmU3VlJxV25kL3NHcVlibzh1U29sRlh0VFVGSFNra21aMDJN?=
 =?utf-8?B?T3RtbUdBdGd1aVZHaGliSzJ3eGxQcWRZem9wLy90OFQ5RlZUNHNIN2VtSEJX?=
 =?utf-8?B?eW5DRUZWZXIrOXVoc1pSdmZ2YWp6Yi9Zd25Sbnl4dFhiRVc2T2V1THRmSmoz?=
 =?utf-8?B?R1p1V0RzYVV0NnpUa3V4UDdNVGhMeHhvVEk1OGl2b3c3enlWc1hSU0JpYlVD?=
 =?utf-8?B?allQd0Z0Nkt1Vnd5b2Z3RWtHR1dVd1RGdnpEZER1ZC8vcWRwTmNuNlZrUXcx?=
 =?utf-8?B?WDM4ZXpjS25JaDhNc1V3Nm9ERHhxSjY1UnVRZHpvbEVjUEtPK3VHeFFybU4x?=
 =?utf-8?B?R1JqTGlrQjF0QmNRN09WdjJvVmVFM3VvNEdTQVBrVjZobHBxK1lMeWZCR2Nj?=
 =?utf-8?B?SkZJeWRkRVNDQU5la3J5dXo2eitqUEFzb2ZxZklpYkVyeUgxTjgxSWwxTHk4?=
 =?utf-8?B?S29RbkFJY2Y5aVQxY29OZUhXREhwK1dBZTVVUWFPK3hYRmtNMnpWMnNPWktG?=
 =?utf-8?B?a0dQMGF0Z1p2UjVJdk1TRDFkY3YxU096VzhTWUVOWWhJR2daNE9zYU9hQS9M?=
 =?utf-8?B?N3pZSElBVnNUOXl2UjVBZWQ1NXhxVERaWTAvU05pcWdDa292cjNZU0diR0d5?=
 =?utf-8?B?aEFmdWl5VUY2TktTWWI2bU1veUIrMjVqRWZZaTJCNDI5eldVR2MyVSszdUpS?=
 =?utf-8?B?RVBRTjZONXc5Z0pMaEliTXE1VGtQMmdKRjcxZXZJRzgxeGppZWhEeXoxVHhx?=
 =?utf-8?B?aGo3ZkRrUXRjVkJPaXdHdWFVbk9QNDRISEw2THRJL1ZEdCtmREkrQU1jWUxS?=
 =?utf-8?B?THR2SGtGVDluY1Y2ekxsZTAwVVprb0VNbW5qWlpTb1RWOWErUnN3M3BTU2Rj?=
 =?utf-8?B?LzdLK3VjL1NIc1MvWVhBalVEWVppR0JTZWVwOXdCSHo5TFVIclk5RzIxUTFS?=
 =?utf-8?B?Vm02c2xMa0NuMEUvRERUSDhBc1hsNFdDMDhrZXNVczVKdEE5enZuOEoyRTJR?=
 =?utf-8?B?WnNTZG1TMDhZazF4WDVCS29aUVpTMW9sdERuQ1dLbXc0ekluU1V6TTRpMGVG?=
 =?utf-8?B?d1YxVlBwaWZGSUl3VU81akRqaVB0OTlDVzY2S1ZBRUU2NFJrSktWRzBjemUx?=
 =?utf-8?B?QndLWWt1ZWFtb08xTDdPU2R0Mzd0cE1vSENEY1c0UEwrdktyZXk0UFNHbUJU?=
 =?utf-8?B?TWt5V3lEUWNrbm1XNW8vUFAyVU5TT2J3MUMvcFIyeTJhTlBzdTlkSEtzbm01?=
 =?utf-8?B?dWMyemYxdUMySFh0SENSZVAyUWZQeWcwQTl4NDlNRmRsb2xKWXpJOHNMd1d0?=
 =?utf-8?B?ZHVmRmUrUWoyRVBDNTFSNVNzbkl2NDM3SUZuWHd5dkVIVXlmbzlERThoRytv?=
 =?utf-8?B?VlFJWmI1Qys3Z3l2Ly9YbU9WSy9MVitVQ3AwMnJmOFFRdGNXdU1lb2s4TS9N?=
 =?utf-8?Q?UfHk3ZCifXxbPuzZsIR48DEGdyM9wrnuB2W7B8C?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658667fb-cd54-425e-8978-08d91ec178fe
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:37:35.8203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6Wv7BbkxxOnNwB9IxLQY1GGaO+2ITRRsWrz9CNN7kW6lLz9CNOLA1TvI5OfwwOz1lqkjo9Mblzx+ZATJgMl7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5673



On 5/23/21 8:36 PM, Andre Przywara wrote:
 > At the moment the fastboot code relies on the Kconfig variable
 > CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
 > flash command. This value needs to be the *U-Boot device number*, which
 > is picked by the U-Boot device model at runtime. This makes it quite
 > tricky and fragile to fix this variable at compile time, as other DT
 > nodes and aliases influence the enumeration process.
 >
 > To make this process more robust, allow the device number to be picked at
 > runtime, which sounds like a better fit to find this device number. Patch
 > 1/3 introduces a weak function for that purpose.
 > Patch 2/3 then implements this function for the Allwinner platform. The
 > code follows the idea behind the existing Kconfig defaults: Use the eMMC
 > device, if that exists, or the SD card otherwise. This patch is actually
 > not sunxi specific, so might be adopted by other platforms as well.
 > Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
 > this up and remove the implicit assumption that the eMMC device is always
 > device 1 (as least for the fastboot code).
 >
 > I would be curious if others think this is the right way forward.
 > The fact that the U-Boot device numbers are determined at runtime
 > seems to conflict with the idea of a Kconfig variable in the first place,
 > hence this series. This brings us one step closer to the end goal of
 > removing the "eMMC is device 1" assumption.

I would actually favor removing CONFIG_FASTBOOT_FLASH_MMC_DEV
altogether, and just specifying the device explicitly in fastboot
commands. If you need to dynamically change the device, you can create
some aliases. E.g. you could have something like

"fastboot_aliases=setenv fastboot_partition_alias_user ${mmcdev}.0:0"

and then run this variable just before calling `fastboot 0` (or whatever
your usb device is).

--Sean

 >
 > I am looking forward to any comments on this series!
 >
 > Cheers,
 > Andre
 >
 > Andre Przywara (3):
 >    fastboot: Allow runtime determination of MMC device
 >    sunxi: Implement fastboot_get_mmc_device()
 >    sunxi: Drop sunxi FASTBOOT_FLASH_MMC_DEV defaults
 >
 >   board/sunxi/board.c           | 37 +++++++++++++++++++++++++++++++++++
 >   drivers/fastboot/Kconfig      |  4 +---
 >   drivers/fastboot/fb_command.c |  6 +++---
 >   drivers/fastboot/fb_common.c  |  3 ++-
 >   drivers/fastboot/fb_mmc.c     | 12 ++++++++----
 >   include/fastboot.h            |  7 +++++++
 >   6 files changed, 58 insertions(+), 11 deletions(-)
 >
