Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F9C20764C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Feb 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740319072; cv=none; b=QD/bU0ccmrTmeJeg5NanrGj82Jj16xliKJIWL5ZX9TZzXodkuovUfgGy4m3VIalXjxSitBgRx/UewHHpzkEklz3KD3mvRrpLWcYudgWC7GSAwAhSke6eIkWnqT5oe9NPp0FTABjBRDgGTk4xrhSnaCSdkbLrT1e/q2RRU4RHtks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740319072; c=relaxed/simple;
	bh=ZyHtNtWQADT7GuU59EQCgspTrupUtGtb4AIJ02QtMao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3fH0KcY52zvpZ0w690Ou2PGyc/nqhAgb3NQBwByHU3Ar0jHYpXypf44u4Pzica++g6eXrDCl/bxo/n4zaWWeu/gKzYMEJTFICJ70IWgXSfHCNzFNcmw5xNvnGiZ7E+sZY0C6kEx2BRzYE15D0oLbNRu+RsSpmjs9c2kYT9EgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7tFzwz3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7tFzwz3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f2f748128so1580636f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Feb 2025 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740319069; x=1740923869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irpvSqgjgTj5pR4QAa0LXMYagaabjkDRM99tvNprbEE=;
        b=m7tFzwz3ErbJ9qyjwrRxFVtRbubdcbgK/TUpPU6zijDNAmCHfEOXrnSwmAbUkNIZA5
         RmbRYyYOmyaBNQPHnC6nuvBa4O4bzxbRnecc+h8zy0olKc2B9s/85aKOs2JvaLfj40wk
         dKs7NEPsKtWshA0sDGWNyI+Gwz6vSw+boS7pdlxC880VfNCfufcKXaRdG0tyqEi73v47
         ekLOa+i89ZB4r1wHBkTmp8i0v6lhhm5BN6ZIjel6Bg+a7uN0vnn6ds/Gp/hOlUWAK6VK
         +YC2KuziP3VMHXsJJY0N40ZHhxXMkSkyiY4ssGJEYbs+P8X0xH39AyEsetnOV5zlbqz3
         FWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740319069; x=1740923869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irpvSqgjgTj5pR4QAa0LXMYagaabjkDRM99tvNprbEE=;
        b=tlsTiPwr3th2nsopN6j4xKjETobMRSTInSMgj/hkbgy54BrnWBFb4n3y4S0/kTC40p
         RnRDnJC+UvbLWwOPqakjQC7Z1LbNeLexjHFsDnD8deQ6lCKz3fPoKI603UNqjOrS2cz0
         BIn9GFzGjJkiNvODpfRbdDMoEsWpxDGEPrP7qfrNix6muWCRQy+1zz48cupsflOTaixg
         9A2fgTHaKJI4uOA4UBC5MqjZya73877xM4r7900EFCcqiRVKaZ3h+4WoNoco7oAQNqau
         PVn/R675gIEw57GuSwG43zh43GJwJ311pOQHctpkfHqjCwbN2N54IQpbeUWW7VkYzz86
         FnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdT0kckClhQ+PA3AmuvirxmmUe3DYo7CZFHCHham8TCC0QD05VUQUCvyn8jL7Hvbik9Nhp8RG3ecFtpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMMI5dCToUFktjsaikr3BzbwJVj9RNSy5NkWwKegwakBUg5nxO
	sFG8Uheq1j71sZMOONMpWbewE4lPeoqbsobmeO+1gfVLZnwB2eFy
X-Gm-Gg: ASbGncv2J/OQCdNTkZJ9h5z4zDuEIZLXcifd4lvDG+qUhzKw1aF+aLM+KPPA6eGgYx2
	KaRpjcT7oapX4wf5hMZDzaX75+hy6OzEx1ma0uqdndwWXVHH349mWG+2Ou7VfDdIaZy1EkQFtSx
	nxGv5WaPdOuTYtZeYm8DixmiyEpcruN3jXy3W4QoI2ODhY4H98b+MU6jhQvOJTJGx+OZe+SHlHH
	hXHGNajUr0bELrfS1+D/Rf+cYPJet/3F30RYY73NeNbPQm3DG/gU+q6/92YoHhOUBCWCJZUlhMU
	79kp4nepJ3TqjQVpFdtVUMs7ePJsw9iJytITa1ovoYrUznJ322yZ90LNuZt/6+T/bvXonDdF9uB
	z5g==
X-Google-Smtp-Source: AGHT+IGEeE9J4uj+DGWwC9Wbtpp9SyskHFPKyeD+C5P4aQJjEmUKEGcNWd3Du/ly0SHMEDli0b4+Wg==
X-Received: by 2002:a5d:588c:0:b0:38d:ddf2:afea with SMTP id ffacd0b85a97d-38f6e95f301mr7975856f8f.13.1740319068981;
        Sun, 23 Feb 2025 05:57:48 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b031c5casm78071995e9.39.2025.02.23.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 05:57:47 -0800 (PST)
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
Date: Sun, 23 Feb 2025 14:57:46 +0100
Message-ID: <2716580.BddDVKsqQX@jernej-laptop>
In-Reply-To: <3297157.aV6nBDHxoP@jernej-laptop>
References:
 <20250220113808.1122414-1-simons.philippe@gmail.com>
 <20250220113808.1122414-2-simons.philippe@gmail.com>
 <3297157.aV6nBDHxoP@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 20. februar 2025 ob 16:41:54 Srednjeevropski standardni =
=C4=8Das je Jernej =C5=A0krabec napisal(a):
> Dne =C4=8Detrtek, 20. februar 2025 ob 12:38:08 Srednjeevropski standardni=
 =C4=8Das je Philippe Simons napisal(a):
> > The H616 manual does not state that the GPU PLL supports
> > dynamic frequency configuration, so we must take extra care when changi=
ng
> > the frequency. Currently any attempt to do device DVFS on the GPU lead
> > to panfrost various ooops, and GPU hangs.
> >=20
> > The manual describes the algorithm for changing the PLL
> > frequency, which the CPU PLL notifier code already support, so we reuse
> > that to reparent the GPU clock to GPU1 clock during frequency
> > changes.
> >=20
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> Changelog is missing here. What's changed?
>=20
> In any case, this patch isn't useful on its own. What about PPU and GPU D=
T node?

In the light of separate PPU & GPU DT series, this patch is gtg.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej
=20
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
=2Dng/ccu-sun50i-h616.c
> > index 190816c35..6050cbfa9 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0"=
, gpu0_parents, 0x670,
> >  				       24, 1,	/* mux */
> >  				       BIT(31),	/* gate */
> >  				       CLK_SET_RATE_PARENT);
> > +
> > +/*
> > + * This clk is needed as a temporary fall back during GPU PLL freq cha=
nges.
> > + * Set CLK_IS_CRITICAL flag to prevent from being disabled.
> > + */
> > +#define SUN50I_H616_GPU_CLK1_REG        0x674
> >  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
> >  					0, 2,	/* M */
> >  					BIT(31),/* gate */
> > -					0);
> > +					CLK_IS_CRITICAL);
> > =20
> >  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
> >  		      0x67c, BIT(0), 0);
> > @@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
> >  	.lock		=3D BIT(28),
> >  };
> > =20
> > +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> > +	.common		=3D &gpu0_clk.common,
> > +	.cm		=3D &gpu0_clk.mux,
> > +	.delay_us	=3D 1, /* manual doesn't really say */
> > +	.bypass_index	=3D 1, /* GPU_CLK1@400MHz */
> > +};
> > +
> > +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> > +	.common		=3D &pll_gpu_clk.common,
> > +	.enable		=3D BIT(29),	/* LOCK_ENABLE */
> > +	.lock		=3D BIT(28),
> > +};
> > +
> >  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
> >  {
> >  	void __iomem *reg;
> > @@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >  	val |=3D BIT(0);
> >  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> > =20
> > +	/*
> > +	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400=
 MHz.
> > +	 */
> > +	val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> > +	val &=3D ~GENMASK(1, 0);
> > +	val |=3D 2;
> > +	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> > +
> >  	/*
> >  	 * First clock parent (osc32K) is unusable for CEC. But since there
> >  	 * is no good way to force parent switch (both run with same frequenc=
y),
> > @@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >  	/* Re-lock the CPU PLL after any rate changes */
> >  	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> > =20
> > +	/* Reparent GPU during GPU PLL rate changes */
> > +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> > +				  &sun50i_h616_gpu_nb);
> > +
> > +	/* Re-lock the GPU PLL after any rate changes */
> > +	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> > +
> >  	return 0;
> >  }
> > =20
> >=20
>=20
>=20
>=20
>=20
>=20




