Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2087.outbound.protection.outlook.com [40.92.40.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836DC173
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jan 2022 16:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTBiSZuXO3kZiOLrgLY2HnzTtGfgzPWAdyaQyTJwn743r3aAY4km6kjLD+BV91c41uBte2o1Ga5e1lgylCk6U+26LlXsNiY+GBp+dv/ifPz4SnOle5bRc4z5IVX6dVaglUuqU2SEMvJ+DmWnAZ/mbEwxGiEmhF11RdeeFbelfmNw8OiTYtsOH5LBIJEXweVw/6+mZduEC/zniLuagR2k6WotI+h+D2rwKBPvI87H3VQX/QFqVz4ruFiI5VRYtXlhE/82Rj5vTP7L7swIKTdM0BLDHg3M1aSOIVi1Ep7x4dv+e92nCqjDOPrIp8qcF+c3lxjPpkBqQ6OevomptxPNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ7ioG6h4wz3Gt3clp7vLX7eEWzYNMAm7BiBjtlAABg=;
 b=QcqaVLrYjUbV+8WCoYoHuYBf9graVR1rBF76kV7QohXVa8zOp7nXF05TGHVZ2audTWApx6542ny/p/RXG7CDbqo8yk5j1LGyfR6U+BYewoMNhwupx7ztqdaPhb6tkyWkyyzGmQ/2Nv4O3N6twZhIL6slsKiiydt+gF606wv7lr0JmObvtvg9NmaXNbU5q2OWfC5eYiOIPcGMJaBH399Tu7HlJwWHHdon8Mi/LUn9I59MWKk14sE77wRmgku9FjnoRh8ns/D8WImoZIvvXQKwfl6fZfvHCzd2d3+lbIjwJRassMttovCE4/KcsubJG8yXu+zj0tHjXb4Q7FnoXHg83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ7ioG6h4wz3Gt3clp7vLX7eEWzYNMAm7BiBjtlAABg=;
 b=Jgcx1yrzip43iDOIOcAHGzT6ZfkfQvKs6QggHUnD+j0H8rWiP+jRRUCsswDfkb/KyKYAuNn8eHeMv/ugd5DwYjXVjxCuCpZwFF0iiGweDZ6nyioNPRScylKulcvj0wjSKjtZCLebEQUxudGDj1nl6GL6BTExZCMhHc2U1iJl41Ig+VXuIwF+kG6zI+e9HzrwIdPkQSHOd9RgBwUlDCDbmCYJlTs7RUZtws0E3O84Hkw8d8fUPsr8B6BRboHgCSjVbFJVm8jFraQHwb5RhgN2ubIr1MSMV4lLyG5jnRThcmgFUyCmKNJF89ml/39XziaJgARcmTvUe/fMlx+uL3o4WQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SN6PR06MB4318.namprd06.prod.outlook.com (2603:10b6:805:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:35:37 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::85e9:40de:68cb:7654]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::85e9:40de:68cb:7654%7]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 16:35:37 +0000
Date: Fri, 21 Jan 2022 10:35:33 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH v2 2/2] sunxi: Add option to prevent booting on power
 plug-in
Message-ID:
 <SN6PR06MB5342B270F3679AC56A297553A55B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220121133732.2397273-1-andre.przywara@arm.com>
 <20220121133732.2397273-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121133732.2397273-3-andre.przywara@arm.com>
X-TMN: [QzWEEUDjIuJZLgNNUVjI57wA184ZYm3E]
X-ClientProxiedBy: SA0PR11CA0163.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::18) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220121163533.GA139@wintermute.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae206730-8bf6-4c83-0d7e-08d9dcfc0db4
X-MS-TrafficTypeDiagnostic: SN6PR06MB4318:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1a9yDTqRHc2P8zcuNghuM/zNJD0wYvO1GVDHO/N6V+jsqIiK8kaSDI+t9q0hv6dxcNTf1Xf5gogcsNASNBAq8RLcpe++SskgKS+LCNo35qWDrb+SFMJSZVVRhBcNSts2o5/6nMir2I0XT4SDp9P30neQ+kZI7upI/ZcrZbxFrh6ak21Q10WEOLdojwzQEQPWR/1JoNFl3o4HDgEc1AZgGtAKaZLAKNpwK8AmZFBxTZVX2G4d05rl2ULG67TvitmGysDuPESm+CID6n9JJHSSyMkR3kxUYm5PsiVdCfZrxR1f7Nwqy1h5vvjtOk8dUNshemjZmw34+EvHU9LKm/2LUr/gsz0CM4cdKgqlLOG+GAmzuy/oIkMnw5WgHynvmSYMGiyN5F8Q/9z8Z+gu35dskm9iNqhoGT5CVMdiHNR2bNfqmAwfHrCnFzEwXRcdx0MCVAvUEVlUr0ctp3NOwQRFnDow/PID2Pupi5gbACRSjJn+i0UwlwzmMlT7Aj+ajLur8esCfV9kqXuUDHUhSHfovW9wkDDOgkf4TZYQ4vKzAtEO6IHOZKKFGFeMwXJpcjSprNjMs+GjCX4tBO2Z1NxkAw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/95lR4uS7/EPGwDPuJnc/8VHyi5Kg60lexb7eqrqUzWqYtflGUirsclx19Cx?=
 =?us-ascii?Q?Y3vnfItdKqSsy0+g2T2pI/Gf7S7OunkWudHEbbVVv6mFe72UKX7sBkJNuoTh?=
 =?us-ascii?Q?e1Fd1O+QeFmg9amDtB5VmX6V3qRHc5mFSJeocT11VuaHyU4FFsdlVfQOX4G7?=
 =?us-ascii?Q?Euo4+UvHGOlLi7r5x0d07oGEvVpIJSNSFEKLYuu8/Hbg/S71nsmo7dlgkoJB?=
 =?us-ascii?Q?zwUEeGs0ql2yPvnw0LWC/EsljdTbAPh9rPKDw9byYrMK6tXef9aa6gGrQq1L?=
 =?us-ascii?Q?0HQvQrmZ++kSfLtaG1ceQbAAQamos6r7FKDLXkXdp5nTd3oxGLZ34Nu5i+Oc?=
 =?us-ascii?Q?O80N4R6YIONUPR0PhV0vkz6ukxZKnJshWn5xuAv3qNFEBaXK2nr9fYhiipxR?=
 =?us-ascii?Q?Q7XTwZiGWEOQ+A79dynzAnwlcjIWG2rRz4dqMCCedic7VhxFMNztC1WqEqPE?=
 =?us-ascii?Q?dYftBwy3sqg8R4v5ZOygIIJEzu7Unp9psGJLZLgA/hrEnG7i7MC2uuGuIPQN?=
 =?us-ascii?Q?P2Qi84CEnzP0lLxC0is1VevXMvcFl47evdz6whfCHeiFmG1X/rnPq4uQYW13?=
 =?us-ascii?Q?GdMiHYiUll1djmzlmY82l6JGPGpJbfi/uMCQJX5nSNIf8NoLo7uybG/59GgA?=
 =?us-ascii?Q?YyJnNVAoDBeztGjzUKmy2iH9vkzCzGJbqJLeJy+CBYSRDr/RRDmcJzW8H+WF?=
 =?us-ascii?Q?Kl8zMJh2Rhgu1Dq67tyie1kfnRIG4Ho7sQM7OUUFwSBLQpgCp1d11cVW7yDm?=
 =?us-ascii?Q?6Q+kQudl9zjVKniMIgHROcgBwwJrOcEQA+zaRHi2n+lb3K5OS1j/E/XmEwSr?=
 =?us-ascii?Q?VxZVna5dShaRchKhmrrJOgsZlzrBFK+0BFdsnpMx8GKRYjOp0LtnAuPpBvXu?=
 =?us-ascii?Q?9Ie9F8BNXzZyY1uNuCiN87uOWuxLwul4WFF+5CMSFWdAkSTfcqH/x9TpEOHv?=
 =?us-ascii?Q?6mAaoqobBfOTgQb8DziWfw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ae206730-8bf6-4c83-0d7e-08d9dcfc0db4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:35:37.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR06MB4318

On Fri, Jan 21, 2022 at 01:37:32PM +0000, Andre Przywara wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> For sunxi boards with the AXP209, AXP221, AXP809, and AXP818 PMICs
> (plus possibly others, I only confirmed the datasheets for these),
> it is sometimes desirable to not boot whenever the device is
> plugged in. An example would be when using the NTC CHIP inside a
> PocketCHIP.
> This provides a configurable option to check if bit 0 of
> register 0 of the PMIC says it was powered because of a power button
> press (0) or a plug-in event (1). If the value is 1 and this option
> is selected, the device shuts down shortly after printing a message
> to console stating the reason why it's shutting down. Powering up the
> board with the power button is not affected.

Tested-By: Chris Morgan <macromorgan@hotmail.com>

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> [Andre: reword to speak of boot, remove #ifdefs]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> adapt board.c to generic AXP symbols
> ---
>  arch/arm/mach-sunxi/Kconfig | 10 ++++++++++
>  board/sunxi/board.c         | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 2c18cf02d1..d7f9a03152 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -785,6 +785,16 @@ config AXP_GPIO
>  	---help---
>  	Say Y here to enable support for the gpio pins of the axp PMIC ICs.
>  
> +config AXP_DISABLE_BOOT_ON_POWERON
> +	bool "Disable device boot on power plug-in"
> +	depends on AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER
> +	default n
> +	---help---
> +	  Say Y here to prevent the device from booting up because of a plug-in
> +	  event. When set, the device will boot into the SPL briefly to
> +	  determine why it was powered on, and if it was determined because of
> +	  a plug-in event instead of a button press event it will shut back off.
> +
>  config VIDEO_SUNXI
>  	bool "Enable graphical uboot console on HDMI, LCD or VGA"
>  	depends on !MACH_SUN8I_A83T
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index fdbcd40269..3b5e7f3cdc 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -27,6 +27,7 @@
>  #include <asm/arch/dram.h>
>  #include <asm/arch/mmc.h>
>  #include <asm/arch/prcm.h>
> +#include <asm/arch/pmic_bus.h>
>  #include <asm/arch/spl.h>
>  #include <asm/global_data.h>
>  #include <linux/delay.h>
> @@ -601,6 +602,16 @@ void sunxi_board_init(void)
>  	defined CONFIG_AXP809_POWER || defined CONFIG_AXP818_POWER
>  	power_failed = axp_init();
>  
> +	if (IS_ENABLED(AXP_DISABLE_BOOT_ON_POWERON) && !power_failed) {

This doesn't work for me unless I change this to
IS_ENABLED(CONFIG_AXP_DISABLE_BOOT_ON_POWERON)

With this change though, it works just fine on my use case.

> +		u8 boot_reason;
> +
> +		pmic_bus_read(AXP_POWER_STATUS, &boot_reason);
> +		if (boot_reason & AXP_POWER_STATUS_ALDO_IN) {
> +			printf("Power on by plug-in, shutting down.\n");
> +			pmic_bus_write(0x32, BIT(7));
> +		}
> +	}
> +
>  #if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
>  	defined CONFIG_AXP818_POWER
>  	power_failed |= axp_set_dcdc1(CONFIG_AXP_DCDC1_VOLT);
> -- 
> 2.25.1
> 
