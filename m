Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA446453
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719558501; cv=none; b=b7EV7DCxLlpGr+1lw6v/xgFYZWHf+2gWEBtVN2CJ0D9DUszBWewP4iYZ288y+8I8VCm/DLgxADMkNldcnA01b8mfONFYZwY9gpeaIm9OPpXF00Q3egc4y1xtArHOGCkcWJ++qkwNYC8ld3uvf9RWBgB/EduVP1J3JvgQR1R8lUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719558501; c=relaxed/simple;
	bh=IW4BvU+WtkslLV6DlrajbdSUd/DH91yJLMPSAG8b9zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDATsMcMfxHOqsX8QlB5A3vjExX8V++1UkGhypNNXo3l6XyD6xhZIfwVEpvWfHRpIxrq68tNXdl7XNlY/C+cNC4U6EgrW2jST8/dEgp+mRtO7Vt8smplAQk7Xoq3G4xMwiFppIS6kqXqkm+YEFBXd1gtfkXJhR4sZkkTAE39FxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdfb69724so318052e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 00:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719558496; x=1720163296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zo3VHVTl7gNC6GGZIm3/Sa7uX+11Aj0WDxqixq9tZw0=;
        b=p+0uvCANjnJm5Od9pakogafuJVZkS+ZCcyv672mRxI6DuQFcluPvJOPc4rGQ0n+JnI
         StTZH5R/TIQUHJcbXYpSDxIZwuDsWUOesAQedxiXCV58j4s3iz5rByf6lAtazh+EpaB+
         zbTMm92U4aqReoSCR5N2VgNEmhXnm0ERnuW2p0kYnGuVKLrRl6k3Mh5Q1Ht/lKMNmNKb
         9NpRAmVjfvfgeqJpGM3hgdGmnfI43uDGx2XVwY5CsulYD/6D1+kWfz+U9O1QAcx3P8F+
         e2ol6Bg12pYd0I77ubjAhfYgFOaEcglAqtjsXqV3nKiJKOWa/JWQgLVdoN9/8J0A4M3g
         iK8A==
X-Forwarded-Encrypted: i=1; AJvYcCUEZHjFkonY7bJR+obFSeTy/TDrerH9/XKLBpGhYdB5HHN0XRmo08eoyfHF28fGghwf/3VudZAaW9yBCtufnD+M+xtiiQwbQh0pZLU=
X-Gm-Message-State: AOJu0Yx1JfP7wLJ9Ih+c7sPOfWSB+eE/Iq7XpHSlIB+lHSrrRiV4SFl0
	gWxiL+UmKmH5Caa/DN6bbDLIWOC7h69rb6aCTIdNz9I1+/0AFCrKxq2XlCDmzBo=
X-Google-Smtp-Source: AGHT+IFguRyqbBEMt8fVkt53ET1YiNjawS5P3nqqSyUaGtQhzc+CF8K+Us0G1ZFplBIM9MtgcPe/8A==
X-Received: by 2002:a05:6512:2394:b0:52c:d84c:1182 with SMTP id 2adb3069b0e04-52ce1862c12mr11626790e87.64.1719558495996;
        Fri, 28 Jun 2024 00:08:15 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bad6sm185177e87.6.2024.06.28.00.08.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:08:14 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso2338061fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 00:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfPAy+OGMsJ5FqI97ml3Bhb4VCvwfWbACe1sLU+2nhvl+crRH5TOTC4fL2NEM5XY3VzuJaVbovQ8g/F1ffiYcUYmyJxzmTa8pPZPc=
X-Received: by 2002:a05:651c:1991:b0:2ec:5bb2:c230 with SMTP id
 38308e7fff4ca-2ec5bb2c26bmr125219161fa.12.1719558494097; Fri, 28 Jun 2024
 00:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240628061929.89273-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240628061929.89273-2-u.kleine-koenig@baylibre.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 28 Jun 2024 15:08:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67m7y2E1Kq8PM9AFYZvBas_kW4k_ihpY42nBTOqZqWJmQ@mail.gmail.com>
Message-ID: <CAGb2v67m7y2E1Kq8PM9AFYZvBas_kW4k_ihpY42nBTOqZqWJmQ@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Make use of devm_ functions
 for clks
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:19=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Using devm_clk_get_enabled() and devm_clk_rate_exclusive_get() allows to
> simplify the error paths in .probe() and the remove callback.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/devfreq/sun8i-a33-mbus.c | 38 +++++++++-----------------------
>  1 file changed, 10 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
-mbus.c
> index bcf654f4ff96..4c179d7ddf0b 100644
> --- a/drivers/devfreq/sun8i-a33-mbus.c
> +++ b/drivers/devfreq/sun8i-a33-mbus.c
> @@ -360,7 +360,7 @@ static int sun8i_a33_mbus_probe(struct platform_devic=
e *pdev)
>         if (IS_ERR(priv->reg_mbus))
>                 return PTR_ERR(priv->reg_mbus);
>
> -       priv->clk_bus =3D devm_clk_get(dev, "bus");
> +       priv->clk_bus =3D devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(priv->clk_bus))
>                 return dev_err_probe(dev, PTR_ERR(priv->clk_bus),
>                                      "failed to get bus clock\n");
> @@ -375,24 +375,17 @@ static int sun8i_a33_mbus_probe(struct platform_dev=
ice *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk_mbus),
>                                      "failed to get mbus clock\n");
>
> -       ret =3D clk_prepare_enable(priv->clk_bus);
> +       /* Lock the DRAM clock rate to keep priv->nominal_bw in sync. */
> +       ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_dram);
>         if (ret)
>                 return dev_err_probe(dev, ret,
> -                                    "failed to enable bus clock\n");
> -
> -       /* Lock the DRAM clock rate to keep priv->nominal_bw in sync. */
> -       ret =3D clk_rate_exclusive_get(priv->clk_dram);
> -       if (ret) {
> -               err =3D "failed to lock dram clock rate\n";
> -               goto err_disable_bus;
> -       }
> +                                    "failed to lock dram clock rate\n");
>
>         /* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
> -       ret =3D clk_rate_exclusive_get(priv->clk_mbus);
> -       if (ret) {
> -               err =3D "failed to lock mbus clock rate\n";
> -               goto err_unlock_dram;
> -       }
> +       ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to lock mbus clock rate\n");
>
>         priv->gov_data.upthreshold      =3D 10;
>         priv->gov_data.downdifferential =3D  5;
> @@ -405,10 +398,8 @@ static int sun8i_a33_mbus_probe(struct platform_devi=
ce *pdev)
>         priv->profile.max_state         =3D max_state;
>
>         ret =3D devm_pm_opp_set_clkname(dev, "dram");
> -       if (ret) {
> -               err =3D "failed to add OPP table\n";
> -               goto err_unlock_mbus;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add OPP table\n=
");
>
>         base_freq =3D clk_get_rate(clk_get_parent(priv->clk_dram));
>         for (i =3D 0; i < max_state; ++i) {
> @@ -448,12 +439,6 @@ static int sun8i_a33_mbus_probe(struct platform_devi=
ce *pdev)
>
>  err_remove_opps:
>         dev_pm_opp_remove_all_dynamic(dev);
> -err_unlock_mbus:
> -       clk_rate_exclusive_put(priv->clk_mbus);
> -err_unlock_dram:
> -       clk_rate_exclusive_put(priv->clk_dram);
> -err_disable_bus:
> -       clk_disable_unprepare(priv->clk_bus);
>
>         return dev_err_probe(dev, ret, err);
>  }
> @@ -472,9 +457,6 @@ static void sun8i_a33_mbus_remove(struct platform_dev=
ice *pdev)
>                 dev_warn(dev, "failed to restore DRAM frequency: %d\n", r=
et);
>
>         dev_pm_opp_remove_all_dynamic(dev);
> -       clk_rate_exclusive_put(priv->clk_mbus);
> -       clk_rate_exclusive_put(priv->clk_dram);
> -       clk_disable_unprepare(priv->clk_bus);
>  }
>
>  static const struct sun8i_a33_mbus_variant sun50i_a64_mbus =3D {
>
> base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
> --
> 2.43.0
>
