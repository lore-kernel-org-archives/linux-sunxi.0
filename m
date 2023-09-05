Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34328C14
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:33:17 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-986d8332f50so461751466b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693945996; x=1694550796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGd37heVkKpNeW2/JaXN+6U9D28h1iXnKKCdvuTuCX4=;
        b=i7NIMK3FX+r9QTT7nsh0Jsyp4oJ3abhAtlji7BiWZFPBkkQdaVZA1yKfaZAL5V4468
         zFWJQ1wpp6JYW0glEi9U9QQHS5m6Ga3kJJ/0qeKLTgAI789/jyL7PZXbWczKKJWT4xOk
         lzKZNfLACiNP2XMdMyHPLvBma3sB8/sy9fi1okahTVlVlBAw0Vq9un4bvx4fwnpbRKzH
         sYFm/Tdh4JbjWfh1o+K9yCp/jyHSNrLPp2aUHOOyKJxTJOVxJH+l/ZsTVtXvGNZWrcqK
         iqph8NAW4oJwRNtxEhYWfTz+5AnxIOubPS0PwNIWHicosPXSOnVeeDuE08Het4C3T7jK
         Enlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945996; x=1694550796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGd37heVkKpNeW2/JaXN+6U9D28h1iXnKKCdvuTuCX4=;
        b=V+5SUNNsupf298uITkKv4DTWTSMly6EGv+zKqT5ZsNee3BDDTI6IDwFsIumgJ2vC0w
         VECFQuDiT7D4n8fVPNysLZNLt3NevajrBNoJyuiBHNna8QIqEeeM7E6sBiVJhqx0r2BA
         +Wn2xCXO84JbuJTyzDHoHirIrYSW/Fb2cpw8O8ldc4C2VqXZf3qLhMNcuIP4Ot01veNG
         WiWlPxXyyKE/+sln0jBdkWeZbhY18q+l1OEhed1qPfbRAtKY4cAl3l6XBLMil8++GyM9
         KgjvXkRIifr+pB17gLCVnev5/pfTN6qbond3MdmB/ns7Z4T5DUt0lhLDd6nocAayw5tO
         hV2A==
X-Gm-Message-State: AOJu0YxCtQUhgmC8tTjUU3n/GCUL6uUl2H7cSSpNBzKakE7ejDKBASCf
	cAdfE+Ap0ODuP0Uo0z6mHnKKvh4qaM0oJtr0
X-Google-Smtp-Source: AGHT+IENZGk26Bm3PR5lydcBmGnBLfg4yzMPCxRYm/sOmVPlXgIH6rG0SRwq7IEeS0NdXyk/8TrfhA==
X-Received: by 2002:a17:906:314f:b0:9a1:fc1e:19ac with SMTP id e15-20020a170906314f00b009a1fc1e19acmr714243eje.33.1693945995700;
        Tue, 05 Sep 2023 13:33:15 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709061c1700b00992b71d8f19sm7964262ejg.133.2023.09.05.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:33:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, wens@csie.org, Yang Li <yang.lee@linux.alibaba.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Yang Li <yang.lee@linux.alibaba.com>
Subject:
 Re: [PATCH -next] clocksource/drivers/sun5i: Remove surplus dev_err() when
 using platform_get_irq()
Date: Tue, 05 Sep 2023 22:33:14 +0200
Message-ID: <8307837.NyiUUSuA9g@archlinux>
In-Reply-To: <20230831041414.66434-1-yang.lee@linux.alibaba.com>
References: <20230831041414.66434-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 31, 2023 6:14:14 AM CEST Yang Li wrote:
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from either the platform_get_irq()
> or platform_get_irq_byname() functions as both are going to display an
> appropriate error message in case of a failure.
> 
> ./drivers/clocksource/timer-sun5i.c:260:2-9: line 260 is redundant because
> platform_get_irq() already prints an error
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej
> ---
>  drivers/clocksource/timer-sun5i.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c
> b/drivers/clocksource/timer-sun5i.c index 69fee3540d37..0d229a9058da 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -256,10 +256,8 @@ static int sun5i_timer_probe(struct platform_device
> *pdev) }
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "Can't get IRQ\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk)) {




