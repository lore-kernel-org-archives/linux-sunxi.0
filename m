Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A83A4430
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 15:07:58 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 78so18462753pgb.8
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jan 2023 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=32Padg+6hCGNbUOr+i7YKPADHH8ODZ6PAm/7FSi080w=;
        b=o3kDDhSg/4BKw0h3LN7nnLkP5n88azR2T4lMg++jOkvPcpSodWFNVySeZn/di7Am3V
         bqtdiloyy3vTewr7iJBrM6xBwS5XXAH2591syXmn+EhDHVviuhjY6IIA/Ds1XbPRbgC4
         s3RtRmJAESNNku6+O0hM7I0wQtGJ9S51lfufmw1xxtCYMvjBbQ+fBDl6JPTSvjGg98x1
         OyNFxauuEy/Tvo2N3R6gn1d8R7t+YfbbQW9ukSSYbDYYWW4sE7b6J9hwHJy+xS/f8ER8
         9gIt1RIivbqyypaNKHlN2gqu7/JiwPoGpzlfrtZeJgQqATh/aFNzXc3Fdx0yMeBj5yxn
         yAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32Padg+6hCGNbUOr+i7YKPADHH8ODZ6PAm/7FSi080w=;
        b=Zc8hH9T6jo3f5G6ih4I8GQKoG0B1iM1L8X7Dw3DoOG0UEYmaJoRWo14gZL9KECUjxj
         GKBVyq7gVSeaNEyo5EaKHSYFew+lXkGH4n014jJuq9Tl6Ep+O3VtmMC34uhRWn16irze
         O11lWf58X7TESUV9YmSVmPrKI9kWQWU6NCbRo6fgGFKHhVzVaBmtf9mxK3WeCDrWrJUC
         n0ROwrTvYBIhIpx+xGVfNkSNz4UiGn+ijBEmZb8PsAQ/H0cs5d/2DFop9CgSexDVRvRA
         ptDjhm1AD2v2STRDuSaVuA4udR332VGIcEbBTw04rPWsi47OBn3s0zEvqrTqaN6lbgtH
         d2BA==
X-Gm-Message-State: AFqh2koNAq3l4DWYt3jekSCd0d8IOzDvxT8Uu+taZgFc7L6AjPz4Nhiu
	iyiVQ4GibiSiSxyBafIOq2qjvVXe5WTrPrKfHjz/JA==
X-Google-Smtp-Source: AMrXdXvlgdZ1EhWM9+BrEgG6jEOHpwPMS0nCd80DKfupgv9iB+pTOd4h4gP1SRBOJ+HG1yaubXmSSDuGkMJKN2+wG9I=
X-Received: by 2002:a63:5841:0:b0:477:b650:494b with SMTP id
 i1-20020a635841000000b00477b650494bmr2406813pgm.434.1672672077956; Mon, 02
 Jan 2023 07:07:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220810022509.43743-1-samuel@sholland.org> <CAPDyKFqg0BUbpQwKvZxuMrqoiwBKzZxbgP-e=50yLpKRhQ+zPw@mail.gmail.com>
 <5a6a65c6-6df3-0d24-b28a-324b28fd4756@sholland.org>
In-Reply-To: <5a6a65c6-6df3-0d24-b28a-324b28fd4756@sholland.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Jan 2023 16:07:21 +0100
Message-ID: <CAPDyKFpiuWY+vC1cY8xLozFucsTA0vMHVk_KTpzCfOcXntcBZg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andre Przywara <andre.przywara@arm.com>, 
	Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Jan 2023 at 20:25, Samuel Holland <samuel@sholland.org> wrote:
>
> On 8/15/22 05:11, Ulf Hansson wrote:
> > On Wed, 10 Aug 2022 at 04:25, Samuel Holland <samuel@sholland.org> wrote:
> >>
> >> If the controller is suspended by runtime PM, the clock is already
> >> disabled, so do not try to disable it again during removal. Use
> >> pm_runtime_disable() to flush any pending runtime PM transitions.
> >>
> >> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>
> >>  drivers/mmc/host/sunxi-mmc.c | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> >> index b16e12e62e72..3db9f32d6a7b 100644
> >> --- a/drivers/mmc/host/sunxi-mmc.c
> >> +++ b/drivers/mmc/host/sunxi-mmc.c
> >> @@ -1492,9 +1492,11 @@ static int sunxi_mmc_remove(struct platform_device *pdev)
> >>         struct sunxi_mmc_host *host = mmc_priv(mmc);
> >>
> >>         mmc_remove_host(mmc);
> >> -       pm_runtime_force_suspend(&pdev->dev);
> >> -       disable_irq(host->irq);
> >> -       sunxi_mmc_disable(host);
> >
> > Perhaps a better option than the below, would just be to drop the
> > above calls to disable_irq() and sunxi_mmc_disable(), as that is
> > already managed through the call to pm_runtime_force_suspend().
>
> I like the idea, but it will not work for !CONFIG_PM builds, which this
> driver currently supports.

Good point! I have applied the patch for fixes and added a stable tag
to it, thanks!

[...]

Kind regards
Uffe
