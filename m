Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3991875
	for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 20:52:38 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id m20so5094498ejj.10
        for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjJ5UCoJeEEihDN4cVR/wdYe+l5GkBSpbVBb3aSL4no=;
        b=fmCZGiSEap2Sdg2Jlb5iXaZ7JVSkwbh+dArG/YZsXXY674HMsPQBqz7nF3kI/a1vi2
         h1KsAfji5yU3wvX8nswk6Y+k+0jsVf9GH4Tv9zLclptTrrAe/bOGy8qQMrfPompfJcxx
         OHgOf2qjCrCXP1lCTzZEqW9quldpOgto7x6K1UHu8F1TF/e6g2lj5BP4Q8cWqBPK7I6D
         mWlL7Y9AHd6TB3xoyjpY0fm3kk6S/P0pKPFg6ni9PMposl3RUYbhwcyMKqzOez3eJI7r
         fc6RebtGxyjarWJTFMQGT540zTK7JQyofIVuDc4/m7O2hS43b1mg3/dvE/cdNQftPMJF
         3LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjJ5UCoJeEEihDN4cVR/wdYe+l5GkBSpbVBb3aSL4no=;
        b=ir5+o1zrLxHRnq9kTHQj/GJyZH2OT/sIsGVefL+k6YjptuVRLQf4sxRvDWRh/Ivq/+
         rlZtx8xgrrnOyLyuQoK5UfIA2UWzP5paRPmxa0IUze88WuQ1hiO/5Y+J/ZssmDdeu3+k
         dJ2rSSUUPUixg1aIzRWuIJJvNip6hRu5OUfrekWHqi9YlZPhpW/6wgyEd1qIcIdJVDOT
         aHvJURwQiprytDITmZ7pmQiSAYnrjpdh9IVyo8z1Xv9LjpC+ZX9B5iUIB8TVNqgFuaB2
         dkZp+laGcyucFk+x+o+sgdn50qttiJTGLMQcWDHTUHjS+5DdQx/OLWV0b6f5crN6yPw5
         IHiw==
X-Gm-Message-State: AOAM531cvfOT/DutUGZnsd/BDoHBvA3JPlu+DHOStTBA8Qi7oYgnfEWg
	NuzMLLAPZHmPdDvaU3Yrd5o=
X-Google-Smtp-Source: ABdhPJzyP6vXYbvseTprmcbD7yTLmiYVknJtdA3ZxP10dTaYa5/p1h3eSUCZzGxfr18pM+7PjFtGjQ==
X-Received: by 2002:a17:906:d7ba:b0:6fe:a119:c4ac with SMTP id pk26-20020a170906d7ba00b006fea119c4acmr32307672ejb.129.1653598356730;
        Thu, 26 May 2022 13:52:36 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id i10-20020a1709064eca00b006fe0abb00f0sm823522ejv.209.2022.05.26.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:52:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linus.walleij@linaro.org, wens@csie.org, samuel@sholland.org, linux-gpio@vger.kernel.org, Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date: Thu, 26 May 2022 22:52:35 +0200
Message-ID: <8939552.CDJkKcVGEf@kista>
In-Reply-To: <20220525190423.410609-1-andrey.lalaev@gmail.com>
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne sreda, 25. maj 2022 ob 21:04:25 CEST je Andrei Lalaev napisal(a):
> Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> Previous implementation used absolute pin numbering and it was incorrect
> for R_PIO pinctrl.
> It's necessary to take into account the base pin number.

You didn't explain how issue manifests. How did you find it?

Best regards,
Jernej

> 
> Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/
pinctrl-sunxi.c
> index d9327d7d56ee..dd928402af99 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -544,6 +544,8 @@ static int sunxi_pconf_set(struct pinctrl_dev *pctldev, 
unsigned pin,
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
>  	int i;
>  
> +	pin -= pctl->desc->pin_base;
> +
>  	for (i = 0; i < num_configs; i++) {
>  		enum pin_config_param param;
>  		unsigned long flags;
> -- 
> 2.25.1
> 
> 


