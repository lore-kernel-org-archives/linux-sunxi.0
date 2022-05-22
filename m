Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76C2103
	for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 07:33:07 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id rq11so721977ejc.4
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 00:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q56IvgxavWJhsEkcadDqcZc6FJeimEL1lZJWPor8auE=;
        b=oIiyK58kipbrNJ6GQaCjqXXreZvXCvVHjcytBE/FyzVM+VNOTvCLY9FgQAbTRnNQaw
         3ucvfITxTcnGiCU+HpEs9caByTp2IZrMetTUCkQ32agmMhas4iT8pkIgIqXpgXauf+Su
         QY0G/53zn+mjJUpwQt1y5LJ5fS4hfXc4jsC+2Pf/PzUWRKKyinlGb2b25puWwo/X7bDE
         FT++CTBo+jSorDuKzLAkowO8jVDCa50w6IAfA8MWGwIz6v8uq8caLkIscISKHMAqHv9+
         CYpaAlYlc4RBOqL204PQb/8Tmf9+Pn9SF3B6ozmHMdzXhoCMUwwcisKgI1SntF4zjFO9
         YV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q56IvgxavWJhsEkcadDqcZc6FJeimEL1lZJWPor8auE=;
        b=XyLceSGRlZbViRWSvhF/gMkGoDcHhYA5y5uNEf3q2rC8uJ7cnBe6/R/fC1hTrr0SEz
         GKTFBNYzszaGvNvUFn2tzt2ralNpNsDnnXFIsciaaslGeh3stBRG/PbDjlEgXFlxgZXL
         9GXB19vQUqqfcHsPN6hqMWADGWW4JpfJWgNcBkfMb+f4XtVT6crf19m110Y7yeqyHvkE
         fPSc6mlZeyQYx5DqMbD0I9uVyk5TPDaIGGntKE7Tzli3921LNhf7qgHRpZ4cKN/2Klzn
         tMAc0KrtbcXOIEr9FdB5yixL10qjTmv8jXXYRLFSEEeXZU3wnsDfAZV9i7Obyf/Un9xC
         g92w==
X-Gm-Message-State: AOAM532t185S5PlF+8EafHbkSWzSlyaHWNHXFXAh3JT2KEjn2YdBm9fZ
	hV27x7PFd25v1knAW9W4pdU=
X-Google-Smtp-Source: ABdhPJxlBx3vwsBGbu+xb+kNECnqZsU7ogBTgwifDfJ1SRjFeixrkga7Y7gf13mVgboWIf8yJHFEKQ==
X-Received: by 2002:a17:906:d193:b0:6fe:9a92:6c4d with SMTP id c19-20020a170906d19300b006fe9a926c4dmr13355170ejz.49.1653204785589;
        Sun, 22 May 2022 00:33:05 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id ej23-20020a056402369700b0042a2d9af0f8sm6696800edb.79.2022.05.22.00.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 00:33:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: sun8i: fix typo in comment
Date: Sun, 22 May 2022 09:33:03 +0200
Message-ID: <2629117.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20220521111145.81697-36-Julia.Lawall@inria.fr>
References: <20220521111145.81697-36-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 21. maj 2022 ob 13:10:46 CEST je Julia Lawall napisal(a):
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> ---
>  drivers/thermal/sun8i_thermal.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c
> b/drivers/thermal/sun8i_thermal.c index d9cd23cbb671..212c87e63a66 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -237,7 +237,7 @@ static int sun50i_h6_ths_calibrate(struct ths_device
> *tmdev, * The calibration data on the H6 is the ambient temperature and *
> sensor values that are filled during the factory test stage.
>  	 *
> -	 * The unit of stored FT temperature is 0.1 degreee celusis.
> +	 * The unit of stored FT temperature is 0.1 degree celsius.
>  	 *
>  	 * We need to calculate a delta between measured and caluclated
>  	 * register values and this will become a calibration offset.




