Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589EA37D04
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeIX1z0S"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a234dc0984fso323825666b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 08:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703004422; x=1703609222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeShSK6cVdZ3tR/tSiq3rkncbpvvwt6PkK61/vcn6JY=;
        b=VeIX1z0SVMnT7HgEBtroQQ1CTFbxpNVhLgCwvfTS+5m1/SzST3fs+fUPJ/Bz8rb/3U
         NJsR+yaCQaevXVAYkjnloRhOt8tZ94r4/iDq2WidHN1LcbRht9b7yBSJde5laB8V0prs
         ETDtAG4FqUsr1O31cbK3ZS4TbdWGMbGh6PtX4MA/HUJmcDxUJYGA7ahhMZbGzTghtiOp
         eoLne8ygHtjKQUag6rm5dFCFiH6BWwhA1f7vqy805dW003nSH2WaR/40xyuOkrAYW5Yc
         Mdd0HyAasLH5cqF5Bt/Vo5/+4a+r/67/LoVKseJqe4+fbObmkqBHb06OXpe0ro52yGOm
         vg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004422; x=1703609222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeShSK6cVdZ3tR/tSiq3rkncbpvvwt6PkK61/vcn6JY=;
        b=krfhEHcFxa77VYULZR64cPHS3pEZqIL2eZxMjunCzQ/xIm2r3QjGr2iPdWNwas21mZ
         xqJtaTDtYuY7PLqjLRvUXMvqneva195GIXxIUi0uhqjAUGBcFjK7O4d9bj4SeXE+utLM
         ys9PHvt3yrZhqAliKkiU38LThNAg5PtP02DpFwnxDzTDZcW2y4qyc7VMFrf9SdcmMBb6
         Ww41KN7AmHQdHeNKEjFXBbhTd5uRxooZ8hWYyvyIF+4u7Doi8Ox0iKY7lGA/DEs6Tvk/
         M6SkQdUKPSIz1nqZaC+JKhSJSpGLz7aJlYvFbKD7aca0ABoc+dfI7APFH2o21qdFLTAp
         Gn5Q==
X-Gm-Message-State: AOJu0YwRnjz0VUO/eWEv2qswCQ30KMHvk2Mj38qbj2nRE/041mqVkNLo
	cNfEm/oriFMx9DHWW/g9MT0=
X-Google-Smtp-Source: AGHT+IG/BM4Mx/0Unwhzt2oGgH1Ni3lsEEn7GjfNPeGpMSmWn0LI6JdBChftgTkGEW3WIn9NXYk51A==
X-Received: by 2002:a17:906:c214:b0:a19:a19b:78bd with SMTP id d20-20020a170906c21400b00a19a19b78bdmr8931356ejz.128.1703004422323;
        Tue, 19 Dec 2023 08:47:02 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906135800b00a25501f4160sm780675ejb.1.2023.12.19.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:47:01 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH 2/5] clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio
 and parent rate
Date: Tue, 19 Dec 2023 17:46:59 +0100
Message-ID: <4881920.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-2-e238b6ed6dc1@oltmanns.dev>
References:
 <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-2-e238b6ed6dc1@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 14:35:20 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N >= 3

Same as in previous patch, should be "<=".

Best regards,
Jernej

>  - (PLL_VIDEO0)/M >= 24MHz
> 
> Use these constraints.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index 8951ffc14ff5..c034ac027d1c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -176,6 +176,8 @@ static struct ccu_nkm pll_mipi_clk = {
>  	.n		= _SUNXI_CCU_MULT(8, 4),
>  	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
>  	.m		= _SUNXI_CCU_DIV(0, 4),
> +	.max_mn_ratio	= 3,
> +	.parent_wo_nk	= 24000000,
>  	.common		= {
>  		.reg		= 0x040,
>  		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
> 
> 




