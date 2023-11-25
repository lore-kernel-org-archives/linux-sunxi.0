Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEB1EB57
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Nov 2023 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmelTtVW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b2fa4ec5eso21296935e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 25 Nov 2023 10:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700938118; x=1701542918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SzMDeq8cuJF4iGMiJU+VHUL3rvnTgoje2vjhJHYf3M=;
        b=bmelTtVWZXcIrXTIs+LxnxOkj6wXnQ/4q+A/Fw4M2u9Nsu5m5YuYA9Vi3PdK7xSDGM
         4MjqxoD/TN2RwKKIt21gLEw/m4uvqXKpT5FDPfpEZRpSA9MgEVll53CAcEwgAa66xajM
         WeqoEtEV9peJdRUmdotV6/AC6hCEQP0aQBKlGsiF1ecQpX7AMa0EH3Wp4n+QIYvZBwpq
         lZq8Wi0XErrJJI1J3d8sr6rHNgnoQNx8JpEyYB6QdMIvzsHD4FoTE0mytR/ZlLYnoTLh
         dwuz+pOR/oRupr9vCwwU05xhe7mqLPGhdZpPKpQAANLb4CLn30gLe4/hcN0NOAKzgGU9
         wtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700938118; x=1701542918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SzMDeq8cuJF4iGMiJU+VHUL3rvnTgoje2vjhJHYf3M=;
        b=oHG256y0uvBf8a5da8fQrhzPt5YXUluEw8vyHYZkGA0bRxS/sdKeGxby75pQOy7j3T
         fP0yva7+22rwHcnic56o4p3Kcjo48R7kIG5GOk2FM6zyAGhutdVklWDeJbDLjHU+BnNR
         ZJkkHAQxmfOJGu9NZJFwnY+wl0aoUSNgoOFgs0SgVF8pTFyDNHXd/Tkb7zAcT8cXnRop
         s2sxFhbieqdik48mMiKd5GePIyp0j6/hyX6KgGb8APAcP1NdU5NvlC83zlymqyasv9gH
         yyMaTfYD/UFpzSDEyU2GGX+fjguuvmeXbnu8dxliUGNhZF4ClZwzIboswZ5Ho+8mlne4
         lwGA==
X-Gm-Message-State: AOJu0YybRcJGYR+60VjmK2DmDzCXRaTw9wchSZYK4yrKzwplQVrSH+FJ
	SoosGo3M5eocZemNutB106I=
X-Google-Smtp-Source: AGHT+IFeInfOx+70yaIqwk3UdjHO8KiZz0Ggp4tdjGhbYyZu1TqbbJipbhA1dexuK9jYndmtYvWdiA==
X-Received: by 2002:a05:600c:b85:b0:40a:45ff:fd69 with SMTP id fl5-20020a05600c0b8500b0040a45fffd69mr5382276wmb.19.1700938117285;
        Sat, 25 Nov 2023 10:48:37 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c3b8800b0040b398f0585sm6003890wms.9.2023.11.25.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 10:48:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH v3 030/108] pwm: sun4i: Make use of pwmchip_parent() macro
Date: Sat, 25 Nov 2023 19:48:35 +0100
Message-ID: <2706375.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231121134901.208535-31-u.kleine-koenig@pengutronix.de>
References:
 <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-31-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 21. november 2023 ob 14:49:32 CET je Uwe Kleine-K=F6nig napisal(=
a):
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the macro
> provided for exactly this purpose.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pwm/pwm-sun4i.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index 1a439025540d..44edf1ce5739 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -245,7 +245,7 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  	if (!cstate.enabled) {
>  		ret =3D clk_prepare_enable(sun4i_pwm->clk);
>  		if (ret) {
> -			dev_err(chip->dev, "failed to enable PWM clock\n");
> +			dev_err(pwmchip_parent(chip), "failed to enable PWM clock\n");
>  			return ret;
>  		}
>  	}
> @@ -253,7 +253,7 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  	ret =3D sun4i_pwm_calculate(sun4i_pwm, state, &duty, &period, &prescale=
r,
>  				  &bypass);
>  	if (ret) {
> -		dev_err(chip->dev, "period exceeds the maximum value\n");
> +		dev_err(pwmchip_parent(chip), "period exceeds the maximum value\n");
>  		if (!cstate.enabled)
>  			clk_disable_unprepare(sun4i_pwm->clk);
>  		return ret;
>=20




