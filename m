Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7ED53B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 16:34:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r2so1859330wrv.7
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lAIo3spWClLaTdCHxySX0ouHrSXLWypZM77NTYweN4=;
        b=eBDP8rvyt7dl//bCEO8LrldKofxFCS2KF4Gz8zBBX2kN4AQ2DAyM5YtayeT/dDYKMg
         X0Qp+gHtvnsVqnvSh9SD/U926xqPOw3bgmfAF0B/I4fUm+eTNalEO6RSdX/2Vc1y6PmY
         2woD/uit8a55nMlZlxXtbdL9+J9wxo8KzddOkDuHrFBwRc31dZCT3LTIxdf1f3kIoIIi
         No3OceHFZJWaJc9wj9QuvxRrsQUItTOk3vS6FIMBWL+dBJ8nyNvfXhO+pvMa0m4w3LIF
         7f2XQhQswdzkH7Z/6s7q4fOaDvzs0pjAz0n4OMOKCGJ3VtxZICs/9YUCTYxjePtFm/tb
         RSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lAIo3spWClLaTdCHxySX0ouHrSXLWypZM77NTYweN4=;
        b=lrXmSPfPcIcI5wrwHcNqEmwfMvDXDBnda850IObQq+Uujjq6XJOnyME+cA5OP+dvuk
         07SfMv1D8SohEjtSwlHVD5G6YbWgRP+amf/Ir+O3ZDN8WHi3clamLKIwQg0mxpuTwpx5
         /7YhFNgCTLrJuA/HhRSRc/WOv5yC64sjnFFQhTyn2Hr9IF+t5y2vg/x0VpVX0lfZTqkz
         C0wjKjcWQdOZBSsmCqMJ1zQ+45gj1pa6y0xGJTK8p+t488QAIY12ZO2nHkRPz3KuTPMS
         GwpYT+GiC/wC+pBuWroM/awvhYDj7lppksXlY1gXVMckjcf4CE6DdyhfYhDP0EqxY2qa
         4tqw==
X-Gm-Message-State: AFqh2kpNYQ21V2ASi1xykogUsk1EXi2/kEE2ve0ERZp7BlZUN/txnRWg
	SurJ9Iaed2TdN2/gafLB7bqsdFWwm656AHlx
X-Google-Smtp-Source: AMrXdXu+KA2fB53cJsZQeu9XcWeoxFE9i61XhKCbJ/q9IJZHzllc3rqNHO8IHGwyEIhC6Mu/EMwedQ==
X-Received: by 2002:a5d:6e8f:0:b0:276:473f:7120 with SMTP id k15-20020a5d6e8f000000b00276473f7120mr32573146wrz.26.1672936487924;
        Thu, 05 Jan 2023 08:34:47 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id s18-20020adfdb12000000b00241fde8fe04sm37319469wri.7.2023.01.05.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:34:47 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/2] Allwinner power domain support
Date: Thu, 05 Jan 2023 17:34:46 +0100
Message-ID: <1915282.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20221231160402.16157-1-samuel@sholland.org>
References: <20221231160402.16157-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 17:04:00 CET je Samuel Holland napisal(a):
> This series adds support for the power controller found in D1 and other
> recent Allwinner SoCs. There is no first-party documentation, but there
> are a couple of vendor drivers for different hardware revisions[1][2],
> and the register definitions were easy to verify empirically.
> 
> I have tested this driver on D1 with the video engine. There is no DT
> update patch here to avoid dependencies between series. The example in
> the binding is what will go in the D1 DT.

So such driver is needed for H616 for GPU? Or is power domain handling 
different there?

Best regards,
Jernej

> 
> [1]:
> https://github.com/mangopi-sbc/tina-linux-5.4/blob/main/drivers/soc/sunxi/g
> pu_domain.c [1]:
> https://github.com/mangopi-sbc/tina-linux-5.4/blob/main/drivers/soc/sunxi/p
> m_domains.c
> 
> 
> Samuel Holland (2):
>   dt-bindings: power: Add Allwinner D1 PPU
>   soc: sunxi: Add Allwinner D1 PPU driver
> 
>  .../power/allwinner,sun20i-d1-ppu.yaml        |  54 +++++
>  drivers/soc/sunxi/Kconfig                     |   9 +
>  drivers/soc/sunxi/Makefile                    |   1 +
>  drivers/soc/sunxi/sun20i-ppu.c                | 207 ++++++++++++++++++
>  .../power/allwinner,sun20i-d1-ppu.h           |  10 +
>  5 files changed, 281 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml create
> mode 100644 drivers/soc/sunxi/sun20i-ppu.c
>  create mode 100644 include/dt-bindings/power/allwinner,sun20i-d1-ppu.h




