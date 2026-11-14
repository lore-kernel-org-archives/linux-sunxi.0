Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676757;
	b=kd7KfeAB8g6aKKmi1zjdoJHnBulHGsfj+gTXib6vLYYcSKn0Tp1G77M8oRL0Ue2mOP0I
	 ayQeTAtrLgnW6lzZLVWzkaX3SDkuBfcqafjlNciBDNc3KVeSdE6/t/RnLt9fze0Pc+QoI
	 LvBPKpGWfOzS78Lyn5NCSQ/T4hI5TqiqSWC3vcE8N3SHFYEh7UkXxsQsL1vrFeL+fMaVW
	 CTSvjf46tlfc0qA1/Hhz4RFkcH7XxRZQy0TTFa20Ar5DHz7bXy8KHC8c8YPyXfoBOtDsG
	 XhseXgwvPvHPJi15miskTnfhhrALz4Q48dKMifHFSf8HzL+auSVFOg/fAIjhVTxAERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
	b=WhOZvtFqrh8h1sc2b7cZHb3Gy5VQphAR/8SWbQxdBXNV85CGztpLDm1Wgdc/qQIp2I0k
	 gIP8wF2SIrKjGCtY3fdMFPqIX7bh8fZ8AqtuPlbjMMoLOEGgF7FnnXDaYkY80tx4h3C6z
	 Kg60dRIDEFKuuOqznR89q6zrKCnsAYsJicSCYaZIddJcjk6KwQXNdlq8jF7WQbJjKpys+
	 vsycyZgz+9JxG/BnLA5GUTdaxefvsRMITvgAVoW0A0NTZwas0+WbkHZma+OlgFZRQtOpN
	 9gSfy1nMMu33IX8j0Gh4n8FgFjL2V7YN1iVEzzbmI5Dc3Rkr2BfFZe/ZIB4WxFevBAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFQR0NuP;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21681606A323
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 17:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21681606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFQR0NuP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12084185e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 09:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676754; x=1795281554; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=XFQR0NuPkeJ8h12qShzb5zgj8tETD6d2jb88sCtbC5MkL8D9Ct5devXHSPbfZmoo1n
         bJeUKirhTvXb0NCxZuf/K8OQUq5ebkuWuCfaodtFKsPpBpc2NulgeVlp5JbtSdBif5rx
         k2YMecmzlDoDbcHhoBx7Jb+zoC+6dCAFcbMq943iXzC+N9VaIUoUYd+l/GyjOaM/eGhv
         +s/LTSfpAv9lXw8MdC13CpT4VncazzFUb1XRQKP+/u/q+XPpyxvyRboOW1BRe+HhR1s1
         z/YDaa2UXlIy3XBr+m3I6ZAIYeE3ZOjgh5Fprm24sQT7kYkoubIGi+aQPwQSz/jmshw1
         UcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676754; x=1795281554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=PgvvOPx7LPMpCiAGak+zSX7vOi6Zo7xEaAo3nps51eTJ1OQ4J/DdfjBbX0T2HVjzd6
         RlGYIU6fm7Pp4rPwicofQZceVU2ugW8H8DonyYxpbv8iFknamZ6J4AK/yK+qu5yEYDhv
         kBKd69yBNSGcBoA/VYF8GyNAM6ZGo6Q9EhQh0mYjco1AFF0LE3H3kFNp10gFnuB1cIbt
         86901YPgc8QpHlqBrAEn27z7FFIGwd4qIa6sXhx1Ggb+kUkEQ7ajxPyVTwmJB5/Y21Ck
         k1WSp5EFc3ewAtMA1ZgVxEzAWAGMQaH1dsvxORCfaZcq27JdyQu3HJRhGtt9f49ZNq3F
         6vPA==
X-Gm-Message-State: APuU4Z/Wbo7vRZ0SZUbY/H42qA+MTKcSyO4AnghMBrCwakRqWlxmfJy7
	o5p6eNfd2ejQDj8UD2Z6FkSLLwDjFIK0OveNFlQ/sKuqBevVfqXT+0R0NL409w==
X-Gm-Gg: AYBFou2xaPuFnmgFU3SxTbxtaGcRn5qGam2go+JrekKspMnTCclgJ5DTLktexnL52WY
	0ixz5vbESQS6RiXmBtYum4zPAXpyO4zuqZ8R9pkhylC4yOUyiIl3J6SX4Irrenc0dDImYkWT7ng
	yyFVLt6GrohO7y2wSr8PzGairCoyHlu9vC4g0uyh7bfCviGAmdO1mTBljS2oW4XNfmDE5QeEOP1
	7da015voaCC0Ss5Xq7DNzCTd/zzChaHyxuwckezOV1hPs27A3YYp1VgBG1tlRVRl8aVdoivOSif
	nM846lbJn5kxD0Nu+tAPiYSjwScXng23cBMM9V1l91OyLEx04JJoJi5E9ag6hnFYjT+vZ+ivGax
	t4nfLE0nLmfQOo5Cuim2Vlc1Vbx0HpwzYaoZhOxmewUNKGpT85IHEOiVqMb/xbqmFV0Qq+Gh7mu
	d2mAod+H06X83zYwwgnLWX+tzSqocsA46rQeBKeYWxURfLQqGGlnGJ5Muz6D7Y7htJ8icDbuYqf
	pBhIoi2ShSHgbX4GJHjJ9wNm9z/4Bxt59dCzzLUzNroUXpOcgBtUvO0i8hInNIDzBgxDYOSweJL
	lwJ87Wfg0gLJvuLCTLXhekJ8sRX+6Wf5HD7usuuzjRvu3tMeYYMRuDMQrb5qtBwp0u04mqpDInJ
	y8KSRfXsv9U5puaJbwHyd02DVIHw/ZgUMq8pXK/ebnneLzu1v9tNfmN29CLK9ygrB0pqKLZ9vKO
	8cFnpERmXYgUtUGNSP0cvA1CSvqpYEi1tqHRq8naadWaQvrTWe1xu2zQzfXd6JLJqCChKsQt5fL
	KUzqi+qvGJYZbs8sPam76/h7A==
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr132258135e9.30.1794676754290;
        Sat, 14 Nov 2026 09:19:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm20031827f8f.7.2026.11.14.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:19:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>
Subject:
 Re: [PATCH] iio: adc: sun20i-gpadc: Use
 devm_reset_control_get_exclusive_deasserted() in sun20i_gpadc_probe()
Date: Sat, 14 Nov 2026 18:19:12 +0100
Message-ID: <lGotwwBTRaeZcOCAphaQBQ@gmail.com>
In-Reply-To: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
References: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 14. november 2026 ob 18:08:10 Srednjeevropski standardni =C4=8D=
as je Markus Elfring napisal(a):
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:55:16 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index baa7661db13b..070d061572c6 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -157,13 +157,6 @@ static const struct iio_info sun20i_gpadc_iio_info =
=3D {
>  	.fwnode_xlate =3D sun20i_gpadc_fwnode_xlate,
>  };
> =20
> -static void sun20i_gpadc_reset_assert(void *data)
> -{
> -	struct reset_control *rst =3D data;
> -
> -	reset_control_assert(rst);
> -}
> -
>  static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
>  	.type =3D IIO_VOLTAGE,
>  	.indexed =3D 1,
> @@ -225,17 +218,10 @@ static int sun20i_gpadc_probe(struct platform_devic=
e *pdev)
>  	if (ret =3D=3D 0)
>  		return dev_err_probe(dev, -ENODEV, "needs at least one clocks\n");
> =20
> -	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	rst =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);
>  	if (IS_ERR(rst))
> -		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n=
");
> -
> -	ret =3D reset_control_deassert(rst);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> -
> -	ret =3D devm_add_action_or_reset(dev, sun20i_gpadc_reset_assert, rst);
> -	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to get and deassert reset\n");
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>=20




