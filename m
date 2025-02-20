Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AA1F9406
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066121; cv=none; b=arXiQmiHRz3UhmCw1xderKdS5D3HMjsm60k+TWmRO07yIRxj2BNLsL29c2yzxdoir78Df/DsnIVn9xp7gHfkE3OBmfuRLyuU09Xs9EA5E4zDwTSVKhoyuNlnBH027jkduY4o1idG33HboCbhTUAD4L4OuH68nNfAFqtTJn1VXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066121; c=relaxed/simple;
	bh=rLDdqL4LhGKAjsGNUH/kcLvHKcVzqtPa5ndSZ+UTsbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3AMx8cgFHpBeDMl2/YY4I94KYg17QqhzBOtTSCYH9mAG2Rs0KHZjP3L/cN3TkEHHwKIb9VDgsvzOfKctbKReQwU+RdtxNvWNIfAQAQJzXOLSDvWXCgBLMVtDXC4rPEgRfeVIZxnlW4/lThZxhEiJWhi0TIuITIjZbJ1vdCYksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii4uaYX+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii4uaYX+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-439a331d981so9422015e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 07:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066117; x=1740670917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyIVLkT28r4TU0EMijOb+j2RXpDTj6f3sAkEcVbKSk0=;
        b=Ii4uaYX+7njWByN49J9F/4Blv8uJhxwJq0qeOoR4/gOemZ60BFdb8YwQxIvp3iYy+I
         8EyNuFiXWiUOiNqV7M3nMszpU5vkKM0758TdAGV4e0Rs8mQQ+9a7Mb3X/rQLhksvzvDY
         iZROtJ+kDRAoAIUyox19l7BNNIv1d9iEMrndxbhZhdAf63igtb9fyqnw/FpoyZJIxCbH
         9vY2Yd53G16whqQ/ay13Y6IUN7hN53VhGV19um3WV0Uj2rsLDSmdv73WmXM+9ar6aAXk
         vCn3QFD7meg6MzO8gWSlohGdbfxeBYaNd2dbSuQQaUAg6+/CzYkrPj8MQjj5YXdKaJ96
         2BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066117; x=1740670917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyIVLkT28r4TU0EMijOb+j2RXpDTj6f3sAkEcVbKSk0=;
        b=hhz38wSLZ5sNCZjhl3WiztRqCdxP8UUKWwJMoO9ahj87UAM5f7Xz0BT8NYokuQjC14
         ccEu08BzMY0amksaEhpkm0+nAT4aXen3LF7YDi895QTtgJmHncUoTRT7dCOHKzha39G4
         yCByNhiG8rYIPV5i0rVN45jF/WcxuDCQaELG7yG7A4pwfxM1fC5HtTtkLpMYJspJ64F0
         02AG9I3nSE/Q6QxHyYdEfE6m9QZUuj8i7gPlXw3kGiWRsrbnfvXkmyoN21iUJurx1J86
         6p0nhIuyOSA4FQvROPS+XLhvEt2huRTb8jcLC3o6pV8x3pd4Ru7CgYaM7Dl0V4AadooF
         C9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBMliiCLWYphBAoWAKV988lCqzU/EzRavODZRdDa20SF0daP8M9CKEbbWP0A6mCI+mB+FT5Umze3w5mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxamOE4gzbXq0tgR4nXV28/Olvc9CMTrW4z9BoaDFdrZ5xmdxoj
	h120P61DYg2Y4lzVgqe+X0OvQupHePe3h8hqL0bSLq/C8N7ing2R
X-Gm-Gg: ASbGncvYuGVNQecFV3jirbi7mgPFnTfSrB07fNttyTmfoTeFTX5GOhYP70r/SU7p/hx
	Chpc8sI0escGY5daoXRH6VZUV7QQ7y0xsij6roMaBu+1Xl2nPESW0ya/RzVWQ5Hj1OAQ5W387Z4
	qzgpoMGQUzdXkbwYdyXFphwr16Go78LmqVMuGHuc6Ly0wLV6BSXVnVR571mCGeFNFWE6vMhSmnB
	k+1pskNO+epNFIBPlSwbEzo79WwXjESUPG4w/5NynE9Nxz4gFej9Y6nh2Jqj74x3Wg8krM4EDbx
	0YnVd6Ur7kMDnYC6RSJCZtPmEw7OT5WyBgw2Xo3l88zPbPPBQLtrwhHsJqaPaHrrIoo=
X-Google-Smtp-Source: AGHT+IGLMBgWAS8md1eWr3QLcZNc7eKtGIVV3ogJUweYOTxfA509OyXxG3f6PzbwI1nZtFPUxbjlgg==
X-Received: by 2002:a05:600c:4f48:b0:439:8bb1:14b1 with SMTP id 5b1f17b1804b1-43999d91255mr100404625e9.11.1740066116912;
        Thu, 20 Feb 2025 07:41:56 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7e0sm20646011f8f.48.2025.02.20.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:41:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject:
 Re: [PATCH v3 1/1] clk: sunxi-ng: h616: Reparent GPU clock during frequency
 changes
Date: Thu, 20 Feb 2025 16:41:54 +0100
Message-ID: <3297157.aV6nBDHxoP@jernej-laptop>
In-Reply-To: <20250220113808.1122414-2-simons.philippe@gmail.com>
References:
 <20250220113808.1122414-1-simons.philippe@gmail.com>
 <20250220113808.1122414-2-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 20. februar 2025 ob 12:38:08 Srednjeevropski standardni =
=C4=8Das je Philippe Simons napisal(a):
> The H616 manual does not state that the GPU PLL supports
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead
> to panfrost various ooops, and GPU hangs.
>=20
> The manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that to reparent the GPU clock to GPU1 clock during frequency
> changes.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)

Changelog is missing here. What's changed?

In any case, this patch isn't useful on its own. What about PPU and GPU DT =
node?

Best regards,
Jernej

>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 190816c35..6050cbfa9 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", =
gpu0_parents, 0x670,
>  				       24, 1,	/* mux */
>  				       BIT(31),	/* gate */
>  				       CLK_SET_RATE_PARENT);
> +
> +/*
> + * This clk is needed as a temporary fall back during GPU PLL freq chang=
es.
> + * Set CLK_IS_CRITICAL flag to prevent from being disabled.
> + */
> +#define SUN50I_H616_GPU_CLK1_REG        0x674
>  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
>  					0, 2,	/* M */
>  					BIT(31),/* gate */
> -					0);
> +					CLK_IS_CRITICAL);
> =20
>  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
>  		      0x67c, BIT(0), 0);
> @@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
>  	.lock		=3D BIT(28),
>  };
> =20
> +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> +	.common		=3D &gpu0_clk.common,
> +	.cm		=3D &gpu0_clk.mux,
> +	.delay_us	=3D 1, /* manual doesn't really say */
> +	.bypass_index	=3D 1, /* GPU_CLK1@400MHz */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> +	.common		=3D &pll_gpu_clk.common,
> +	.enable		=3D BIT(29),	/* LOCK_ENABLE */
> +	.lock		=3D BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>  	void __iomem *reg;
> @@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>  	val |=3D BIT(0);
>  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> =20
> +	/*
> +	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400 M=
Hz.
> +	 */
> +	val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> +	val &=3D ~GENMASK(1, 0);
> +	val |=3D 2;
> +	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> +
>  	/*
>  	 * First clock parent (osc32K) is unusable for CEC. But since there
>  	 * is no good way to force parent switch (both run with same frequency),
> @@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>  	/* Re-lock the CPU PLL after any rate changes */
>  	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> =20
> +	/* Reparent GPU during GPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> +				  &sun50i_h616_gpu_nb);
> +
> +	/* Re-lock the GPU PLL after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> +
>  	return 0;
>  }
> =20
>=20




