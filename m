Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2226B765
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Jul 2025 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752308763; cv=none; b=AOl5CmChDmVOfxxbzlaICSCtsTECPhNlVq1bkp0p5cqIc8NTzecLlrGKLIJ6Dj/VsndeAtxS392yZfji+304rVYvG7ZuUXmcZ/f/DqkC5bK2ZH0CR91X6yeRrUmBCijnV8voZr5F1VGayUAoqj0fvKnnLSQCuuh9eQM18pVIvlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752308763; c=relaxed/simple;
	bh=ULgQmqNv8PySGk5+xltUtgTVVyz184W244B3rlM3Zvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6AfA1BisIjZ4ZupBgJsU9w2vWrTBO9tebQMDomSOncR+5gzYRLGkivl1z99fBwMJExYMqFR4GHZeghyR8HLxPIYAN2ajzuwhmSQZVf3zBA2jOvmC1g06B/DZSfyOXdeJU7RLUA6lfp/l7bjuIHeWA2zRd9ivDcqKXmYg+fYyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5562838ce68so2607349e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Jul 2025 01:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752308758; x=1752913558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8+rtQC6XpTE2vRTh9EDlBtLhS/B0Gdgn+coAVMY1wQ=;
        b=cv62JvpVlLOipvso4eLITlZXXso2XIlwQPinx8CK40dnFFhzvovaD72WCBTqlob49Q
         y50j/8bCNgxO8LKN8jLZHVfPcEvhQWsNEpqd+CRCg0WAtqYOThMAAXZaF1bWi+ugFlgD
         a5jUf2t/f/wpOtBLTdfs2L+nStsxTVtiO1/cbi3nGJ6G3R7wxxaKF8qxxFv3VDES+3AA
         glwnpHK8nW0kxraeu2O93n63m0yDxg9l448v8udMSD6QZC/T+fvCjfZEQomTnRdeYtSR
         cEQBOlnB0S3c4J5tI8yT9j0Or3h1oamnHR3+zNe+jPjrEAlQ+4ra4Alz5inYQUdzwuAV
         x/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWNcygz+Y6fzQd++Fqmlwv3utq7WVgNpVVs3rDuNKeSApDMn+1xCbThzaZFDq7m20I5kKeR/9hOKZ3YjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjsLvow8puu8drf4G63mnsjHZyZRudW8wFN43jQsg60nil8LHW
	DWXxxB2nOws5UkPhi8qC2RdEApTUyONDTjeeZODVmJrIFq2IedyIYkyxvi41x2kc
X-Gm-Gg: ASbGnctZUsTBgc9cSwrocsqM8fQJyC0GaStJcYZxVJe2MWGhg9iLOROOFB/mfwsm6bZ
	plyL5VnRJJwBSUkUAr1BuYt5Y7nyBilHP/L9Oeuq+8rlkgdynxoBLGz35EnVW95Som7DAvhAbz1
	1nAcPk+c3bO10DZnty+eLC+6TfS7gvpmTeiwhprtON1hZ8AfK4rhXgKYeZiAh80IhIIvRcmQSwx
	zlHnN717dfw+AMIdSnPU5QnVZyZWZebC6XqxIypjtN8xZa2pFjLuB0febpWIDFoBfhoWZnfXtX6
	eEFNe5yDy8FVYDsbJn23JOJSqYfuiw5s7FsTjwB+sYSd06XC7r+Bh6vwG9Y0nGBj7Q9PI/GisnR
	WWTAtTMdjJeInNueQuYRL5v+0rMEqLL9XgHT6emkw5bAaWhIu6vZYOzE=
X-Google-Smtp-Source: AGHT+IHinffjiXdlz5r7RZnLYxzoveEXUfeLt5AM1JFqNYIdzusptxi56lZT8jypZ8IvwOesgp2oEQ==
X-Received: by 2002:ac2:4e13:0:b0:553:3514:1a53 with SMTP id 2adb3069b0e04-55a044c9553mr2102945e87.4.1752308757767;
        Sat, 12 Jul 2025 01:25:57 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b635ecsm1272266e87.166.2025.07.12.01.25.55
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jul 2025 01:25:55 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32e14cf205cso25145241fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Jul 2025 01:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtBkgFHJL3Caeb4buhexm2yhPiSHtMpk6l9JUz9ba0lo403BNVTQHV/m43D8oMhpyRwZaQKnM8nvdefg==@lists.linux.dev
X-Received: by 2002:a05:651c:b1e:b0:32b:7472:c334 with SMTP id
 38308e7fff4ca-330532dfcf4mr20735521fa.16.1752308755571; Sat, 12 Jul 2025
 01:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250703151132.2642378-1-iuncuim@gmail.com> <20250703151132.2642378-4-iuncuim@gmail.com>
In-Reply-To: <20250703151132.2642378-4-iuncuim@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 12 Jul 2025 16:25:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CnNEw0Rhh0SLnr73b+TPJXCZ_eY3n4nH8_9LiXj2Ydw@mail.gmail.com>
X-Gm-Features: Ac12FXymLasGX3Z5Rb9uWIApOu-xW47ktDWvJ_I7-HUhHhL0xFXKGGC-Mm7lvpI
Message-ID: <CAGb2v66CnNEw0Rhh0SLnr73b+TPJXCZ_eY3n4nH8_9LiXj2Ydw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] thermal/drivers/sun8i: add gpadc clock
To: iuncuim <iuncuim@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 11:13=E2=80=AFPM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Some processors (e.g. Allwinner A523) require GPADC clocking activation f=
or
> temperature sensors to work. So let's add support for enabling it.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 226747906..45aaf5348 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,8 +66,9 @@ struct tsensor {
>  };
>
>  struct ths_thermal_chip {
> -       bool            has_mod_clk;
> -       bool            has_bus_clk_reset;
> +       bool            has_gpadc_clk;
> +       bool            has_mod_clk;
> +       bool            has_bus_clk_reset;

What's with the random whitespace change here?

>         bool            needs_sram;
>         int             sensor_num;
>         int             offset;
> @@ -89,7 +90,8 @@ struct ths_device {
>         struct regmap_field                     *sram_regmap_field;
>         struct reset_control                    *reset;
>         struct clk                              *bus_clk;
> -       struct clk                              *mod_clk;
> +       struct clk                              *mod_clk;
> +       struct clk                              *gpadc_clk;

And here?

>         struct tsensor                          sensor[MAX_SENSOR_NUM];
>  };
>
> @@ -417,6 +419,12 @@ static int sun8i_ths_resource_init(struct ths_device=
 *tmdev)
>         if (ret)
>                 return ret;
>
> +       if (tmdev->chip->has_gpadc_clk) {
> +               tmdev->gpadc_clk =3D devm_clk_get_enabled(&pdev->dev, "gp=
adc");
> +               if (IS_ERR(tmdev->gpadc_clk))
> +                       return PTR_ERR(tmdev->gpadc_clk);
> +       }
> +

This looks correct.


ChenYu

>         if (tmdev->chip->needs_sram) {
>                 struct regmap *regmap;
>
> --
> 2.49.0
>
