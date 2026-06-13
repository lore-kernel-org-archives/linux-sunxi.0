Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC01547C0
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781336786; cv=none; b=k3xQzKW0V/fKnp+XTiI59+TxVHPEuyYavCqFqhMxgaBw7K5UCEO1UxZ4TsP9ciHz9SPIthQVDy7VDq9WaKc1Q9NMk1ugvt2ulNy/snK0krzya6DEG9BTiED27/vppp+gYw6P47i8McqMhgIC+PbXR89q9yr2hOAdZ1VNIMOWY9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781336786; c=relaxed/simple;
	bh=7fVG15Gm7oG900vnZ44bPuyYJ9HGjnOY0gNg7QGMuqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GnpKeCtGq7pj241LmG7PwinvtZZknLd7sR7qAMz7AFVxA0IguBsh4MIwQzhMEIkOO4qATup/PHAEewt6hpdan8gw9UFVabjzIe6crZqK03LecHBI+1K2hky8dpHNsH1lYg8iJpkdi9Bkm/wHUhozobHyhb32QC01Y0b2od2OXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3wsndfg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3wsndfg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490afc47455so7531115e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781336784; x=1781941584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veSLkLuVXjwdrZzfCCj4w9cK+dyeH9xMaJHceYyp2QA=;
        b=b3wsndfgLsfxiAkVfBORSnWqNj54THTlm5AcRWWs3sleU1ZUqEQUpG5BbpEyg30odE
         CEh3TjVG3DA7B40LW1VvTdwO5D4xkiBx6xLFgxoYdnax+7cza2AfDJvdGqieQM9FyyXn
         4BJNIXiGfQr5JjPM86yEP0dySOWwNvZTli2oGixXq2j5DW117olOP8N8xUncPIiCHfDV
         kjAT/z1KKjJsMCS/49fxMkGzqkQH7vaszXYTvNSnKvmSNSRgZGTdV/9WeKu/IkOnms0G
         QQaUj7GENuKCy5JlqIdDcte3a+gK0tojs4786VlctSD7yG/lZHljQWQVWz4B3aZRpzVV
         MvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781336784; x=1781941584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veSLkLuVXjwdrZzfCCj4w9cK+dyeH9xMaJHceYyp2QA=;
        b=PldSmm3s0ttht5WSPdOCWMDWZrgij+irKlG8Ptk3mPsh5uOAACv95twQrdQCF4BDJR
         Fxv//NqNL3+ta6D98N5rf6zVBwJLvECOSoiYT5vWO5xeyNuCiYH5P0SMofBecdPr8fj2
         pYWEFMqK+OIUVKYjCFLi10SKJgC1dLp8OKwD0oVWAt8oA/V9PGZvQshyBDVF9iPIu0na
         RV8yOvD0O3YH0Kj9s9Jyj+NFpn+iwDwPMZfcORdnl8fLMhThupSaQcCklN2AhALru8Ch
         jdHNJfljdjSI6QSCh8qVN5+ULj1Y6xiX10M7sJ3W9gzZA6sq9DvXS+YCdMlVq1p1kMsl
         f6bA==
X-Forwarded-Encrypted: i=1; AFNElJ+LpzBtbEnCVgHYKj/SaAz8gmxypJXzSgcITxDqdTyEVH3hWoRqeexMuHjk/4T36EMWgXRrS94L1VDGEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoTVUJOXX+MLZPyAtJvAn6lznN5l/+M1hgRjTNWtNlWhGvAuvw
	tLydHektho3U1NAyO4QnKTvXahVGeHjykeOZZboXn7E6+xFlE2hbjkscQRhRhQ==
X-Gm-Gg: Acq92OGoHwisAJY1q5nXxk4yObrFEeBwEXZ1SlN0QfT+UaVY28ClVrP6OwDmA/obz+x
	7a+Qe9rMK3G0F2xetumG/Nl038nXf5Cis9o2aX9lvNGFiPIsHuLCwh+H7y05Y62PhBzmosXdTCJ
	mpKRD8r5z5q+4c976nK+MJZ5jHn/Y4k/R9BSyGhbaY+2PtESZ5SzA8cAfpD9QbOudvxQoOyG7Zw
	Mit4hYK4FO0hEsb4o0ydefOYRZfK0XVmq29KE+f6Mqzrumm2P39B0n7CuOcxBjD2KMBD+tQ+kEm
	uyJx9FsunFN+2AVSwTTjpTYmBTv0vBAbQiQKwfbGXPUt/aZ6i+ejRsvwssP2D+MWmUHQ2TJQycX
	8s6PsnhmKnyMu3DYaxgFk0Ia7aLUH2t/OasRVEW8pvnCO1FjguX8IRdd5k3QM90AYmYb2/y2GRJ
	VL3/Z0N/vustTzlaWPpdWylvfIa3lefcj4diUjDbYpoCop
X-Received: by 2002:a05:600c:3548:b0:490:e196:e8e3 with SMTP id 5b1f17b1804b1-490ec501a29mr82066385e9.18.1781336783742;
        Sat, 13 Jun 2026 00:46:23 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm13078689f8f.14.2026.06.13.00.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:46:23 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject:
 Re: [PATCH] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
Date: Sat, 13 Jun 2026 09:46:19 +0200
Message-ID: <CyWPMXMZRBuYyL_Lpl2t_Q@gmail.com>
In-Reply-To: <20260611063631.96566-1-zenghongling@kylinos.cn>
References: <20260611063631.96566-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. junij 2026 ob 08:36:31 Srednjeevropski poletni =C4=8D=
as je Hongling Zeng napisal(a):
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
>=20
> Fix by saving both the next virtual and physical pointers before
> freeing the current node.
>=20
> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  drivers/dma/sun6i-dma.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb..eb9c4ae87ac8 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -788,9 +788,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> +	p_lli =3D txd->p_lli;
> +	v_lli =3D txd->v_lli;
> +	while (v_lli) {
> +		struct sun6i_dma_lli *next_v_lli =3D v_lli->v_lli_next;
> +		dma_addr_t next_p_lli =3D v_lli->p_lli_next;
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +		v_lli =3D next_v_lli;
> +		p_lli =3D next_p_lli;
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
> @@ -869,9 +875,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> +	p_lli =3D txd->p_lli;
> +	v_lli =3D txd->v_lli;
> +	while (v_lli) {
> +		struct sun6i_dma_lli *next_v_lli =3D v_lli->v_lli_next;
> +		dma_addr_t next_p_lli =3D v_lli->p_lli_next;
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +		v_lli =3D next_v_lli;
> +		p_lli =3D next_p_lli;
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
>=20

This is certainly a valid fix, but it's replicating what sun6i_dma_free_des=
c()
is already doing. It would be better to split code to accept struct sun6i_d=
esc
*txd parameter and call that instead from all places.

Best regards,
Jernej


