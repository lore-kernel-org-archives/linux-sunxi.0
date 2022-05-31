Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD692F50
	for <linux-sunxi@lists.linux.dev>; Tue, 31 May 2022 15:22:49 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d26so13558757wrb.13
        for <linux-sunxi@lists.linux.dev>; Tue, 31 May 2022 08:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8dhNZzxcDqH8eUH1s8IHbudWKgs58nSE0muzeXBTjuY=;
        b=E1GQjuZW9sZHmfYcFMJ1aCOAduFcwcvyblhlBvq/cAFNzFuTn0SKU0mRpFpAYYq4M4
         RL7F92BzzyAnPM+7e4UY7ciMPz1wi0xQ5Niwo428c0HGjrqIg5PgayxupDIiTTJufuT/
         yavaeCJzEc7NIym5JQLqM5AFLnckZMuEBgZ4JW7vgmEHVAZ5m6gAwzKykayGuJYLM/tN
         s3qc8N1ZX3AwBYay53ph+wJtHECS7/3YjHhRx7xzCPST8JPg9AqSJIJql0Cw+8t2+9ec
         Qf3f4nFLfrNlYYK/JGoZXuS8zAk3wFPqBj5EaAB9zJWye79Ru3uliTiU49n2NCFr6Ybo
         rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dhNZzxcDqH8eUH1s8IHbudWKgs58nSE0muzeXBTjuY=;
        b=PK57YiepPVBRjlOe54NIthZihz1x28G4th0GJs8sGsSXW5Cjj1J66fTUXYkLB/abJz
         jRua6WuQSPjnUGsHUfdfoq5QCvzo3MgO/OLY7Pgt6vi5l85fB8hHF5tkj+bMAYiABl7v
         PjAuLqWg7rK50KQ0pm8hRpT8FOBS+H/ZMZqXLIubKaBzaOqdy8uQ6UoiNGPd60pcgztn
         Z3YLC0S+927bqeOe29l7TtE7QGaGdz56gYJ0a9f/grKOQLJaIu09dFgDfKETMFOsnbmb
         6CI6rh4gyPEREIuLJhl0b16t92kQykuM3B6ZZoilbFIKpn9/b9dTlM2keEmYhQexOJ1s
         WHKQ==
X-Gm-Message-State: AOAM533N6IaMX54YyyUBt0ltM2uIDAJzRUuuEonsU6wHqfphvI9o7tWd
	LLidhv84tknJJFnnsxNn938=
X-Google-Smtp-Source: ABdhPJzxQR5NMIK+rbklutVxfOhZ8bGcR/zgUdGkNetM8QcimtFO8AwzM70tocDrq5+3XsEckuxvww==
X-Received: by 2002:a5d:54c3:0:b0:210:2a28:5666 with SMTP id x3-20020a5d54c3000000b002102a285666mr13156176wrv.345.1654010568205;
        Tue, 31 May 2022 08:22:48 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b0039466988f6csm3062560wmq.31.2022.05.31.08.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:22:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/3] pinctrl: sunxi: Remove non-existent reset line references
Date: Tue, 31 May 2022 17:22:46 +0200
Message-ID: <4400164.LvFx2qVVIh@kista>
In-Reply-To: <20220531053623.43851-1-samuel@sholland.org>
References: <20220531053623.43851-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 31. maj 2022 ob 07:36:20 CEST je Samuel Holland napisal(a):
> I assume these properties came from a lack of documentation, and the
> very reasonable assumption that where there's a clock gate bit in the
> CCU, there's a reset bit. But the pin controllers are special and don't
> have a module reset line. The only way to reset the pin controller is to
> reset the whole VDD_SYS power domain.
> 
> This series is preparation for converting the PRCM MFD and legacy clock
> drivers to a CCU clock/reset driver like all of the other Allwinner
> SoCs. I don't plan to add reset lines that don't actually exist to the
> new CCU driver. So we might as well get rid of the references now.
> Technically this breaks devicetree compatibility, since the old drivers
> expect the reset. But the CCU conversion will be a compatibility break
> anyway, so it's a bit of a moot point.

If I understand correclty, this would cause only DT forward compatibility 
issue, which happens now and then anyway. Kernel would still be compatible 
with older DTs, it would just ignore that reset, right?

Best regards,
Jernej

> 
> 
> Samuel Holland (3):
>   pinctrl: sunxi: Remove reset controller consumers
>   ARM: dts: sunxi: Drop resets from r_pio nodes
>   dt-bindings: pinctrl: sunxi: Disallow the resets property
> 
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  3 ---
>  arch/arm/boot/dts/sun6i-a31.dtsi              |  1 -
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi          |  1 -
>  arch/arm/boot/dts/sun9i-a80.dtsi              |  1 -
>  drivers/pinctrl/sunxi/Kconfig                 |  3 ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c  |  1 -
>  drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c   |  1 -
>  drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c |  1 -
>  drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c   | 22 +---------------
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c   | 25 +------------------
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c  |  1 -
>  drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c   |  1 -
>  12 files changed, 2 insertions(+), 59 deletions(-)
> 
> -- 
> 2.35.1
> 
> 


