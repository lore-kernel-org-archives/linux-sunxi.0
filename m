Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4D3D78
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 10:45:24 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-521a8d6e6b1so505324a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 03:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689936322; x=1690541122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8wJTVBT/3WAHQa2wXEwIaaZ8k9MULWPoI7qp0kxJXk=;
        b=d41THwj0PVLxEAp4o+SjhGcCqNWgibp+YqpYDYRHTkmV/CjaRORw47gzSjQOsYrjTG
         LAApQA6KoTSlxYozPc/1pdZ/O2HwjWKZJvGFZwyCPqMmnrKaGabZ/HgcRpzsDTT4hfoO
         dXh3gLC+VRKFjbYpY01VOVJgeLx2/5LG0OUC+K8x8qQLTLYBmfyxrFbbc+LNdUYwmtg8
         Ds6RPcIVdfMp74eYUjC84JwqZ8Q4yxh+Wq7oAxuCm09d1aPGyIUQ1bpLTmvTcMtkDT5i
         vsz5xjba4vvNQRrrvGCCVmKjTP/OpBgbLLcDRQ1pvSV1AuhvMSQwyt3wroRzceyGnuzM
         004w==
X-Gm-Message-State: ABy/qLY8VyMwWUcFbilIvk+yqqyU3qXG5kzkkgOUpYJxhdD2/aeq5ynn
	jIZ5Jlr648c+JVdflzh9JL9mFfShVmwBMFTuU1A=
X-Google-Smtp-Source: APBJJlGTR98Wg1niPHUvEdRwLJkWx6ZLHdL0iuuk2pM2B7Twjw+C+B41NYMrkfG5Gog1cpc6MO+7IsZMPQ5Z62zq098=
X-Received: by 2002:a05:6402:4304:b0:51d:9a92:24f0 with SMTP id
 m4-20020a056402430400b0051d9a9224f0mr1557619edc.4.1689936322410; Fri, 21 Jul
 2023 03:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230721094641.77189-1-frank.li@vivo.com> <20230721094641.77189-2-frank.li@vivo.com>
In-Reply-To: <20230721094641.77189-2-frank.li@vivo.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Jul 2023 12:45:11 +0200
Message-ID: <CAJZ5v0iB5arngPxxduafyZ+hbxqTRLXm_5iwNoEcQcqVyCdCYw@mail.gmail.com>
Subject: Re: [PATCH v5 02/22] thermal/drivers/sun8i: convert to use devm_request*_irq_probe()
To: Yangtao Li <frank.li@vivo.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 11:47=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wro=
te:
>
> There are more than 700 calls to devm_request_threaded_irq method and
> more than 1000 calls to devm_request_irq method. Most drivers only
> request one interrupt resource, and these error messages are basically
> the same. If error messages are printed everywhere, more than 2000 lines
> of code can be saved by removing the msg in the driver.
>
> And tglx point out that:
>
>   If we actually look at the call sites of
>   devm_request_threaded_irq() then the vast majority of them print more o=
r
>   less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
>
>      519 messages total (there are probably more)
>
>      352 unique messages
>
>      323 unique messages after lower casing
>
>          Those 323 are mostly just variants of the same patterns with
>          slight modifications in formatting and information provided.
>
>      186 of these messages do not deliver any useful information,
>          e.g. "no irq", "
>
>      The most useful one of all is: "could request wakeup irq: %d"
>
>   So there is certainly an argument to be made that this particular
>   function should print a well formatted and informative error message.
>
>   It's not a general allocator like kmalloc(). It's specialized and in th=
e
>   vast majority of cases failing to request the interrupt causes the
>   device probe to fail. So having proper and consistent information why
>   the device cannot be used _is_ useful.
>
> So convert to use devm_request*_irq_probe() API, which ensure that all
> error handling branches print error information.
>
> In this way, when this function fails, the upper-layer functions can
> directly return an error code without missing debugging information.
> Otherwise, the error message will be printed redundantly or missing.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Cc: AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

It is not clear to me what the purpose of sending these patches is.

Because the devm_request_threaded_irq_probe() definition is not there
in the current -rc kernels AFAICS, it looks like they are sent in
order to collect tags from people.  If so, there should be a cover
letter making that clear.

As it stands, it is also unclear how you want them to be merged.

Moreover, sending the series without patch [01/22] to linux-pm has not
been helpful.

Thanks!

> ---
>  drivers/thermal/sun8i_thermal.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 195f3c5d0b38..a952804ff993 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -512,9 +512,9 @@ static int sun8i_ths_probe(struct platform_device *pd=
ev)
>          * registered yet, we deffer the registration of the interrupt to
>          * the end.
>          */
> -       ret =3D devm_request_threaded_irq(dev, irq, NULL,
> -                                       sun8i_irq_thread,
> -                                       IRQF_ONESHOT, "ths", tmdev);
> +       ret =3D devm_request_threaded_irq_probe(dev, irq, NULL,
> +                                             sun8i_irq_thread,
> +                                             IRQF_ONESHOT, "ths", tmdev,=
 NULL);
>         if (ret)
>                 return ret;
>
> --
> 2.39.0
>
