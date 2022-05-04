Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD907F
	for <linux-sunxi@lists.linux.dev>; Wed,  4 May 2022 13:54:35 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id t25so1753007ljd.6
        for <linux-sunxi@lists.linux.dev>; Wed, 04 May 2022 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P6qBDyeH+xgHUpsPjtNSn4a+2fKviODgV+T0tGLuQ9A=;
        b=mCRJ1b3PXw/ulWo14ia9eEiZPHjm61FsyhyDgEVG4vvTVfpmqIAwbaoEFGAQ2zHE+h
         /9Sgv/8RW9fG0f0wO+mhs5Kik2TWTth5zKhfbzY5aa1ZRk0dkwkfO12awx9Z9TiwEimE
         7nySmI8yrqkVTl/r2L0h5OP1hYh2zITPxg1SA053LIkij5JTydHaB2+2b9sNdmllCrPZ
         GmYHC51j0U9cedgfK80PyEKmJZMUxuUfAFl51+XcL/eJCNyQfAJ8W9j9KQOkx8VBIywq
         VFdNV+wXI4J0MFVOlecSC3YT0HzbATVkhVdwWv0ZUHUMZFdE7YGNeJiO6RDaVBYMi4g2
         S1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P6qBDyeH+xgHUpsPjtNSn4a+2fKviODgV+T0tGLuQ9A=;
        b=BfhDoxorRACfiLyWMt/Hut8l8DwukQGkiUQyBH2xh1wrZtNu+ZfuWylEyt4gJRgy3Y
         gVL19giVfn+09r6FOdRPkmXbHnoJm7Qt8WXaWwJ4zdZtUuyaUKcp7exCaiyrdC+su83Y
         lqqJf6x8GVIfJi6nUHpDAiexbRahVwFgMtSkdrVSqu59/yIQI4ZO89CvZ0vg4h5Uj7Mo
         m7OhLb1R0z2k0mvtmpJ3o2nfEUF+cVaBAuyVosLFnwUXobds+L+IcZGmxAfSxUcrnrNa
         TdZFILHh44RihVk8Sna0DNKmTN8PEb6sAAuLORq0Fr6U8qjtgLZkqgtyhqbc3MNlInqj
         IWbg==
X-Gm-Message-State: AOAM530HPc6SHXVPmsPyOIUA6SYwF41ID/JORZxVh39t8yKLdEmh3u0M
	zqhLXEua7JweJjrvjPxXaGzQOCChKUmxBOUeNx1XBw==
X-Google-Smtp-Source: ABdhPJxKhCPqCSviNHhQ8pe+/xyLvakb0eNhls2zQBTccZ5aI+9uMHMHOEZZc1iIBMBsL9xfWv5ofeR+hFcZrlCFMCI=
X-Received: by 2002:a05:651c:a12:b0:250:5abe:4ec4 with SMTP id
 k18-20020a05651c0a1200b002505abe4ec4mr7890315ljq.4.1651672473916; Wed, 04 May
 2022 06:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422140902.1058101-1-icenowy@aosc.io> <BYAPR20MB2472BAA6CFEA5BD4B18D7D4EBCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
In-Reply-To: <BYAPR20MB2472BAA6CFEA5BD4B18D7D4EBCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 May 2022 15:53:57 +0200
Message-ID: <CAPDyKFoE5oqGL9VqArskbZRa0u5F2AUYSaPmvcJCujZz4_pDTg@mail.gmail.com>
Subject: Re: [PATCH 08/12] mmc: sunxi: add support for R329 MMC controllers
To: icenowy@outlook.com
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Apr 2022 at 17:42, <icenowy@outlook.com> wrote:
>
> From: Icenowy Zheng <icenowy@aosc.io>
>
> The two MMC controllers in Allwinner R329 have a mixed feature set
> comparing to the previous SoCs' ordinary MMC and eMMC controllers.
>
> Add support for them.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Please repost this (and the DT patch) to linux-mmc, so I can pick them
up from the patch-tracker.

Kind regards
Uffe

> ---
>  drivers/mmc/host/sunxi-mmc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index 0e8fbf4957d8..06934eef8be5 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1207,6 +1207,15 @@ static const struct sunxi_mmc_cfg sun50i_a100_emmc_cfg = {
>         .needs_new_timings = true,
>  };
>
> +static const struct sunxi_mmc_cfg sun50i_r329_cfg = {
> +       .idma_des_size_bits = 13,
> +       .idma_des_shift = 2,
> +       .clk_delays = NULL,
> +       .can_calibrate = true,
> +       .mask_data0 = true,
> +       .needs_new_timings = true,
> +};
> +
>  static const struct of_device_id sunxi_mmc_of_match[] = {
>         { .compatible = "allwinner,sun4i-a10-mmc", .data = &sun4i_a10_cfg },
>         { .compatible = "allwinner,sun5i-a13-mmc", .data = &sun5i_a13_cfg },
> @@ -1218,6 +1227,7 @@ static const struct of_device_id sunxi_mmc_of_match[] = {
>         { .compatible = "allwinner,sun50i-a64-emmc", .data = &sun50i_a64_emmc_cfg },
>         { .compatible = "allwinner,sun50i-a100-mmc", .data = &sun50i_a100_cfg },
>         { .compatible = "allwinner,sun50i-a100-emmc", .data = &sun50i_a100_emmc_cfg },
> +       { .compatible = "allwinner,sun50i-r329-mmc", .data = &sun50i_r329_cfg },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> --
> 2.35.1
>
