Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F12BF3F4
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982579; cv=none; b=G8AV5zxHILHv6Shdd17GbhpE1RYG/BC+Ttkh0ow0EfwtAOW/1/ExD940j6C9/7TMq4lp4juTJc2eVCnxZ/uPNFZl/rpMYXUSrljFIhymMwAMVqSXPEdD8WMj6lic/yinDp/qEbNutgg2UKk+PuJ29TKR0KCQtJDob3tFe/LDgMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982579; c=relaxed/simple;
	bh=xOrPsbGqKSS2XyeFNV4ELqt4UHoe2WbEgpv+4VqM/Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0O1Sj3p8s1TzmUHxKooBKYT7H4nWibuz+7MB/UzZlYzcysYPXkn7stPTOKsEZoOsrPLaQORSH0B3XBOXZqFe732Puk25RZOG483+d8QwXwfWkdepMB1uloiEEq84EG3ZtS8gG89PKH05HRgU54MGfIbv2cQiBDvGw6nPZLcBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShpT8QCu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShpT8QCu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so6342830f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982576; x=1761587376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyCd/4JIj55gxSeGf4+DJdNpJNeCwDGuxusuHQkGxZw=;
        b=ShpT8QCuTn5s+cpDDwBwwp34IQ8xT7LH5YYf1TjmWUKR5iN0KGkwOhKw2gvb/DseAU
         ozQ9X9kAd8MGTa/d5dpywVih7Sjbsv+nRDzRbTsz3ZbBV6PksKtZiOqMjtthBE9dc6Xf
         MTX6QPS0Hehl14mfGfkC5C0Lk18D1hYV+gXsLeMTKxfxvGwwtjQ7vNTVRenSl+30Hsws
         hJYb5DJPbExJhG7o30cSZMh++opGDfwdGs+vMjS3aJSkSPM5w2GeolV/rcARdA52buyC
         avl3B7D84bkzKEJsE8Btm506ILO6VY7om+2nGYrnWYM3jrXTmKtMfG4WERGVd0eccnOk
         c+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982576; x=1761587376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyCd/4JIj55gxSeGf4+DJdNpJNeCwDGuxusuHQkGxZw=;
        b=gEokIRoiJxyyZrMwb/pQZL4AVVu6ohgFWb3WpLuKRIybNQDLxZrm6aOta0XTHOsI7g
         Py4XcebYq3Co+Q7Gr8Fj0ojWO1aXlcIcFr3efTtFX0tBw4JSyuMQhwiVUE/SUPiVzwkk
         FBzIOffOmzKkewJ138vIpUgigTjGmvN6+SMvqD3gqVVYYDpYCkyQMxPQMlijdYRn4Uvl
         6/tIsqV+6KIHrJEnXpRw67aWTKM/uZTXIxVwR1VjWe6pTQB2BCUdY3JK1oYFjp3Go6XM
         Z1VViG3UdyaQgtU+u9FuWxXLa2WgKXfEd1DzSHmeMyIO1uqI1NKUWe67E7KPfPChPyiF
         C7UA==
X-Gm-Message-State: AOJu0Yyp4GH0Wa3BsW+/TTulv6CwMeiCltf2UDVIG6Y2y2bZ5M5ywPJX
	KFpeg8iXjAFigiZE8ew7Mq28oXNKBCd616PG3YSyQkmLxwzauvjCPsIf
X-Gm-Gg: ASbGnctYj3Cn1Cjr5uwriMwyXXsiyTA6N7FreyP8KV2VXYS2GdMXJCEOcZz6gkWjjDt
	nA54lSk/KTjGuTKgr6DUv7HUdsscJrrlQW9MJgPogzKwOEMKHkYpXiBgP73ZvB+uMi++rSiKb4i
	nWhXIsiLdvSW5T8PcppulDizhddW3BcWykSi9dzN58vEuTyzfP9ZDuJDfPsnJoYTmUZZS1o9bzg
	Ok3CjTt2mBO8vQVtsi+sAbqdnq1TGHHYiv9b2zhVWb+JvbFjhfz7vFYSQZIShqlQuZuix9hM8K3
	DTKO6+KEX1t93P8Lyuv8uQXfOilr+u8ZLVn/ixmhTru9A84uDCmjZ+rHiEbdvCD6P+XZnmk9vCr
	usl3AW+ZRxnuLkbWXPUALzpk8swYt2Vg5jc2Fwu8LQGyReTJNNAhuchnPY9L/AXSdETryb3CYlX
	EwrKrZaUZLDNIUR8arQ7zd6XIV8fcIBSQSXPrB4Rauf7a/MaWvKm0QXzV3jiPa1UVtMdU4XaYao
	g31cw==
X-Google-Smtp-Source: AGHT+IFVJfltDBGpXshwdA6ycK/H046cTrEtcv4sm/ksCoAaIUW3ZG+YpLxzBGC+3OrZRm/196984w==
X-Received: by 2002:a05:6000:4021:b0:427:8b:441a with SMTP id ffacd0b85a97d-42704d7e960mr9407198f8f.11.1760982575740;
        Mon, 20 Oct 2025 10:49:35 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm16212597f8f.17.2025.10.20.10.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:49:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 04/11] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Mon, 20 Oct 2025 19:49:34 +0200
Message-ID: <13867454.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251020171059.2786070-5-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne ponedeljek, 20. oktober 2025 ob 19:10:50 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The TX side of the SPDIF block on the A523 is almost the same the
> previous generations, the only difference being that it has separate
> module clock inputs for the TX and RX side.
>=20
> Since this driver currently only supports TX, add support for a
> different clock name so that TX and RX clocks can be separated
> if RX support is ever added. Then add support for the A523.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index 34e5bd94e9af..6a58dc4311de 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -177,6 +177,7 @@ struct sun4i_spdif_quirks {
>  	bool has_reset;
>  	unsigned int val_fctl_ftx;
>  	unsigned int mclk_multiplier;
> +	const char *tx_clk_name;
>  };
> =20
>  struct sun4i_spdif_dev {
> @@ -323,6 +324,7 @@ static int sun4i_spdif_hw_params(struct snd_pcm_subst=
ream *substream,
>  	}
>  	mclk *=3D host->quirks->mclk_multiplier;
> =20
> +	dev_info(&pdev->dev, "Setting SPDIF clock rate to %u\n", mclk);
>  	ret =3D clk_set_rate(host->spdif_clk, mclk);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev,
> @@ -542,7 +544,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai =3D {
>  		.formats =3D SUN4I_FORMATS,
>  	},
>  	.ops =3D &sun4i_spdif_dai_ops,
> -	.name =3D "spdif",

Why this change?

>  };
> =20
>  static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks =3D {
> @@ -572,6 +573,14 @@ static const struct sun4i_spdif_quirks sun50i_h6_spd=
if_quirks =3D {
>  	.mclk_multiplier =3D 1,
>  };
> =20
> +static const struct sun4i_spdif_quirks sun55i_a523_spdif_quirks =3D {
> +	.reg_dac_txdata =3D SUN8I_SPDIF_TXFIFO,
> +	.val_fctl_ftx   =3D SUN50I_H6_SPDIF_FCTL_FTX,
> +	.has_reset      =3D true,
> +	.mclk_multiplier =3D 1,
> +	.tx_clk_name	=3D "tx",
> +};
> +
>  static const struct of_device_id sun4i_spdif_of_match[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun4i-a10-spdif",
> @@ -594,6 +603,15 @@ static const struct of_device_id sun4i_spdif_of_matc=
h[] =3D {
>  		/* Essentially the same as the H6, but without RX */
>  		.data =3D &sun50i_h6_spdif_quirks,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun55i-a523-spdif",
> +		/*
> +		 * Almost the same as H6, but has split the TX and RX clocks,
> +		 * has a separate reset bit for the RX side, and has some
> +		 * expanded features for the RX side.
> +		 */
> +		.data =3D &sun55i_a523_spdif_quirks,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_spdif_of_match);
> @@ -635,6 +653,7 @@ static int sun4i_spdif_probe(struct platform_device *=
pdev)
>  	const struct sun4i_spdif_quirks *quirks;
>  	int ret;
>  	void __iomem *base;
> +	const char *tx_clk_name =3D "spdif";

Reverse tree?

Otherwise it looks good.

Best regards,
Jernej

> =20
>  	dev_dbg(&pdev->dev, "Entered %s\n", __func__);
> =20
> @@ -671,9 +690,12 @@ static int sun4i_spdif_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(host->apb_clk);
>  	}
> =20
> -	host->spdif_clk =3D devm_clk_get(&pdev->dev, "spdif");
> +	if (quirks->tx_clk_name)
> +		tx_clk_name =3D quirks->tx_clk_name;
> +	host->spdif_clk =3D devm_clk_get(&pdev->dev, tx_clk_name);
>  	if (IS_ERR(host->spdif_clk)) {
> -		dev_err(&pdev->dev, "failed to get a spdif clock.\n");
> +		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
> +			tx_clk_name);
>  		return PTR_ERR(host->spdif_clk);
>  	}
> =20
>=20




