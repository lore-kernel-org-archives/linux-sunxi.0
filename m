Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3019463
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753647355; cv=none; b=jV3XMUPtrdFM9S8cYX0MN2eeqM8gGxsHdMO943Zxm6jOCQsUMGiRzeLwLsFORjPujZCIujMoY0v+FWwSGy9wkzY/xlTbsd8xmfrCjU+HQNtlRPArUhIhW7mH2Z0zbt21cJa3QV6rMLYZpxwGBC13mRj1Y1TyEyoW0WdsUy0bxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753647355; c=relaxed/simple;
	bh=Eg8BSNKAJtE1JWeUpSAq4dktwRnrx5tJRHHK85QIq7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fX5iAlSsqDo4KyeXVmoQqqklcbM91mp0csYDWeK2jOO5HqGhVHNyxD4Va3CGbhKTqhQl4rt9YHvYKUgHMNTgxLiBTm6gCa97BZHyC7syJish+DFHaauUKo74oT8pH0EM5KYgtYkbFr1pwOu4bnzl2SsFYSLRvDI7HKDeSTx0T3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP8n1v2N; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP8n1v2N"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b77b8750acso848106f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753647352; x=1754252152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeJK5GRaLBnuaIJaNMR/TgDp7Y/oSysAbwbgoE2oFxc=;
        b=LP8n1v2NKO5CtTXYmB+Fip3uiHIzRrE1x66O5hDp7dGBidR1duZFXq3qv91Vxdc1Ly
         BMTL7knptLeqbmjX/2VaVfg9FPinO8CX45OoedfY6pN8jcmmXNWykWFFYgVXtJOGURgv
         lGUrjglenaNaOorjfhG5nO8zagYE9ZLJHjuxYx/Ft8cqsC5oNt1+qrD6saXJEK7Nh+9a
         vRJ3wvcDEhh9BsD7T8yHnMmHSu8XadVkLwDiaRvHSqo7spZWxciIBH80Wg0Nzi6NXPiV
         ZUDipBZaT5vsf6cX+n9jvK5Xxm6+qfmbqZ9JP0+juG84eLRZ73LmVYQikgP/GjHf0LIC
         pfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753647352; x=1754252152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeJK5GRaLBnuaIJaNMR/TgDp7Y/oSysAbwbgoE2oFxc=;
        b=K8t4fKIDNP3JEX1AUku3aOtC1pMtkERW2070nLct0RxX1sGi0QrA1k+wWXHyePNdZv
         eZfMzf8G/OjCcCSmpO89CFgng4WlhwOLsZDUEPUSzDoBezms87uC81sD8QG7DpDN0jEc
         Gdybvq+N84K6xHU2vVHr68G79WAvARsV8TnDiUH9qf1Vi3mhQHmaxlhm8djUxdNr/fvd
         9FDkJqLL7aGgTa+8cjjBD3TropFgBPhIYUqtkwdkpXetwiaNLy+6mLdDFyRsSsV7upPZ
         BRmrmZr2OOXTAqDQuLwAKotmu2Ao13jutJuVy5dtHhNCpXstytnzIF9ecxvj3gXTOK4e
         G7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9s7QUbtvFW+0iNHZUNl0mrtzvthFoKSrlA7bhvbdq/2a0PdHI4TwbELldwC2KEQ7ipBUQ32+I/+64uA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl7rV272oRgbB1LFzEr0q9Vpfj0CzJAJjbgw36cckBl9o+NuM9
	hRF4ezj4i2xehZLd7arK5Ybd+IF2Yzlb3S+4/BopPMQHMPwJ/ivOZpfBh6Jsfw==
X-Gm-Gg: ASbGncs8Q8XfD8tjoXyrWZ7jBsmAfbJ677hX1FqZvBjajoxr1p2voFcdUFb2TgC8Vzd
	FeKczyX+G/X8kuYc0FEOZ0ebPlDS1DnHvDmV9EkAB0E7rZxERQIaAF2HPidsouSSLt6Imu3IcK8
	B+Waf4/h06Um/2IkI8GSN9KRIrXFbpF3HYVeEuVV1DGsz6aETKBZgSD4hJnQsiQ0fbLKScicooM
	zym55tirVqF0JJvvlhR+2kWE5Z4iG6/ErjmUC/N6EjhwvFQiiNai4HQ/mOAfJTYzIVOYRdk6BIG
	Vs3nHpKPsGTdhgOmfyrf7HNChzyi1DIvbLI/5RCkrT5tH8I9sC4+klI2LeBy0qSZWVMPuC1c/pf
	4Ohc0BOh7j05nYyUFuYkFldixnmx1ae0Hv/aAzn9iOYDkOxBjRCOLQMWWdily4UWeW/ksiag7iD
	YQzZ5yzS8H
X-Google-Smtp-Source: AGHT+IGM5og9dbblnxiB6VEviCevlY/F42ZT90c8gfTmT5u0NOxevw2SiWfq3nPkEKCImjmWQxcgtA==
X-Received: by 2002:a05:6000:40ca:b0:3b6:162a:8e08 with SMTP id ffacd0b85a97d-3b77123f244mr10502095f8f.12.1753647351538;
        Sun, 27 Jul 2025 13:15:51 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586f88ce71sm104125975e9.0.2025.07.27.13.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:15:51 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>, Yixun Lan <dlan@gentoo.org>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev,
 Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH v2 12/20] sunxi: sun50i_h6: add A523 SPL clock setup code
Date: Sun, 27 Jul 2025 22:15:50 +0200
Message-ID: <2789576.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250717235455.32528-13-andre.przywara@arm.com>
References:
 <20250717235455.32528-1-andre.przywara@arm.com>
 <20250717235455.32528-13-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 18. julij 2025 ob 01:54:47 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

>=20
> ---
>  .../include/asm/arch-sunxi/clock_sun50i_h6.h  | 10 ++++++
>  arch/arm/mach-sunxi/clock_sun50i_h6.c         | 32 ++++++++++++++-----
>  2 files changed, 34 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm=
/include/asm/arch-sunxi/clock_sun50i_h6.h
> index 5881ab88573..699d75f37c4 100644
> --- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
> @@ -108,6 +108,13 @@
>  #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
>  #define CCM_AHB3_DEFAULT		0x03000002
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
> @@ -127,6 +134,7 @@
>  /* MBUS clock bit field */
>  #define MBUS_ENABLE			BIT(31)
>  #define MBUS_RESET			BIT(30)
> +#define MBUS_UPDATE			BIT(27)
>  #define MBUS_CLK_SRC_MASK		GENMASK(25, 24)
>  #define MBUS_CLK_SRC_OSCM24		(0 << 24)
>  #define MBUS_CLK_SRC_PLL6X2		(1 << 24)
> @@ -139,10 +147,12 @@
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
> index 3a4399a9c6c..80004f13a1e 100644
> --- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
> @@ -16,15 +16,22 @@ void clock_init_safe(void)
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
> @@ -41,9 +48,10 @@ void clock_init_safe(void)
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
> @@ -55,7 +63,15 @@ void clock_init_safe(void)
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
>  }
> =20
>  void clock_init_uart(void)
>=20




