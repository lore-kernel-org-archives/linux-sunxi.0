Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A702118
	for <linux-sunxi@lists.linux.dev>; Wed,  4 May 2022 10:37:52 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id h29so1606948lfj.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 May 2022 03:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+UK7a5jf0KZOl/DUtb1w9sbFadlObhTOJmpHWQdrpc=;
        b=hm2ua1HVcCJqnnAGwF5xo/rNEYAQhftBcLO3n4wSKHPKVExz4/ps2iF279WPGoLBOi
         U2RMBXyKqSHTq/iMqYJuaihXJyHGxfXMUoI6gK1wxi8kI9vXEbnR8PGYbZzf2WhO09kp
         k1h6Mz1WWZ6WZMtwi1Pf49wB1iKajJLIfzVcFWl5oc7BQN0JtmTELvuFDiiGwWtTnfeO
         lMp1bNf08nelacSsBTyAup8ZqotOBF7uKfj/MXiOACYrrxKJdGm3Hq2qfYRWBVX1uCmJ
         hiq3henLKfsJ9oxmGhuJ1Ld7u/gIFo3aBnCDxUuS7EQ66IUB+PXHY3Bylibvxsm03sZF
         tCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+UK7a5jf0KZOl/DUtb1w9sbFadlObhTOJmpHWQdrpc=;
        b=vw6jMI6+AeiIGZUoGnrHi6QjZcEDZVJe+aJEL22Bs5ldc04WQt+bnUcEftuZNuTSs4
         mL4cxq/5fTCyo2+JLxCNs2RnwOYfnJeDcZ0fDWditvJe6ItcJAPSXiS4/AhimCkQdxfH
         yfyQ89+H9GS4Ss99WI485YXJzlADoO4XS79znzeAGsl8NPksPuKKj//+mqx48qbfUkwF
         0T+op7nolLROWRLNSKwFoJwEGYeujoxCTTV3DZiTR7K7Ja6ixkxwpLV9PLcIdeEpXVuS
         Dfn4RIM7tFTXaeNkZ8mqRc9R1NSjPbPzKONBzyaQqtG59zXjW+s5ZHklIgBukUKieMBT
         Zbsw==
X-Gm-Message-State: AOAM533fPilkpdKg43uXDXfzMKcI/+nKtI9uMgTlIBzVpU7eK0AK+ojt
	vruc6vp5EB39lrMmXDh5mX/gvDFhgAOKi/sUqRnlmg==
X-Google-Smtp-Source: ABdhPJwkwNV4rISj+UH7j2rCs0ZZC2RzQF+RxkG2Q4oc4buD17InzEKJpaRYTpbP38qZFRwCTAMNg/Ni/18erN3K+dw=
X-Received: by 2002:a05:6512:301:b0:471:ecd0:ea24 with SMTP id
 t1-20020a056512030100b00471ecd0ea24mr13515183lfp.71.1651660670573; Wed, 04
 May 2022 03:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220424231751.32053-1-samuel@sholland.org>
In-Reply-To: <20220424231751.32053-1-samuel@sholland.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 May 2022 12:37:14 +0200
Message-ID: <CAPDyKFp8JRkMJxPP8g_83o4hqxu8FUARaT8fU0zPR7Yn26cYsQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix DMA descriptors allocated above 32 bits
To: Samuel Holland <samuel@sholland.org>
Cc: linux-mmc@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maxime Ripard <maxime@cerno.tech>, Yangtao Li <frank@allwinnertech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Apr 2022 at 01:17, Samuel Holland <samuel@sholland.org> wrote:
>
> Newer variants of the MMC controller support a 34-bit physical address
> space by using word addresses instead of byte addresses. However, the
> code truncates the DMA descriptor address to 32 bits before applying the
> shift. This breaks DMA for descriptors allocated above the 32-bit limit.
>
> Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/host/sunxi-mmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index c62afd212692..46f9e2923d86 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -377,8 +377,9 @@ static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
>                 pdes[i].buf_addr_ptr1 =
>                         cpu_to_le32(sg_dma_address(&data->sg[i]) >>
>                                     host->cfg->idma_des_shift);
> -               pdes[i].buf_addr_ptr2 = cpu_to_le32((u32)next_desc >>
> -                                                   host->cfg->idma_des_shift);
> +               pdes[i].buf_addr_ptr2 =
> +                       cpu_to_le32(next_desc >>
> +                                   host->cfg->idma_des_shift);
>         }
>
>         pdes[0].config |= cpu_to_le32(SDXC_IDMAC_DES0_FD);
> --
> 2.35.1
>
