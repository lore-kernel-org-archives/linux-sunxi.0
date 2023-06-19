Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF826D2F8
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 15:33:23 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1aa291b3fc7so919757fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 08:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687188803; x=1689780803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPFXYlRHAa3U0GY2gSsZaKSWcpvM3hRa94CDc3700HE=;
        b=L18U/tKjGAjH+G/oazerkNmQXLPFG3JgVrjEx194CI7QNbBbEh82LjbsyHdhnXp6vv
         GRIi0ZDa0xYmPry5RcQ2tBwHtkyBOImtk1ZDNCs8WdEOdFYnyy60RSHJmGUp1aA+vj5w
         eiGm4fomi6jzivRI0OvtoSEH6cVU0dSJ1LHJbrSdUJ2qYD44WdDmoop+4gb6eoXjk0r4
         JBSimvAffxfNXL59Uk8EF8V4YMzXKqfsUFKReHHNTC7CTtr+17YNWY1TUZvlpjWpoq1k
         s+oQ2+4G+jvSsqHdz8vjiyDOytH1pqI13COmMS44dMCLg2UdFxD0nXCDuqlKYSMKxlcw
         bXnQ==
X-Gm-Message-State: AC+VfDyeUbZKEj8oyPWUsfJIrxlIiRNMy8solNQSlXOHQIZqx++vUrUL
	kk6Ce2WCLV6SzNU3f7k3g5plGiAcMPwncA==
X-Google-Smtp-Source: ACHHUZ55GjBnXDdQwDUc4l7mb3GG0vj2Nk2VIoh73PlvlHJa4ZEoq5Zobxj0m79lqER8RBmQdG6AJw==
X-Received: by 2002:a05:6870:54c7:b0:19f:4f5c:82a7 with SMTP id g7-20020a05687054c700b0019f4f5c82a7mr7503098oan.22.1687188802779;
        Mon, 19 Jun 2023 08:33:22 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id ve17-20020a0568710c1100b001a6a3f99691sm10028413oab.27.2023.06.19.08.33.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:33:22 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-39ecbb4c7d3so1197404b6e.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 08:33:22 -0700 (PDT)
X-Received: by 2002:a05:6808:1a29:b0:39e:de09:8b96 with SMTP id
 bk41-20020a0568081a2900b0039ede098b96mr2946266oib.34.1687188801974; Mon, 19
 Jun 2023 08:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230613114904.15749-1-frank.li@vivo.com> <20230613114904.15749-11-frank.li@vivo.com>
 <91db8e7b-29fb-3c43-ac38-008ebc9b1f6b@gmail.com>
In-Reply-To: <91db8e7b-29fb-3c43-ac38-008ebc9b1f6b@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 Jun 2023 23:33:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v65xzhzVp+pBsa_Z3aHtK4LOpiTbhA749doMpwSTwDtxCg@mail.gmail.com>
Message-ID: <CAGb2v65xzhzVp+pBsa_Z3aHtK4LOpiTbhA749doMpwSTwDtxCg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] thermal/drivers/generic-adc: Register thermal
 zones as hwmon sensors
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	anarsoul@gmail.com, tiny.windzz@gmail.com, jernej.skrabec@gmail.com, 
	samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	edubezval@gmail.com, j-keerthy@ti.com, 
	angelogioacchino.delregno@collabora.com, bchihi@baylibre.com, 
	niklas.soderlund+renesas@ragnatech.se, wenst@chromium.org, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 11:17=E2=80=AFPM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 13/06/2023 13:49, Yangtao Li wrote:
> > From: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Register thermal zones as hwmon sensors to let userspace read
> > temperatures using standard hwmon interface.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > [Yangtao change to use dev_warn and remove return]
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   drivers/thermal/thermal-generic-adc.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/th=
ermal-generic-adc.c
> > index 017b0ce52122..9531bc2f2ce7 100644
> > --- a/drivers/thermal/thermal-generic-adc.c
> > +++ b/drivers/thermal/thermal-generic-adc.c
> > @@ -13,6 +13,8 @@
> >   #include <linux/slab.h>
> >   #include <linux/thermal.h>
> >
> > +#include "thermal_hwmon.h"
> > +
> >   struct gadc_thermal_info {
> >       struct device *dev;
> >       struct thermal_zone_device *tz_dev;
> > @@ -153,6 +155,9 @@ static int gadc_thermal_probe(struct platform_devic=
e *pdev)
> >               return ret;
> >       }
> >
> > +     if (devm_thermal_add_hwmon_sysfs(&pdev->dev, gti->tz_dev))
> > +             dev_warn(&pdev->dev, "Failed to add hwmon sysfs attribute=
s\n");
>
> Isn't that already done by patch 1/12?

I think patch 12 should just be squashed in?

> Regards,
> Matthias
>
> > +
> >       return 0;
> >   }
> >
