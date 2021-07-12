Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140050.outbound.protection.outlook.com [40.107.14.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE670
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 00:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U04HauY7S5eIRgjlaARtLps4z0SzC2ysA6nq5yDwTYHk/KQgXEujKf6+Isx3977TFJoa5mXz+uRYbt0ckODcBJG70Fg+9UyEni5cjziiUV/ctcJCpUR7VQEYFXLQgutuHxlZOFrSMpqjDF/1gIBzyRkwIjmkC6zwEaEuyujyg2RlRimrZAVSOTMre264XUV+1+v4rITGhqbF3op7q6bhNp4ICKoX7YtURdE9FYGsZ2JdOVCn7bCFeEdgmvnY7w73sDirErqMiUqfzoVknIiGzMAz0XHthdnTjUjryfkQ0U5pkQbtfZnMJvth+ocrqAviZfD8IVt5DEiuCLvF+oBOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC8Xh/skygKr1SikRYAan6HkvVU0Iy80P4AS6IQOGWo=;
 b=BJyf933cvr74SN7Tj5UHpQZpTx4oIjQE54Wq4lsLQNjqZLDMFz/873IzKtTIr35i9GDY2BYgK3iScFxseRXGnZ8a4vv/5K9ajc7m3livZ8IjOL2Bcnc7tsACX/7vBkx2e/L61sz5Mrqpro1DIiNNOxUUlgquwRN7EeUhlJ/yXrzvrQvwoLEiM2syjyH/NszKE/4y/oqmvLik/YJzraHwY6iLtCVmSuWhwlimxZT712/hBouleHMdtiAObZvefmFG3EumrUI+qWE/Do0bV0WqM01Ebb3TZCj6gBeKeLB0Ean+0cIcqQUqNq2AhP/UEvDphIAo99UzpkPd3YlPdA479g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC8Xh/skygKr1SikRYAan6HkvVU0Iy80P4AS6IQOGWo=;
 b=j2TSeMWFHoFve8LTh1kZ+CwY0a8EL3bRwxExPtQveEx3Y6AWlo58FOZ/p1k9lYVO7whcw5KjEBO7FHkRGD57mvIldsARHFrO4JeTET4DDp/D16OAo061F7WQmPfI43NNAMNgNnc1/uIFbdNEF5JRUK54Px9ewBaVfcof4pu40rk=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 00:52:44 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 00:52:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	<jagan@amarulasolutions.com>
CC: Samuel Holland <samuel@sholland.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Aleksandr
 Aleksandrov <aleksandr.aleksandrov@emlid.com>, Sunil Mohan Adapa
	<sunil@medhas.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, Stefano Babic <sbabic@denx.de>, Fabio Estevam
	<festevam@gmail.com>, dl-uboot-imx <uboot-imx@nxp.com>, Lokesh Vutla
	<lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>, Philipp Tomsich
	<philipp.tomsich@vrull.eu>, Kever Yang <kever.yang@rock-chips.com>, Marek
 Vasut <marex@denx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
	Ley Foon Tan <lftan.linux@gmail.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, Patrice Chotard <patrice.chotard@foss.st.com>
Subject: RE: [PATCH v2 1/3] spl: mmc: extend spl_mmc_boot_mode() to take mmc
 argument
Thread-Topic: [PATCH v2 1/3] spl: mmc: extend spl_mmc_boot_mode() to take mmc
 argument
Thread-Index: AQHXdqWGk6p+DIwqWk+0OjF5oWnDLKs+gwzA
Date: Mon, 12 Jul 2021 00:52:44 +0000
Message-ID:
 <DB6PR0402MB2760CF598C730F5D985F005888159@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210711223812.29886-1-andre.przywara@arm.com>
 <20210711223812.29886-2-andre.przywara@arm.com>
In-Reply-To: <20210711223812.29886-2-andre.przywara@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e6efbdd-2807-491c-047c-08d944cf5c25
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <DB8PR04MB6618D4E0621F8AB34FC44825C9159@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BmJ2IvAJ6wI7OAUYj8Bn7niP1VJ+oxYDMYvmiEGecn/pmpPGNTAoSu4eMH7nTsjbZf1qKj0wiqxecdoQoYJubV6fPTGGhsSWo8Sv/joieQwqhr3fk4f+ZI+7lPm6R8VcHw1Ohtprp5Msgbtyy9AxklJdCXSQ28EtV3h+5MSBf4Q/pRgldR3xWDLegYQexT869I4dB94M2xV0VPFjdEmKMYzLcCa0A0wbU1FWOD2SeaifS5isrHfwUpWr9dQnuZrOTgSiiSZbHxxU764ndWyi3n3MbxBVyaT77w0mtjy8R3guKPTB0lhprjnaYVaQlAOLwBRRPX7O9v5wJg/RD91hdInI6uHlIQUXbEKxp2Wauh7myjKYAD1ai2Cp4CodEAh2bHFHQcEMqxETj/nlDw4YEmPsDkzn4XnJdjujosaQzM0GoQThzJpbNW0NeUll6bSlOEmG54uPE4KLE/hQ9OTKXXXCcPzXdvF69JUIWvzv4YekCj4FI9ZCfSE7Q7zGHn3wm+DRVrp2RmSuj6XUyE710sTWwCaVNTxRRJ+qSOJ/zxM9NN+SZrtivABrV2GacZQvAupvE0RFBl3urQBdFhLbq+gVLoMMRf5yYQmD9aA2B10I/uY5YaUTC8r7txo0kvDxDxB7ZOGO/N4szlzjY1ARpg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(38100700002)(66946007)(9686003)(64756008)(66446008)(186003)(33656002)(2906002)(83380400001)(55016002)(66556008)(122000001)(6506007)(66476007)(76116006)(7416002)(8676002)(8936002)(316002)(26005)(86362001)(7696005)(4326008)(110136005)(478600001)(5660300002)(54906003)(71200400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fxP/1ELgGIUjHzRbuAZPXtDSIPJT5o9WXb3Fhmt+n2BF0P060gf6CJYCY6vw?=
 =?us-ascii?Q?31HzpPJePsh6feqk6NaqqaNhf+RH9dPwfq0Llr3iqvAuXLExLeEXZYzsE5o1?=
 =?us-ascii?Q?LpP21zMmgJ5C7bM0Fcl6ZW2xiFx2t9aSSq2ZOt26+TIGJgMoObgIf/tFsh4u?=
 =?us-ascii?Q?xZOQpzZn3sJ70xSfsbb3W8fy2yYhLjZDaBtI6LMNtQdSIchd7JQoUgNbuFjn?=
 =?us-ascii?Q?+SWSBz6h6y3GZUu8wHdQjbSR/AmFaP26ngzlq4KigMqadKvOqSBjteNGBRdS?=
 =?us-ascii?Q?EADmOLqAIcvWLfZ9bIDTxQ3Ui5GrVJH8jnTdUNBUB0o4p71tw7en/Mr5JbmD?=
 =?us-ascii?Q?o/Yp7rNAQgxiwy2dDxesYwpB7mxXqaykX6Lhcng4kWXnTe73AtyL1TXMeNnV?=
 =?us-ascii?Q?HHdFZjSBhH9k4/KlkmdhGVS7adN6mI+RoFEbBWJvN3alZVvtoFc8OfviF9MB?=
 =?us-ascii?Q?eWRkApR1iCIQ89zcAaRjuMgZiUhIscMxoXIWAO8PIUX3EkQe9U96IRqPZF21?=
 =?us-ascii?Q?lfbAXsjCmQKvk7S0xzKF1pD8Rq81FbCdid9HWL2vmKZarjmTR7K+XCUWNFt3?=
 =?us-ascii?Q?2t15iw4131GYAlyaK1B0LdapRTjmCK83ipygSSTLLYB9H4SRYr1zaBtuH4nA?=
 =?us-ascii?Q?dDK+TkizmEPpu8PPPIjP6piB73yGrk4BVtR1jkSUUvXJkEyAIsO+TKv2fvfl?=
 =?us-ascii?Q?6X3MgnkyRRpyu/ol75bNiU87dYLsKlGh/c10oesONSA8P9D1Os+ag/TVggNC?=
 =?us-ascii?Q?0OJTwGUSHPZEhbhMjTAMV07Yb/UaVt5V65L4M1o36YFzXufoJ2XaYtxwdnLJ?=
 =?us-ascii?Q?onILyfn92JhHuLAJ/s7BSpYixGe5HIHrBHA5y8lDpDguPk5CVjtZ4s59MTy0?=
 =?us-ascii?Q?QlNoTau45ChIYwvLUFDcIuxwkiDRrVQ5mI5EBcY/1to1tnDu1Z3X73WfqtN2?=
 =?us-ascii?Q?CzqRj/pmd4LZZ18Cymm6/ukyESkNgd/ojYfVi5XFWnaRei7iOFINa/6j+XNI?=
 =?us-ascii?Q?ggusf3+VqSLanPnkFO5gIbmSnBVCQ3F5v0eyOBCzgiuKLTSovOXtTDoHx89c?=
 =?us-ascii?Q?0bRny7M5vi5Ii/sOw6zbBmjtvNOoHJBpGcy4fryiOe0+4rL40U+HfpQ8AHiT?=
 =?us-ascii?Q?8XSIphSNWFUEWAWXLi793TZ50DR7ZIV2TJmSgUddMXWNmBeoVwbe+oPXQmKm?=
 =?us-ascii?Q?skHTCMNUX+C9VDCDTBoShvkS+7BX6x4Iv3wlSPG+xo+KNuzIF7McYi1hYNFT?=
 =?us-ascii?Q?EGnbuDAk+zc5QAyrn6hT1dCtXsENiZUKn+4gMjBVsi8TfYo87MIqQmj9OB/V?=
 =?us-ascii?Q?iwn1po8KcD/1aF6IASQMUIxB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6efbdd-2807-491c-047c-08d944cf5c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 00:52:44.2435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KjsdDTHANU1FeRI8/9vvj0fzyiqS8Rx20Ue3IMUk7ciPhsRAgACPbRADiia3Cd9cQCBiEa9hfCEuSmvIfqO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618



> Subject: [PATCH v2 1/3] spl: mmc: extend spl_mmc_boot_mode() to take
> mmc argument
>=20
> Platforms can overwrite the weak definition of spl_mmc_boot_mode() to
> determine where to load U-Boot proper from.
> For most of them this is a trivial decision based on Kconfig variables, b=
ut it
> might be desirable the probe the actual device to answer this question.
>=20
> Pass the pointer to the mmc struct to that function, so implementations c=
an
> make use of that.
>=20
> Compile-tested for all users changed.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Stefano Babic <sbabic@denx.de>
> Reviewed-by: Ley Foon Tan <ley.foon.tan@inte.com> (for SoCFPGA)
> Acked-by: Lokesh Vutla <lokeshvutla@ti.com> (for OMAP and K3)

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
>  arch/arm/mach-imx/spl.c                | 2 +-
>  arch/arm/mach-k3/am6_init.c            | 2 +-
>  arch/arm/mach-k3/j721e_init.c          | 2 +-
>  arch/arm/mach-omap2/boot-common.c      | 2 +-
>  arch/arm/mach-rockchip/spl.c           | 2 +-
>  arch/arm/mach-socfpga/spl_a10.c        | 2 +-
>  arch/arm/mach-socfpga/spl_gen5.c       | 2 +-
>  arch/arm/mach-stm32mp/spl.c            | 2 +-
>  arch/arm/mach-uniphier/mmc-boot-mode.c | 5 +----
>  common/spl/spl_mmc.c                   | 4 ++--
>  include/spl.h                          | 3 ++-
>  11 files changed, 13 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/arm/mach-imx/spl.c b/arch/arm/mach-imx/spl.c index
> 36033d611c9..797097b9c79 100644
> --- a/arch/arm/mach-imx/spl.c
> +++ b/arch/arm/mach-imx/spl.c
> @@ -201,7 +201,7 @@ int g_dnl_get_board_bcd_device_number(int gcnum)
>=20
>  #if defined(CONFIG_SPL_MMC_SUPPORT)
>  /* called from spl_mmc to see type of boot mode for storage (RAW or FAT)
> */
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  #if defined(CONFIG_MX7) || defined(CONFIG_IMX8M) ||
> defined(CONFIG_IMX8)
>  	switch (get_boot_device()) {
> diff --git a/arch/arm/mach-k3/am6_init.c b/arch/arm/mach-k3/am6_init.c
> index 425b3f93c86..f4b039e8a6a 100644
> --- a/arch/arm/mach-k3/am6_init.c
> +++ b/arch/arm/mach-k3/am6_init.c
> @@ -253,7 +253,7 @@ void board_init_f(ulong dummy)
>  	spl_enable_dcache();
>  }
>=20
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  #if defined(CONFIG_SUPPORT_EMMC_BOOT)
>  	u32 devstat =3D readl(CTRLMMR_MAIN_DEVSTAT); diff --git
> a/arch/arm/mach-k3/j721e_init.c b/arch/arm/mach-k3/j721e_init.c index
> e9e076c9e72..fc0db2a4001 100644
> --- a/arch/arm/mach-k3/j721e_init.c
> +++ b/arch/arm/mach-k3/j721e_init.c
> @@ -232,7 +232,7 @@ void board_init_f(ulong dummy)
>  	spl_enable_dcache();
>  }
>=20
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  	switch (boot_device) {
>  	case BOOT_DEVICE_MMC1:
> diff --git a/arch/arm/mach-omap2/boot-common.c
> b/arch/arm/mach-omap2/boot-common.c
> index 1268a325038..f71fe65a0b1 100644
> --- a/arch/arm/mach-omap2/boot-common.c
> +++ b/arch/arm/mach-omap2/boot-common.c
> @@ -189,7 +189,7 @@ u32 spl_boot_device(void)
>  	return gd->arch.omap_boot_device;
>  }
>=20
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  	return gd->arch.omap_boot_mode;
>  }
> diff --git a/arch/arm/mach-rockchip/spl.c b/arch/arm/mach-rockchip/spl.c
> index 02c40fb37ed..082a5bfb20a 100644
> --- a/arch/arm/mach-rockchip/spl.c
> +++ b/arch/arm/mach-rockchip/spl.c
> @@ -65,7 +65,7 @@ u32 spl_boot_device(void)
>  	return boot_device;
>  }
>=20
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  	return MMCSD_MODE_RAW;
>  }
> diff --git a/arch/arm/mach-socfpga/spl_a10.c
> b/arch/arm/mach-socfpga/spl_a10.c index b5f43f09d19..c6dcd309bfc
> 100644
> --- a/arch/arm/mach-socfpga/spl_a10.c
> +++ b/arch/arm/mach-socfpga/spl_a10.c
> @@ -94,7 +94,7 @@ u32 spl_boot_device(void)  }
>=20
>  #ifdef CONFIG_SPL_MMC_SUPPORT
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  #if defined(CONFIG_SPL_FS_FAT) || defined(CONFIG_SPL_FS_EXT4)
>  	return MMCSD_MODE_FS;
> diff --git a/arch/arm/mach-socfpga/spl_gen5.c
> b/arch/arm/mach-socfpga/spl_gen5.c
> index 7c716117685..e5d1e64c449 100644
> --- a/arch/arm/mach-socfpga/spl_gen5.c
> +++ b/arch/arm/mach-socfpga/spl_gen5.c
> @@ -53,7 +53,7 @@ u32 spl_boot_device(void)  }
>=20
>  #ifdef CONFIG_SPL_MMC_SUPPORT
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  #if defined(CONFIG_SPL_FS_FAT) || defined(CONFIG_SPL_FS_EXT4)
>  	return MMCSD_MODE_FS;
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index b53659a698a..4c8085b8305 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -53,7 +53,7 @@ u32 spl_boot_device(void)
>  	return BOOT_DEVICE_MMC1;
>  }
>=20
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
>  	return MMCSD_MODE_RAW;
>  }
> diff --git a/arch/arm/mach-uniphier/mmc-boot-mode.c
> b/arch/arm/mach-uniphier/mmc-boot-mode.c
> index e47e5df6480..09cad743c55 100644
> --- a/arch/arm/mach-uniphier/mmc-boot-mode.c
> +++ b/arch/arm/mach-uniphier/mmc-boot-mode.c
> @@ -7,10 +7,8 @@
>  #include <mmc.h>
>  #include <spl.h>
>=20
> -u32 spl_mmc_boot_mode(const u32 boot_device)
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  {
> -	struct mmc *mmc;
> -
>  	/*
>  	 * work around a bug in the Boot ROM of LD4, Pro4, and sLD8:
>  	 *
> @@ -24,7 +22,6 @@ u32 spl_mmc_boot_mode(const u32 boot_device)
>  	 * Fixup mmc->part_config here because it is used to determine the
>  	 * partition which the U-Boot image is read from.
>  	 */
> -	mmc =3D find_mmc_device(0);
>  	mmc->part_config &=3D
> ~EXT_CSD_BOOT_PART_NUM(PART_ACCESS_MASK);
>  	mmc->part_config |=3D EXT_CSD_BOOT_PARTITION_ENABLE;
>=20
> diff --git a/common/spl/spl_mmc.c b/common/spl/spl_mmc.c index
> add2785b4e3..309abaf961a 100644
> --- a/common/spl/spl_mmc.c
> +++ b/common/spl/spl_mmc.c
> @@ -300,7 +300,7 @@ static int spl_mmc_do_fs_boot(struct spl_image_info
> *spl_image, struct mmc *mmc,  }  #endif
>=20
> -u32 __weak spl_mmc_boot_mode(const u32 boot_device)
> +u32 __weak spl_mmc_boot_mode(struct mmc *mmc, const u32
> boot_device)
>  {
>  #if defined(CONFIG_SPL_FS_FAT) || defined(CONFIG_SPL_FS_EXT4)
>  	return MMCSD_MODE_FS;
> @@ -351,7 +351,7 @@ int spl_mmc_load(struct spl_image_info *spl_image,
>  		}
>  	}
>=20
> -	boot_mode =3D spl_mmc_boot_mode(bootdev->boot_device);
> +	boot_mode =3D spl_mmc_boot_mode(mmc, bootdev->boot_device);
>  	err =3D -EINVAL;
>  	switch (boot_mode) {
>  	case MMCSD_MODE_EMMCBOOT:
> diff --git a/include/spl.h b/include/spl.h index cee9a42ddb5..c8f470dd5f2
> 100644
> --- a/include/spl.h
> +++ b/include/spl.h
> @@ -14,6 +14,7 @@
>  #include <asm/global_data.h>
>  #include <asm/spl.h>
>  #include <handoff.h>
> +#include <mmc.h>
>=20
>  struct blk_desc;
>  struct image_header;
> @@ -343,7 +344,7 @@ u32 spl_boot_device(void);
>   * Note:  It is important to use the boot_device parameter instead of e.=
g.
>   * spl_boot_device() as U-Boot is not always loaded from the same device
> as SPL.
>   */
> -u32 spl_mmc_boot_mode(const u32 boot_device);
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device);
>=20
>  /**
>   * spl_mmc_boot_partition() - MMC partition to load U-Boot from.
> --
> 2.17.5

