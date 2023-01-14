Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018A320D
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Jan 2023 20:34:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7CDBB5C00D2;
	Sat, 14 Jan 2023 15:34:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 14 Jan 2023 15:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673728478; x=
	1673814878; bh=/TAb0XYfpnr++FGUez2OWtEKJs8N1wIgIoxQeLVYD1M=; b=D
	UrGWrPcLxhl8mqfqrBocf92LL/FmbvKRGMM9pfD4t9A93p1wf2/hheCH9pdcwJ4F
	ok+xIeX83EywTY+Kcsf6DRVJHb7zd5cpJhbgRmKkwQZaZV8+39QvkPc+HMo/ZFVM
	629pobkR7KGDY+zFzPff84q0KCGybYZbSpFklCFZ6SlNguWufCKc51KPHNC4BFh2
	BWVIjrx/ZCdYRBD3z2P/LopUL2oW/ZH5OpGOWqFZp8430uz20WzXriDg1jmdy9h8
	4s7X33YmI2fF2p6RRrfMaCeTFMVECsBhydazOMh6NEGkzBaMKnG3nApRhlOwf7/o
	Msg9pDwPsFWBxreKPPXqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673728478; x=
	1673814878; bh=/TAb0XYfpnr++FGUez2OWtEKJs8N1wIgIoxQeLVYD1M=; b=P
	tKcysFd3UG3nMuy8NVxwdAWhSeZBSyFG0ZkkvT3OThiV5KJj/H2HPzCGsWnVJzGJ
	LebFadFtOBVBQWNv8F2y5lI0ay76pRoYt/1yWJ9bQK35dqdy5mTCXog1uiTd5wVC
	EZQ/x5n6T3GV1DrurIxR/EUcpKH+tUeM4fP+EVdJ5gvjLn5dtEo4NvqupWCqZs1C
	gDe41R2CY1G0EwkSLVL7wDDjHpxkQmgMYnAClZU0mAq0SAXGI9zWgl9TvExfxqIC
	ob1j+Yn1oOY7kfI6vaNCXrtLP9fMo2cfhwtH7ByDBa7uU1O0yxleqx2h/JeDc97s
	hwAGcZ+Hz4sO5reA0fHpw==
X-ME-Sender: <xms:3hHDY7rp-HVk552wjR-cyyqZeGvF5aGUFM1BWDaXUe2Hnjvp80F54Q>
    <xme:3hHDY1q8ZujgNAPebISs_GhDsBigWaMMBv_QfJYLzYzHbGSWcI7sYjIVgADh0yaHA
    v93FXPuc5TO0y2-cg>
X-ME-Received: <xmr:3hHDY4NmT-flG3hULRedbh5SVEjaFEdt47HvRpo1M30xkd6qPv2KnUuoh_OX11n9CkIHszkb8A7V5Q6WGOSO82qSHTWp5P3XxPsONuqnjSpX3gBJSIiGkjWa5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:3hHDY-7DjzKOFad8o5BiNKevBXxOwT-t6Lc5Yzm5DaAniFJp_zCqDg>
    <xmx:3hHDY64E6vA0Sxqk1kGIi0lJXIzfRn-H_Ge1pfh5gBRHRZmBFjcAwA>
    <xmx:3hHDY2juJonOkNLid19AnZLr2cYdd_0JiIadxSGpA2gpWf-DKccD5g>
    <xmx:3hHDY6G5A-NxBwd2fo6IO4_kgWE-vtz1d_dW4IjiG6lroj8QmCqHyw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 15:34:37 -0500 (EST)
Message-ID: <5402eef2-6e4e-c2d4-2646-0ae3334bf6c3@sholland.org>
Date: Sat, 14 Jan 2023 14:34:38 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] sunxi: eMMC: support TOC0 on boot partitions
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20230105015818.19053-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230105015818.19053-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 1/4/23 19:58, Andre Przywara wrote:
> To determine whether we have been booted from an eMMC boot partition, we
> replay some of the checks that the BROM must have done to successfully
> load the SPL. This involves a checksum check, which currently relies on
> the SPL being wrapped in an "eGON" header.
> 
> If a board has secure boot enabled, the BROM will only accept the "TOC0"
> format, which is internally very different, but uses the same
> checksumming algorithm. Actually the only difference for calculating the
> checksum is that the size of the SPL is stored at a different offset.
> 
> Do a header check to determine whether we deal with an eGON or TOC0
> format, then set the SPL size accordingly. The rest of the code is
> unchanged.
> 
> This fixes booting from an eMMC boot partition on devices with secure
> boot enabled, like the Remix Mini PC.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/board.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index 0c4b6dd1ca3..a90c88210cd 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -365,6 +365,7 @@ static bool sunxi_valid_emmc_boot(struct mmc *mmc)
>  	struct blk_desc *bd = mmc_get_blk_desc(mmc);
>  	u32 *buffer = (void *)(uintptr_t)CONFIG_TEXT_BASE;
>  	struct boot_file_head *egon_head = (void *)buffer;
> +	struct toc0_main_info *toc0_info = (void *)buffer;
>  	int bootpart = EXT_CSD_EXTRACT_BOOT_PART(mmc->part_config);
>  	uint32_t spl_size, emmc_checksum, chksum = 0;
>  	ulong count;
> @@ -391,11 +392,17 @@ static bool sunxi_valid_emmc_boot(struct mmc *mmc)
>  
>  	/* Read the first block to do some sanity checks on the eGON header. */
>  	count = blk_dread(bd, 0, 1, buffer);
> -	if (count != 1 || !sunxi_egon_valid(egon_head))
> +	if (count != 1)
> +		return false;
> +
> +	if (sunxi_egon_valid(egon_head))
> +		spl_size = buffer[4];
> +	else if (sunxi_toc0_valid(toc0_info))
> +		spl_size = buffer[7];

Please dereference the appropriate structure member here instead of
indexing the buffer.

Regards,
Samuel

> +	else
>  		return false;
>  
>  	/* Read the rest of the SPL now we know it's halfway sane. */
> -	spl_size = buffer[4];
>  	count = blk_dread(bd, 1, DIV_ROUND_UP(spl_size, bd->blksz) - 1,
>  			  buffer + bd->blksz / 4);
>  

