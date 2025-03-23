Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A451DE4CE
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742731463; cv=none; b=iXyVJJLBbEaDGPMzmJKsqUNyEk8NWrgmP19l1sICdQASmJr59rjIrzPVpju4mcS+VYt+iZGJI/TREnz5A02LR7X0P8O97u/LoHrmm6OkHUPuD26dKaGDl0n441ExSlghoCPPTMP54D5FfDqecvPTtAgRQsVkuTKuK0iz5aUYLS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742731463; c=relaxed/simple;
	bh=bB+9DdvKuLNDh1/1J3pgGaNrtRX5GZxYQ6aGOU0HbL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmbGkUOEr8lZFvmd3Bfn9giKpcIj3uqB9O9QT6Cl/72hsQ3rx13kq0cJ3iM517CfZAD9Kvp0lU3MEnaFmLbb2Byg/0b5FtZ8WNBaLQazxmb0h8JXGHMqpKGBdQfOHoFbjpoRZYyVHGeppGBmO8XuREp5Z5toXNx2u1ZLvr5JIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqktQnzZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqktQnzZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so28252065e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742731460; x=1743336260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuPw0GZF9a/hUTOvCeLcWoS8zIMbRUHNgnepKPqCXIg=;
        b=lqktQnzZSGNQQnba0k2CymNl4fTiJwSS9TReCwQ/r/Tu8LI/MDmHmNojp1a1yUJshi
         m6E9GRhakt2uZfYhhKukrTfAlBwrfX85DEFHjo7MHAlbflMpSnD2ebeZp3Hyue602Vl2
         aC3/6Gbjq1Y1mcu7d+Rk66w04PYcW32GnuhDNSkl89SDlVCqUBlQqvyv3/g2XWdobiKY
         XYwGfkq7ZCz4GGRviWq7MBZlyJPsWYR4lDJ862HMrAe3dsDC+90RoqMZVljPYpjdWujm
         FXXSQU/dUpV7Q3vIRUGd8LLEhhTnXsENncLvFOXdDd1IPUehFKvAAhML+LgXEEx/2n+A
         RW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742731460; x=1743336260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuPw0GZF9a/hUTOvCeLcWoS8zIMbRUHNgnepKPqCXIg=;
        b=eLqBSkS0e2NZOzkighB8VqfnOfyrzVDarTinBGAqxoblBcsJ27ukmP8JZHnuQEVZlZ
         NZLqAWupggmq1flqOUMjCqWYE2/WR8XLFcSpgllXDvoa+J1TFAE+mRB+z/a83On0VISM
         k9qhkCXBO3zJHY3piCBQlPAMlOJMOPhAz5DCGG8Goi68wgSa+WsR6FRxWI4sxG/KbD3j
         Bhdl+cryhePgjH875QgZdGseLTsOZrX2UhS2v33spv/AVFeV4pUg1Qi6wVVY2GgUSGex
         z2NaLFE8HfwaY5tsXyRWFtULelGNu624ftR90gciQbYbrb9USaaGqllhFt1EcWQxvv3S
         GreA==
X-Forwarded-Encrypted: i=1; AJvYcCVJmtuPuzK9D2ueBLh3WOtdO2rdItXcQuWUKc/lOtny05+zQBmgH3OAQ0YQRyYTrImD/+lI3E6rMrbKEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzudP0hOkuZ3u+H6PFZJc+1WBbjZyAzlxc18+meVvUwyMRFxVZU
	rvrZII2x1b80Fm/UL/OM2bIoveHL/CsZbCC8B2ax16XUnF4j9B2J
X-Gm-Gg: ASbGncuKbUlM1ZNGB891Tzi22bl2r79VmvQo6F3bX32xcXefEr9rJnZb2OihHhHOfbF
	IkOv+chkUPKqbAvoHo0pex9Y72NCuG3BzA5HDVsdEp/Hxb5Ubvm8RXCAIKu00hg/W6EMcJNe56z
	eDFp+GU+lWiKQhsTz5PhvWPPylD8FcxcIwax4ECznJDoe6N6OoI+2VGwSWVPanCjBpCyMi9yoEj
	oaQMui48KZNdgY5zz6tEjkHd0QfHJxETzgMg5b02e/IMgqEugIyJaIODRJ7HZm4IZ4v6tUgRsUw
	WzePUl5cTxRJsqGOY8eXy0FTLfaNXH4X9fY/1Wp0u9UfrE6nlpL1xNo/47phmwei6lTyGMBanRy
	70rLZYMqPNq8vuVDXi5Hu
X-Google-Smtp-Source: AGHT+IHTB7c1iuVCtvgJWJSsaECWnoJL2SKATjVK2xPuEMJCBXsYah2wcJFyy+KPEM2FmmuWYs2YGA==
X-Received: by 2002:a05:6000:186f:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-3997f90101bmr7706646f8f.12.1742731459674;
        Sun, 23 Mar 2025 05:04:19 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm7526788f8f.25.2025.03.23.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:04:19 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Peng Fan <peng.fan@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH 02/34] sunxi: mmc: remove usage of struct sunxi_ccm_reg
Date: Sun, 23 Mar 2025 13:04:18 +0100
Message-ID: <4966638.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250323113544.7933-3-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:12 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner MMC code uses a complex C struct, modelling the clock
> device's register frame. We rely on sharing the member names across all
> Allwinner SoCs, which is fragile.
>=20
> Drop the usage of the struct in the MMC code, by using #define'd
> register names and their offset, and then adding those names to the base
> pointer. This requires to define those offsets for all SoCs, but since we
> only use between four and six clock registers in the MMC code, this is
> easily done.
>=20
> This removes one common user of the clock register struct.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/include/asm/arch-sunxi/clock_sun4i.h |  6 ++++++
>  .../include/asm/arch-sunxi/clock_sun50i_h6.h  |  4 ++++
>  arch/arm/include/asm/arch-sunxi/clock_sun6i.h |  7 +++++++
>  .../include/asm/arch-sunxi/clock_sun8i_a83t.h |  7 +++++++
>  arch/arm/include/asm/arch-sunxi/clock_sun9i.h |  7 +++++++
>  drivers/mmc/sunxi_mmc.c                       | 20 +++++++++----------
>  6 files changed, 41 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h b/arch/arm/inc=
lude/asm/arch-sunxi/clock_sun4i.h
> index 2cec91cb20e..00bdd5f938d 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
> @@ -10,6 +10,12 @@
>  #ifndef _SUNXI_CLOCK_SUN4I_H
>  #define _SUNXI_CLOCK_SUN4I_H
> =20
> +#define CCU_AHB_GATE0		0x60
> +#define CCU_MMC0_CLK_CFG	0x88
> +#define CCU_MMC1_CLK_CFG	0x8c
> +#define CCU_MMC2_CLK_CFG	0x90
> +#define CCU_MMC3_CLK_CFG	0x94
> +
>  struct sunxi_ccm_reg {
>  	u32 pll1_cfg;		/* 0x00 pll1 control */
>  	u32 pll1_tun;		/* 0x04 pll1 tuning */
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm=
/include/asm/arch-sunxi/clock_sun50i_h6.h
> index a485e00f1f3..655f562c2af 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
> @@ -22,6 +22,10 @@
>  #define CCU_H6_APB1_CFG			0x520
>  #define CCU_H6_APB2_CFG			0x524
>  #define CCU_H6_MBUS_CFG			0x540
> +#define CCU_MMC0_CLK_CFG		0x830
> +#define CCU_MMC1_CLK_CFG		0x834
> +#define CCU_MMC2_CLK_CFG		0x838
> +#define CCU_H6_MMC_GATE_RESET		0x84c
>  #define CCU_H6_UART_GATE_RESET		0x90c
>  #define CCU_H6_I2C_GATE_RESET		0x91c
> =20
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun6i.h b/arch/arm/inc=
lude/asm/arch-sunxi/clock_sun6i.h
> index 7fcf340db69..28c3faccbbc 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun6i.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun6i.h
> @@ -10,6 +10,13 @@
>  #ifndef _SUNXI_CLOCK_SUN6I_H
>  #define _SUNXI_CLOCK_SUN6I_H
> =20
> +#define CCU_AHB_GATE0		0x060
> +#define CCU_MMC0_CLK_CFG	0x088
> +#define CCU_MMC1_CLK_CFG	0x08c
> +#define CCU_MMC2_CLK_CFG	0x090
> +#define CCU_MMC3_CLK_CFG	0x094
> +#define CCU_AHB_RESET0_CFG	0x2c0
> +
>  struct sunxi_ccm_reg {
>  	u32 pll1_cfg;		/* 0x00 pll1 control */
>  	u32 reserved0;
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h b/arch/ar=
m/include/asm/arch-sunxi/clock_sun8i_a83t.h
> index 35ca0491ac9..5ad2163926a 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h
> @@ -13,6 +13,13 @@
>  #ifndef _SUNXI_CLOCK_SUN8I_A83T_H
>  #define _SUNXI_CLOCK_SUN8I_A83T_H
> =20
> +#define CCU_AHB_GATE0		0x060
> +#define CCU_MMC0_CLK_CFG	0x088
> +#define CCU_MMC1_CLK_CFG	0x08c
> +#define CCU_MMC2_CLK_CFG	0x090
> +#define CCU_MMC3_CLK_CFG	0x094
> +#define CCU_AHB_RESET0_CFG	0x2c0
> +
>  struct sunxi_ccm_reg {
>  	u32 pll1_c0_cfg;	/* 0x00 c1cpu# pll control */
>  	u32 pll1_c1_cfg;	/* 0x04 c1cpu# pll control */
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun9i.h b/arch/arm/inc=
lude/asm/arch-sunxi/clock_sun9i.h
> index 006f7761fc6..8d696e533f8 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun9i.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun9i.h
> @@ -12,6 +12,13 @@
>  #include <linux/bitops.h>
>  #endif
> =20
> +#define CCU_MMC0_CLK_CFG	0x410
> +#define CCU_MMC1_CLK_CFG	0x414
> +#define CCU_MMC2_CLK_CFG	0x418
> +#define CCU_MMC3_CLK_CFG	0x41c
> +#define CCU_AHB_GATE0		0x580
> +#define CCU_AHB_RESET0_CFG	0x5a0
> +
>  struct sunxi_ccm_reg {
>  	u32 pll1_c0_cfg;	/* 0x00 c0cpu# pll configuration */
>  	u32 pll2_c1_cfg;	/* 0x04 c1cpu# pll configuration */
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 0b56d1405be..432be66c632 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -451,29 +451,29 @@ struct sunxi_mmc_priv mmc_host[4];
>  static int mmc_resource_init(int sdc_no)
>  {
>  	struct sunxi_mmc_priv *priv =3D &mmc_host[sdc_no];
> -	struct sunxi_ccm_reg *ccm =3D (struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
> +	void *ccm =3D (void *)SUNXI_CCM_BASE;
> =20
>  	debug("init mmc %d resource\n", sdc_no);
> =20
>  	switch (sdc_no) {
>  	case 0:
>  		priv->reg =3D (struct sunxi_mmc *)SUNXI_MMC0_BASE;
> -		priv->mclkreg =3D &ccm->sd0_clk_cfg;
> +		priv->mclkreg =3D ccm + CCU_MMC0_CLK_CFG;
>  		break;
>  	case 1:
>  		priv->reg =3D (struct sunxi_mmc *)SUNXI_MMC1_BASE;
> -		priv->mclkreg =3D &ccm->sd1_clk_cfg;
> +		priv->mclkreg =3D ccm + CCU_MMC1_CLK_CFG;
>  		break;
>  #ifdef SUNXI_MMC2_BASE
>  	case 2:
>  		priv->reg =3D (struct sunxi_mmc *)SUNXI_MMC2_BASE;
> -		priv->mclkreg =3D &ccm->sd2_clk_cfg;
> +		priv->mclkreg =3D ccm + CCU_MMC2_CLK_CFG;
>  		break;
>  #endif
>  #ifdef SUNXI_MMC3_BASE
>  	case 3:
>  		priv->reg =3D (struct sunxi_mmc *)SUNXI_MMC3_BASE;
> -		priv->mclkreg =3D &ccm->sd3_clk_cfg;
> +		priv->mclkreg =3D ccm + CCU_MMC3_CLK_CFG;
>  		break;
>  #endif
>  	default:
> @@ -520,7 +520,7 @@ static const struct mmc_ops sunxi_mmc_ops =3D {
> =20
>  struct mmc *sunxi_mmc_init(int sdc_no)
>  {
> -	struct sunxi_ccm_reg *ccm =3D (struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
> +	void *ccm =3D (void *)SUNXI_CCM_BASE;
>  	struct sunxi_mmc_priv *priv =3D &mmc_host[sdc_no];
>  	struct mmc_config *cfg =3D &priv->cfg;
>  	int ret;
> @@ -549,11 +549,11 @@ struct mmc *sunxi_mmc_init(int sdc_no)
>  	/* config ahb clock */
>  	debug("init mmc %d clock and io\n", sdc_no);
>  #if !defined(CONFIG_SUN50I_GEN_H6) && !defined(CONFIG_SUNXI_GEN_NCAT2)
> -	setbits_le32(&ccm->ahb_gate0, 1 << AHB_GATE_OFFSET_MMC(sdc_no));
> +	setbits_le32(ccm + CCU_AHB_GATE0, 1 << AHB_GATE_OFFSET_MMC(sdc_no));
> =20
>  #ifdef CONFIG_SUNXI_GEN_SUN6I
>  	/* unassert reset */
> -	setbits_le32(&ccm->ahb_reset0_cfg, 1 << AHB_RESET_OFFSET_MMC(sdc_no));
> +	setbits_le32(ccm + CCU_AHB_RESET0_CFG, 1 << AHB_RESET_OFFSET_MMC(sdc_no=
));
>  #endif
>  #if defined(CONFIG_MACH_SUN9I)
>  	/* sun9i has a mmc-common module, also set the gate and reset there */
> @@ -561,9 +561,9 @@ struct mmc *sunxi_mmc_init(int sdc_no)
>  	       SUNXI_MMC_COMMON_BASE + 4 * sdc_no);
>  #endif
>  #else /* CONFIG_SUN50I_GEN_H6 */
> -	setbits_le32(&ccm->sd_gate_reset, 1 << sdc_no);
> +	setbits_le32(ccm + CCU_H6_MMC_GATE_RESET, 1 << sdc_no);
>  	/* unassert reset */
> -	setbits_le32(&ccm->sd_gate_reset, 1 << (RESET_SHIFT + sdc_no));
> +	setbits_le32(ccm + CCU_H6_MMC_GATE_RESET, 1 << (RESET_SHIFT + sdc_no));

I guess this is in SPL path, so DT can't be used here? Anyway, can you use
some little more generic macro name? I assume there could be other generati=
ons
which can use same concept.

Best regards,
Jernej

>  #endif
>  	ret =3D mmc_set_mod_clk(priv, 24000000);
>  	if (ret)
>=20




