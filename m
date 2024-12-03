Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA02040BC
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Dec 2024 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733240216; cv=none; b=ZplCPxb/i7DcHpBrqh0PxtGruaU+jka4s74c0GNCpYYSXiVeMi47RpSzWvy4DMHD8+X1RyNzFemlOhBN8lKUtmvezxxW8oUtS/h+gEWqmHqW83CKXpjY2fkqegRT5JzIcLBI49uGQeaG0R6uwz18LWb6vWlqr/bDxaaiV8yOsKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733240216; c=relaxed/simple;
	bh=8cI36BzhHV8HgXQu/TVym++uvxOl9i6AEwSINrhZjEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6vruKJHm7aHen+Hn39wUsv1sTCbWuM09KL6agJNhSd8N+dpgt/XXhiQEabi6UHgF23dTCcxYxy1bNmyV1cgiPhE1hIYrcocg4Y39hNF6Es4T7sUON+7MfqpX1I4Fzgly4FLiPTwAe4JBc7I3ixJudBL1g9WdEXzMH0eB6oU2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df80eeeedso5876597e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Dec 2024 07:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240209; x=1733845009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dh6O5hcOma4p8AZfLng5WyXnPkEX/xU+8B4IUyvO9lw=;
        b=e0H3VlUj8LGFxiUnhd2QddjjMjW1K3M/Wyfu4yw0KeBImQ7oi3vtiY5Hkhwyg7WXUV
         qWimaOA+AY2Wh6HN1zD5NN93myIC1fazBkwvAa23mZq/Z5qo+amNPWHZVYrDwEsd6IbD
         fGF4LdehhOm9V7uhBqefjRf1P00OpIQqe7qegVJlt4DM8lvOLq/zKWBJqABHoBUkHZMN
         qyRKUCAF8+FmuO2V4NImbmAesV4xoHW2aPokPBBzLh+rfuIrn0vHfMwq1F7X/iiy9T20
         sIitS01ZEeyR/jrdW9lRsTGJKjNC0C2SidOFv5zCRWUtNA008gxrB5Q3QmydGiMO44aQ
         75XA==
X-Forwarded-Encrypted: i=1; AJvYcCUT5+t2+EQXO8VusAHttfJv07SvJG/lYhYY2TVftlXexE5R7u6o2IugQJiE+6g4K4Rx1EvuXKltl1k5FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHiNN47HfBcB7z9qs1D7XCNwCvzesn2l/a3xil8FkUuFvaWpq6
	o9iTpIt8ZNzUP4Mrel7vyd+lufkDuNbvaHpsuWq5MKTiRgJCk31cPSeofr9i
X-Gm-Gg: ASbGnct4WgK+idiOtbpTYZ25sw9e67HYXfQ8EG+b+bS6YoiIWe2kKZU2FWi8fuZ5tQz
	Fj2mwfn3LRJlf5NRzgbqy7esdRa+1cSjN98IsI1Yttk1+iKavUo35GhqdaCZJzPSGIR0tikOLLW
	rfjlVWom/6kJx1CX/Cw7GJ1j4DoDxb7InjxusUxgQtLVlSXpVdK/6F/uypTiGqTPmpqW1ki9fS6
	dLsn87Bj3D5051jOSme1iRl6mAJha1P+EpqWyPRQRTSzIKQEiVLQIMIBpXEjHM6Kz5b/lNBkzqy
	vEOFccA=
X-Google-Smtp-Source: AGHT+IGtseJJ3OvKqZ1Yj/2Fs5l7I32H3v7ui4O//EuQFJcO//vcP+sBdEfNdQP/PSexUE+899wztA==
X-Received: by 2002:a05:6512:281c:b0:53d:de12:ef25 with SMTP id 2adb3069b0e04-53e129fff06mr1267085e87.19.1733240209030;
        Tue, 03 Dec 2024 07:36:49 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6431013sm1902994e87.39.2024.12.03.07.36.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:36:48 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffe2700e91so48972691fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Dec 2024 07:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXf9KhFIBYG2J0w+8pOdvMcXCaVHQNCKhL90Wez39CCDp286BlHg0v1Ea+ODrHsQXcTTyizXExdhdd1dw==@lists.linux.dev
X-Received: by 2002:a2e:bc83:0:b0:2fb:955e:5c17 with SMTP id
 38308e7fff4ca-30009cc52cfmr17349571fa.40.1733240208287; Tue, 03 Dec 2024
 07:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Dec 2024 23:36:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v65i=Ttij+pnK9nhdPzsk9kTdP0ZXS1MGboAud+QudbEDA@mail.gmail.com>
Message-ID: <CAGb2v65i=Ttij+pnK9nhdPzsk9kTdP0ZXS1MGboAud+QudbEDA@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 7:22=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/devfreq/sun8i-a33-mbus.c | 38 ++++++++------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
-mbus.c
> index bcf654f4ff96..5b630c6e602e 100644
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
> @@ -375,24 +375,15 @@ static int sun8i_a33_mbus_probe(struct platform_dev=
ice *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk_mbus),
>                                      "failed to get mbus clock\n");
>
> -       ret =3D clk_prepare_enable(priv->clk_bus);
> -       if (ret)
> -               return dev_err_probe(dev, ret,
> -                                    "failed to enable bus clock\n");
> -
>         /* Lock the DRAM clock rate to keep priv->nominal_bw in sync. */
> -       ret =3D clk_rate_exclusive_get(priv->clk_dram);
> -       if (ret) {
> -               err =3D "failed to lock dram clock rate\n";
> -               goto err_disable_bus;
> -       }
> +       ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_dram);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to lock dram clock=
 rate\n");
>
>         /* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
> -       ret =3D clk_rate_exclusive_get(priv->clk_mbus);
> -       if (ret) {
> -               err =3D "failed to lock mbus clock rate\n";
> -               goto err_unlock_dram;
> -       }
> +       ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to lock mbus clock=
 rate\n");
>
>         priv->gov_data.upthreshold      =3D 10;
>         priv->gov_data.downdifferential =3D  5;
> @@ -405,10 +396,8 @@ static int sun8i_a33_mbus_probe(struct platform_devi=
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
> @@ -448,12 +437,6 @@ static int sun8i_a33_mbus_probe(struct platform_devi=
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
> @@ -472,9 +455,6 @@ static void sun8i_a33_mbus_remove(struct platform_dev=
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
> base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
> --
> 2.45.2
>
>
