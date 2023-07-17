Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52E946D
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 09:00:12 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C02543F235
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689584404;
	bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iaYVq55rdX9ZOQzOEBnT6j8l7mCyW/myKb8kLteoxLQDt70VpKcY/sgOADb4ILtq2
	 DYbT2KH6OGmgKKhyfcW3A3DG/HULfhsmivJs6D/AvcVqcc1r3iKZsq3YZDBFcND2HC
	 cggBJvrvBWB3+7B72rqP5KJMgMcVpnfbv86zAvv6EijrKPCjae5MQ7+ihQRSDaBqjh
	 3PaZZsWRpkIaNIVhvi+AGH6ol2r5SX9j7VE0chX2x44XGJ2jrgUTSgu+31plGOEvEK
	 SSx/CG1LiJwdy7t9ciNCvh9oBR/Lwh+byC4ZDUAGEOi87EyRBtBG0pbB9G/vGSfkCN
	 FSowSxBDIOP4w==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403b4983a24so39122041cf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689584401; x=1692176401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
        b=NBhMdtUShJuZemvZKXM12O0KULR89rZurkYG+8haC8IlfQ4IJMSyTy+4bLoQE/hrPi
         qe1vOGr112K7ejRMgN5XjVAmqwlB8idt7mTCRw2VFpDKtWDIYbgzveZ5n1M0S0Q9MYe6
         zbkI9YWBahhreGe2f9V0xy9UTKnDxwL/LDUf+yDRPPkCVpKZ6aeqInY79UxAT5rmFczU
         ZP3H3TRwmjOrz/01X41s2bt5KAAiINdU8YNQ913LBkwzIcZY6jlIWCZIKLcJPvkwVrwf
         FixhWdq9z1byCAV8q9HMotxFcL+rIcUDz6xW26nhr9GRLXkpFbrcq7ZxThm6geRL2gEr
         vObQ==
X-Gm-Message-State: ABy/qLYZ481s9z29baRNjEul1rwQuYOcLEu1oyfQBI2rtTrGrQxCNVo1
	E19Z03uNh/dECyKC5vOAt3nc8ukMXHneke9Hclg6KdBf1F7K+eYjdkhEbyvqpD7Y9AQMCyYsPQq
	d/T/hioeOBAPlGxrPrI1QU2YQ9lptNLjCRAQQTA5mlv/MFsmdwoaVeXzk
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id o8-20020ac87c48000000b004032dfd1fdfmr15892574qtv.23.1689584401507;
        Mon, 17 Jul 2023 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMazgMYki8IR1CHHFS4st+/s+/y1hah0oj0+nBQlO+NhXDM06BTdCzgvWJM4HcjDSd4KVriXj5Pmlo8MNpIrE=
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id
 o8-20020ac87c48000000b004032dfd1fdfmr15892526qtv.23.1689584401259; Mon, 17
 Jul 2023 02:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 17 Jul 2023 10:59:45 +0200
Message-ID: <CAJM55Z_Eba-LKxKAH0i0_vDM6JO_HvWgDLCLFQDave2+UFLMzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Chester Lin <clin@suse.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-oxnas@groups.io, 
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Jul 2023 at 19:52, Rob Herring <robh@kernel.org> wrote:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 5 +----
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 1 -

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks,
/Emil
