Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F71E51F8
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908540; cv=none; b=ATkiP/dhCcK44vmtI9Fac0t5p3VRGYDwMOuKvJkLTM57khKHbupbD3ZL9+1Zwjv9MA5P966HiKa9K7Sw8wnsdK57imdlG/x4Jno/RZGJSFXYDcXcFcKi/Trayos2EnYZ4OI77JkQswuZS7p4dV8k/whh+8xo6/q5nc+4wkjtDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908540; c=relaxed/simple;
	bh=k/Rt6rfh9WwBwPJRxUAOtPloEhHSn81RZv1EwdOh1SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgE580y2HZmXy388PNXaeBnrU5uGA4IlwO/kNwyJUDPhl4lX9pKbgQeDbpirVG8rjuikmWf6HdxbZoRVkofg9kS/+a2isG2YV8IVE55iaEkbqAkk7/BqD7Yy1yNBvHykzUecmlLPc9Mw5D060U6+uarisYdSqv209pfV0Qlyfvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltdyrWlB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltdyrWlB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso799165e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 11:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739908537; x=1740513337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyFAvHnWoYMGsKstM+kT9VyU5glSveY29/SkjUzLsmk=;
        b=ltdyrWlBlzm69cj9kc8ACFxkaG6NmNyMwcXhOgrMvOkNy2nJfKMmCs5kcwsso89qw1
         USalAkGMBQWWhFG3fSESNdtxlqsyYV9ipfkF779v6gbt/J+d2qTU5hwDCHubtERGMt7W
         10l8nzEsig38/KV9mQ/WCaDfQ+y9z3JMU47dHRtvpYEU7y1Wp8/FiR1fuSbs4342cgdh
         uGKQ0FF9NEY7HX+3tUWoex5T1L/ZmtSeH27BpCemKu3mCYLMU1h0bak+fZ4apk85kdfw
         3fQMjfKNk4RwwFvOYnYmcOAChIkPoc3PhXz/9vt8qQ9maejf/4eQ9IoxelLf7ahPtli0
         MULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739908537; x=1740513337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyFAvHnWoYMGsKstM+kT9VyU5glSveY29/SkjUzLsmk=;
        b=Aswf8iTa+t3JK+28+wg89UF0zsTimHq+tSE2eoQsBWdPWAE6ceOupK4tENSBV3+kWV
         kGmG5FRST5F3utQbSzJB4SSE9D9IEvS3Dcm6x8sSQSfy9FljPDHXptxT/kXKxxG+LkCm
         HO+bc6lPHnpS3L/DC4DX6E21/GfpNPExcY1cHSnC0h+SGZMrsnWGyTCU7ZOCACapOTua
         mM/pXoDSFGqWpQttAg5iIdSppywcaA2ckrqvwMTkSYdO7EINl23ntKQ6JN3iB3+u9/+7
         qKVID2RCl62A0cAY1vcBExNk28hoLML0R659TumyDvuOFCoAkmStTCu4pH2KAkbrCBPB
         +55g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7qbYqnY6cxdq+Z8/dL8STEPifwZ5OEUme73FSofNsWbR9yBhfZXKsUIhUS/VNo4i3L3imHH7s1Ln9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfDPwCpu6trdEJQF+0UY/G+Xjl4D1nL0jwXoY1oo9xYpqxnvph
	lL58Fw2cx+FhoQ8edoKoSALm5ptt4n6Es7e0KGU/vLLl0dYGCulh
X-Gm-Gg: ASbGncsVABW7rVMH78klGzUBQeyCt1vvmKCtnU8Y9YnaGcdPEApH9cKMh7mhRFqqaeV
	jpNQReYSYgA3Z7eoEmV7Rz61BXIRJg4uD0nMD92QpYBe3IvugUMTyld9lTON3HpSLCfxWq5THuE
	3vOEpoxZ2x24c5krWM6ZIHXNLvv/jmKpM4vOxsmgmpgPqh5P26aZNXQgOJGBfke9FulTfyvnPRQ
	oG2uj+VjkSghz0QnpYQDF/CuX5I7zOpVJeSKlsq5Y8zI2x9oSsNLLKhjkGQgxM4OM+M9cJibCxc
	q8TKjGCilqX9/Y4czXqrLB6Lt8rnbT0npVHZLCOWmZ5dOrV3whoFxog3UdKN5gjLQaI=
X-Google-Smtp-Source: AGHT+IGGYoucYTPiZvi9obRT6/pb2zsR/EsexoK2OOZKBRfsRgBHInK++vwyne9vU9LtGD0j5Deg3g==
X-Received: by 2002:a05:600c:1c08:b0:439:98fd:a4b6 with SMTP id 5b1f17b1804b1-43999b70c96mr10501245e9.15.1739908536452;
        Tue, 18 Feb 2025 11:55:36 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fe5esm16019373f8f.99.2025.02.18.11.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:55:36 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] clk: sunxi-ng: a523: remaining mod clocks
Date: Tue, 18 Feb 2025 20:55:34 +0100
Message-ID: <47026132.fMDQidcC6G@jernej-laptop>
In-Reply-To: <20250214125359.5204-12-andre.przywara@arm.com>
References:
 <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-12-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 13:53:55 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the remaining mod clocks, driving various parts of the SoC: the "LEDC"
> LED controller, the "CSI" camera interface, the "ISP" image processor,
> the DSP clock, and the "fanout" clocks, which allow to put clock signals
> on external pins.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 190 +++++++++++++++++++++++++
>  1 file changed, 190 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 59cc31f89ae77..6a4340f1fd041 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -354,6 +354,7 @@ static SUNXI_CCU_M_DATA_WITH_MUX(apb0_clk, "apb0", ah=
b_apb0_parents, 0x520,
>  				 0, 5,		/* M */
>  				 24, 2,	/* mux */
>  				 0);
> +static const struct clk_hw *apb0_hws[] =3D { &apb0_clk.common.hw };
> =20
>  static const struct clk_parent_data apb1_parents[] =3D {
>  	{ .fw_name =3D "hosc" },
> @@ -832,6 +833,153 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(edp_clk, "edp",=
 edp_parents, 0xbb0,
>  				    BIT(31),	/* gate */
>  				    0);
> =20
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ledc_clk, "ledc", ir_tx_ledc_paren=
ts,
> +				      0xbf0,
> +				      0, 4,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static const struct clk_hw *csi_top_parents[] =3D {
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +	&pll_video3_3x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(csi_top_clk, "csi-top", csi_top_pare=
nts,
> +				    0xc04,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_parent_data csi_mclk_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_video3_4x_clk.common.hw },
> +	{ .hw =3D &pll_video0_4x_clk.common.hw },
> +	{ .hw =3D &pll_video1_4x_clk.common.hw },
> +	{ .hw =3D &pll_video2_4x_clk.common.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk0_clk, "csi-mclk0",
> +				       csi_mclk_parents, 0xc08,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);

Missing dual div flag for csi-mclk clocks.

> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk1_clk, "csi-mclk1",
> +				       csi_mclk_parents, 0xc0c,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk2_clk, "csi-mclk2",
> +				       csi_mclk_parents, 0xc10,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk3_clk, "csi-mclk3",
> +				       csi_mclk_parents, 0xc14,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static const struct clk_hw *isp_parents[] =3D {
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_video2_4x_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(isp_clk, "isp", isp_parents, 0xc20,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_parent_data dsp_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "iosc" },
> +	{ .hw =3D &pll_periph0_2x_clk.common.hw },
> +	{ .hw =3D &pll_periph0_400M_clk.hw, },

Last one should be pll_periph0_480M_clk.

> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(dsp_clk, "dsp", dsp_parents, 0xc70,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_GATE_DATA(fanout_24M_clk, "fanout-24M", osc24M,
> +			   0xf30, BIT(0), 0);
> +static SUNXI_CCU_GATE_DATA_WITH_PREDIV(fanout_12M_clk, "fanout-12M", osc=
24M,
> +				       0xf30, BIT(1), 2, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_16M_clk, "fanout-16M",
> +				      pll_periph0_480M_hws,
> +				      0xf30, BIT(2), 30, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_25M_clk, "fanout-25M",
> +				      pll_periph0_2x_hws,
> +				      0xf30, BIT(3), 48, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_50M_clk, "fanout-50M",
> +				      pll_periph0_2x_hws,
> +				      0xf30, BIT(4), 24, 0);
> +
> +/* These clocks have a second divider that is not modelled and forced to=
 0. */

Any specific reason for that?

Best regards,
Jernej

> +#define SUN55I_A523_FANOUT_27M_REG	0xf34
> +static const struct clk_hw *fanout_27M_parents[] =3D {
> +	&pll_video0_4x_clk.common.hw,
> +	&pll_video1_4x_clk.common.hw,
> +	&pll_video2_4x_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(fanout_27M_clk, "fanout-27M",
> +				    fanout_27M_parents, 0xf34,
> +				    0, 5,	/* M */
> +				    24, 2,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +#define SUN55I_A523_FANOUT_PCLK_REG	0xf38
> +static SUNXI_CCU_M_HWS_WITH_GATE(fanout_pclk_clk, "fanout-pclk", apb0_hw=
s,
> +				 0xf38,
> +				 0, 5,		/* M */
> +				 BIT(31),	/* gate */
> +				 0);
> +
> +static const struct clk_parent_data fanout_parents[] =3D {
> +	{ .fw_name =3D "osc32k-out" },
> +	{ .hw =3D &fanout_12M_clk.common.hw, },
> +	{ .hw =3D &fanout_16M_clk.common.hw, },
> +	{ .hw =3D &fanout_24M_clk.common.hw, },
> +	{ .hw =3D &fanout_25M_clk.common.hw, },
> +	{ .hw =3D &fanout_27M_clk.common.hw, },
> +	{ .hw =3D &fanout_pclk_clk.common.hw, },
> +	{ .hw =3D &fanout_50M_clk.common.hw, },
> +};
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout0_clk, "fanout0", fanout_paren=
ts,
> +				    0xf3c,
> +				    0, 3,	/* mux */
> +				    BIT(21),	/* gate */
> +				    0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout1_clk, "fanout1", fanout_paren=
ts,
> +				    0xf3c,
> +				    3, 3,	/* mux */
> +				    BIT(22),	/* gate */
> +				    0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout2_clk, "fanout2", fanout_paren=
ts,
> +				    0xf3c,
> +				    6, 3,	/* mux */
> +				    BIT(23),	/* gate */
> +				    0);
> +
>  /*
>   * Contains all clocks that are controlled by a hardware register. They
>   * have a (sunxi) .common member, which needs to be initialised by the c=
ommon
> @@ -904,6 +1052,23 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
>  	&tcon_tv0_clk.common,
>  	&tcon_tv1_clk.common,
>  	&edp_clk.common,
> +	&ledc_clk.common,
> +	&csi_top_clk.common,
> +	&csi_mclk0_clk.common,
> +	&csi_mclk1_clk.common,
> +	&csi_mclk2_clk.common,
> +	&csi_mclk3_clk.common,
> +	&isp_clk.common,
> +	&dsp_clk.common,
> +	&fanout_24M_clk.common,
> +	&fanout_12M_clk.common,
> +	&fanout_16M_clk.common,
> +	&fanout_25M_clk.common,
> +	&fanout_27M_clk.common,
> +	&fanout_pclk_clk.common,
> +	&fanout0_clk.common,
> +	&fanout1_clk.common,
> +	&fanout2_clk.common,
>  };
> =20
>  static struct clk_hw_onecell_data sun55i_a523_hw_clks =3D {
> @@ -997,6 +1162,23 @@ static struct clk_hw_onecell_data sun55i_a523_hw_cl=
ks =3D {
>  		[CLK_TCON_TV0]		=3D &tcon_tv0_clk.common.hw,
>  		[CLK_TCON_TV1]		=3D &tcon_tv1_clk.common.hw,
>  		[CLK_EDP]		=3D &edp_clk.common.hw,
> +		[CLK_LEDC]		=3D &ledc_clk.common.hw,
> +		[CLK_CSI_TOP]		=3D &csi_top_clk.common.hw,
> +		[CLK_CSI_MCLK0]		=3D &csi_mclk0_clk.common.hw,
> +		[CLK_CSI_MCLK1]		=3D &csi_mclk1_clk.common.hw,
> +		[CLK_CSI_MCLK2]		=3D &csi_mclk2_clk.common.hw,
> +		[CLK_CSI_MCLK3]		=3D &csi_mclk3_clk.common.hw,
> +		[CLK_ISP]		=3D &isp_clk.common.hw,
> +		[CLK_DSP]		=3D &dsp_clk.common.hw,
> +		[CLK_FANOUT_24M]	=3D &fanout_24M_clk.common.hw,
> +		[CLK_FANOUT_12M]	=3D &fanout_12M_clk.common.hw,
> +		[CLK_FANOUT_16M]	=3D &fanout_16M_clk.common.hw,
> +		[CLK_FANOUT_25M]	=3D &fanout_25M_clk.common.hw,
> +		[CLK_FANOUT_27M]	=3D &fanout_27M_clk.common.hw,
> +		[CLK_FANOUT_PCLK]	=3D &fanout_pclk_clk.common.hw,
> +		[CLK_FANOUT0]		=3D &fanout0_clk.common.hw,
> +		[CLK_FANOUT1]		=3D &fanout1_clk.common.hw,
> +		[CLK_FANOUT2]		=3D &fanout2_clk.common.hw,
>  	},
>  };
> =20
> @@ -1048,6 +1230,14 @@ static int sun55i_a523_ccu_probe(struct platform_d=
evice *pdev)
>  	val &=3D ~(BIT(1) | BIT(0));
>  	writel(val, reg + SUN55I_A523_PLL_AUDIO0_REG);
> =20
> +	/* Force fanout factors N to 0. */
> +	val =3D readl(reg + SUN55I_A523_FANOUT_27M_REG);
> +	val &=3D ~GENMASK(12, 8);
> +	writel(val, reg + SUN55I_A523_FANOUT_27M_REG);
> +	val =3D readl(reg + SUN55I_A523_FANOUT_PCLK_REG);
> +	val &=3D ~GENMASK(9, 5);
> +	writel(val, reg + SUN55I_A523_FANOUT_PCLK_REG);
> +
>  	ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun55i_a523_ccu_desc);
>  	if (ret)
>  		return ret;
>=20




