Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA82309B9
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098712; cv=none; b=PyPdpcB2Vg80bPffH5QyF4MXIGyLVeNHut9o/y6nzQVk+xR5/Wj9nrVoOqH/qcnKPtqx8idk/VZe7xLaRyG7ukExT97rMfv1ZsGN6CyZ+3ghY+cbk6Qimk/tODyKupi5L0zGA/B0CwF+JecmUEZ+5jclJxardk6xYFaMq4zUijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098712; c=relaxed/simple;
	bh=aSZYpogVJcVF1l/xXID+mUfdRe8mg1bAaCN9UZNml/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qISBmQLT/HIdTnW1AkZNOagVAHUWJ8w3R30LuZPqVlV4fDkxySaRRPcaDenx2KMOB9fnqFyGghzk2PSsKEJ1KGj6rf4uzL+M7mFzXQxv/A1dqmljl/0blQY0+l+j5gYOrltn5tdiYU7+fNTxfiaBw4A4y9PPVVBhhsBB2O2OmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk8kKrtO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk8kKrtO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b78a034f17so5129770f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098708; x=1755703508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIKzP+v10goqJv8MZ6hUQxh9iZh9GLNgEJG//KT6geg=;
        b=mk8kKrtOB8yxxud+nI6a6eZykVtNaFrRemdAo2ZJVleiacV3NIG0FlCEKjV7QJ0FNV
         g1MOa9bwpaBX+EMjwbTemUeSRxn0CnaEP7oeGzmJMCC+ol6A9Q+oioBM04zqhI9BWS0n
         KWO7PrBxc6CMLoL2enxKHbF/ZhiyeNsJRqbzBxpYiN8AWsxfojEYK+YAnvC8IdoztNsd
         YQLqg870oyzVjKtbnSFfhm+eXrhVMPhfIfixYivGv4aQx5Rtgo6PG+RJ0tLuqk9wuULe
         HkRjZgy8VS9REHy/BKYLwFlrKZfOEAmWin2Xc/MYgocBULmfPgaX+AgTQl+bTU+eFwW5
         +89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098708; x=1755703508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIKzP+v10goqJv8MZ6hUQxh9iZh9GLNgEJG//KT6geg=;
        b=MEQ0YK9rVjkpG9Tlwg4K/K80LpVt3fo4GJFqxtKJNsS/YltcP/geVxJx/Lf4nlCGLe
         cn3Xwa7VRsdJTqKo8zLn+g15AF6T81O1XDMjO5vnf3VzNUDC7ZQeylR3MXPsCtghER1P
         tcObkvSeNQ653YcU/3n6rUhjDZ0445AMFuNvbUbS6n/uRKtx+1mJarylxgBVqO+wxfxz
         tDoRVQ1wxBdGUSM9VskOubv9MtLonMH084DzqE4uQzafH77xkMsLvAdn2/sAuDxRmrd4
         gbuUOtykbjBzf6s7+gDfaaPjATtl+GOTKzXQjLmuBfIZgosEYcskmhvL2y87OnMLACgX
         U1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXzbUMcBgDqLcroOYKJrF0OGaDA8J7BQLSm5FsH6XYOKcUfFxK7p8ecETrCukwe4rDbw25KZA9xkV3Y4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKXOa/THQYzem2NGfHcg/bZhRkGq8DhVI1hJrLVTgCm1bdTVhg
	x0Ad5FD7HRPFs71K5Ocekw4N/H5izCGexZH+6L1u6d7l3yPPqSi0vrZi
X-Gm-Gg: ASbGnctvPy02oAC+Zq2UOxB4d0d6hYEKw98eTHlrkFjn2y6OzctFbbCn7IUQh5ObSj1
	aKlPy+eZBDIRKIzbjIYYC1rZuEmcOujLA5zW3OsMSA2WZc5Ql1mltc6O2X3X+onBjeaVmRY2SGG
	EYtKVnqwHLAT80SYJR0thWMkYcglNCgfp1txjgll8DFAYTSx4JWXTraGqHolbLbSJTvE+FUeStk
	myPS1EEsJ0zIiPhYkAAcidmuUOLqgj0sWr+Ze/U9zHE34KpZmQrFYsnxSJD6BnTU1UBcKtc6tY8
	P3wPUBq8OrjNNaEVXbZXRvRfWope/jyg833EjMmVoiJGMDdfxYrIg1xlRCHogFmTLDJ1KXRVQLE
	p0vzrXGLCQ1OKWPC8Y1g/rWQri2ekS/JVjDJPo5o+l9Im7BWa7NHIKZrJ8Da7pOaA28+q4jNIrg
	==
X-Google-Smtp-Source: AGHT+IFDK6njZdaYiIYPO/ZMO6ujPoE/G41Mb7N255M2MT+1frSU31mMtoR+dOSJ53Ri0BsuUYgPGg==
X-Received: by 2002:a05:6000:2c01:b0:3b8:d4ad:6af0 with SMTP id ffacd0b85a97d-3b917f14e1amr2572720f8f.40.1755098708425;
        Wed, 13 Aug 2025 08:25:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1abcd59bsm465535e9.3.2025.08.13.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:25:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject:
 Re: [PATCH net-next v2 04/10] soc: sunxi: sram: register regmap as syscon
Date: Wed, 13 Aug 2025 17:25:05 +0200
Message-ID: <5910992.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250813145540.2577789-5-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:34 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> If the system controller had a ethernet controller glue layer control
> register, a limited access regmap would be registered and tied to the
> system controller struct device for the ethernet driver to use.
>=20
> Until now, for the ethernet driver to acquire this regmap, it had to
> do a of_parse_phandle() + find device + dev_get_regmap() sequence.
> Since the syscon framework allows a provider to register a custom
> regmap for its device node, and the ethernet driver already uses
> syscon for one platform, this provides a much more easier way to
> pass the regmap.
>=20
> Use of_syscon_register_regmap() to register our regmap with the
> syscon framework so that consumers can retrieve it that way.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
> Changes since v1:
> - Fix check on return value
> - Expand commit message
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 4f8d510b7e1e..1837e1b5dce8 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -12,6 +12,7 @@
> =20
>  #include <linux/debugfs.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -377,6 +378,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>  	const struct sunxi_sramc_variant *variant;
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap *regmap;
> +	int ret;
> =20
>  	sram_dev =3D &pdev->dev;
> =20
> @@ -394,6 +396,10 @@ static int __init sunxi_sram_probe(struct platform_d=
evice *pdev)
>  		regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
>  		if (IS_ERR(regmap))
>  			return PTR_ERR(regmap);
> +
> +		ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +		if (ret)
> +			return ret;
>  	}
> =20
>  	of_platform_populate(dev->of_node, NULL, NULL, dev);
>=20




