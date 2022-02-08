Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93622F21
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Feb 2022 15:13:04 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b9so33871321lfq.6
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Feb 2022 07:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ul6586FcR2XNKw03Estem+L/2VYFh9q5OPSt2ipD/I=;
        b=lTtINBBOCY8o3GicRiibtef9ezSJryqKiDbXTVXhiO2U9dopVM6SL0E++3vEtiIRSj
         rS1GnQalBTA1I7lJodLcbsoS0D8ywNS8LVmOpinkajALmglHEsjWQLeK6m1aG+WnV66h
         jhXKV/qfDnWh0WQxPwSWLP+zzio3U73dP/HwllvT2QN2sInSJcvivIHrqiEEya9A9gdU
         yCuX+3BtSAbSAJIOSmXpFb+fGVM3+yZ8OWP7LwnT1gGlzChXv8v1qOxgMDNXjFIGgAiP
         HcUGwLco3iOmOwLrpa3SiOXc8rgDhaGZT6W10uP8KdICZoVXsFR4RecOTYA1dO1Tec2D
         0+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ul6586FcR2XNKw03Estem+L/2VYFh9q5OPSt2ipD/I=;
        b=L0uPeGzPbjMP73FJPypSF4U5/KpRHdMERQ3OXAr4wcofjXvM8tsSON1IeMqG9eUIiW
         waPXW51WcW6pXZfPwGsheBg+T84HqRfMUw7TwmZqkSfWh3Op8G6omUrmGo3Q4NvDzq91
         V1Y5f3REYqxEVhm04p85oZq64DAvDaAkUJwj/OBCLv3d8d8Zj/FJU9BKA0te6KA1nOLO
         jiL+Nm7+sN6g4rpYIe6X18TJlgxgoy1bubKXujjnm48qQaujskKcgnci4AORXg1H/VYj
         NbNy/5Dut92pRHvXbWBqd4Cw9QE63deocrDiE3w4hsG3v3EMg71iVeybNyMK/4n+tMH7
         jV6A==
X-Gm-Message-State: AOAM532mO6PdSKCx1GnBMiUYfJYbtOv6L4rCgEamu8o278cgfBp1aTc1
	fKD1VNsp90SFkaYGcwTSySuSoKa2vBCdiEB9tZodbA==
X-Google-Smtp-Source: ABdhPJwi6FPXFMyazeJ7i45pYAQSCW8A1BCRnS82xEFe9NN4cuh8Q4joFFexYDXE7e2Y5nmlF/FcS/EQkzm2rd08e2A=
X-Received: by 2002:a05:6512:3b9a:: with SMTP id g26mr3266780lfv.71.1644333182732;
 Tue, 08 Feb 2022 07:13:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203015112.12008-1-samuel@sholland.org>
In-Reply-To: <20220203015112.12008-1-samuel@sholland.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Feb 2022 16:12:25 +0100
Message-ID: <CAPDyKFoQzcD0gV0fXU=FyzTqQfLoTuDWhMrUaRPGYqsD7Spq8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sunxi: Add D1 MMC and eMMC compatibles
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Feb 2022 at 02:51, Samuel Holland <samuel@sholland.org> wrote:
>
> D1 contains variants of the usual sunxi MMC controller. The eMMC
> controller has the same parameters as the A100 eMMC controller. The
> other controllers have a DMA address shift like on A100, but they have
> a smaller 13-bit size field, making them a new incompatible variant.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 4f62ad6ce50c..94e2c6c4e4b7 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -24,6 +24,7 @@ properties:
>        - const: allwinner,sun7i-a20-mmc
>        - const: allwinner,sun8i-a83t-emmc
>        - const: allwinner,sun9i-a80-mmc
> +      - const: allwinner,sun20i-d1-mmc
>        - const: allwinner,sun50i-a64-emmc
>        - const: allwinner,sun50i-a64-mmc
>        - const: allwinner,sun50i-a100-emmc
> @@ -49,6 +50,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-h6-mmc
>            - const: allwinner,sun50i-a64-mmc
> +      - items:
> +          - const: allwinner,sun20i-d1-emmc
> +          - const: allwinner,sun50i-a100-emmc
>        - items:
>            - const: allwinner,sun50i-h616-emmc
>            - const: allwinner,sun50i-a100-emmc
> --
> 2.33.1
>
