Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27297647
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742733376; cv=none; b=P8j9Jsks/CXEEjccd+8tWC55yij/3U/NZlGAYL4VD06YQc2MM6XT+P/TJkB7EsROlQdjUuV4B7LpaQYOEYngpQydAwOuobnzYI+w/PVSXNlARHYAY+7O0r9QroT2kBwfwOtPKOvnD3fQBrOnPlYay/JIuqcp8dBS6Vwf/dga1as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742733376; c=relaxed/simple;
	bh=e0d6Bt7PVClJNbT53icGwrfsWgmFie/DI/4TF/xa4rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGDHRqneXAMzzKGo5yhiBl8i2F8gLdX9r3fB3NGYu0Ly6nCJCFSyqsCQXOj/4B+twN8HW/UBiKlcyiAK+U3y3EaWf3oEuKGc83q2hSldIRf8EP3CScTVzBBxYShCckbK77k9m8gAenVKdDwWYCtGw2Usz89uKiYGjoaWg8PkxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJPvYo5B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJPvYo5B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912baafc58so2739906f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742733372; x=1743338172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vluZQCg22suxtk4J5+a77FJ5djPbExqa1KlvC0fNA6U=;
        b=GJPvYo5BrAXZU4F255nYweZoawYk3ctQkdtKyNT15gCWWoCKRF/5TEDiv/DOtrlPM/
         OBIoJb0Jx73ICvmfRYESmGr5jRZDt17cVqEE2Rm81UT6wZ2PBSm0ObblpJaVXG71viAU
         Xdk8tAA0RlFRZtgfVfl0c6SRvXO4njHMKU1sZ56q2p9/lad29oAPTu4vtDy+STn050mB
         sJ4iM8/9MJGKFFhgduXj97SQOS55pTRliJFKjiTGa1vOzsqTckC+JT2pSBMmi8ZfPk86
         cHgk1LXd0tqrpQcTwfZGd5L4CpXX0Ar8gmztKXMna0lMpgdJxBFxzPRVc91H8F9ZOk1d
         Yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742733372; x=1743338172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vluZQCg22suxtk4J5+a77FJ5djPbExqa1KlvC0fNA6U=;
        b=sf5JJqY4eAHaHTw/dwvAs+v3mh+I2RwB1OyTG36AQTgy3+orKpTxDHbLqmFb6LGWCn
         JR31fqW0ENCZEXiz6U3F++psSocXDn9bmPWFM94QKGHnFBtuYmNR0lRhbH276CsQZyl3
         cfTz1Zs7xXay4/NeqBrEwOSVtWTZjgKdbGtwAxU4rxGIFtDAW/hUjv05ORkFEh5ifM6L
         h0e7FLh1P+apONR82k4jVOvmtRivNcaieKnHb3ioBMQUp7WV60eXt60lLPsXene5Xi66
         A3J81Ws0gxIU3LNvxVsXK5mW8Q5Ff/iBMIDJGxQh9pZFIfJ0xwMJ7uzmA4+XROM3BJEB
         CWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmIjpZ83r8xpzYsv3OZbApSMou+nOsQdjWKmHyMUzZMn3YYF5kF5nnbHVk9DeA211G2pfYhgvP7hwNRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YydacNyd8H8zbhS5c0F8p3abYnvGvzl2q54FJ6zUK4kMxljVDgu
	ZuM1DrTrGKxvLDY4OAP8o2SpaMTSxJktZtCxEvzWliEjIVyd9s0g
X-Gm-Gg: ASbGncutk4Bf4+9Mhe/mDf5xzL0I5X/dgyuinPJhmfjxK8FcRKVUHReu8Fdcme+wwse
	NSu9Rue27jXzlwV4l6X6ff+cFzd0Zl5nfot50prsCHIVKWrkDPSrcV+yMb1e8v+vMToIK8VZqbH
	XYDKHJkgRvKcQfxfuC6If9HvL1iha04yHhjcbnXNBhciz65r55hHBWDMzxvfbcJNabnKz66CbpR
	eHT30gRyA/m0U/iEwmCX+fLggy69HeTHC52pBb/PQK56NuTAAZT+IOx2VqFiWnHzF++dQ/91fVz
	NiLTH/aaReQVPhuqKtqLN7EsedTE1MNkVMCUwqpXhYG3DuNNtOgA/HTJauZtMEqkK3SrgS2/ALV
	2y1cqhQOt2NDeLzqqD8AC
X-Google-Smtp-Source: AGHT+IGzu0u9INcDCXRj6WVqL7VkKmNQtvbWOeXlmsEibdwfDTH1ozisOlERmSNr0B85bB7wARjAQA==
X-Received: by 2002:a05:6000:186b:b0:391:4684:dbdb with SMTP id ffacd0b85a97d-3997f9039ecmr7813444f8f.17.1742733372165;
        Sun, 23 Mar 2025 05:36:12 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efc90sm7763650f8f.98.2025.03.23.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:36:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 29/34] sunxi: sun50i_h6: add A523 SPL clock setup code
Date: Sun, 23 Mar 2025 13:36:11 +0100
Message-ID: <3536548.QJadu78ljV@jernej-laptop>
In-Reply-To: <20250323113544.7933-30-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-30-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:39 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>

I'm sure you can take credit for this as it's just making definitions and
putting them in place. But I can also provide SoB if you want.

>=20
> ---
>  .../include/asm/arch-sunxi/clock_sun50i_h6.h  | 10 ++++++
>  arch/arm/mach-sunxi/clock_sun50i_h6.c         | 32 ++++++++++++++-----
>  2 files changed, 34 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm=
/include/asm/arch-sunxi/clock_sun50i_h6.h
> index c95f2b39e64..d251ed49798 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
> @@ -101,6 +101,13 @@
>  #define CCM_PLL6_DEFAULT		0xe8216300
>  #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
>  #define CCM_APB1_DEFAULT		0x03000102
> +
> +#elif CONFIG_MACH_SUN55I_A523				/* A523 */
> +
> +#define CCM_PLL6_DEFAULT		0xe8116310	    /* 1200 MHz */
> +#define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002	    /* 200 MHz */
> +#define CCM_APB1_DEFAULT		0x03000005	    /* APB0 really */
> +#define CCM_APB2_DEFAULT		0x03000005	    /* APB1 really */
>  #endif
> =20
>  /* apb2 bit field */
> @@ -120,6 +127,7 @@
>  /* MBUS clock bit field */
>  #define MBUS_ENABLE			BIT(31)
>  #define MBUS_RESET			BIT(30)
> +#define MBUS_UPDATE			BIT(27)
>  #define MBUS_CLK_SRC_MASK		GENMASK(25, 24)
>  #define MBUS_CLK_SRC_OSCM24		(0 << 24)
>  #define MBUS_CLK_SRC_PLL6X2		(1 << 24)
> @@ -132,10 +140,12 @@
>  #define GATE_SHIFT			(0)
> =20
>  /* DRAM clock bit field */
> +#define DRAM_CLK_ENABLE			BIT(31)
>  #define DRAM_MOD_RESET			BIT(30)
>  #define DRAM_CLK_UPDATE			BIT(27)
>  #define DRAM_CLK_SRC_MASK		GENMASK(25, 24)
>  #define DRAM_CLK_SRC_PLL5		(0 << 24)
> +#define DRAM_CLK_M_MASK			(0x1f)
>  #define DRAM_CLK_M(m)			(((m)-1) << 0)
> =20
>  /* MMC clock bit field */
> diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/=
clock_sun50i_h6.c
> index f76d1b83883..2ba144a6ac3 100644
> --- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
> @@ -14,15 +14,22 @@ void clock_init_safe(void)
>  	void *const ccm =3D (void *)SUNXI_CCM_BASE;
>  	void *const prcm =3D (void *)SUNXI_PRCM_BASE;
> =20
> -	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616)) {
> -		/* this seems to enable PLLs on H616 */
> +	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
>  		setbits_le32(prcm + CCU_PRCM_SYS_PWROFF_GATING, 0x10);
> +	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
> +		setbits_le32(prcm + CCU_PRCM_SYS_PWROFF_GATING, 0x200);
> +	udelay(1);
> +
> +	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
> +	    IS_ENABLED(CONFIG_MACH_SUN55I_A523))
>  		setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 2);
> -	}
> +	udelay(1);
> =20
>  	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
> -	    IS_ENABLED(CONFIG_MACH_SUN50I_H6)) {
> +	    IS_ENABLED(CONFIG_MACH_SUN50I_H6) ||
> +	    IS_ENABLED(CONFIG_MACH_SUN55I_A523)) {
>  		clrbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 1);
> +		udelay(1);
>  		setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 1);
>  	}
> =20
> @@ -39,9 +46,10 @@ void clock_init_safe(void)
>  	while (!(readl(ccm + CCU_H6_PLL6_CFG) & CCM_PLL_LOCK))
>  		;
> =20
> -	clrsetbits_le32(ccm + CCU_H6_CPU_AXI_CFG,
> -			CCM_CPU_AXI_APB_MASK | CCM_CPU_AXI_AXI_MASK,
> -			CCM_CPU_AXI_DEFAULT_FACTORS);
> +	if (!IS_ENABLED(CONFIG_MACH_SUN55I_A523))
> +		clrsetbits_le32(ccm + CCU_H6_CPU_AXI_CFG,
> +				CCM_CPU_AXI_APB_MASK | CCM_CPU_AXI_AXI_MASK,
> +				CCM_CPU_AXI_DEFAULT_FACTORS);
> =20
>  	writel(CCM_PSI_AHB1_AHB2_DEFAULT, ccm + CCU_H6_PSI_AHB1_AHB2_CFG);
>  #ifdef CCM_AHB3_DEFAULT
> @@ -53,7 +61,15 @@ void clock_init_safe(void)
>  	 * The mux and factor are set, but the clock will be enabled in
>  	 * DRAM initialization code.
>  	 */
> -	writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3), ccm + CCU_H6_MBUS_CFG);
> +	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523)) {
> +		writel(MBUS_RESET, ccm + CCU_H6_MBUS_CFG);
> +		udelay(1);
> +		writel(MBUS_UPDATE | MBUS_CLK_SRC_OSCM24 | MBUS_CLK_M(4),
> +		       ccm + CCU_H6_MBUS_CFG);
> +	} else {
> +		writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3),
> +		       ccm + CCU_H6_MBUS_CFG);
> +	}

While this is in BSP boot0, I don't think it's needed at all. Full reset is
done later in DRAM driver anyway.

Best regards,
Jernej

>  }
> =20
>  void clock_init_uart(void)
>=20




