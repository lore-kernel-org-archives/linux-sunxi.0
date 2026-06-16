Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD62466B5E
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Jun 2026 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629170; cv=none; b=qG83ciB28xjVIbQI571NgSyuGeo3p0kCTAFyrAto5FYyHFToguzDyTMVuEdlIKkdIYlSP4u9Xs/9b1XhfoWqiTvTSsIit3Ev+COR+brVY38tJq9Z7EIMeYrclzc+b3Y7ANUg2Ly5V+86HygBq0B25VkEd8ZL7V63eMiESHA3ojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629170; c=relaxed/simple;
	bh=RmlQGoLfci9osWvKrydhp2LNMfnznzpLPtUIkwc+vAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuFNGFa8mdMTzx0fv3B78HpzJX+bY9zkuOu8SAo94ESWZWZui1kaDUowvzoXLxeb91lNgusfGRYvkWn808wgFOrD4YpnqYInG/KtxsX+5PKgmTPNIa3oxIsPe4PomlR5yE6lmKacrU9T7XCguy4eFV7jDPortJKFKZ9Hz19qRmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax96FEQa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax96FEQa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so33819415e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Jun 2026 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781629168; x=1782233968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2MzvP3M/Lvdf+YQEoRrr/63qV3jwcTxyyvjTUVpfjs=;
        b=ax96FEQaGsUlJkOH5uDctLnno6qFQouTJ5/8MGGOpQWzMAUFcKywqum7OgwshkQNT1
         LP0A8w9J3Ab6RTNQ/wHUGRd9ISZc5Bdnvd5vCojv3rrsa3T9j6iWkkKvtlspCcU/fJhS
         ekQnQjauvHkBTKoo7saj8mQsf/9b7zisvU25Wr2YiSJmqPC3Kvnu+sIz51RNylxZtvZ/
         FbtFy2ZIf6WxihUJoJ23JordSSJoa+OZjfy02c/jdzUWVoRfK4I9izKeKUvoFWpikgyY
         Aqsg1ul4qbxHd5Axc7xLocguPEUo26OVoJ7E5uyGjIb/3Xy/PYyp2afN9WcMC/SdUJkZ
         hAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629168; x=1782233968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2MzvP3M/Lvdf+YQEoRrr/63qV3jwcTxyyvjTUVpfjs=;
        b=KxKXvpEyIo4XPK7gho5vktxgztO/dQdsfSHmikvDNn3u+A4rrzT+zBRwOgSftYGy5t
         Fh9d8kNA1sq3yvHuzP4EQRmrTuB+UBCZ00P8+0meQrOoDoDkbWW0H9JEfvgnv0xw2oON
         mDd7Y9lEcepnKl7GIPbg8FRHtXUzm82dgHLFHDOyBKjIp8wrLMMq0lW/GwWzFlV9V30l
         5NQ34HuZ2NMxbe4AvY12Yyx16apfWM1/rlK2QlNH9skYiZ9+P+2QDJZ+AAEzNXKpVmPW
         ia2wYsrIfHuuAp19K5tZ4iXAtLop+eKma9iB7BJld8I8yZMQ7JT6sWfOiwzTi7L5efVR
         tWKg==
X-Forwarded-Encrypted: i=1; AFNElJ9slP64QlmU+SrB8NkStXsQEnFWCBAJH4I0camTGFuR2/IYUOAE2AlfV82Xbq2Hp0xGEGhjL9wLdTYqoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwN6HXTdq7GEXaQxGHaPmtkLj6SP8Xxih95S+Cc3uZ1DMEvOJyJ
	S4uQqsr5IWCW3plT965gTKa6xX4XWaqxVYwTSexBg5+HdUDhGVt77lbvHUpBbA==
X-Gm-Gg: Acq92OE23I+AaFk3ynqaegH6difSBQGRGV0AI40nq8aR3jRGcAAPf7tK7ftzG7UQ2mh
	CAe1ohqEpWrM+TKRX1wbcUJznAk1XVqnR2XGF2VEDKb9DnEumfqxGM+Tv1pZdU481WEWRNAik1v
	72lH/T/UMy3n9DDOOcqajaueEO6dU35wEAzBYBxI9i3V5eOaTXNQ/CBY+gPn6yFCpK9uSCUHfX9
	5Ln8P6B3xnMXWFbE27R9z5qCApJ9OXelH2gP+Nf2qxpxNWcC0NwjcXjxdlFihoGgNcskjJn+6mA
	vSF15BRb7xeiL9iyfzKzz1qWrQBZVNOD6wC40BRFSwYy5NE/biULrSQnc2n47A052cHbYtJXTTH
	EJAaduQ710ENmW3+/ahwVh/0m0CudI/2UQJlaSNMW1lu0i7G01igxCWXmT/oUFl061lpRfVNIeO
	fqhKXkaOIHsVNW4jge9m/yC7RJoAYkbX/ZWSiPqhj+rYblsg8WsXTUOUe/x4ZwRHGo47benXOlW
	bq5bdpN5UWZl5vB74LPmJrRckMfX28ByPnD
X-Received: by 2002:a05:600c:3b02:b0:490:6237:521d with SMTP id 5b1f17b1804b1-492333a8e2cmr6254255e9.13.1781629167571;
        Tue, 16 Jun 2026 09:59:27 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-99-120-gprs.simobil.net. [46.122.99.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa890d8sm103698875e9.10.2026.06.16.09.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:59:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject:
 Re: [PATCH v2] dmaengine: sun6i-dma: Fix memory leak in
 sun6i_dma_terminate_all
Date: Tue, 16 Jun 2026 18:59:24 +0200
Message-ID: <9Stif-p9RWiht_4RVVcSpg@gmail.com>
In-Reply-To: <20260616060449.42225-1-zenghongling@kylinos.cn>
References: <20260616060449.42225-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 16. junij 2026 ob 08:04:49 Srednjeevropski poletni =C4=8Das je H=
ongling Zeng napisal(a):
> When terminating a non-cyclic DMA transfer, the active descriptor
> is not properly reclaimed. The descriptor is removed from the
> desc_issued list in sun6i_dma_start_desc(), but in
> sun6i_dma_terminate_all(), only cyclic transfer descriptors are
> added to the desc_completed list before cleanup.
>=20
> For non-cyclic transfers, pchan->desc is set to NULL without first
> adding the descriptor back to a list that vchan_get_all_descriptors()
> can collect. This causes the descriptor and its associated LLI chain
> to be permanently leaked.
>=20
> Fix by ensuring both cyclic and non-cyclic active descriptors are
> added to the desc_completed list before setting pchan->desc to NULL.
>=20
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 =
DMA controller")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
>  Change in v2;
>  -Add pchan->desc !=3D pchan->done check to prevent race condition
>   where completed descriptors could be double-added to desc_completed
>   list, causing list corruption
> ---
>  drivers/dma/sun6i-dma.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7a79f346250a..12d038ef5f2e 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan =
*chan)
> =20
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
> =20
> -	if (vchan->cyclic) {
> -		vchan->cyclic =3D false;
> -		if (pchan && pchan->desc) {
> -			struct virt_dma_desc *vd =3D &pchan->desc->vd;
> -			struct virt_dma_chan *vc =3D &vchan->vc;
> +	if (pchan && pchan->desc && pchan->desc !=3D pchan->done) {
> +		struct virt_dma_desc *vd =3D &pchan->desc->vd;
> +		struct virt_dma_chan *vc =3D &vchan->vc;
> =20
> -			list_add_tail(&vd->node, &vc->desc_completed);
> -		}
> +		list_add_tail(&vd->node, &vc->desc_completed);
>  	}
> =20
> +	vchan->cyclic =3D false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
> =20
>  	if (pchan) {
>=20




