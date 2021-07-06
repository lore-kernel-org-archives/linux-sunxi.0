Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40073.outbound.protection.outlook.com [40.107.4.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A370
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 19:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA2Zt7QNDht6EsehVgdZ44jnXCiLB8cbTUb7hwqxynmu1JTYnX1YwJ+sYdNkVpgo+SNSD+YoqTy4Wgnr/reCBndLLOIDsDnu9e8qwGwgvFxZHkfG81fXx8AaE8iowG3BuIXiCCPt0NxNUZP4ar6JevEcHmlSI77hSv14kJyYMN8KFe4K9n25xi5r98MJSsVNKb2v4phsYkOFqfZ4DaV4ejHcdqseIYu5K+eakJ3K/swhtcVSJ23No+R0JJxCD3v23Q66DMgXkeGPmKt+sqPmr4XRs6GBmu8eNDC04e2J/Q+TfDqBwjk8rh+3QQao71goeXXSPWY7h3vJdEn8OH41cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9x93nz2ACSrzZ87cMS2dkL9fctJ1JWHPiiqn3UEVoY=;
 b=OAb07fu0WvyvJxDPOv3ZWWPtsGOjTcA1go8KMujf1psJPTGzRhGZbiyPdZpBd1lhSyKKV/hGb+J5grUQmqPikeyibv7du/75IVzr+iVoOc8CMh9dzNFT5DVWNKHyazgLOhfIvQlDh/RQa+0vE6NgvsNdt0vYG0vrj+O1lBMNWAHMtuwZ9XnP6Gn5YxioG561FpT5wPSi0TIDzKT2A/r1XoSsDuAD4KWxEuJAv3EZIObZnI8Eu6ga6W6vT5ZRq7DBA02MaM/Nc+SabnqAOIfvZorSEIyJ6VTW6X6wOdAvmQHpVEwk5xXuboAGivAts6jsEt6BZDWImyI7AIArJ/CSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9x93nz2ACSrzZ87cMS2dkL9fctJ1JWHPiiqn3UEVoY=;
 b=TUwICxNpqIGp004Yhfe0VopwU5nU067dP5CGr3jgjjwMcysQZe2TfC7rGymyCKWgw9ETbn0i4zo3myPRNxclvQ3EGs70GgyQ63CGWMdkOlS04JBjDYEwNXLry+2GiLUtGnXjxaTXLO96ADtN0QwGrdWNUugLGKf6n52XDLwBmw8=
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB6203.eurprd03.prod.outlook.com (2603:10a6:10:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 19:23:43 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 19:23:43 +0000
From: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH] cmd: ums: Enable by default for sunxi
To: Maxime Ripard <maxime@cerno.tech>, Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, U-Boot-Denx <u-boot@lists.denx.de>,
 linux-sunxi@lists.linux.dev
References: <20210705232319.15149-1-andre.przywara@arm.com>
 <CAMty3ZDv3WPqRAMQEZe6D8BxJgz+MhzxdaKMQLUcG5K-CL7=Ew@mail.gmail.com>
 <20210706165732.7a532568@slackpad.fritz.box>
 <20210706161118.im2majzm4kwhuqw6@gilmour>
Message-ID: <0ed283bb-db0f-6ad4-7258-d316439b548a@seco.com>
Date: Tue, 6 Jul 2021 15:23:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210706161118.im2majzm4kwhuqw6@gilmour>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0097.namprd02.prod.outlook.com
 (2603:10b6:208:51::38) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL0PR02CA0097.namprd02.prod.outlook.com (2603:10b6:208:51::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31 via Frontend Transport; Tue, 6 Jul 2021 19:23:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f21bbb-93c2-4760-f38e-08d940b39185
X-MS-TrafficTypeDiagnostic: DB8PR03MB6203:
X-Microsoft-Antispam-PRVS:
	<DB8PR03MB6203EEF777D32DC7F952DCAB961B9@DB8PR03MB6203.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dJkGUIrguJRPUDLROz535iZqLVyDQ/vANmjMTYgJQwBU8LH9v1kv7T6TvYnRoFQNCuS6XRq8WuNaJ9ShdyCiphAJS5msXYYfjNldCh38S4fDW5qZpnWA0hFXsggCme2EJa/McsfrkS4q3ZKGKtlyVq3KfAu9fDXcH6pFuRTMHMfh9wLqlsHA2afIRMknOAckIce3PJRQPSmj62/aZpLMCwctrFpbDj59UWW7RZRoEVPCzJAFCfuwpNuPdwzXgT4aY0j1UgP0W0yjaUAfMN36JE3839OscFTeIg6bt2DXVKS0G7r9hIgKxFLNPNQYYorKxxSk0f7jlO3iGWqCuzX27osm2IvopIWZRoX8Q3SYHUwF+fnre0jd06c2mrund7demhopIoC4Jh2C+NI0MpNkiJQQSSZp7JZcKyMmRJpwytnmFYERBOjKDwIlGgp8aWaKMdxgxsCkA5A5TDs6ylFuuTgmPqKSDHCvdmlUGKH8e7DefYDtawrPDZGvVPccniZ4wq4HEs5Qmr0KOzchi8L3WcbIfpFbFDVGNpL5IgeNU7Y+euN2G05RJWA/TebcCJT74rQF8n/hKL9fs0xRdRie3hTIMspynZDVv4VpkVOBFY+Z2ZLPeJU6w55/FvmKeZhn4nbb6zkYZeWhn1CxDxk23dvWitL1zC+2LYRLE1Ko9Rii9vZQNYsYdqR+sBVcV2ZNVvALI/xN9FB8Au3en6SMbsZaEq0Cb7CxXdr5sD/DykJ1v4pL0hFmBNLTifzuA1SdyxKrvknoRcn7W21dEhGsig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(376002)(39840400004)(478600001)(8676002)(31686004)(8936002)(83380400001)(5660300002)(6486002)(54906003)(186003)(66476007)(16576012)(38350700002)(66556008)(38100700002)(44832011)(316002)(66946007)(52116002)(86362001)(110136005)(26005)(2616005)(956004)(53546011)(6666004)(31696002)(2906002)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?aUSa9hRbGo94MOCjUaL3KiNz7tZpI7oe6nYQ6vr3sx4heZqUT0tqDZjk?=
 =?Windows-1252?Q?uqmglvhAEgQ7qImeKfqrDMWN6r6qdJOAF7zXeAO3aVSDoiDuZ2sohH+2?=
 =?Windows-1252?Q?ED2sOk/VOAifPDXx1U6U2Hnpu4KYj5cumi2Q8NadRxNtFgCK9KGbEyEZ?=
 =?Windows-1252?Q?RY4Oqc1/7+0K7ISu3/Rao/khPLeXYufPGC/zfRjA8ucD73wQJYLo8MIH?=
 =?Windows-1252?Q?IewtadT7/OrZ7GLhs3QabHsIceS8uU4kLujCNI58q3gbujvbtaBQhHFr?=
 =?Windows-1252?Q?Uo5gnY352L+DiuSL8MdwifNPjnSjy03gNEhZEB5s8EFfM82a/9L2M+RR?=
 =?Windows-1252?Q?SBumjK+EasVCQnEvEyY+YLk1G7UuLLAaE99Vz/d9iFkVU+nvll2gTee9?=
 =?Windows-1252?Q?XXi++gxf6ynferUNR6MkvQ4JVLwDi0xQf+dX0RprwwQDqgcu/CPxaXyZ?=
 =?Windows-1252?Q?l0CpEnM+Y6yWFNdoa0O5Bv4XfLuP0iduU2xOh2T9ikffcANDIo3hADvO?=
 =?Windows-1252?Q?b20yhIs9aWs2Q5zjGremqKic8mFLl/QJny3VWKPSKaJt3f/Ku8TIahsK?=
 =?Windows-1252?Q?BN5D8U2sxZkpok6KowtnFBRpVtWFtNBVCsUkpnzCoauFNrTqCVZ8OHab?=
 =?Windows-1252?Q?2tnJW8YUPF8VY6MEGnaduh4F9jD/IGsb5Kpe1XJV5sFwnudeHjZr60WF?=
 =?Windows-1252?Q?6v33Qy+fV1SxEcvJXdTq7IRrenVo0gbU5Tnm26nSY3B0XXPRDIhsaHAZ?=
 =?Windows-1252?Q?z2Ef6mF01hBDIpARbV6/OjNS9SCfzS9jdYwMjGy/JSy45CIVaf6Miyqc?=
 =?Windows-1252?Q?Yse+dBnIKF73GjUrVqzzOS4H7l5bLal0EMzHUXKxVrbsnM4knehdVS6F?=
 =?Windows-1252?Q?G3NEwFsnNzjPVkbOJI0/AvIiusmu9UeaL219w5NycJ6r/lMOImU9Taw5?=
 =?Windows-1252?Q?CGSBBMNHWoCvK31k34yqRmh5E/eOdJhPZcJBB9cJBjh51g5fiM5vqZV/?=
 =?Windows-1252?Q?pZTcT/JUWhI5dKOrIZVNFLrjMPTRX2N5fUerz2FKTG7r4t0UWzdobA5F?=
 =?Windows-1252?Q?x1hc3SOvxPGstWJa6a7ljmlGtUfBtgZYY7OaiJY960idnelYgJELDzSm?=
 =?Windows-1252?Q?EHwiS1yOZDuDNPjfPJDlcB3YG6xrRrgUx9x0x2KtF1eoeMPhcOxP3fEc?=
 =?Windows-1252?Q?QqmL2FIcG8QSZz0uO9tEq1bu9QROO4YL6VPl7B7r+/EDXXlpH9zq0WpC?=
 =?Windows-1252?Q?3TgYrW0uDZg7KulUjZfhseOeGG8uTRfr7XuS31v2wKtHPPgyW98REzfL?=
 =?Windows-1252?Q?S06PdQRx0+pKke1cRN77QUpJQ8JGIMVRs/V791jCu8GoG9Gk2p1yIovO?=
 =?Windows-1252?Q?EvNNRoEfvgTih2C5X1HNYiOK1QeTPQq3OcJHtxVdTWZJMmC0ATuhvr6b?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f21bbb-93c2-4760-f38e-08d940b39185
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 19:23:43.6253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0IMwA47grLubyh1ZvEQ6olRmGrVXNf9qTRNImitUgT8YAyw15BxkZVAY1VnB9XRbOUzDqD0qkHpoe4Pzohy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6203



On 7/6/21 12:11 PM, Maxime Ripard wrote:
> On Tue, Jul 06, 2021 at 04:57:32PM +0100, Andre Przywara wrote:
>> On Tue, 6 Jul 2021 19:56:24 +0530
>> Jagan Teki <jagan@amarulasolutions.com> wrote:
>>
>> Hi Jagan,
>>
>> thanks for the response!
>>
>> > On Tue, Jul 6, 2021 at 4:53 AM Andre Przywara <andre.przywara@arm.com> wrote:
>> > >
>> > > The ums command (presenting a U-Boot block device as a USB mass storage
>> > > device) is very useful for accessing eMMC devices via USB-OTG.
>> > >
>> > > At the moment we enable USB fastboot by default for Allwinner devices,
>> > > so it makes sense to do the same with USB mass storage, which is
>> > > actually more versatile and can be accessed on any USB host easily.
>> > >
>> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> > > ---
>> > >  cmd/Kconfig | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/cmd/Kconfig b/cmd/Kconfig
>> > > index a9fb4eead29..7b1c96910a8 100644
>> > > --- a/cmd/Kconfig
>> > > +++ b/cmd/Kconfig
>> > > @@ -1347,6 +1347,7 @@ config CMD_USB_MASS_STORAGE
>> > >         bool "UMS usb mass storage"
>> > >         select USB_FUNCTION_MASS_STORAGE
>> > >         depends on BLK && USB_GADGET
>> > > +       default y if ARCH_SUNXI && USB_MUSB_GADGET
>> >
>> > UMS or any secondary-emmc accessible are considered in production
>> > u-boot config instead of mainline u-boot since we have fastboot
>> > already available for this kind of purpose. This might be one of the
>> > reason not conisidered UMS by default till now, atleast on Allwinner.
>>
>> Well, I consider fastboot inferior to UMS. I understand that
>> Android phone hackers use it all the time, but I think having a block
>> device is far more versatile - you can partition it as you like, create
>> and populate a filesystem, dd an image to it, extract or update
>> firmware, etc. - most without extra software, even on Windows or Mac.
>> I think fastboot offers a reboot command, but are there other killer
>> reasons for it?

During manufacturing it is very convenient to be able to run arbitrary
commands with ACMD/UCMD, or particular commands like partconf. Fastboot
also allows loading things directly to ram, which is nice for loading a
ramdisk/kernel when you don't have network/mass storage.

There is also no way to stop UMS other than by yanking the cord or by
hitting Ctrl-C (though I am working on this).

> And having the ums command in addition to fastboot does
>> not hurt, both would still work.
>
> fastboot abstracts away the storage medium, whereas UMS doesn't. You
> cannot run UMS on a NAND or SPI-NOR, while this causes no issue at all
> to fastboot.
>
> Similarly, UMS exposes the whole partition to the host. You then need to
> have a driver for that FS on that machine, otherwise you just can't
> access it.

You can expose just one partition like

ums 0 mmc 0:2

you can also expose multiple partitions like

ums 0 mmc 0:1,0:2,0.1,0.2

--Sean

> Sure, it's convenient, but it's far from being ubiquitous and the silver
> bullet you claim it is.
>
>> So are there any real arguments for not adding ums as well? I am not
>> sure many people tweak their config, so I would like to offer a decent
>> out-of-the-box experience, even for casual users.
>
> As usual, we also have to balance that with the size limit, but I'm not
> sure it's an issue these days?
>
> Maxime
>
