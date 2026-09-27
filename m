Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6C345CC9
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510537; cv=none; b=trwNLjaZzP3ctsawS8bx/etiMxRsGK7Kczw0lVaxqOXat3PT3QCAhLnyF4Jd7u1j/etIPyZT9oY1T6jpP7NJ08nlyobJ73cvzYiniywOagEl21jK5HoCH2+sTl89/54aq309eJsaLJeYP0zNlekSDpW4JB2tGAmSYlECOZVDu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510537; c=relaxed/simple;
	bh=oiDfx3xTmCK059N3KmPjyVwz7QIbdUrM1wdlBFdAy1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GtyNmA0cGuE08Lqr9PoI04/J5B3p//J9AhYhoWP3umeQj5owInKQdOa++qcsb4smFnGzdImyaBwUIRpibpPzNN9sQW/ICoq0Yyq1kHicFhSsYocgOm5L4o6Y3/rzeGYnYkM8OaZoUN3DhuBWYt6GxJ7phzReVQwr+WKk89YhoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDtH8MPK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDtH8MPK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1179349f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510534; x=1791115334; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=;
        b=NDtH8MPKiSThhm0Jan1nQsLunM/M4JlGHwGYqnqTKhiUEnmfODE8OoL1TNABMz6f8L
         YQlrHLiq71/xWcnSx08zTTbVHdPQXjV9Yey0WscNJcaZjkojHacEMPEizk4IlXRpRQPt
         jMnSjr6oCSAMcJ0OenTGgAZfSDnTuua+nly3u7j8bRq2mMacvhFFFhIl5s4RPKkdMcf9
         fZb4ITUuFnb5Hx6APMxw4UfOZaN3o2xZEuKGeifEo3yMV1xotruxiyYbsLvz8cpYpINW
         hri4sjRoOCIbHaWx9uvnr0nsJgeygySaYsAf3rpzBjTOuICcIYkyvTVGvmQrqnwaxF78
         undA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510534; x=1791115334;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=;
        b=hMQVyLYOIHQ3ztlKVeAR20PdKXb9T3AJTljyvoLYqvxMXmdtkx2mysE2kFtEVPQHaM
         c1EF0EGuWgzFSmgzZ/4vJA/b2C4WJoxEGJc/6NuyoYfypuh5eIgG3nmIanM1suaFO0G0
         fIgrZmPGOf0guYAkaRmbiZIWO+e21tB5ov7JZElLGVzES8QqK+dFJ4QFiMp1/61CfG14
         haD5c5vdv6lDeOd+NNlQPHjF4tos+mF+Tku2XPdFcy3zYqtswI9HWJQ5PQgHq0cYA0ug
         bOqX9abEMWAnhbB6B/rwgilmSWmLvYyCCZSl8xeiI7n1aOnMzUCOh1i66YvwkrLzuK3i
         /8JA==
X-Forwarded-Encrypted: i=1; AKwUvByQGZZRPi6qL7QofrQyHwFPNwVucmupR8pzP5CkQ9htt46hy6ATu8dvW+ajqG3REM5u4Ryf9nJfHZsAug==@lists.linux.dev
X-Gm-Message-State: AFuF++mODEWTa0lXCbl0O6mIgKDGH2AosUNm4vetODx5svu0OXqsWyOI
	BaqdpD3eokzxOjxY+xMq6MN1mrf3vF5+rx/SAhH5HoUYZapHU5YlMD6m8zSCaQ==
X-Gm-Gg: AYBFou0R1+GocuiIvUR3AbfyLU88pf7QR3TGhzO7eubXEWZRgqAQqPCJTeoO2RBqFnJ
	4gqZhE/FLuX4nvGJ7H28I65jnx9LzIbgZU61LROMhrCgsPPB0woQ9+7izxeDNF2a0ZuVnWs/8ag
	DlfisDX2jeeQ5HqXVLaGsGAdAPY86CGrxZKIIDrbSN5tnLJaY/rf7/0FdLbgEInGbyMG0fXXc+/
	bH8wh/9C5IOBZT91IuMyMbrceO6IXI8TteRdqAgDWRVhVqk8yAPxVvxHbZ8YEZhR2u6Fo13z3mE
	t+p4iqAlBFJEIh54rjLhxyFR1nZ1QvHvZxCldPxUXKPaNmDr0sPmqVA94tP/sqbjNOqgIM5HYV5
	c32yhjCgjXAzxv11QFb53ea5lMtuE2H5JbJfxD6Bnt3OCtANcAGjIiHkptsiDDvvFycwL6Ly+n9
	aOlHwGi4NCw1zJH8XqOzxwWgwVrYUQQxZzBf/qL6yo9anVHbq7v9qs9toiiGWAdw9rSUQK7nTax
	xhaVuEFm7MSDEAIvuPEN9rqndbTBcLxEjPvjCHze5HLFbo5U1ZJjklHBJwVQ99+xAbI/nK7rWSP
	/FaOeDUHgZcvbKirrv3w9t8+63NKZgxJDKbkAk9TtK4hEU4TqMghCEwFQA8HTyIml7u18on0qVb
	TtoJZUeAclsjeg46665YOE5s9n9cbi8/ElPUlqWQTSYjE6ecRVVdjul3fJigwQvQnVBrd6x18wB
	fTYxUX4mx9xUbvfwd8JCfR//u1nZA=
X-Received: by 2002:a05:600c:3547:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49fe66c8a33mr175216005e9.2.1790510533830;
        Sun, 27 Sep 2026 05:02:13 -0700 (PDT)
Received: from jernej-laptop.localnet (77-38-7-79.dynamic.telemach.net. [77.38.7.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001790022sm69199455e9.13.2026.09.27.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 jaidevshastri@vt.edu
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
Subject:
 Re: [PATCH] soc: sunxi: sram: order the publication of base against sram_dev
Date: Sun, 27 Sep 2026 14:02:11 +0200
Message-ID: <_KSVwOofQtuLLVcIRHSVdg@gmail.com>
In-Reply-To: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
References: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 22. september 2026 ob 02:48:49 Srednjeevropski poletni =C4=8Das =
je Jaidev Shastri via B4 Relay napisal(a):
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>=20
> sunxi_sram_claim() is called from the probe functions of the EMAC, the
> video engine and other consumers. It gates on the file-scope base
> pointer:
>=20
> 	if (!base)
> 		return -EPROBE_DEFER;
>=20
> and then walks sram_dev->of_node in sunxi_sram_of_parse().

Where do you see sunxi_sram_of_parse()? This function doesn't exist
in current kernel.

> sunxi_sram_probe() writes sram_dev and then base, both with plain
> stores, and the claimer reads both with plain loads. Neither the two
> stores nor the two loads are ordered, so a claimer on another CPU can
> pass the gate and dereference sram_dev =3D=3D NULL.
>=20
> Keep the mapped registers in a local and publish base with
> smp_store_release() once sram_dev is set; read it with
> smp_load_acquire() in sunxi_sram_claim(). The error value is still

Where does sunxi_sram_claim() use sram_dev? It's used only in debugfs
show method.

I don't think this solves real issue, so NAK.

Best regards,
Jernej

> stored to base so that a failed probe keeps reporting it to claimers.
>=20
> Found with MBCheck, a static herd7-based memory consistency checker.
>=20
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 2ccaeacf8..0e0b86ad3 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -266,10 +266,14 @@ int sunxi_sram_claim(struct device *dev)
>  	int err;
>  	int count =3D 0;
> =20
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	void __iomem *regs;
> =20
> -	if (!base)
> +	/* Pairs with smp_store_release() in sunxi_sram_probe(). */
> +	regs =3D smp_load_acquire(&base);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	if (!regs)
>  		return -EPROBE_DEFER;
> =20
>  	if (!dev || !dev->of_node)
> @@ -410,6 +414,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>  	const struct sunxi_sramc_variant *variant;
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap *regmap;
> +	void __iomem *regs;
>  	int ret;
> =20
>  	sram_dev =3D &pdev->dev;
> @@ -420,12 +425,21 @@ static int __init sunxi_sram_probe(struct platform_=
device *pdev)
> =20
>  	dev_set_drvdata(dev, (struct sunxi_sramc_variant *)variant);
> =20
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs)) {
> +		base =3D regs;
> +		return PTR_ERR(regs);
> +	}
> +
> +	/*
> +	 * base is the gate that sunxi_sram_claim() tests before it walks
> +	 * sram_dev->of_node. Publish it after sram_dev so that a claimer on
> +	 * another CPU that passes the gate also sees sram_dev.
> +	 */
> +	smp_store_release(&base, regs);
> =20
>  	if (variant->num_emac_clocks || variant->has_ldo_ctrl) {
> -		regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
> +		regmap =3D devm_regmap_init_mmio(dev, regs, &sunxi_sram_regmap_config);
>  		if (IS_ERR(regmap))
>  			return PTR_ERR(regmap);
> =20
>=20
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-sunxi-sram-41c3288a4660
>=20
> Best regards,
> -- =20
> Jaidev Shastri <jaidevshastri@vt.edu>
>=20
>=20
>=20




