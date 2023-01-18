Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C153A7
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Jan 2023 19:05:09 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j9so7851857qtv.4
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Jan 2023 11:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOwQfemle8oAtk5HhkSGbIU5cG/VOJmaf2KabL9UxvM=;
        b=EQRX2m/pCjxSpPRNNmD4OKdNKaD3o9MOQFv/9uSbQZv6R/hzb7NXbf0h/m+DTToEAK
         XFTATbv6ziF2tI9Y3D1LDEUD6Dv5Ca+7UOA69UWbgxpzMu6CSwjkUFQMr74Bg1Wyuk38
         9t1lXAzxXmc37t6ZLRU1i03VsWjYv9VL654WD6tOYn4GrdZVoT4kFxqVNukFIgD8AdJN
         CoO8G77Jg1Is/2iDjJNMRuX4agCQcLxcnXOmY7nMxVyzMRahOLIFalzI+hHliPfZKsWI
         RK4vx1NT6KzrdK6t8OjJ19Nmlb57GjkLMOazLT7Tg22fgcY5B4WM1yPytFzDwjgCGVM8
         kIkg==
X-Gm-Message-State: AFqh2kqSh0YHHKAEhdIlO5JspsYpSfJSzHyyiLh6B7tmhjDSOxRTSohL
	IRtLRQdfq+kmI7afooFf9/XuJaLshU/8nrnUDcc=
X-Google-Smtp-Source: AMrXdXs2QHOwpt6XkOmiVm+r//9BALAzKSVXU9FPIS/I+3v03jcr9LSqmypDVPp4Q4ctNRKA8AAPUg==
X-Received: by 2002:a05:622a:4209:b0:3b5:4aae:cb0b with SMTP id cp9-20020a05622a420900b003b54aaecb0bmr9915178qtb.22.1674068707863;
        Wed, 18 Jan 2023 11:05:07 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id d2-20020ac81182000000b0039cd4d87aacsm17628340qtj.15.2023.01.18.11.05.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 11:05:07 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-4d0f843c417so368245247b3.7
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Jan 2023 11:05:05 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr846222ybg.202.1674068694405; Wed, 18
 Jan 2023 11:04:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org> <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 20:04:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Li-hao Kuo <lhjeff911@gmail.com>, Michal Simek <michal.simek@xilinx.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Parshuram Thombare <pthombar@cadence.com>, 
	Leilk Liu <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>, 
	Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, 
	Birger Koblitz <mail@birger-koblitz.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anson Huang <Anson.Huang@nxp.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Erwan Leray <erwan.leray@foss.st.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 6:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
