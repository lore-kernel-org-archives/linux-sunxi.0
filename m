Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F61E835C
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907774; cv=none; b=HpaLL6qAnes6iAR+T3lvAe1Ru6JN+miYuh/RV1hmqVOqGcDO0H2yzs0k/1aStanwyueA1YP6zuwMdp7U7LKowjFqmx8RUaEMDkMt4gEa9XVMd5AVYO0xruopDFLHPxFLIQ3TGGAG+yXVLT4Ru36e0vQgwP5QU+ykIQfD083l7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907774; c=relaxed/simple;
	bh=JVDAb2/wbhF3ydZ1Jo4lZCTcWIRQXA3iNvferXgyxx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eXRzQeTAC9swoAxZVTMFt5a6YnaGwVgl0mL0QytubvqRcW/30jl3oeXb0IDfMsoC6HNsvxfcnYDcrQX4F9bxrJVmmdwXX54Gn9aA5FzYBh82GzvTeonVzHQjHWGhWjD74qCWohALleb5TDQ/mTDUoTwfS+isWk87s1KD/Tx7dS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR3PstmB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR3PstmB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4396424d173so60614795e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 11:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739907770; x=1740512570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl7U1zRTmSliSaba3R9gS9qlysQX6pYP+zWE+Yu6Uvk=;
        b=JR3PstmBULBGkYvpUmd5TnRl1E//FQ+qNMZwgsM9QA7anuavTaxDE7xTr9PSAfx3y/
         RPLB5SP8VimJi/kYXTXXxO7mlfEVf69GLG16w14CrkXazhQvGkCp6amdcgYJozlczAWS
         Nxn7lK1E+bsJhtP42aCdMQnpQqr2GT0q7SCQd6fi1XOZDdzcWcEnP3rnqg+UDYjZnslb
         LsAn016caOZf48NkcF1hNWRu433B4Sr7KlzIYIEE0DR0Mq7/pI46cvwR3go5r/AJQva1
         R+zowoMsFG9EpuXzPKUTMSnRzqA2jzeIWv2cTcITzXolZbhNUECIMPirK0zcxQK4j/Q5
         SDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907770; x=1740512570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl7U1zRTmSliSaba3R9gS9qlysQX6pYP+zWE+Yu6Uvk=;
        b=K5m/rWWVkWFrUb2EmzUatjfzUOdfzCHHUHwchMYFk5i1b9rGsm4CEFq13OxqED/DSs
         HqbVhdIB139C03/1Jl++53oYoyqYbtxuQBnTBRnPf3kSxdUMjQNI4Iy7hItnOEFzLyJx
         a43QOSHk1TR8WZpAZc1K6/UkX9OFoji85LoOUvuphn0VoTXaIeQIPGsvzGmWnt58d7Aj
         oeyY0XbcLkkRyWG8ceg2UNKxV65BL9qCe3pXbjRHmmth4mRF9Mh/ZRQrvKJ08TWy4UhC
         RmLBgvDVlHNia11xbOZKAwxBkkk2hDQOUuxNZiQvUXnxMr85/1LErIREv6x184TYD691
         xgJw==
X-Forwarded-Encrypted: i=1; AJvYcCW7HmR4nBbYNkzmi+fAOcsX76FvpGEAx2PKfzBqaay7krZ70n5Y68hHyRSTQzzmQcUFsBzO7nIATuwSSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR1cfhWVLCvDFZYexu66x/FFdNu/4upaNxI37U26a7ao7NSTrL
	OLVIti39EJ1sDBz/uBHyNRkOC2NaTdIGN3N71aMJDdAtUTOCBQ4B
X-Gm-Gg: ASbGncteJDp7hZ78TrqwRZ1mBz0vbGv/8k0yvcamZU7NIxsgQBighw7njRgLmaZWwWQ
	H7mfD91k0dOKZp+T45QH8HI9KB5SS1WAOjlffEzm6LxarfQ4uS/zAYXkBfaTFjA3xENA+KJsMEs
	S8vY4diTJolvTfXXEM4bL+D27+zV9cTaN1Sjj+4wl7lD+urnGd7Qd5q2sAMUvAd3Hk2/uJpIhsG
	4Vh5tNkbajiPPRDVPvM/o7p11Do//ClhHKvoZ6RKwHcuLg9djg4TyXbBTqTzFvvZlZIx5EogqQj
	jzyDYAV+YxRXzVaaTRmitgggVClwdCQYQb3QGJY/PqwHNikofcm8IExipbBDhdFot6c=
X-Google-Smtp-Source: AGHT+IGUZTP9Mx+RmuM36MdYWx5EMbKHtaqxdPPdwHgNaovkF0uIkKf3zl23uWEwqGtbHZ3m2biocA==
X-Received: by 2002:a05:6000:1785:b0:38d:d6ef:f8 with SMTP id ffacd0b85a97d-38f33f38d23mr16417610f8f.30.1739907770231;
        Tue, 18 Feb 2025 11:42:50 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398937341csm54963525e9.24.2025.02.18.11.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:42:49 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/15] clk: sunxi-ng: a523: add interface mod clocks
Date: Tue, 18 Feb 2025 20:42:48 +0100
Message-ID: <2641802.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <20250214125359.5204-10-andre.przywara@arm.com>
References:
 <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-10-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 13:53:53 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the clocks driving what the user manual summarises under "interface"
> devices: raw NAND flash, MMC, SPI, EMAC, "IR" infrared, and the "GPADC"
> general purpose analogue/digital converter.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 160 +++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index b68c44bce825f..14d13fb16dfbb 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -113,6 +113,9 @@ static CLK_FIXED_FACTOR_HWS(pll_periph0_150M_clk, "pl=
l-periph0-150M",
>  			    pll_periph0_2x_hws, 8, 1, 0);
>  static CLK_FIXED_FACTOR_HWS(pll_periph0_160M_clk, "pll-periph0-160M",
>  			    pll_periph0_480M_hws, 3, 1, 0);
> +static const struct clk_hw *pll_periph0_150M_hws[] =3D {
> +	&pll_periph0_150M_clk.hw
> +};
> =20
>  #define SUN55I_A523_PLL_PERIPH1_REG	0x028
>  static struct ccu_nm pll_periph1_4x_clk =3D {
> @@ -537,6 +540,133 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(dram_clk, "dram=
", dram_parents, 0x800,
>  static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
>  			   &dram_clk.common.hw, 4, 1, 0);
> =20
> +static const struct clk_parent_data nand_mmc_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_400M_clk.hw },
> +	{ .hw =3D &pll_periph0_300M_clk.hw },
> +	{ .hw =3D &pll_periph1_400M_clk.hw },
> +	{ .hw =3D &pll_periph1_300M_clk.hw },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand0_clk, "nand0", nand_mmc_paren=
ts,
> +				    0x810,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand1_clk, "nand1", nand_mmc_paren=
ts,
> +				    0x814,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc0_clk, "mmc0", nand_mmc_par=
ents,
> +					   0x830,
> +					   0, 5,	/* M */
> +					   8, 5,	/* P */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   2,		/* post div */
> +					   0, CCU_FEATURE_DUAL_DIV);
> +
> +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc1_clk, "mmc1", nand_mmc_par=
ents,
> +					   0x834,
> +					   0, 5,	/* M */
> +					   8, 5,	/* P */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   2,		/* post div */
> +					   0, CCU_FEATURE_DUAL_DIV);
> +
> +static const struct clk_parent_data mmc2_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_800M_clk.common.hw },
> +	{ .hw =3D &pll_periph0_600M_clk.hw },
> +	{ .hw =3D &pll_periph1_800M_clk.common.hw },
> +	{ .hw =3D &pll_periph1_600M_clk.hw },
> +};
> +
> +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc2_clk, "mmc2", mmc2_parents,
> +					   0x838,
> +					   0, 5,	/* M */
> +					   8, 5,	/* P */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   2,		/* post div */
> +					   0, CCU_FEATURE_DUAL_DIV);
> +
> +static const struct clk_parent_data spi_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_300M_clk.hw },
> +	{ .hw =3D &pll_periph0_200M_clk.hw },
> +	{ .hw =3D &pll_periph1_300M_clk.hw },
> +	{ .hw =3D &pll_periph1_200M_clk.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi0_clk, "spi0", spi_parents, 0x=
940,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi1_clk, "spi1", spi_parents, 0x=
944,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi2_clk, "spi2", spi_parents, 0x=
948,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spifc_clk, "spifc", nand_mmc_pare=
nts,
> +				       0x950,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);

Missing CCU_FEATURE_DUAL_DIV flag.

Best regards,
Jernej

> +
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac0_25M_clk, "emac0-25M",
> +				      pll_periph0_150M_hws,
> +				      0x970, BIT(31) | BIT(30), 6, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac1_25M_clk, "emac1-25M",
> +				      pll_periph0_150M_hws,
> +				      0x974, BIT(31) | BIT(30), 6, 0);
> +
> +static const struct clk_parent_data ir_rx_parents[] =3D {
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "hosc" },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_rx_clk, "ir-rx", ir_rx_parents,=
 0x990,
> +				      0, 5,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +static const struct clk_parent_data ir_tx_ledc_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph1_600M_clk.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_tx_clk, "ir-tx", ir_tx_ledc_par=
ents,
> +				      0x9c0,
> +				      0, 5,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_M_WITH_GATE(gpadc0_clk, "gpadc0", "hosc", 0x9e0,
> +				 0, 5,		/* M */
> +				 BIT(31),	/* gate */
> +				 0);
> +static SUNXI_CCU_M_WITH_GATE(gpadc1_clk, "gpadc1", "hosc", 0x9e4,
> +				 0, 5,		/* M */
> +				 BIT(31),	/* gate */
> +				 0);
> +
>  static const struct clk_parent_data losc_hosc_parents[] =3D {
>  	{ .fw_name =3D "hosc" },
>  	{ .fw_name =3D "losc" },
> @@ -693,6 +823,21 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =3D=
 {
>  	&hstimer5_clk.common,
>  	&iommu_clk.common,
>  	&dram_clk.common,
> +	&nand0_clk.common,
> +	&nand1_clk.common,
> +	&mmc0_clk.common,
> +	&mmc1_clk.common,
> +	&mmc2_clk.common,
> +	&spi0_clk.common,
> +	&spi1_clk.common,
> +	&spi2_clk.common,
> +	&spifc_clk.common,
> +	&emac0_25M_clk.common,
> +	&emac1_25M_clk.common,
> +	&ir_rx_clk.common,
> +	&ir_tx_clk.common,
> +	&gpadc0_clk.common,
> +	&gpadc1_clk.common,
>  	&pcie_aux_clk.common,
>  	&hdmi_24M_clk.common,
>  	&hdmi_cec_32k_clk.common,
> @@ -767,6 +912,21 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clk=
s =3D {
>  		[CLK_HSTIMER5]		=3D &hstimer5_clk.common.hw,
>  		[CLK_IOMMU]		=3D &iommu_clk.common.hw,
>  		[CLK_DRAM]		=3D &dram_clk.common.hw,
> +		[CLK_NAND0]		=3D &nand0_clk.common.hw,
> +		[CLK_NAND1]		=3D &nand1_clk.common.hw,
> +		[CLK_MMC0]		=3D &mmc0_clk.common.hw,
> +		[CLK_MMC1]		=3D &mmc1_clk.common.hw,
> +		[CLK_MMC2]		=3D &mmc2_clk.common.hw,
> +		[CLK_SPI0]		=3D &spi0_clk.common.hw,
> +		[CLK_SPI1]		=3D &spi1_clk.common.hw,
> +		[CLK_SPI2]		=3D &spi2_clk.common.hw,
> +		[CLK_SPIFC]		=3D &spifc_clk.common.hw,
> +		[CLK_EMAC0_25M]		=3D &emac0_25M_clk.common.hw,
> +		[CLK_EMAC1_25M]		=3D &emac1_25M_clk.common.hw,
> +		[CLK_IR_RX]		=3D &ir_rx_clk.common.hw,
> +		[CLK_IR_TX]		=3D &ir_tx_clk.common.hw,
> +		[CLK_GPADC0]		=3D &gpadc0_clk.common.hw,
> +		[CLK_GPADC1]		=3D &gpadc1_clk.common.hw,
>  		[CLK_PCIE_AUX]		=3D &pcie_aux_clk.common.hw,
>  		[CLK_HDMI_24M]		=3D &hdmi_24M_clk.common.hw,
>  		[CLK_HDMI_CEC_32K]	=3D &hdmi_cec_32k_clk.common.hw,
>=20




