Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EA40E8C1
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Jun 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781628881; cv=none; b=Ktp4HK3sFPEsevnIv4MmoGGR4TrcLCVe+FygZLGJyw6MmGRG9dqMhM/o8/qjST/qOBBIXULBsGQgGwrEdxhWqpYOTQnSHg65Gz5Pvx7RoqaPTIeQO6CfgzzAbe6TL0n2WKnnPmaDJGieI0bVyDk6tUDxq/VoImFHPfG2vUFTjYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781628881; c=relaxed/simple;
	bh=Q3ogCEiEplFsajmHh+DrlKd0CFRslk5VBsvGzlR4oX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nRJStPOecD/6Aw3Ed8keDb4EbvNkRZs/qfuYA1iDrwmXGgW50qFHT52E/v+vNG0nCR9O+/LKE2tZxrgDEVvcF22DKpLoOtT653orHRrSzuS7kxDPAxHpG87vanzmUFkJYkQA9BrbddfEismlbjV0nLuD/H+8+jMOHXbg3lP6bb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf2A9sK7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf2A9sK7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490afc47455so21987395e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Jun 2026 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781628878; x=1782233678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exFxm0hh9AfcFczlY3WuFGnTo6SOwxmm6hFx+zY5Z3Q=;
        b=hf2A9sK7cpzfLK5IWjAaCnJwcqOM9cbmO9XGL+jUnp9h5nx0VysK/tqSPCkJlVcb3B
         D6j2+sy8XwHtlmyjI1Y6j/9GxD+UpMFA7qi2K/KGDgZMryQwnR/ja4uQNt03Lu2EKS8C
         tuA+Mh6fGRqk73ONAlLWN4rRTHPSIw6/c5GVtaxtr4/DKKf8vBPBlWoOocG/nE9umShp
         UnFxAsNGWJfh/QZWpbFWN2AcJTzaE6MOGQrT+Kuw2yjXV38+G0I+fUbqMiwsrtlTaUfV
         ODNxV01AYx07gZq3qefC8cZOMO4+3iKrbYJbuJXuWNkmTfWG1Lr1I/0AyqJdczSyYcqk
         t5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628878; x=1782233678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=exFxm0hh9AfcFczlY3WuFGnTo6SOwxmm6hFx+zY5Z3Q=;
        b=DwEVO1zuDprIMXccFTQAUcceLaRx05dIW8OjF8Lw8ja+CYmw9JXYbr41bur3vOgMWR
         CDu00nsL6mOZxlBOtZcg8pL9g3pfnJ1j9jAxr/RKnBC4N1EcP4x8aq2oX6DhdJhNhtRf
         d7K/TJNn4XfUe1cwHdJd+YSooo/Hs8sEtG21sJqhbwX7Co+F6P/Qgxuq+WCa0gCzwlYZ
         djW8DKuomf+YlOsNuW80ytYu/hXbgOxBVISdwgZaiwTTmd22y4JQeOcE3OICrrw3eikZ
         HL5iuQMbtLjesihPQiwGxYWpRasaYVQkvRz4xYfC+4Zo2nwtBs26I/p8XMFkMFP6UbJY
         Snng==
X-Forwarded-Encrypted: i=1; AFNElJ/Ufew35DMawX/2swRvS5Vy614aUCAi3a/ng+SJp2yoLaNkqcdDOkDbHGWF0rd2yAP/bzY79MhdCFmvaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjgga4uRvWKSn+lTWU+HxJYy83bC4kkBwp+8mALre88QsVeLn7
	hr8AERElDWE2ehw6YZAKTYUMcEF7Xu0b3cr9g12CrDXxwEufRpgOCcXX
X-Gm-Gg: Acq92OFovVZEnX0QIWeVpGiY+0CRQvgfSiwkxOsOo+e9omcb+Ifq41sEkDlF//Fa8Zo
	3KHG3RTwFio0Pk3Ms3qvlbv8wasFjB1rbUn3lhDvUkIdl4S6QhAQialXF0HS0VdE6L+MhGrmCFo
	bD9Rh/v2SYFwWyLYDK0nHXb0nLo9uGksnwxarenGcUxb6WbO3OdVm/y6RRejkmYbXFVtpsZ1cOl
	/vfGw5W+E1YepfGeaBxa0Umg/T679MT01oIQUKKCzx1hkiN6sFYyUDERclEQZPuTMY9VZXbvsqG
	b7ScTWbU8h8hmSkag2OKdnKmm3UI8IE2yHhgJZ2LIlqH0iPm0gPYT6E90V+2MWf5Zb+GjcnEeqH
	cZzPClBH2F7zmdeW52nlABTJeQNJD5w21m4j/DSIPSKB4iyYYgUs89brgQm4n9py8u9X2rYUqNi
	2LogBg062veu/6W1s91iCoibGWgYFSttH+uQrtLCOAMC1lqUBzv7BBL5KOxfMGw1x+JXSSuvZFh
	H50Shxtk61HvssM8HjqLiCtP3h9ISXLlPgGKwCodqt7s00=
X-Received: by 2002:a05:600c:a111:b0:492:301e:3270 with SMTP id 5b1f17b1804b1-492333af267mr5549255e9.13.1781628878052;
        Tue, 16 Jun 2026 09:54:38 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-99-120-gprs.simobil.net. [46.122.99.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b1083e3sm1842555f8f.20.2026.06.16.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:54:37 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject:
 Re: [PATCH v3] dmaengine: sun6i-dma: Fix use-after-free in error handling
 paths
Date: Tue, 16 Jun 2026 18:54:35 +0200
Message-ID: <phINRqN0SQqjDvxjLw8DWg@gmail.com>
In-Reply-To: <20260616023138.15904-1-zenghongling@kylinos.cn>
References: <20260616023138.15904-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 16. junij 2026 ob 04:31:38 Srednjeevropski poletni =C4=8Das je H=
ongling Zeng napisal(a):
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
>=20
> Fix by saving both the next virtual and physical pointers before
> freeing the current node.
>=20
> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ---

This looks great! Thank you for your patience.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Changes in v2:
>  -Refactored the fix to avoid code duplication by creating a helper funct=
ion
>   sun6i_dma_free_lli_list() that handles LLI list cleanup
>  -Add Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ---
> Change in v3:
>  -Further refactoring to move txd handling into the helper function
>   as suggested by Jernej
> ---
>  drivers/dma/sun6i-dma.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb..7a79f346250a 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -406,16 +406,12 @@ static inline void sun6i_dma_dump_lli(struct sun6i_=
vchan *vchan,
>  		v_lli->len, v_lli->para, v_lli->p_lli_next);
>  }
> =20
> -static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
> +static void sun6i_dma_free_desc(struct sun6i_dma_dev *sdev,
> +				struct sun6i_desc *txd)
>  {
> -	struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
> -	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vd->tx.chan->device);
>  	struct sun6i_dma_lli *v_lli, *v_next;
>  	dma_addr_t p_lli, p_next;
> =20
> -	if (unlikely(!txd))
> -		return;
> -
>  	p_lli =3D txd->p_lli;
>  	v_lli =3D txd->v_lli;
> =20
> @@ -432,6 +428,17 @@ static void sun6i_dma_free_desc(struct virt_dma_desc=
 *vd)
>  	kfree(txd);
>  }
> =20
> +static void sun6i_dma_free_desc_virt(struct virt_dma_desc *vd)
> +{
> +	struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
> +	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vd->tx.chan->device);
> +
> +	if (unlikely(!txd))
> +		return;
> +
> +	sun6i_dma_free_desc(sdev, txd);
> +}
> +
>  static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>  {
>  	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vchan->vc.chan.device);
> @@ -788,10 +795,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }
> =20
> @@ -869,10 +873,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }
> =20
> @@ -1431,7 +1432,7 @@ static int sun6i_dma_probe(struct platform_device *=
pdev)
>  		struct sun6i_vchan *vchan =3D &sdc->vchans[i];
> =20
>  		INIT_LIST_HEAD(&vchan->node);
> -		vchan->vc.desc_free =3D sun6i_dma_free_desc;
> +		vchan->vc.desc_free =3D sun6i_dma_free_desc_virt;
>  		vchan_init(&vchan->vc, &sdc->slave);
>  	}
> =20
>=20




