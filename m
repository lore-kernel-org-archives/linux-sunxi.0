Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA828E4
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 18:49:57 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id j6so6446664qkp.9
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQ40q30UltGPLcxI7Io5PMB3YYsh2rTffdRN3EHyu6c=;
        b=RdHamgujXU7B88WXCri1aYVijHI83k3VkPNNzKtG/MLExSd3tIZhvESxewq0tXjykm
         ZbLf3MYd+E+jl55CDkujFwCtgTIQGeesQfrYn/H+8XX3KHlq6UOqVWd5HD568lvBJS6t
         92kcI88/9o48d6YdJHOnjZ/6OtWJqI/i2kqcLu9frpMNsVT+urshO4xfvMbWCcvhOGT+
         ZGB+ld9FNj2oviMGVglawZScNhMQGkyXBEL2Bv9lIuhrEf31/qdwSWjNbmpQW1L9ZCLF
         WO18jlmA5OWphmosTS1G/HzZqOBTYQSv3GAcU9nwVqg+Zg0DGaHDdCxGIvrcaxb3d8Ex
         vYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQ40q30UltGPLcxI7Io5PMB3YYsh2rTffdRN3EHyu6c=;
        b=MHtJGUIbKBtzYh3EZkgVRnjNdDWGOGh4x1pSNquIlWrZ4comjDMZSMZadt+nojawF/
         KY8NQOwgm7GCtq4jRyP1y5gBzrL8Ka8lvrZbGxrqWu5wDG67H4L6tnj2dGO1y2IPo9XQ
         mNdmhFw9eBpknfg5s/rbVODbTzwzYtSgBKiRHFRlAQOu4xNaLmB3Um/IeTu66BR1pT5r
         z8D3C+zptu4pLfTC8DW85Ocdwq3VGeNCkFXWsKmyy3ysBameW5j40zYm3HN5FjNEAQkm
         I4VYETGpiaHHtnFIz2GcsDOK7MuJ6jRDo/uxN7Zjm610j7E8WxPKv2LP2bLubDq8zmzD
         HxwA==
X-Gm-Message-State: AOAM533dhaIRX2WdNO9ohTrRSJhnW5VRdwi9P7+czfma5BBazjGM1Yed
	X7AgBZJnup8Dye3EJ8tmQ+TOD4oD8bYwGXsOmI4=
X-Google-Smtp-Source: ABdhPJyrbF6gvV7/wmLrqZkZPzMLNWIkWAv1BEqTuRLLFd+eovymNNvGQWzPxUcW2ESAhhinTTllnLRYQlRa6HY7eho=
X-Received: by 2002:a37:89c7:0:b0:69a:121b:9256 with SMTP id
 l190-20020a3789c7000000b0069a121b9256mr3714602qkd.218.1650653396872; Fri, 22
 Apr 2022 11:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422161156.1075227-1-icenowy@outlook.com> <BYAPR20MB24720C488FD2BB42038D9825BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
In-Reply-To: <BYAPR20MB24720C488FD2BB42038D9825BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 22 Apr 2022 11:49:30 -0700
Message-ID: <CA+E=qVfhEhe325M+s784BYw4Ctvv=eGWxGAJBMwPptHXs_vKFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal: sun8i: add R329 THS
To: icenowy@outlook.com
Cc: Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linux PM <linux-pm@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	arm-linux <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 9:12 AM <icenowy@outlook.com> wrote:
>
> From: Icenowy Zheng <icenowy@aosc.io>
>
> The thermal sensor controller on R329 is similar to the one on H6, but
> with only one sensor. Calibration method is still unknown because no
> calibration is implemented in BSP kernel, neither is it documented in
> the user manual.
>
> Add its support to sun8i-thermal driver. Calibrating it is now
> prevented.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/thermal/sun8i_thermal.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index d9cd23cbb671..3a2f381005b4 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -312,7 +312,8 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
>                 goto out;
>         }
>
> -       tmdev->chip->calibrate(tmdev, caldata, callen);
> +       if (tmdev->chip->calibrate)
> +               tmdev->chip->calibrate(tmdev, caldata, callen);

I think it's a bit late to check it here since you already read nvmem
cell if you got here. I'd suggest moving the check to
sun8i_ths_resource_init(), i.e. call sun8i_ths_calibrate()
conditionally depending on whether calibrate callback is present.

>         kfree(caldata);
>  out:
> @@ -628,6 +629,17 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
>         .calc_temp = sun8i_ths_calc_temp,
>  };
>
> +static const struct ths_thermal_chip sun50i_r329_ths = {
> +       .sensor_num = 1,
> +       .has_bus_clk_reset = true,
> +       .offset = 188744,
> +       .scale = 672,
> +       .temp_data_base = SUN50I_H6_THS_TEMP_DATA,
> +       .init = sun50i_h6_thermal_init,
> +       .irq_ack = sun50i_h6_irq_ack,
> +       .calc_temp = sun8i_ths_calc_temp,
> +};
> +
>  static const struct of_device_id of_ths_match[] = {
>         { .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
>         { .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
> @@ -636,6 +648,7 @@ static const struct of_device_id of_ths_match[] = {
>         { .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
>         { .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
>         { .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
> +       { .compatible = "allwinner,sun50i-r329-ths", .data = &sun50i_r329_ths },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, of_ths_match);
> --
> 2.35.1
>
