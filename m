Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27C168
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 11:04:11 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210712105617epoutp015d0bc206b3489fb0a6fe32748369534a~RBdq9qe7V0750607506epoutp01K
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 10:56:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210712105617epoutp015d0bc206b3489fb0a6fe32748369534a~RBdq9qe7V0750607506epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1626087377;
	bh=gN+eaqDCL5ANZkd6OIMqAWXnGHG0uVroZbgv8hhPasE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=HInhOYepQkMv7xQjioT4u6+MiAu79qOeq91LZRcGlx2cLTKZ7mdeNJmWSJcKjHMzG
	 SXE7EHSaKv84XiJaVCrUKyGCJsjzYhX7fseK00r0VchpcnVzGX1W7sozc0UC1rv5s5
	 z0jd4N+i2v4IMd0vYI1C3Jj8Y3HcrxyYwmjMOH+g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20210712105617epcas1p4ab24e3640fa667f8f323eefb9b12707c~RBdqkKzg31267912679epcas1p4b;
	Mon, 12 Jul 2021 10:56:17 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.155]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4GNgg01NhBz4x9Q2; Mon, 12 Jul
	2021 10:56:12 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	AF.29.09551.BCF1CE06; Mon, 12 Jul 2021 19:56:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20210712105611epcas1p45cd482c56d6a99c43df1e27abf15efd3~RBdlTbzdW1267912679epcas1p4K;
	Mon, 12 Jul 2021 10:56:11 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20210712105611epsmtrp1aebe79de94abe1ff7021fff2ff8ea2eb~RBdlSncIX3211332113epsmtrp1d;
	Mon, 12 Jul 2021 10:56:11 +0000 (GMT)
X-AuditID: b6c32a36-2b3ff7000000254f-8a-60ec1fcb5200
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	29.33.08289.BCF1CE06; Mon, 12 Jul 2021 19:56:11 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20210712105611epsmtip13427707405610df5c07d447567a9b11b~RBdk-8RIF1156911569epsmtip1M;
	Mon, 12 Jul 2021 10:56:11 +0000 (GMT)
Subject: Re: [RESEND PATCH v2 2/3] sunxi: eMMC: Improve automatic boot
 source detection
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	<jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Sunil Mohan
	Adapa <sunil@medhas.org>, linux-sunxi@lists.linux.dev, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <881f4ae3-a635-29d2-1549-8a27b8781f37@samsung.com>
Date: Mon, 12 Jul 2021 19:57:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210712100651.6912-3-andre.przywara@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmru4Z+TcJBq2vGS1WzPvJaPF54T0m
	iy+bJrBZPJ+/jtFiyr5dQNajTjaLHyduMFq83dvJ7sDhsfbjfVaPxT//MXmsmbeG0WPnrLvs
	Hmfv7GD0eLF5JqPH+4nzWD1efZ3LGMARlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhr
	aGlhrqSQl5ibaqvk4hOg65aZA3SbkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafA
	skCvODG3uDQvXS85P9fK0MDAyBSoMCE749a9N2wF59QrzpycwtbA2CbfxcjJISFgIjH7wn/W
	LkYuDiGBHYwS79auZYZwPjFKrPt9HirzmVGif+MqVpiWjfu2MEEkdjFKtG1shap6zyhx7/Nq
	RpAqYYFIibN9D4CqODhEBMIknlwqAqlhFrjIKNHTfYYZpIZNQEdi+7fjTCA2r4CdxKSDL9hB
	bBYBVYnJE/aC2aJAc87vXsACUSMocXLmEzCbU8Ba4ty1T2A2s4C4xK0n85kgbHmJ7W/ngP0g
	IbCSQ6Lx0nSos10knr2/CWULS7w6voUdwpaSeNnfBmVXS+xqPgPV3MEocWtbExNEwlhi/9LJ
	YN8wC2hKrN+lDxFWlNj5ey4jxGI+iXdfe1hBSiQEeCU62oQgSlQkLr1+yQSz6u6T/1AlHhKv
	7vNOYFScheSzWUi+mYXkm1kIexcwsqxiFEstKM5NTy02LDBCju1NjOB0q2W2g3HS2w96hxiZ
	OBgPMUpwMCuJ8H7rfZUgxJuSWFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OBCT+vJN7Q1MjY2NjC
	xNDM1NBQSZx3J9uhBCGB9MSS1OzU1ILUIpg+Jg5OqQYmltIVL1VMfuZzdq53Xp5yd2bKfPl/
	lpvfPJbpSz26qDAuPGnC9qscO2YbpGwIayjVqQ74v3f67yJf/7cBnpO+XPt5wGr/QZm0j2xb
	LHnWrjh/+94sn08TsqLudXK+Xiu1ZdM2julub2W2RyVeKorj5DTcUfO/iZ9F/2hd3ew9Z2v0
	Tk+MaH/dd3vZ48J+58d+vQXO59kCbQM7H85JCHh4J7WlVD/Ya6PDknubuz9+jd9u5/vQqy9o
	X9nJ73O4Aw8YMOluvPqB00zketCRQ7t1PikoCt84dn2d7+tdD90Y1B23WZ79NHG/DMvlaVuu
	LI0+8ex+aktW8ocz1keX3nL97Ls58bXoJp5vul+rCzcqRyqxFGckGmoxFxUnAgCVIG39QAQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTve0/JsEgxcfeC1WzPvJaPF54T0m
	iy+bJrBZPJ+/jtFiyr5dQNajTjaLHyduMFq83dvJ7sDhsfbjfVaPxT//MXmsmbeG0WPnrLvs
	Hmfv7GD0eLF5JqPH+4nzWD1efZ3LGMARxWWTkpqTWZZapG+XwJVx694btoJz6hVnTk5ha2Bs
	k+9i5OSQEDCR2LhvC1MXIxeHkMAORonf71+xQySkJD4/ncrWxcgBZAtLHD5cDFHzllHizd7F
	LCA1wgKREmsOXAOrFxEIk5g8aRILSBGzwGWgoq53LBAd+xklehatYASpYhPQkdj+7TgTiM0r
	YCcx6eALsG4WAVWJyRP2gtmiQFM/L3jFClEjKHFy5hOwbZwC1hLnrn0Cs5kF1CX+zLvEDGGL
	S9x6Mp8JwpaX2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OL
	S/PS9ZLzczcxgmNMS2sH455VH/QOMTJxMB5ilOBgVhLh/db7KkGINyWxsiq1KD++qDQntfgQ
	ozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGplYm9c1cNvcmJ84xXHIjW3TtAa6yx2Fb
	fGo2pZ7YnBNbXOlZd4O3N3Tji91m9S4zFux0S+hvL494cFWiw7NmBY/xo8z5RkErvjoerFOy
	u/TYy2BR2YLz/q0N21Y+fPYtQ/5SjqfEqaa8D82TL8Vf/rXMmv2SFRuf297+Qu/jnL28zT3+
	+9eahSyW9TpnvlP62BWzjONx+sWCUvOWOvXuKr2UvXTyv+JJn3bfdJPYo79ZlOFbGqNza3je
	4vqX/+dfqTho6n17b4zbisUy+mZuO1p32rCUx71/+GzJyjjDm6u8rQx1pitvcrJfeqEmyzB1
	YXZokswsCRn2JX0Lva2t+3VeTdlZdlxzWuRrSYNgJZbijERDLeai4kQAiQygOyADAAA=
X-CMS-MailID: 20210712105611epcas1p45cd482c56d6a99c43df1e27abf15efd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210712100805epcas1p20992d4369e127fe979bd6003d938abcd
References: <20210712100651.6912-1-andre.przywara@arm.com>
	<CGME20210712100805epcas1p20992d4369e127fe979bd6003d938abcd@epcas1p2.samsung.com>
	<20210712100651.6912-3-andre.przywara@arm.com>

Hi Andre,

On 7/12/21 7:06 PM, Andre Przywara wrote:
> When the Allwinner BROM loads the SPL from an eMMC boot partition, it
> sets the boot source byte to the same value as when booting from the
> user data partition. This prevents us from determining the boot source
> to load U-Boot proper from the proper partition for sure.
> 
> The generic SPL MMC code already looks at the enabled boot partition
> number, to load U-Boot proper from the same partition, but this fails
> if there is nothing bootable in this partition, as the BROM then
> silently falls back to the user data partition, which the SPL misses.
> 
> To learn about the actual boot source anyway, we repeat the algorithm
> the BROM used to select the boot partition in the first place:
> - Test EXT_CSD[179] to check if an eMMC boot partition is enabled.
> - Test EXT_CSD[177] to check for valid MMC interface settings.
> - Check if BOOT_ACK is enabled.
> - Check the beginning of the first sector for a valid eGON signature.
> - Load the whole SPL.
> - Recalculate the checksum to verify the SPL is valid.
> 
> If one of those steps fails, we bail out and continue loading from the
> user data partition. Otherwise we load from the selected boot partition.
> 
> Since the boot source is needed twice in the boot process, we cache the
> result of this test to avoid doing this costly test multiple times.
> 
> This allows the very same image file to be put onto an SD card, into the
> eMMC user data partition or into the eMMC boot partition, and safely
> loads the whole of U-Boot from there.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> 
> (resent to also include forgotten U-Boot list)
> 
>  arch/arm/mach-sunxi/board.c | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index e979e426dd1..2552c34733b 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -334,6 +334,86 @@ u32 spl_boot_device(void)
>  	return sunxi_get_boot_device();
>  }
>  
> +/*
> + * When booting from an eMMC boot partition, the SPL puts the same boot
> + * source code into SRAM A1 as when loading the SPL from the normal
> + * eMMC user data partition: 0x2. So to know where we have been loaded
> + * from, we repeat the BROM algorithm here: checking for a valid eGON boot
> + * image at offset 0 of a (potentially) selected boot partition.
> + * If any of the conditions is not met, it must have been the eMMC user
> + * data partition.
> + */
> +static bool sunxi_valid_emmc_boot(struct mmc *mmc)
> +{
> +	struct blk_desc *bd = mmc_get_blk_desc(mmc);
> +	uint32_t *buffer = (void *)(uintptr_t)CONFIG_SYS_TEXT_BASE;
> +	int bootpart = EXT_CSD_EXTRACT_BOOT_PART(mmc->part_config);
> +	uint32_t spl_size, emmc_checksum, chksum = 0;
> +	ulong count;
> +
> +	/* The BROM requires BOOT_ACK to be enabled. */
> +	if (!EXT_CSD_EXTRACT_BOOT_ACK(mmc->part_config))
> +		return false;
> +
> +	/*
> +	 * The BOOT_BUS_CONDITION register must be 4-bit SDR, with (0x09)
> +	 * or without (0x01) high speed timings.
> +	 */
> +	if ((mmc->ext_csd[EXT_CSD_BOOT_BUS_WIDTH] & 0x1b) != 0x01 &&
> +	    (mmc->ext_csd[EXT_CSD_BOOT_BUS_WIDTH] & 0x1b) != 0x09)
> +		return false;
> +
> +	/* Partition 0 is the user data partition, bootpart must be 1 or 2. */
> +	if (bootpart != 1 && bootpart != 2)
> +		return false;
> +
> +	mmc_switch_part(mmc, bootpart);

It can be failed to switch to bootpart. Doesn't need to control error?

Best Regards,
Jaehoon Chung

> +
> +	/* Read the first block to do some sanity checks on the eGON header. */
> +	count = blk_dread(bd, 0, 1, buffer);
> +	if (count != 1 || !is_boot0_magic(buffer + 1))
> +		return false;
> +
> +	/* Read the rest of the SPL now we know it's halfway sane. */
> +	spl_size = buffer[4];
> +	count = blk_dread(bd, 1, DIV_ROUND_UP(spl_size, bd->blksz) - 1,
> +			  buffer + bd->blksz / 4);
> +
> +	/* Save the checksum and replace it with the "stamp value". */
> +	emmc_checksum = buffer[3];
> +	buffer[3] = 0x5f0a6c39;
> +
> +	/* The checksum is a simple ignore-carry addition of all words. */
> +	for (count = 0; count < spl_size / 4; count++)
> +		chksum += buffer[count];
> +
> +	debug("eMMC boot part SPL checksum: stored: 0x%08x, computed: 0x%08x\n",
> +	       emmc_checksum, chksum);
> +
> +	return emmc_checksum == chksum;
> +}
> +
> +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
> +{
> +	static u32 result = ~0;
> +
> +	if (result != ~0)
> +		return result;
> +
> +	result = MMCSD_MODE_RAW;
> +	if (!IS_SD(mmc) && IS_ENABLED(CONFIG_SUPPORT_EMMC_BOOT)) {
> +		if (sunxi_valid_emmc_boot(mmc))
> +			result = MMCSD_MODE_EMMCBOOT;
> +		else
> +			mmc_switch_part(mmc, 0);
> +	}
> +
> +	debug("%s(): %s part\n", __func__,
> +	      result == MMCSD_MODE_RAW ? "user" : "boot");
> +
> +	return result;
> +}
> +
>  void board_init_f(ulong dummy)
>  {
>  	spl_init();
> 

