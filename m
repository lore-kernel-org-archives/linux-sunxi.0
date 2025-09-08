Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2B530BF59
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Sep 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339410; cv=none; b=NmMGJGNiT097bAqHy/ZIcRzftZ0Ka9gAU6WJAOXkyzMRAWOoP7D244BRX7qNGsrKod83yyczrqxMdnU46xMhZyG+EEQp4a3EivqOQIE0zoeDnIOQBso/8qhSCYTSDutSgzn4xE5/aDWhlV33kEALMcN5MfvCfEG0z1MFFGmv+vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339410; c=relaxed/simple;
	bh=NE9xksFOdVcKp/dgIaAUqQMJQQJUL7f/VO008GPiXck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldbo6aW+fk4hs6arIHNEO6Yncx/ttol7/2aiu25fxhc1cUul68qUytEy7npDjJKZWR6Wg+EeShh2Wjk3Fo+RPTJdxxCIKDS9m6TWmdD0i4yH+EdBFzHSHt1uV/DTfosEBAyPmwJdI/flyYFBnQ8zb48IDiUOyHGiwTIq6VZgHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cb8L3Yk8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb8L3Yk8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so6157235e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Sep 2025 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757339407; x=1757944207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7veukEnVp6GrvfVjkMK+b/oGtMaJi6sCw0gsjNd6Qs=;
        b=cb8L3Yk8HGNMmkpuKSO2Ell24s8KD9maj740N9w5ajMXFgDBjw5BJKsRn/4OQ27gb+
         /sEUzHa61FZRk5LjJHS17uDU0iz6iTxt81LtTeWuCJwqy+7B/QCSCKpz/dLspSOomVgl
         +PkV9tELhrjMa8r/FNKpk8weJptvcrPGBC98qHFfcl1gwWnKYladHGi7QfZ56vRGJ2R/
         eBReOhkTaRY6kdLjxrh2wmXkk/fz6GhrKmjTHU6jQVjhHr1lEsFzk/qd7uzMD0srZHb5
         qbk2orw+VKvHlQjr+VKFRi2Bm4iKk58BYs1HISznByldBneqPoMAeeXbEIsHTxl5z7fF
         3dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339407; x=1757944207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7veukEnVp6GrvfVjkMK+b/oGtMaJi6sCw0gsjNd6Qs=;
        b=YVBFqfAqr9fRrdON83o+rpQKhcMIdiuBFYPm9pLf+15lF+sMi9o7T5VbCmW2HlXj8z
         r+f+zKTGNGT+I5TTw1J8Jt8SpxpENmZ5PYf5C6yMU1+mTrFduV1H/qnTALtCUZKpH24n
         pGLxXuBEcF28sM7GU0Pm9w2RSy8zMhNEeHCbqwh7sMLNYGjdx3Bo4A8gEaJ2aWBNJzqb
         I984qMngoQWhgRgVByn5l7CBV2DYH7N5KMtWcdpny/dQi3aVrj3DTdPgpcuXeB2ARz0d
         RtLfLGRrRlyi77F6ck1lar5NZTCVDZZaOCrv+D/rt71dIOlZYpwcyme6HT2NnYhkiSdP
         kPLw==
X-Forwarded-Encrypted: i=1; AJvYcCWmUu/A+AaHZ/N+O+BtrDhrGRXKAfhSwIRBF5sYiv9MNFvtmKnOzeJNAPHyZ8vTFXnPj8RLq/Ge/EM7Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ+5zG/H3IwYfdKpZZAh889/ROzcmxFcJk9C5dBdOZ1NITPS/M
	0hQxiJQGc3BPxonHFBpiVZ7xu4VZU2iTOlo9Qff+/aX/64FEi6XJFXnU
X-Gm-Gg: ASbGncv4kAeWybMOtbMXdqvHiCoPFI842t8D191ebHNP78RGWA2IbuLCy7Voq1KOC8M
	lM82z16aoxJb52EfY57A+RzcaZgBAU7t+9Pl18Ehz2n//YNUvSV1zf1j1Ui5kgkSXW25NKBG9f9
	2ksbSrE7dKY2NKnUr+vq1x6uozug9ZRzrfhPlyGH0Axu7Hu/cTP1xmiFm0TsClGVOGgmA++Tf3Q
	ewOSsgARb9cuDvryoANHmYmO8SgzyiYCnCdyU4IS6IEuAaGSld1zhxTQiJ+Rve3UxcMF2JghRxL
	6dNx6VXUKaKCXzsKKFFzUMVGt81Slb/39PnZOAMUsFc6MRFEgTLFC/MudBpmAjdGgggoN8MgPka
	fBFp4u1kSi9EwiVRwoACr6NeHvvpZjxHFrWSU+AFuoqilb6iNMcX8kdc29j71PXq8hwpJ0GG2zt
	Hp7gNKI37e
X-Google-Smtp-Source: AGHT+IFnQTfMAEk7b1oBy07c3ZuOKtJCPSX+KHHl8137PXEZ2FG0x48RG9TfY60Fk0nPHOU7Rhd8EA==
X-Received: by 2002:a05:600c:1e21:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45dddf7762dmr77422515e9.3.1757339407154;
        Mon, 08 Sep 2025 06:50:07 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd8c09fe6sm63715885e9.9.2025.09.08.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:50:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: ulf.hansson@linaro.org, wens@csie.org, samuel@sholland.org,
 Xichao Zhao <zhao.xichao@vivo.com>
Cc: linux-mmc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xichao Zhao <zhao.xichao@vivo.com>
Subject: Re: [PATCH] mmc: sunxi: Remove dev_err_probe() if error is -ENOMEM
Date: Mon, 08 Sep 2025 15:50:05 +0200
Message-ID: <5918619.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250821091721.546580-1-zhao.xichao@vivo.com>
References: <20250821091721.546580-1-zhao.xichao@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 21. avgust 2025 ob 11:17:21 Srednjeevropski poletni =C4=
=8Das je Xichao Zhao napisal(a):
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.

It would be better to print error message rather than dismiss them.

Best regards,
Jernej

>=20
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  drivers/mmc/host/sunxi-mmc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index ee4a65b0a22d..8dd1d2409a26 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1371,8 +1371,8 @@ static int sunxi_mmc_probe(struct platform_device *=
pdev)
> =20
>  	mmc =3D devm_mmc_alloc_host(&pdev->dev, sizeof(*host));
>  	if (!mmc)
> -		return dev_err_probe(&pdev->dev, -ENOMEM,
> -				     "mmc alloc host failed\n");
> +		return -ENOMEM;
> +
>  	platform_set_drvdata(pdev, mmc);
> =20
>  	host =3D mmc_priv(mmc);
> @@ -1387,8 +1387,7 @@ static int sunxi_mmc_probe(struct platform_device *=
pdev)
>  	host->sg_cpu =3D dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
>  					  &host->sg_dma, GFP_KERNEL);
>  	if (!host->sg_cpu)
> -		return dev_err_probe(&pdev->dev, -ENOMEM,
> -				     "Failed to allocate DMA descriptor mem\n");
> +		return -ENOMEM;
> =20
>  	if (host->cfg->ccu_has_timings_switch) {
>  		/*
>=20




