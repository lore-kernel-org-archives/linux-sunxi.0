Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9471C680
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Mar 2024 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709587976; cv=none; b=Itv++V8MbParKur9sFrt/oomAfyXk+HKBBs93kZEsRsNIE7/d2eUWPf4zzEeausll8xHSv1+C5H4kvtPU8S87LDF0NU3Mej6n5PFp9DzLInMeZlsaq73TzcrZKjgppiiwilm8e0zykhpbhZa51aZTTtp5U323+/E+5IAHHlhwdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709587976; c=relaxed/simple;
	bh=vUIE+PnbCHPY3yWhXZ4b5EcL/Br19znwg7t4PmplrAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuLgexZCXoWxHj+NNooMvSEVWZJTjCisWq0CqhUWAU3wlI22sqqHMNHZ3Ut5Oyn77qPSioLiOFT41Ap2ZXDtbo0r4To8GTrNdn7D0TjuKzGsB7irY0dEvLHTwaVFmRrxak3WRBlxKNDNLVJWXsw8ykcQZRDboGC9qgJLB6FX+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D85N9Mpi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D85N9Mpi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ddd1624beso3252059f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Mar 2024 13:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709587972; x=1710192772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gEfJ2Kg9284/c3Le6qMD+DwxWh1aoS/80hOyg6wh6o=;
        b=D85N9Mpi8oCvSh49rwJ59U6A+NE+qJ8ZNc4EDmK/jRPRvLu02+AxVbi1sIniNJqhFX
         MEQH4FMdxN36WxqZ6LWLNXQWDQsPqRW5Ttd3/YcsHtccoFpvSorhngg9cxNK3FWh86sb
         gOcwA8wHXgdHmUJw5HGIL+6tEmNWXnm6Lf4aqGyj6aECIAV73M4JupbmM17WeAkjmVFB
         WY5SYl4WKB4pd+AwkUQH5gx+76AWK0ziTcRELfv7FKWGoTmNMrMbJCMLY7MEfH9fwwFX
         piYphhbrxTZKs86kkb1RA2rvU+4k8aiO8PphF7a9iR5LabYeNXqlQOtvUuXaGE7XhDHi
         2tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709587972; x=1710192772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gEfJ2Kg9284/c3Le6qMD+DwxWh1aoS/80hOyg6wh6o=;
        b=tqIaj0Sduz81n2GPLrFfnFoVQpZJskEHhbMd1y1BQS/d1vHP5AWa5ckfvreVuiFrEj
         UZI7TdHf51a7SjwySgmNEh3/fm5HmJtq3SITF3nwsQ3KsIr64qC+vQUDPJLL0Hed5VOC
         F4Ihagr9aUxkAVc9DTBFJHIhTTSF5vgp+L1yp6UDCMsNFl+QKp/0MpX73gfWrUNQe7hg
         x8aQBhn8B8NZ1h2i1k7e0/VDDj7lUOkjYJ20lNfl/TK4xXAiGfWpABmxpxYVIPFYhlcn
         iPyxavzOpNCsvHKTmMsnxj3xrmfqgyIlCykpl5FG0R+5eegG613cPNJjX5auy5c7W2go
         Y8ow==
X-Forwarded-Encrypted: i=1; AJvYcCWi8IGLBKZ/pzIKJsrN7imnB3JxzsHTrOBcMa2TgPDSTfjBKUscKwOlkx8KVimRq1dKjiPrGwdOKbXldShcbtTlcrAZmLcw++7uBQI=
X-Gm-Message-State: AOJu0YxAQsZ8XVLY/0eVYawVoU61pWcc1DTE3NEAXf9Z5D/euiF/zw6u
	PaPJnD50yFtmQcLzF3k4WAQArxkV2KTuvityBt9TMKZ87d34nD1eZzXmggy/
X-Google-Smtp-Source: AGHT+IE8DqAnRoNBogGFb/riHiJFzj/xl1Ztb0tsaT8WRbkyPQ87GhcWCrkRQmVMiZdGWnSTZyDn5w==
X-Received: by 2002:adf:ca04:0:b0:33d:c45:15ec with SMTP id o4-20020adfca04000000b0033d0c4515ecmr643795wrh.32.1709587972146;
        Mon, 04 Mar 2024 13:32:52 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id u20-20020adfcb14000000b0033b7ce8b496sm13078199wrh.108.2024.03.04.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 13:32:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 5/5] PM / devfreq: sun8i-a33-mbus: Convert to platform remove
 callback returning void
Date: Mon, 04 Mar 2024 22:32:50 +0100
Message-ID: <2719174.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <0ca3f35bdf9549ccda7c6c10a476f28350d987df.1709587301.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1709587301.git.u.kleine-koenig@pengutronix.de>
 <0ca3f35bdf9549ccda7c6c10a476f28350d987df.1709587301.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 04. marec 2024 ob 22:28:43 CET je Uwe Kleine-K=F6nig napisa=
l(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/devfreq/sun8i-a33-mbus.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
=2Dmbus.c
> index 13d32213139f..bcf654f4ff96 100644
> --- a/drivers/devfreq/sun8i-a33-mbus.c
> +++ b/drivers/devfreq/sun8i-a33-mbus.c
> @@ -458,7 +458,7 @@ static int sun8i_a33_mbus_probe(struct platform_devic=
e *pdev)
>  	return dev_err_probe(dev, ret, err);
>  }
> =20
> -static int sun8i_a33_mbus_remove(struct platform_device *pdev)
> +static void sun8i_a33_mbus_remove(struct platform_device *pdev)
>  {
>  	struct sun8i_a33_mbus *priv =3D platform_get_drvdata(pdev);
>  	unsigned long initial_freq =3D priv->profile.initial_freq;
> @@ -475,8 +475,6 @@ static int sun8i_a33_mbus_remove(struct platform_devi=
ce *pdev)
>  	clk_rate_exclusive_put(priv->clk_mbus);
>  	clk_rate_exclusive_put(priv->clk_dram);
>  	clk_disable_unprepare(priv->clk_bus);
> -
> -	return 0;
>  }
> =20
>  static const struct sun8i_a33_mbus_variant sun50i_a64_mbus =3D {
> @@ -497,7 +495,7 @@ static SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
> =20
>  static struct platform_driver sun8i_a33_mbus_driver =3D {
>  	.probe	=3D sun8i_a33_mbus_probe,
> -	.remove	=3D sun8i_a33_mbus_remove,
> +	.remove_new =3D sun8i_a33_mbus_remove,
>  	.driver	=3D {
>  		.name		=3D "sun8i-a33-mbus",
>  		.of_match_table	=3D sun8i_a33_mbus_of_match,
>=20




