Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63F24E4D4
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760179327; cv=none; b=praMKRMLkQb6Tp87DXtQHNRXGU9nQjo2PMpHz8dMZKUuPbnQ1YS4wYC/ZOnb3ahnjq3gfDn3Y1/YYIOP2tRohE+2eqRQnTJoceNaUcFjIj3c/r/4oqGAs28xEidRq10ouYJ+EsGcNX3Q5xtEWpZ8bZzGw6KT03cJhxev0GXuWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760179327; c=relaxed/simple;
	bh=7YGmsI/AyhEGNwVbcyoDoc/5++M0Tl9+P4bT27GsW/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2VJvlOhJYVTujyVTHZ+cH7R869w7GCRdIIkNUoDM6+83XEpjZHaB6wjeOB75LauZHqeU11G7qLAXXu+oI3nctLusgXqJPDO/Y5249Ek9G7tF0YQlNp1+sgiw185pkewOHguxVDIt52lFgk7L+BTpI72XG4WCpUESVU1AjsAP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evyIqtt+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evyIqtt+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so4605233a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760179319; x=1760784119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=;
        b=evyIqtt+GyrzzyYK+qpKe5yIEo0Ar9Hef+5D4vtclGoLWQPGtK2lXsqrC0N58gAcSR
         itMwESbmaC26Q/lLwqiUxpPaQDFlz50m4gfzs4Ap0ApiAXpY7HlAeZLQd/tv9Yzh54xA
         Hd+8DG+B57sC9czJdJsRoBCh+UvmJUG+5ps8Z/Gin0YQPs23l+CMf1Vm1pfVjmKRpCoc
         leFLqMGzfa92lXE6MdfqKBHWfj1GAc5wFcsKm7gCKtrmEGbPgMVaSKnwWglVYBiGmwkU
         nGlJhp4sfPJE4wSb5M1Lly2TT2ur1UAnkAfEVv4/VeKPcuswPAe2UrAg0dyojTKilWMw
         2FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760179319; x=1760784119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=;
        b=HV32VU66ngWQftSInLER4LQ7p/tkJ839U8GWRCLtJ2endXAqzSkRR//ega780l2AUI
         w/E2pkh3u9OfkYB4QOnN3xvb4QraLTlrtudSWP3V9lanO1aQxDj6awWwnC3rbUjSkyXT
         GGZL3F7g0CfFuDyhRgta0OekendOioCoSmNXUR/GiYuuo2x+chNTyHQTgM7KLLy5EEzG
         paOlGvwRu7a/iFbeJ4LFbFz1dVq6sTLhzWDfxb2cU65wfpg5uty2KRkdx1cmXHRTbuWk
         gACD8160jyDpAcniLSwy9hZXPsXJYzSwimTFiuIyLyEcyt5MFaaJZyp6lAM/Eaa3ssW8
         jNNA==
X-Forwarded-Encrypted: i=1; AJvYcCXH2qtpm8WjPjSZTahrrNeUk3f44IVTwUdWy0aM+0rp1XWcy73zz8Hc0PDkcvVxADTw+ODOgMDJf9KuWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Lq5k437VWusnXBtEBjTIJ1MjDH/Mi+AiTg17HDahh+UANrJ2
	+eYGjx5UBk7gU7DzIyyzA0RuE8i46dUrbzMMf2MqJE2zVEaRoTV+0iru
X-Gm-Gg: ASbGncsKv+Uob0Ed5/HeVT2F91Ib4rnEOHlb7ce72uBqrOaioR8zdT7mydZhmfAd/0b
	FkBWkg726HNDFfLGGnakRbA8XiMmk4Yia8FUzntPdLZwt/p0Czxwg7KoleB0AGo9C5fcjaN/YDN
	4I0G10Ta5knbs0Gqgm6/ypAT9y4AprZCxnwomma318ki/H/wRHBvCsRs74GigylgaBknw5i39Jy
	zJn8RL89bTHVKo83wfJ+lx1zuE7Z3qGLyHNUwt94RlK6WFZWdl5Y4JADTF4kbnSG7ZvZq/i6Huu
	lNFt47G3SqYHYPJ2YLcMYHXLmZp2G97+0j7vr+TESq2uIbkTHH8MbBUVg67rh3Yuz/8zxtczPFp
	62zMaUMhyfdqUhEaEjrq79wT0jj1vmprn0vhd88AZiGDdmKr1/Zw+8ntb8KGoF6s=
X-Google-Smtp-Source: AGHT+IFniI0WsDXjo4z3UaAWm2jZN00980pqXioaMnWWaQ/4U3UhS7uWYQBxdSYInHj9x0mV1hCBAA==
X-Received: by 2002:a05:6402:5106:b0:634:544b:a756 with SMTP id 4fb4d7f45d1cf-639d5c59407mr12973844a12.32.1760179319203;
        Sat, 11 Oct 2025 03:41:59 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b10072sm4482832a12.16.2025.10.11.03.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:41:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH 04/15] mtd: nand: sunxi: move ecc strenghts in sunxi_nfc_caps
Date: Sat, 11 Oct 2025 12:41:56 +0200
Message-ID: <13861163.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251010084042.341224-5-richard.genoud@bootlin.com>
References:
 <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-5-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne petek, 10. oktober 2025 ob 10:40:31 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> H6/H616 has more ecc strenghts.
> This commit prepares the change.
> No functional change.

=46ormat looks weird. Reword message to something like moving ecc to caps w=
hich
will allow expand support for newer cores.

Also, there should be empty line before "No functional change."

Best regards,
Jernej

>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 10a48e0d361f..198dd40f9220 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -213,11 +213,15 @@ static inline struct sunxi_nand_chip *to_sunxi_nand=
(struct nand_chip *nand)
>   *			through MBUS on A23/A33 needs extra configuration.
>   * @reg_io_data:	I/O data register
>   * @dma_maxburst:	DMA maxburst
> + * @ecc_strengths:	Available ECC strengths array
> + * @nstrengths:		Size of @ecc_strengths
>   */
>  struct sunxi_nfc_caps {
>  	bool has_mdma;
>  	unsigned int reg_io_data;
>  	unsigned int dma_maxburst;
> +	const u8 *ecc_strengths;
> +	unsigned int nstrengths;
>  };
> =20
>  /**
> @@ -1619,9 +1623,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  				       struct nand_ecc_ctrl *ecc,
>  				       struct device_node *np)
>  {
> -	static const u8 strengths[] =3D { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
>  	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>  	struct sunxi_nfc *nfc =3D to_sunxi_nfc(nand->controller);
> +	const u8 *strengths =3D nfc->caps->ecc_strengths;
>  	struct mtd_info *mtd =3D nand_to_mtd(nand);
>  	struct nand_device *nanddev =3D mtd_to_nanddev(mtd);
>  	int nsectors;
> @@ -1645,7 +1649,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
> =20
>  		ecc->strength =3D bytes * 8 / fls(8 * ecc->size);
> =20
> -		for (i =3D 0; i < ARRAY_SIZE(strengths); i++) {
> +		for (i =3D 0; i < nfc->caps->nstrengths; i++) {
>  			if (strengths[i] > ecc->strength)
>  				break;
>  		}
> @@ -1666,7 +1670,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  	}
> =20
>  	/* Add ECC info retrieval from DT */
> -	for (i =3D 0; i < ARRAY_SIZE(strengths); i++) {
> +	for (i =3D 0; i < nfc->caps->nstrengths; i++) {
>  		if (ecc->strength <=3D strengths[i]) {
>  			/*
>  			 * Update ecc->strength value with the actual strength
> @@ -1677,7 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  		}
>  	}
> =20
> -	if (i >=3D ARRAY_SIZE(strengths)) {
> +	if (i >=3D nfc->caps->nstrengths) {
>  		dev_err(nfc->dev, "unsupported strength\n");
>  		return -ENOTSUPP;
>  	}
> @@ -2167,15 +2171,23 @@ static void sunxi_nfc_remove(struct platform_devi=
ce *pdev)
>  		dma_release_channel(nfc->dmac);
>  }
> =20
> +static const u8 sunxi_ecc_strengths_a10[] =3D {
> +	16, 24, 28, 32, 40, 48, 56, 60, 64
> +};
> +
>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
>  	.reg_io_data =3D NFC_REG_A10_IO_DATA,
>  	.dma_maxburst =3D 4,
> +	.ecc_strengths =3D sunxi_ecc_strengths_a10,
> +	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
>  };
> =20
>  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps =3D {
>  	.has_mdma =3D true,
>  	.reg_io_data =3D NFC_REG_A23_IO_DATA,
>  	.dma_maxburst =3D 8,
> +	.ecc_strengths =3D sunxi_ecc_strengths_a10,
> +	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
>  };
> =20
>  static const struct of_device_id sunxi_nfc_ids[] =3D {
>=20




