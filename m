Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DDE5381
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Jul 2022 16:28:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u5so20906087wrm.4
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Jul 2022 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIPI5KmDuzcke0XGgrnA7zF01gNNf3RwyHxJZzCv/6M=;
        b=k8hilhnoU7dbumJaKM2qpgafxXdLLktBG83dcxCI1JKx7n39zUKZxlP+hYZm/5j5C2
         7YXLb7fuySnGgbnGkpxhvXpl1sRoF7hshwnMXivVt8w4pR79xXoN0Zf/Z7O6i0ZPoqXy
         h1w3xxojKg6npjOj4gSATpRpP4fc1AKm8exDwY9RtlBiYU/Nfv3DnCgIerclgCrtIiHW
         4pqdofanwkiLeTMik0j7QL4VI2a6h9rzGwhyNseX/zAvfEyvDIB7CGdodUglNtq//vdd
         dTGcKL2oeKGfhCJtZP5P5kO4nWtRmbI4NitvhT49eeOqA5wxxNWKTwDOcY0s9DVscfWs
         8yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIPI5KmDuzcke0XGgrnA7zF01gNNf3RwyHxJZzCv/6M=;
        b=dBV69x3D1hun780nxufxZzppJbUev8SbvA3n6t1D+LX/fBp8XvXXXzkH13Zo9Hj9m4
         01ZPxAq8gkPbDEYo9rOqnJ2eyRYMdh8rl2xq8IgQB0NtglujmacWg56sDrZKsiiAYE47
         F8je5I4pqQaan7d2lgwk0pW0tMWJ+YSJlP7+LVBbx+qrPjcEYBZHugHytaW3VHXilPsR
         Wy04IaU5uAniST8GbdlHVaMcFTCwXo6LgOBvmQDS/C8yutFE829B6nS56boJszNT8uj2
         lBjLr8c+TP7z7FZtJNAlV2vKW7YCF9twqMCR5QKfo7jNgD+KvSEbyTmPPhbvGyMXn1Vb
         wXng==
X-Gm-Message-State: AJIora/J2WAXzCFy535QvIzkMjhli3OeZIW0FVAcnol+crj0fm3OKjY2
	RJIkjv8v87mo+wejedWI75LjSz9CRFjf010+fyk=
X-Google-Smtp-Source: AGRyM1vY2aubeKfH02KOuWoMorYDcmWdRSnkyGf3LHvGNaqt/b0DKZ5DoJ31VTcRGRydCQOFcoPshiRi+xhhDc0J+ac=
X-Received: by 2002:a5d:4889:0:b0:21d:eab7:f798 with SMTP id
 g9-20020a5d4889000000b0021deab7f798mr11482162wrq.96.1658852927394; Tue, 26
 Jul 2022 09:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220725212637.2818207-1-daniel.lezcano@linexp.org> <20220725212637.2818207-9-daniel.lezcano@linexp.org>
In-Reply-To: <20220725212637.2818207-9-daniel.lezcano@linexp.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 26 Jul 2022 09:28:20 -0700
Message-ID: <CA+E=qVdrNkx9nXMEFFYQgDcX+gdKJaCh3zoTkBZBY3HhBFDAdQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/32] thermal/drivers/sun8i: Switch to new of API
To: Daniel Lezcano <daniel.lezcano@linexp.org>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	abailon@baylibre.com, lukasz.luba@arm.com, broonie@kernel.org, 
	damien.lemoal@opensource.wdc.com, heiko@sntech.de, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, talel@amazon.com, 
	thierry.reding@gmail.com, digetx@gmail.com, jonathanh@nvidia.com, 
	tiny.windzz@gmail.com, baolin.wang7@gmail.com, f.fainelli@gmail.com, 
	bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, glaroque@baylibre.com, 
	miquel.raynal@bootlin.com, shawnguo@kernel.org, niklas.soderlund@ragnatech.se, 
	matthias.bgg@gmail.com, j-keerthy@ti.com, Amit Kucheria <amitk@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 25, 2022 at 2:27 PM Daniel Lezcano
<daniel.lezcano@linexp.org> wrote:
>
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach. The ops are no longer device
> tree specific and are the generic ones provided by the core code.
>
> Convert the ops to the thermal_zone_device_ops format and use the new
> API to register the thermal zone with these generic ops.
>

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> ---
>  drivers/thermal/sun8i_thermal.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index d9cd23cbb671..2a4fa4068950 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -108,9 +108,9 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
>                 return -1590 * reg / 10 + 276000;
>  }
>
> -static int sun8i_ths_get_temp(void *data, int *temp)
> +static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
>  {
> -       struct tsensor *s = data;
> +       struct tsensor *s = tz->devdata;
>         struct ths_device *tmdev = s->tmdev;
>         int val = 0;
>
> @@ -135,7 +135,7 @@ static int sun8i_ths_get_temp(void *data, int *temp)
>         return 0;
>  }
>
> -static const struct thermal_zone_of_device_ops ths_ops = {
> +static const struct thermal_zone_device_ops ths_ops = {
>         .get_temp = sun8i_ths_get_temp,
>  };
>
> @@ -468,10 +468,10 @@ static int sun8i_ths_register(struct ths_device *tmdev)
>                 tmdev->sensor[i].tmdev = tmdev;
>                 tmdev->sensor[i].id = i;
>                 tmdev->sensor[i].tzd =
> -                       devm_thermal_zone_of_sensor_register(tmdev->dev,
> -                                                            i,
> -                                                            &tmdev->sensor[i],
> -                                                            &ths_ops);
> +                       devm_thermal_of_zone_register(tmdev->dev,
> +                                                     i,
> +                                                     &tmdev->sensor[i],
> +                                                     &ths_ops);
>                 if (IS_ERR(tmdev->sensor[i].tzd))
>                         return PTR_ERR(tmdev->sensor[i].tzd);
>
> --
> 2.25.1
>
