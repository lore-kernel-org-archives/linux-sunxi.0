Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263902D24AD
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 02:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761532761; cv=none; b=FyjhoK0avAUvsF2Wt3oSBqEoaivKvwECbu9LBY2eYMIcMSi9+8BInHeXYnnfBr3Yve+mUaHBnGvPz3liEtbeS770DPQjur5u3R5UZe4YiP63f5wqOYucxLws/562FdM+smhc7lf3+3ypE7pj188voDmREkMq+skCspj2AxmwN9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761532761; c=relaxed/simple;
	bh=evQekrEcmyRdqKp1jJZClGlbzLxhN98LFdFpjeGdBkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZRAvevpCcMHNNu0RdwbVmh5AyPxfH4rxy9MrilGR6NCWY+QKhm78nbjbPE3WTvtqc77v5o1voHDWIDFA53VtP1MTbPQUl2Fjm8Vrvie9uujhSlmLdlNYXLcJMAE680BSRuPy/rrXroigOtZ5PHHC9Jd90qZLmKP5Nom7hyLCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3637d6e9923so40202751fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Oct 2025 19:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761532757; x=1762137557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0xO3eccx9J1JFeRrYmbh54SIcFbkNO2ChisP5DHSmA=;
        b=JJjEhTqL6k0Y0ZcEhu+pQ/OTTQzVozs89zq72tuyBrrhyoERMKT4TKlMskVRvH21yL
         pRT8IcxLcSMvPlbmWSLrGbL9ESobmKPufwlukbjp8+C2HihrPdbi/AXm3haTxCK4ZgNt
         KXF8tYvIztUkw08px+HD1GFcBK9Hg5fRtWUGpFw4FtHsFFkWfIdptel0nbjEHo6/z5Rt
         /aLYFNyu5bBvg4xsQ7+vL3kXHfwilxrpNgyr1w/DVDrWcgH7ud0GoJF3a7tyZaereVbE
         L2EMo2gzzhxHwL+ByMjbquGgqATlkdAzpxWQJnzXXKkpb8PkC6BKb/pjHdKCtusovEWp
         v7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUiIjhGharGGu71qQrCBarUxijFntZbzpPC/bHr26UaSRpV/3R5KE9moFPy36jCEursemnG7rbuG0yJwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ6UWedltIEJ9fA4z574NOnVlls584UA+hqQZKP6OsZCnJ/xN7
	RZhGmFVZ7lppd7o9E1sY5iAH0CsvH1+1+FphkVT2GGZWWjw2TqNbZjgbEWE6ndTfvx0=
X-Gm-Gg: ASbGncsuOQj8M2dFQtgpUftQjczlR7yfFaMaWfkZxF0HfLMQfHTcpTHTVaVbcjEMTp8
	bjU7i2mNYI4bGLGoGXfa8fW3zbY2+37cSS1FLEwGCasdLQBi9Leb/zydgweLauzOCgEhvyEt3H4
	h7x+tNXg2QG26C01KE29MIEiOUwvKKkKRmq3GU7fSqRjGhBeUZpBwtm2MJcLWeiR60zWNiOizAQ
	GPCwVvLdRWRgZpKto1406jRImkjL9/Eu2M0MNRL7gsoOBFfHAEi4Rxud7CouPdFr+BbP2APJyi8
	kJcci3W7MfeOrD/I+uMLD3GESwlIcCXcuXZkHU/Zdeh3x20SgKkpK8jUKHqWL3L9Zy6OP80PaQ/
	NX667v5pBjcZ9iqaVX9Y7b5dBHxjNglLNNDjod/ndqAwFr66ypWtGbtLMBc2Bxb9O8NVLoGK12b
	jGmSWBivsJ8PfD+2ep+JUoFuZ7Hk1fbhfP/qKrnv8e4e0=
X-Google-Smtp-Source: AGHT+IGw1ApWsMm3oB6SBr+XXuqcTAPz8Hnsq97nYiTY/pOaQWZzfbrJHeY0LGnTbETagmj5ZrZREw==
X-Received: by 2002:a2e:be27:0:b0:36b:b0eb:9d64 with SMTP id 38308e7fff4ca-378d6d1c70dmr38424331fa.30.1761532756305;
        Sun, 26 Oct 2025 19:39:16 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09cba7sm16922671fa.11.2025.10.26.19.39.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 19:39:14 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3637d6e9923so40202041fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Oct 2025 19:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7+2nVo7p3AeqDvKfRk4xkOuAHJ/XzHsKbzd8lUT2uUUgxquTe5FvGnJzFaQeKjHyyawO8CIyhJ6FaWA==@lists.linux.dev
X-Received: by 2002:a05:651c:1509:b0:376:2802:84a8 with SMTP id
 38308e7fff4ca-378d6f87cf1mr39477651fa.46.1761532753914; Sun, 26 Oct 2025
 19:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025043129.160454-1-iuncuim@gmail.com> <20251025043129.160454-3-iuncuim@gmail.com>
In-Reply-To: <20251025043129.160454-3-iuncuim@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 27 Oct 2025 10:39:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v656qzX3YrcuTt++=-r5JCyDKgGB8NYTAM3TpyRtAwdibw@mail.gmail.com>
X-Gm-Features: AWmQ_bltF2M2RvHvljsl22XgW5kEnSwcYVFG9c-kdXV1SwRk_st0sy4RKS89u_w
Message-ID: <CAGb2v656qzX3YrcuTt++=-r5JCyDKgGB8NYTAM3TpyRtAwdibw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] thermal/drivers/sun8i: add gpadc clock
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 12:32=E2=80=AFPM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Some processors (e.g. Allwinner A523) require GPADC clocking activation f=
or
> temperature sensors to work. So let's add support for enabling it.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/thermal/sun8i_thermal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 226747906..c02c398b0 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,6 +66,7 @@ struct tsensor {
>  };
>
>  struct ths_thermal_chip {
> +       bool            has_gpadc_clk;
>         bool            has_mod_clk;
>         bool            has_bus_clk_reset;
>         bool            needs_sram;

We could optimize this using bit fields instead. This can be done in a late=
r
patch if you want to do it.


ChenYu

> @@ -89,6 +90,7 @@ struct ths_device {
>         struct regmap_field                     *sram_regmap_field;
>         struct reset_control                    *reset;
>         struct clk                              *bus_clk;
> +       struct clk                              *gpadc_clk;
>         struct clk                              *mod_clk;
>         struct tsensor                          sensor[MAX_SENSOR_NUM];
>  };
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
>         if (tmdev->chip->needs_sram) {
>                 struct regmap *regmap;
>
> --
> 2.51.0
>
>
