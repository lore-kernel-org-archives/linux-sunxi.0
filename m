Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159E07E
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 10:11:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id v2so10022934lfi.6
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Gmr17YBDbHMvM932wEH6jhfSWFYGcnH6MbBcnQ/BW6g=;
        b=Ueh3RcrS+ZQZs8802jLuUeirUvPqjjFabWZ7YC0GkNrk5wxz+RpctVMgDZUGE+s6fn
         hpVH1scGxoKykqcH0g2XO3Bvxpb0D5nhO9zQx8Q+h4a6biDYR3A9bXXQs81Qo3quX8Ff
         I1axUXE4r/QhzDG5ELaF3MySkcDdUmIctOE80MSkhTk781Fr35lLe2NswQNwmanGqXID
         qYDTgxrM3jJoj3tz9YRrl8HwLBF61Sb0Pe6KSUD0kt74T1+k/CkAevXqHBD62dAe6Ls8
         herGn9gG0BqtVG0JFaJLmaLjV1ozeMS7EbnwWcVlgmpvOwquABXx5qHaFBnS06tGsFNp
         o6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Gmr17YBDbHMvM932wEH6jhfSWFYGcnH6MbBcnQ/BW6g=;
        b=ZdOi4B8tQ9OVIiNW7iwa5mJL82Dun2u7Jdn2vFhAXhS+lHMRdqH1YNOs3W0gv9QIyi
         2DN8T2LVfeFoFKJsApziVAIVR1LViAhWBLFm9rWnU7aEIh/atPrT4oMnuIaDcQXXRRqE
         I40sEHiUJJWdN8CsThhHHRdGKMlXC6RdNQBs1gqcvjVa1HUSkfZM2M5gQ/IWeT1mrXN0
         hGsxsdoqjFSFq9btojMX4zq+CQ/vYhSbMg4AAXe/XdrAJ5qLXFxUy2FKP/C/s8tf7YFS
         XZ/GfgJoifcWyXfpQ0S5I6b0HfR38sTJKQUm5+glvRSuCHmBx1uaeQbfCeCB1jB4/Wqw
         Lg4w==
X-Gm-Message-State: ACgBeo0zAMcuTl8kvD27JmlOLI9sTiTJraxzv0lgRqzC28WXC5ot/wHW
	ilLaXzPo6IWO1CyYekXNul9Mo/qcBtWA1wRGD5MomQ==
X-Google-Smtp-Source: AA6agR4C2IO/xQv/D2+AAUs0oCi5pATmLAwL9uiqdJ6839Bh59m6MRIwTdVE+PNLo/Hib6+NITjoDGusDIjIzbLy27k=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr5795536lfu.167.1660558318027; Mon, 15
 Aug 2022 03:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220810022509.43743-1-samuel@sholland.org>
In-Reply-To: <20220810022509.43743-1-samuel@sholland.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Aug 2022 12:11:20 +0200
Message-ID: <CAPDyKFqg0BUbpQwKvZxuMrqoiwBKzZxbgP-e=50yLpKRhQ+zPw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andre Przywara <andre.przywara@arm.com>, 
	Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Aug 2022 at 04:25, Samuel Holland <samuel@sholland.org> wrote:
>
> If the controller is suspended by runtime PM, the clock is already
> disabled, so do not try to disable it again during removal. Use
> pm_runtime_disable() to flush any pending runtime PM transitions.
>
> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  drivers/mmc/host/sunxi-mmc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index b16e12e62e72..3db9f32d6a7b 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1492,9 +1492,11 @@ static int sunxi_mmc_remove(struct platform_device *pdev)
>         struct sunxi_mmc_host *host = mmc_priv(mmc);
>
>         mmc_remove_host(mmc);
> -       pm_runtime_force_suspend(&pdev->dev);
> -       disable_irq(host->irq);
> -       sunxi_mmc_disable(host);

Perhaps a better option than the below, would just be to drop the
above calls to disable_irq() and sunxi_mmc_disable(), as that is
already managed through the call to pm_runtime_force_suspend().

> +       pm_runtime_disable(&pdev->dev);
> +       if (!pm_runtime_status_suspended(&pdev->dev)) {
> +               disable_irq(host->irq);
> +               sunxi_mmc_disable(host);
> +       }
>         dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
>         mmc_free_host(mmc);
>

Kind regards
Uffe
