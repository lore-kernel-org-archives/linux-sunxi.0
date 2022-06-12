Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC791845
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jun 2022 21:09:11 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id h23so7572494ejj.12
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Jun 2022 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mLPNjDUnvcjmZ4FMqBCTRmEclsWEYRrVtqGZBPO5x7k=;
        b=SjqL5tWU78T5/Uz9HugJ/z0Tg9BpHS0Tf5P5vvdgWNO9JNa5FcCqu/4DftsHA2r7vx
         TmnfLfvFeZb064ZzDB8W3dwDL5ZCA9E1R0smXX9Q990NGgZcmT985MKDpMEEtdhJsy9u
         /7Zhs38nA33vbY8OyKPgvkE5u34Cy1XsQHPfpvlxK5Ejen+40f+VsLJ2GrUeLOShtbcj
         UtynMWGStxnAJ0GVL/pm+FpzO4bU77yreznnBrv8Cap0X9BQQPTU3GAJGWeHMOoKP6Vl
         ArmBZkCcwm6+NjwOJm/o9YHwnoiqmxGLqh74msCXz50P4Pdh553PQ3Wl59/apvD007OQ
         GF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mLPNjDUnvcjmZ4FMqBCTRmEclsWEYRrVtqGZBPO5x7k=;
        b=XzRdEtziv3vvETyGOUjNqHB4lTXg+LsSM3DMd9jbOJGIQEqrKfUqVZ0EaZKrqfjKzQ
         YTnxsKZl6ezRQjQCyVKtg9ZtiaUaA1xfjfoamnjXo7B7zR6a+EQbimul5Y8lX7w0vsIA
         kIiqAowoq/4TF+04ZMLGKU7jcavYXDS+UMxx5tm02IvMxkrrs/gJ4yfYCz792Dctk3ft
         uKTYZUIEVtiztv/wc+qc9IjtQhoOjYxN7z8niy8oTFQQLbBKwy/no9Y2erTHIcdVu2CR
         YEkd6Sow2NIp9vwol8lTYBlRO431Mm2LDpwKAy+9//ELtGWMx2EWljVuYYr3/EVPy3Hk
         xCgQ==
X-Gm-Message-State: AOAM531DVI/4Zs2xl/pnMmTnaszWkf4ZOSZ4Ac7YefHCejA3jFFvGbnT
	fWblxBAIgDcBL8azUOq5oqY=
X-Google-Smtp-Source: ABdhPJxf8a6zY47Y+E83LFTn8PcaN6GpEYohhYO0tp4yZMZaCK/233usfpgdu80Pfd1WtXcyhDOJ5Q==
X-Received: by 2002:a17:906:3693:b0:718:4125:f08d with SMTP id a19-20020a170906369300b007184125f08dmr2447118ejc.146.1655068149494;
        Sun, 12 Jun 2022 14:09:09 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id io11-20020a17090780cb00b00715c322bda1sm1243661ejc.69.2022.06.12.14.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 14:09:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel@sholland.org>, Bartosz Dudziak <bartosz.dudziak@snejp.pl>, Bjorn Andersson <bjorn.andersson@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Luca Weiss <luca@z3ntu.xyz>, Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Stephan Gerhold <stephan@gerhold.net>, Thierry Reding <treding@nvidia.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/3] ARM: sunxi: Remove A31 and A23/A33 platform SMP code
Date: Sun, 12 Jun 2022 23:09:07 +0200
Message-ID: <2833034.e9J7NaK4W3@kista>
In-Reply-To: <20220531045038.42230-1-samuel@sholland.org>
References: <20220531045038.42230-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 31. maj 2022 ob 06:50:35 CEST je Samuel Holland napisal(a):
> This series is preparation for converting the PRCM MFD and legacy clock
> drivers to a CCU clock driver. The platform SMP code references the PRCM
> node to map its MMIO space, which will break when the PRCM node is
> removed/replaced.

Why can't we just leave old platform code? If older dtb file is used, it would 
still work. Actually, isn't trivial to support new CCU binding too, just by 
including new CCU compatible string? IIUC new CCU node will have same address 
as current PRCM node.

Best regards,
Jernej

> 
> Since PSCI has been available for 7+ years, instead of trying to deal
> with the migration, I think it's safe to just delete this code.
> 
> 
> Samuel Holland (3):
>   ARM: sunxi: Remove A31 and A23/A33 platform SMP code
>   ARM: dts: sunxi: Remove obsolete CPU enable methods
>   dt-bindings: arm: Remove obsolete CPU enable methods
> 
>  .../devicetree/bindings/arm/cpus.yaml         |   2 -
>  arch/arm/boot/dts/sun6i-a31.dtsi              |   1 -
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi          |   1 -
>  arch/arm/mach-sunxi/Makefile                  |   1 -
>  arch/arm/mach-sunxi/platsmp.c                 | 194 ------------------
>  5 files changed, 199 deletions(-)
>  delete mode 100644 arch/arm/mach-sunxi/platsmp.c
> 
> -- 
> 2.35.1
> 
> 


