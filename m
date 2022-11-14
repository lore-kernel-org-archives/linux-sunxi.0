Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC4C4C63
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 12:24:39 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id a6so6964152vsc.5
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jseDXg+bfKp9LA8sgvsVkV393Se7NwCYuZDEZ/MV0GY=;
        b=Dhl14eH0HkdFXG7lsJUSPG2LyOCPf2jM54eKcSPqAG1d3jeFQRhIihhAFnNCvR6rlM
         Ewd1Rd+Q2KQ/1Ys1sdZNSb6zVL8xds5yO2sTnjpVHH6YHeScThrqQkLRh8zEzFp0VtIW
         Rcyl70wf2LtQnlpXbm3FJOw4pkwqAaS9M1xsi3egMPHsPw30ICIevCRk+aA2oOzwHPPQ
         Q0w0970PGr1v3opaGDQU5gkAy8aHx+gCkMzJkzqOCZEgvg+boyI8aR/QbI2kdrXEtk30
         pGCg4iMv2wY7LZboOZiguXXgPS783vefsxjkaWbkjtpfv9FJareAKFfKpbzPz6NXyLek
         0zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jseDXg+bfKp9LA8sgvsVkV393Se7NwCYuZDEZ/MV0GY=;
        b=bKwVmcf3sUfdkPk33Xk/J5KbIFgf606ETwUq8NIDpcRViWnJWk6EItoz+fWtSRincV
         GUqTuhSYvZPfQyR0sjxpKLo3EbFIssZWFOTiqPUayGvTEgaKMMPIA3E4vjz+R8GyUuU+
         fFI3U8dbBqUxyU32sr8qhiy7KKO80FGYetlxCFDUmSmhUPsFMJMcW0FCwEnNkOWnmenx
         AnKck4fogh/RxqtD2AOtgwtTpUuIxxU15oosZ24jK0dUV9JytyrpAS9IK86DDNRLjHQ3
         WBUujz0B4Xd2/dpLK3gQL8VwPUCGjjPtTE0N0RuAfo1+nlkxiENYPq0YnJ0cPydToovn
         i8jw==
X-Gm-Message-State: ANoB5pnwE6rOeBG/F6EvwD2y+BdOIwH35VWRCRVebrkv6OPCMfMGXHVI
	MQGHj83Y2XOnqs3hZJa8ksuEWxPwBpLJ9x3fsrZW1w==
X-Google-Smtp-Source: AA0mqf7LqmPTOFN/Y8WkTSdzCAB667YYC/i5XC95xOIVYt7t6fiF6JJKoRi25YSbSWj2mvqEHYfmbfUjgZA2RK7RBY0=
X-Received: by 2002:a67:ce13:0:b0:3a7:769c:6dee with SMTP id
 s19-20020a67ce13000000b003a7769c6deemr5816436vsl.13.1668428678482; Mon, 14
 Nov 2022 04:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com> <20221112151835.39059-7-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-7-aidanmacdonald.0x0@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Nov 2022 13:24:27 +0100
Message-ID: <CAMRc=McQCrYEo729k9cnH_bB0Vt5BSB1OHg0tsA3rBL51EdUKA@mail.gmail.com>
Subject: Re: [PATCH 06/18] mfd: max77650: Remove useless type_invert flag
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: lee@kernel.org, mani@kernel.org, cristian.ciocaltea@gmail.com, 
	wens@csie.org, tharvey@gateworks.com, cw00.choi@samsung.com, 
	krzysztof.kozlowski@linaro.org, mazziesaccount@gmail.com, orsonzhai@gmail.com, 
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, jernej.skrabec@gmail.com, 
	samuel@sholland.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 12, 2022 at 4:19 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> The type_invert flag does nothing when type_in_mask is set, and
> it's part of deprecated functionality in regmap-irq. Remove it.
>
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/max77650.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mfd/max77650.c b/drivers/mfd/max77650.c
> index 777485a33bc0..3c07fcdd9d07 100644
> --- a/drivers/mfd/max77650.c
> +++ b/drivers/mfd/max77650.c
> @@ -138,7 +138,6 @@ static const struct regmap_irq_chip max77650_irq_chip = {
>         .status_base            = MAX77650_REG_INT_GLBL,
>         .mask_base              = MAX77650_REG_INTM_GLBL,
>         .type_in_mask           = true,
> -       .type_invert            = true,
>         .init_ack_masked        = true,
>         .clear_on_unmask        = true,
>  };
> --
> 2.38.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
