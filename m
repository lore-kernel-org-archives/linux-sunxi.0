Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67AF2C9A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:06:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C206E5C0105;
	Fri,  5 Nov 2021 23:06:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 05 Nov 2021 23:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	to:cc:references:from:subject:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=+
	xWOdOURL8e+JHXxMEneDCPyipFlFYpi6CTnwSZVNEI=; b=PWw/VgybYhrq1QXbu
	DDkWazKFPj0Z5zQnjQEuzsrCDyax3VGFtKtvS5SObojLGQ+A2ipnjsu950TpOAxp
	zJe/u2aJykS7l9t+yAASrqW3Ton9UUspu6uvBdq3qSSVUNnVO1kF3zJyyo4Ouu+k
	vqRFFjl5rT8BbV+lwfJJTBRqrJG3ut/DUBOBNYm5meuSfvQzC07oSgnsoAPEGFMx
	w4jq+aW3yMnq5AqwNKLnMLf9KNJZDBr/ZLY+sqRVv2qLXY66U9WENhGiP8iVwIWC
	BkG2JPaRxV77/wLINXkiWG29ZR4WBZA1wRigqLBgqyh0BB/xUfjJ8RFPn6LdhIC6
	nXOrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=+xWOdOURL8e+JHXxMEneDCPyipFlFYpi6CTnwSZVN
	EI=; b=FoU4pFC9qEs/pqBSx8OMRhEdxQG5xUZK0E8t34js9UlVc5cO0jFcIoeV2
	I3zuxrs5FYINLy89MIUW0dfnhuONaCKT/+NpUNGzE1XlKIwwO4+VT4376GnMM+EU
	vJt5SsbjF48+g3roMk66K1KV6zGaoQfSwyfMZ2DzmcmeV2B2vjznSO0csnyDx0JL
	pGbSx/8pO+BDJvX8xnOq6EJ28wy0tEoH+I1AK489RvEDlillbJZ93D2X9sW9FoZW
	0tZpTzpAMSr6MeZUg6JgooFT62FbJCMCC6PNK8GlRQQNnLKgGNEBtqES5T5dwism
	jpXD5nWBE1DOsq/CBsJmjkay/Qu8w==
X-ME-Sender: <xms:JfGFYbbM31XB7WTZRBC4HeLvSxbonGEy6UANQ0Cm5yYJvwOFxWam_Q>
    <xme:JfGFYabJ83We1q6LAX98pFmfRhZLc9qPLXJjvhuk5Ms-tkNIhLCMFfo3SpKHopKe8
    3rJu5ptXg4BfofmWA>
X-ME-Received: <xmr:JfGFYd9XYBAGG-YHwbleRy5E4PdPXAKQ5wDFGO9tNst8B2EOcnT6dnec55mUvMrFgC3hm3NyrH0MS92qToBgt7AEW8EcjpRnpme_3OHj_AN2cuGXPYtXx9x75w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeeuhfffgeetgeekjedugeekieffgfejffffjeeltedtuedvgefgheel
    heejveevieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:JfGFYRowbzAOcLC9gC5VPRpMBM8MNNwPlA_MH2NnKQKRMyy5g_GbWQ>
    <xmx:JfGFYWqbyqSrSsikZtafxaeJNxCTH2e64pwL-JgL7Sw3XWsPnI1Bxg>
    <xmx:JfGFYXQEhOQDigiBShUE7chtLWS7y_j8ybOIoDr29Jw11GzFnYxv4w>
    <xmx:JfGFYflwoEKR2xLk6FAIZx4r0urqx5U5kjR-mxifNT_v7ZQS8rKRhQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:06:12 -0400 (EDT)
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-8-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 07/13] sunxi: add support for R329 DRAM controller
Message-ID: <28efdf36-e1a3-6acd-c18e-2d68eca13aaf@sholland.org>
Date: Fri, 5 Nov 2021 22:06:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-8-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> R329 has a new DRAM controller, which looks like a combination of the
> H6/H616 MCTL_COM part and the SUNXI_DW MCTL_CTL part. This design has
> already got reused by Allwinner, and V831/V833 SoCs have similar
> memory controller.
> 
> Add support for it. To prepare for further support of other SoCs,
> routines with socid parameter are added, although not checked now.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

I cannot really review the DRAM init part. But it works, so that's
probably good enough.

Tested-by: Samuel Holland <samuel@sholland.org>

There are a couple of magic values I happen to have an explanation for:

> diff --git a/arch/arm/mach-sunxi/dram_sun50i_r329.c b/arch/arm/mach-sunxi/dram_sun50i_r329.c
> new file mode 100644
> index 0000000000..730883999c
> --- /dev/null
> +++ b/arch/arm/mach-sunxi/dram_sun50i_r329.c
> ...> +unsigned long sunxi_dram_init(void)
> +{
> +	struct sunxi_mctl_com_reg * const mctl_com =
> +			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
> +	struct sunxi_mctl_ctl_reg * const mctl_ctl =
> +			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
> +
> +	struct dram_para para = {
> +		.dual_rank = 0,
> +		.bus_full_width = 1,
> +		.row_bits = 16,
> +		.bank_bits = 3,
> +		.page_size = 8192,
> +
> +		.dx_read_delays  = SUN50I_R329_DX_READ_DELAYS,
> +		.dx_write_delays = SUN50I_R329_DX_WRITE_DELAYS,
> +		.ac_delays	 = SUN50I_R329_AC_DELAYS,
> +	};
> +
> +	/* Unknown magic */
> +	writel(0x10, 0x07010250);

This is VDD_SYS_POWEROFF_GATING_REG, presumably disabling pad hold.

> +	writel(0x330000, 0x07010310);
> +	writel(0x330003, 0x07010310);

This is a resistor calibration process. See here:

https://github.com/smaeul/sun20i_d1_spl/blob/342cb1d8/include/arch/cpu_ncat.h#L172
https://github.com/smaeul/sun20i_d1_spl/blob/342cb1d8/board/sun20iw1p1/clock.c#L186

Some other BSP code has:

#define REG_CALIB_CONTROL_REG           0x0310
#define OHMS200_REG                     0x0314
#define OHMS240_REG                     0x0318
#define REG_CALIB_STATUS_REG            0x031c

So this suggests we are calibrating the termination resistors.

Regards,
Samuel

> +
> +#if defined(CONFIG_MACH_SUN50I_R329)
> +	uint16_t socid = SOCID_R329;
> +#endif
> +
> +	mctl_sys_init(&para);
> +	if (mctl_channel_init(socid, &para))
> +		return 0;
> +
> +	udelay(1);
> +
> +	clrbits_le32(&mctl_ctl->unk_0x0a0, 0xffff);
> +	clrbits_le32(&mctl_ctl->pwrctl, 0x1);
> +
> +	/* HDR/DDR dynamic mode */
> +	clrbits_le32(&mctl_ctl->pgcr[0], 0xf000);
> +
> +	/* power down zq calibration module for power save */
> +	setbits_le32(&mctl_ctl->zqcr, ZQCR_PWRDOWN);
> +
> +	/* DQ hold disable (tpr13[26] == 1) */
> +	clrbits_le32(&mctl_ctl->pgcr[2], (1 << 13));
> +
> +	mctl_auto_detect_dram_size(&para);
> +	mctl_apply_para(&para);
> +
> +	/* enable master access */
> +	writel(0xffffffff, &mctl_com->maer0);
> +	writel(0x7f, &mctl_com->maer1);
> +	writel(0xffff, &mctl_com->maer2);
> +
> +	return (1UL << (para.row_bits + para.bank_bits)) * para.page_size *
> +	       (para.dual_rank ? 2 : 1);
> +}
