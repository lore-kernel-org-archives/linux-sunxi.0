Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CEA939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:00:42 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id cy23so66693982edb.12
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jud7IfhPHnbiyASn/wGtL+P6Zu5IjTWaT91NPp+KBg4=;
        b=YjfW3qsRh2lDVopihGnL9OBIV/KoLXiy2unWq+FTm1BMFrEvW/Kxr/IayeNfrTrVWa
         QJp1r2ZCFHPtdbvXqGmoaic5LdWTAE7PEZnkACgboWoW2WW0cgcB21vSIxSbroNxafMH
         jt2shn+0c3AoKE+Wy7qJNYht9ftmyzORhPzKXCjzlymJnm9cT/sVvFtL1WnX40iLBbqc
         WQ0BjlcjNIGctNGkr4RjgaIp180tuYSQyYCj1T2T4IRFALyEb0DuUvzrjVIM7vfs20Qz
         lkOsQO6lyMVODHHKm98R1Mo0Ea2YiPfHDX0qg08k3LDz0sXdZuKNSIIBeq/pX5bP+Fx+
         hxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jud7IfhPHnbiyASn/wGtL+P6Zu5IjTWaT91NPp+KBg4=;
        b=eJMO1JITuJE8jCFfeOxeLaj+yaFIQQkizCLUlZvlbk133K+d8O2Vl/jTpeavqzo1NY
         ve1lBy72WuEjKhRl0B7+//lGfIVPWXSJaf3tLU0A2lYLrSyin309iSvZ5JRV9uyUy51f
         DTbRLlQ/+iDYuck+nJXNCfJPrzvMcSjUNwuFmZI+iEhzId2evLre/zpVJepQRz247QQM
         Dkd3cdgKeh8S7pvfDfrCvJyA88k4tf3TwXZJdcDdIFpFbZHWUgJE7BiKOGAugky9e6of
         6m9jN/rRzTm2MRVkInC5kYHUlpIp4cZYGsRPzAd2kxzNb6bouVn8dpYuhxJ71U3nVaIp
         JnbA==
X-Gm-Message-State: AO0yUKWlHO4SvGN/QB3fWmlPeJUk8wz4VsT5HByhTKc1sU8rUy1zuwZl
	vBHe9wa+iAb1WJbGD+lBvPI=
X-Google-Smtp-Source: AK7set8M3sO1PiJs8c2knz3ceIkbAINsUNHeIyiesvCEzaMZW01qmPTAadH7OxAQIlvaDexMXWdwgQ==
X-Received: by 2002:a17:906:5dad:b0:8b1:3a18:9daf with SMTP id n13-20020a1709065dad00b008b13a189dafmr5128538ejv.74.1678824040344;
        Tue, 14 Mar 2023 13:00:40 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id dx25-20020a170906a85900b00927976a5562sm1525617ejb.181.2023.03.14.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:00:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] soc: sunxi: Use of_property_present() for testing DT property
 presence
Date: Tue, 14 Mar 2023 21:00:38 +0100
Message-ID: <13221354.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230310144724.1545223-1-robh@kernel.org>
References: <20230310144724.1545223-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 10. marec 2023 ob 15:47:24 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/soc/sunxi/sunxi_mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
> index d90e4a264b6f..1734da357ca2 100644
> --- a/drivers/soc/sunxi/sunxi_mbus.c
> +++ b/drivers/soc/sunxi/sunxi_mbus.c
> @@ -82,7 +82,7 @@ static int sunxi_mbus_notifier(struct notifier_block *nb,
>  	 * Older DTs or SoCs who are not clearly understood need to set
>  	 * that DMA offset though.
>  	 */
> -	if (of_find_property(dev->of_node, "interconnects", NULL))
> +	if (of_property_present(dev->of_node, "interconnects"))
>  		return NOTIFY_DONE;
> 
>  	ret = dma_direct_set_offset(dev, PHYS_OFFSET, 0, SZ_4G);




