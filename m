Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3AB8485
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 21:00:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id u24so19067331edd.13
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 13:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40S/F5BELCFB3y9d/ai9+Kw1YT1iYA4dyds8YjgYhaY=;
        b=Xw5Wf5b7B/XodNUpFS/B6Ov4czpPP8CjSWwIVohdOnh3SKVillyHvAllg5+8ECplGF
         n9lo0tIQqE6XEVUignZBgYlhd6MluozJKU64iwAsu1y0OmB+TE1uck7m/XujJPgQDC/6
         B6uZdE55WIUqCXlRbCJCG7To74VkzcDaYN8B73XyYaeoQps8qMdaInj/+bFm61XUubav
         fi+p3m0NWbVKskCSuw+s8StvrNSh40vQ3F6P1b9o2FCALPAoNmCEFSwZomqjTTa8y8HE
         Dy9zoCioYuk/gJRhFJOoRkmQGxYurCA0e2M2zetIV0lLsoXjqjs1/VNWm4/Tm0z5oAo9
         Ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40S/F5BELCFB3y9d/ai9+Kw1YT1iYA4dyds8YjgYhaY=;
        b=TyOp/tN4L5zfCUMlRiux3sCrwQx/Q1kbhI8WGWGPMMn+MJgzHjeTuqejzVyKJkRNbg
         UONZo0wXCxrwSf0plOT4ApdPlXZ2v4kZMOOCd35DCPKYTYwxHxmlGMUIprI6hjUBsoyq
         8wBRWx5c+0uBmbpyKa6dFHVtcwyErLnmgcaDWkUhR6vgXoR/OPFymPz9icSqffGGjsb+
         E0bEikJW2R2eAPJfh9SJBHetEP/DoIDetWvM9fINqlLcf0jbSg8wbLucQUMNeTkdaQu3
         ZRo1kzxPqPaWX1GYWOu7z4QBhj3F7LnPct+iTYdkqHDLhduYSZ51GgjGyPGJMhnB+yya
         DjQA==
X-Gm-Message-State: ANoB5plmeGZRQrQ0n8h7ILmr5SnBx3mJGL3mEVeuXpDOP8xP7sXJPyCK
	IutIjWvxJNaAiPUDTtiJ2LxRAEyppCCzvQ==
X-Google-Smtp-Source: AA0mqf6G5js9yVA+Wu3EQp7CP6PyKNGeW/0xYFHxWYs1E7lEod9nMTctxOBnOzt/UHlB+0vW018ZPg==
X-Received: by 2002:a05:6402:1cc4:b0:462:df63:5ec5 with SMTP id ds4-20020a0564021cc400b00462df635ec5mr12618430edb.147.1668459608543;
        Mon, 14 Nov 2022 13:00:08 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id kw26-20020a170907771a00b00781d411a63csm4585087ejc.151.2022.11.14.13.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 13:00:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 3/3] bus: sunxi-rsb: Clear interrupt status before each transfer
Date: Mon, 14 Nov 2022 22:00:06 +0100
Message-ID: <2170633.72vocr9iq0@jernej-laptop>
In-Reply-To: <20221114015749.28490-4-samuel@sholland.org>
References: <20221114015749.28490-1-samuel@sholland.org> <20221114015749.28490-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Samuel,

Dne ponedeljek, 14. november 2022 ob 02:57:49 CET je Samuel Holland 
napisal(a):
> Currently, the driver clears the interrupt status bits after anything
> could have set them. However, this requires duplicating the same logic
> in several places.
> 
> Instead of clearing the status flags in the interrupt handler, disable
> all further interrupts by clearing the RSB_CTRL_GLOBAL_INT_ENB bit.

where is this bit cleared?

> Then we can delay the status register write until the start of the next
> transfer, so it only has to be done in one place.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v3:
>  - Add a patch refactoring how the status bits are cleared
> 
>  drivers/bus/sunxi-rsb.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index 3aa91aed3bf7..cb622e60897b 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -279,6 +279,7 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb *rsb)
> 
>  	int_mask = RSB_INTS_LOAD_BSY | RSB_INTS_TRANS_ERR | 
RSB_INTS_TRANS_OVER;
>  	writel(int_mask, rsb->regs + RSB_INTE);
> +	writel(int_mask, rsb->regs + RSB_INTS);

Wouldn't be better to clear status before enabling interrupts? Unless global 
interrupt flag is cleared beforehand, but I don't see that anywhere.

Best regards,
Jernej

>  	writel(RSB_CTRL_START_TRANS | RSB_CTRL_GLOBAL_INT_ENB,
>  	       rsb->regs + RSB_CTRL);
> 
> @@ -286,7 +287,6 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb *rsb)
>  		timeout = readl_poll_timeout_atomic(rsb->regs + 
RSB_INTS,
>  						    status, 
(status & int_mask),
>  						    10, 
100000);
> -		writel(status, rsb->regs + RSB_INTS);
>  	} else {
>  		timeout = !wait_for_completion_io_timeout(&rsb-
>complete,
>  							  
msecs_to_jiffies(100));
> @@ -296,12 +296,9 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb *rsb)
>  	if (timeout) {
>  		dev_dbg(rsb->dev, "RSB timeout\n");
> 
> -		/* abort the transfer */
> +		/* abort the transfer and disable interrupts */
>  		writel(RSB_CTRL_ABORT_TRANS, rsb->regs + RSB_CTRL);
> 
> -		/* clear any interrupt flags */
> -		writel(readl(rsb->regs + RSB_INTS), rsb->regs + 
RSB_INTS);
> -
>  		return -ETIMEDOUT;
>  	}
> 
> @@ -503,15 +500,11 @@ EXPORT_SYMBOL_GPL(__devm_regmap_init_sunxi_rsb);
>  static irqreturn_t sunxi_rsb_irq(int irq, void *dev_id)
>  {
>  	struct sunxi_rsb *rsb = dev_id;
> -	u32 status;
> 
> -	status = readl(rsb->regs + RSB_INTS);
> -	rsb->status = status;
> +	/* disable interrupts */
> +	writel(0, rsb->regs + RSB_CTRL);
> 
> -	/* Clear interrupts */
> -	status &= (RSB_INTS_LOAD_BSY | RSB_INTS_TRANS_ERR |
> -		   RSB_INTS_TRANS_OVER);
> -	writel(status, rsb->regs + RSB_INTS);
> +	rsb->status = readl(rsb->regs + RSB_INTS);
> 
>  	complete(&rsb->complete);
> 
> @@ -532,9 +525,6 @@ static int sunxi_rsb_init_device_mode(struct sunxi_rsb
> *rsb) if (reg & RSB_DMCR_DEVICE_START)
>  		ret = -ETIMEDOUT;
> 
> -	/* clear interrupt status bits */
> -	writel(readl(rsb->regs + RSB_INTS), rsb->regs + RSB_INTS);
> -
>  	return ret;
>  }




