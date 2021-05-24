Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945102FB1
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 15:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWBNfscYU0OntQcddugkv0k/bq1GyuEiTgneWuFclhkPd2nQkAyD+7j7Jf95sQ/Lukaozl8He5Of+70MjBP1tTzL5RI15nKR3z8vIg7WLfYxKFBMvYC2gcktH5Mb5uoxrg7coV3l7P6jaUFnEYJXnOCA8StY8MsuWndc9V9Z736UUVUT3lBnlmqAyToqHpo/QuonnyMgYUpSLkjvZ8NmGlnkoZQ2CW0gAA4/4w29cqE+/edl4AgSXa8oiFb+dLmSJFDq8lQs5901tM/6+zmCajaDYhu4eJ0TdmsjClM7m4Z2ynPFx36LOlZBCbN2cnVzaDc3wa9SwgE22VUAWTx82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pnL4IcSL3ByEwRuv2x+tjnjA3Gpbr3lnt9BvkdJd8I=;
 b=bcd4Ey8FnGQeRfsOwBTR4Ees1SDI74/v7c908JVYDFkDXgS+9rmpdhPVPHqXPLdQ4eZ/ZjbVkem2RWbPp81fyZaQz1FJqYOVN7ymWTPduNi1Kkm3tuzIKnrdfFgKc0dzYo3fiaI4T8ZMCtG2iXprCf0jBXJSKHNEtDeFLjVCATpc8jHxZnvovIJXpmV5ViY4F8rucPsll1rGsgcMdRX6BzR1oipgCv21eAhdF/osK3kSTuQH+pOTklZPLEQdwvmQNmYeEjU1Q/CPewc9+d64pdCATMzjG2r5XJ7xbKf2VLit1MoHlNC/yZLPieEd3qs4xnEGrvnpB+Rpl4DNP9DBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pnL4IcSL3ByEwRuv2x+tjnjA3Gpbr3lnt9BvkdJd8I=;
 b=lSO280ru/028O7d1wa05ska+Z29h8ugCEIF0stJPqo87o+pOkgsy+Ubk71yRpJStNAifJAZvtmzFa9WzZtdSySxe8PY4NyGe0gvmawAJUaEmJ8XKTgBqqrJLwOeFZ11C9eD2otpxGQnU0eTPg+C96p2/8vxzIHqiA64xKgKDPW8=
Authentication-Results: vrull.eu; dkim=none (message not signed)
 header.d=none;vrull.eu; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4347.eurprd03.prod.outlook.com (2603:10a6:10:16::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 15:33:34 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:33:34 +0000
Subject: Re: [RFC PATCH 0/3] fastboot: sunxi: Determine MMC device at runtime
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher
 <hs@denx.de>, Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210524003650.24469-1-andre.przywara@arm.com>
 <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
 <20210524161508.2129096c@slackpad.fritz.box>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <b5fabc04-18c0-dc31-f1a5-93501b5d9bc5@seco.com>
Date: Mon, 24 May 2021 11:33:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210524161508.2129096c@slackpad.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:208:256::21) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL1PR13CA0016.namprd13.prod.outlook.com (2603:10b6:208:256::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Mon, 24 May 2021 15:33:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b01b175e-8dd0-47a9-9c68-08d91ec94a81
X-MS-TrafficTypeDiagnostic: DB7PR03MB4347:
X-Microsoft-Antispam-PRVS:
	<DB7PR03MB434769584F505F11313BAAB796269@DB7PR03MB4347.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wwRdUIrejvis/m6VHF1+VtGH2NgaPfM4Gdwpyr9zXzQoPPAzhvAPdDjPrOH63v7Msq5bMtXgPsEklC/e/NW+tVdx5lfZougX+9+2bZma+9+zljg4QT53oxNGGOBz5ckdJhH6CtWSJdoC8xa2N3D8+xKM867JDmveW8oW/LULFMTFszMJmRvAfLDjdlGhQunvLHUQ02wZn9rFuAJwr6kEvoL0O+GcyelW88cLrSoI6QMfwagBhLwa6BHnG8SbprQlSSzbhGuklcSoJiSCglZt31Dcz7CjgoRPgzVvYhz99o3YffYnVnv6l/C2OROSatlAu0SXlkTbGe4WoCPVZPs+ocvnWUJwf7caif9jH7CaT3pLk1EeTpDiNsqzKr4JnFl3HpLjUu41uAq5ILVHt9GbRDKZ7wiqYWUq0bdf0hJp2BuT5jkRkaRokIj7Ke6cx1sQRZnOTWzmYTUL0l/aNSxhNPKINTplak2iHNDXlLJYielTqKCC6/D85ixX175CPVwwqj7O8J9ByKeA0pboSO4wM22TpU6Ps0Z47Krc8bZyXb7g001aYB69ATVADZJXkYHRJCdEQ06LjbIdW/ZemHgbV69/z7Gf6D+PeG0Sko8OfDLPsKrknTj/8/vOET24RWFQTFmxT0/7mA+kEBPmBMGg7btGH0kzjtixxk3ANIOElYxX9V+Y4lGrMgZqflQOHHdQXFmuVQ4VFQqyUydamOTZ+859lFfNlsiayKlrdPfwXgLi8AfOtNTQuBSkD2iF1HEz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(136003)(39840400004)(396003)(8936002)(5660300002)(478600001)(52116002)(38100700002)(16526019)(26005)(53546011)(966005)(54906003)(36756003)(31686004)(6666004)(8676002)(186003)(83380400001)(38350700002)(16576012)(2616005)(6486002)(86362001)(66556008)(31696002)(316002)(6916009)(66946007)(2906002)(956004)(44832011)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?VG9BRTV0TVJoYXRhRGNVVHg3ZVVhaUxyQ0l6ODZlQWRSNUJudHFHU3h3d3ZR?=
 =?utf-8?B?UEIrQ0xBbjVOTW5BMkl1SGkvVnMwRVJ3UnowRWhvN3QvOVgzdkZoS1FQUWU1?=
 =?utf-8?B?WStEc3cvQkJ4R01XRFErc1pzd2xRNzJzc0sydkpvdnNoeWZHWEhMQzZCSTBp?=
 =?utf-8?B?N2g4cWJLbUF2YkZjRHpac2RISVVjYnM5NUl4N0NIUnZ5TDBtc08wZUhYakZ1?=
 =?utf-8?B?WkNFUDAydy9VR3JTcjUzTU9YTVRFUDR1TXQxbHlWU3U4eWN6Z2J1UDlJNFpQ?=
 =?utf-8?B?ZEZFSTBkdXFlKy9XUldET2hJWFo0MnZHcHVNUmJ6ZE4rMkpJWEVma2Evb3dF?=
 =?utf-8?B?b2ZyOUQwcUpvME54TXV6MDludHJXTm5JYnBXdVJYN3RtZUJtQ0hyeTN0ZDJt?=
 =?utf-8?B?MUZvL1NTN1pRWldHWDhEeVhZdFM3SDVPNmtqSSt1MW1aL093SmZyT1hQbkNi?=
 =?utf-8?B?eGlpeDBhbTRQdkJGU20xSHRVSjU0bW4zMzRxTkxSdG5XNGV5WDlTaFQveTRm?=
 =?utf-8?B?cTEvdm9Yc3ZiaWpLMThuSi9McjN2VFdZbi8xUmFYVndLWE9NL0VrVkZnVWpY?=
 =?utf-8?B?NGxxcnNhbk8zUDF5bmdML1Q2QWR4VXNxQlk3TmhWQ0I0UW0yVGNGNHlQNnFw?=
 =?utf-8?B?bEpLdTZ4ZElSOW1lOTd5R1NWVlBENUhWdkdtdlhzQlNvdDFlL0ViUVBhRHNE?=
 =?utf-8?B?RFRqU1ZEbHlpYno2YWZvSTN6VHZqSTkrbUxDNWR1Sm4xOVYrL3Yvd2lnMEhp?=
 =?utf-8?B?YU8rTjBWdG5RTkJNcFdLaGJTaEtienYrZGZiQ0VNdzhpZmpIdWhiMWpNTm4r?=
 =?utf-8?B?NU5OYnR3UjFxSFYvRHl1T280VlFmTm1kTmorM1ZUcHlhbE93S3ZueVp0bzho?=
 =?utf-8?B?Rk9sbjNqcVdKVHBya0I0YklnY01CYTc0SzJPdTdrL0ZubVk5QWxoZXJqdjdN?=
 =?utf-8?B?ZWM5SDJ5RisrZnM2cUhoQ3JqRlJ0bFZzNXBDdHlkdUl6K3RkaDl5YlVYaXll?=
 =?utf-8?B?SkJmcVlJUGJEYUpaRVRxaHk1NHE4bmZxTDN2NURPY3lVZlhGa3V5UGs2MGl3?=
 =?utf-8?B?Q3BJM3NPRkVuNWlzVHQwQWpiNDRqamJoYXVMOGtUNDBLWDJVa1lRZ2pGeVpG?=
 =?utf-8?B?M2pab3hLaW9QQml2VFo0ZzR3eXNkZExjZXhhVUM3cGU4b3ZIQW8wWDNNSksx?=
 =?utf-8?B?MXUvaVFlZzIyUWgyOGFoNFhoTmxlS2lXWWNLdnNtVlZLdmUxU1I5cDVNeCsy?=
 =?utf-8?B?WVNFMHVQSVA5TWp6UytzY2lsZzFYV2s1WGVGZjlBSnpDRXBTRDRMYktVT0d2?=
 =?utf-8?B?cGFBcWdsaU1iYUFQVkRyZHlDbUIzUFZkMThEMThJMndOSExqaFZsUHZBY1ZC?=
 =?utf-8?B?MUtWSms4emN4Wm9zSDl4cXJweUp2U3lheHZYeVRVcGxxRlhmNmIzL3paSXFM?=
 =?utf-8?B?OWkyd0krVDduSmFNWVd3QkI3YjZGM2dmTGxsRGdOVkUvcm9RS3hOcUxaSXRY?=
 =?utf-8?B?MTJENlhRL2RicEZjQWwwQVhaSm10bWM4U1YyL2JwcDMzWGNYWFgydis3RzBI?=
 =?utf-8?B?dTU0cXgwcElyVkdGK1BlNVZTK2dZMTIrOFRLaTdYMlBreDUvMDlHL1ZmOWFu?=
 =?utf-8?B?MmVZTE14dkduUlJTYmZkclRVelN3aDlPdU43eXZkbDhCUVBWaEdyZFk1R29l?=
 =?utf-8?B?ZHVhWEZMTFAwWUtTU2NabmxrTHR0dVFRV0xoaUtQd1ZRVk1XczBzQURvNlVR?=
 =?utf-8?Q?Lrg/ScrstqoVkAaBMSiNCGgD81Q+/pfR9+3z3pz?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01b175e-8dd0-47a9-9c68-08d91ec94a81
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:33:33.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KACfoSyUKWGUzZ+2TsCjOnKltJ36yHZD2e8GnPnBOdnoePvEn5iUSn9ac55tzGUtG/oTbi7ltzlQ7tDNZO9zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4347



On 5/24/21 11:15 AM, Andre Przywara wrote:
 > On Mon, 24 May 2021 10:37:31 -0400
 > Sean Anderson <sean.anderson@seco.com> wrote:
 >
 >> On 5/23/21 8:36 PM, Andre Przywara wrote:
 >>   > At the moment the fastboot code relies on the Kconfig variable
 >>   > CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
 >>   > flash command. This value needs to be the *U-Boot device number*, which
 >>   > is picked by the U-Boot device model at runtime. This makes it quite
 >>   > tricky and fragile to fix this variable at compile time, as other DT
 >>   > nodes and aliases influence the enumeration process.
 >>   >
 >>   > To make this process more robust, allow the device number to be picked at
 >>   > runtime, which sounds like a better fit to find this device number. Patch
 >>   > 1/3 introduces a weak function for that purpose.
 >>   > Patch 2/3 then implements this function for the Allwinner platform. The
 >>   > code follows the idea behind the existing Kconfig defaults: Use the eMMC
 >>   > device, if that exists, or the SD card otherwise. This patch is actually
 >>   > not sunxi specific, so might be adopted by other platforms as well.
 >>   > Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
 >>   > this up and remove the implicit assumption that the eMMC device is always
 >>   > device 1 (as least for the fastboot code).
 >>   >
 >>   > I would be curious if others think this is the right way forward.
 >>   > The fact that the U-Boot device numbers are determined at runtime
 >>   > seems to conflict with the idea of a Kconfig variable in the first place,
 >>   > hence this series. This brings us one step closer to the end goal of
 >>   > removing the "eMMC is device 1" assumption.
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
 > Fine with me. I was actually wondering about this already, but didn't
 > want to disrupt every user, especially since I can't really test this
 > very well.

The ideal way would be to define aliases dynamically mapping old
partition names to new syntax. So if the U-Boot shell were a bit more
expressive, one could do

	for partition in $(mmc part list $mmcdev); do
		env set fastboot_partition_alias_${partition} ${mmcdev}\#${partition}
	done
	fastboot usb 0

which would map old partition names to new-style syntax. Unfortunately,
we don't quite have that capability yet. I think defining a bunch of
aliases when you run fastboot could be... suprising. I'm not sure if
there is a good solution here.

 > So can you use this explicit device naming from the host side already
 > with the current code?  Can you give an example how this would look
 > like?

Flash the partition named "rootfs" on MMC 0 hardware partition 0

$ fastboot flash 0#rootfs root.simg

Flash the entirety of MMC 1 hardware partition 2

$ fastboot flash 1.2:0 boot2.img

For a more thorough treatment of this syntax, see [1]

 > The documentation I could find only speaks of the Android
 > partition names (like "system"), which requires environment variables
 > to work, IIUC?

They require that you use a GPT-formatted disk with partition labels.
Alternatively, you can use aliases. There is one sentence on the
new-style syntax here [2], but I really should expand on it...

--Sean

[1] https://u-boot.readthedocs.io/en/latest/usage/partitions.html#partitions
[2] https://u-boot.readthedocs.io/en/latest/android/fastboot.html#partition-names

 >
 > Thanks,
 > Andre
 >
 >>   >
 >>   > I am looking forward to any comments on this series!
 >>   >
 >>   > Cheers,
 >>   > Andre
 >>   >
 >>   > Andre Przywara (3):
 >>   >    fastboot: Allow runtime determination of MMC device
 >>   >    sunxi: Implement fastboot_get_mmc_device()
 >>   >    sunxi: Drop sunxi FASTBOOT_FLASH_MMC_DEV defaults
 >>   >
 >>   >   board/sunxi/board.c           | 37 +++++++++++++++++++++++++++++++++++
 >>   >   drivers/fastboot/Kconfig      |  4 +---
 >>   >   drivers/fastboot/fb_command.c |  6 +++---
 >>   >   drivers/fastboot/fb_common.c  |  3 ++-
 >>   >   drivers/fastboot/fb_mmc.c     | 12 ++++++++----
 >>   >   include/fastboot.h            |  7 +++++++
 >>   >   6 files changed, 58 insertions(+), 11 deletions(-)
 >>   >
 >
