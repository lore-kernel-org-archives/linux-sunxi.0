Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BC1C0F
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 20:14:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50098cc8967so7948647e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695068061; x=1695672861; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+e7RPlNIEbnCE6SNaWUDYK3xS0AglRAD4OXd3Ulb6s=;
        b=L+Q/QtLn987379pXrnf4cQE6ZB+Eu0C5oe8zIk+gxHPdAEGro8ZojM0pb0cFdo0LYI
         8mZO0gmo2QNPUcv1LqgqQ6QC/OFApMx7+8+ihdf8hMqWRVYg8XJ+9W+xjQSN67GkCcR/
         5p8ZSVJojuODgktmsikDoixNVhhGfVBR6mDLPllqyIWSA2udRPWVcOBOyle+tIO/EhHu
         nwPHgWllTYOF0Q830+nZnvOZw8pFxbSoW2j2uXwTBU4B4So5yZWZ85XANDBlCZuSVdpa
         9i64dL3czV9vMN1te57fx5WnRoleH4mGJqyQUNDPCRBWjUUPRI6cC+c7ozgwo+ujX6W6
         pLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695068061; x=1695672861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+e7RPlNIEbnCE6SNaWUDYK3xS0AglRAD4OXd3Ulb6s=;
        b=EalF2hpIUHIprEUMYaP7cFBRd6TZWZEZNRs62sqyfCEKlpWAfNZl5tb+f6z+qc4BBV
         Y+ivFwu3f/vYIiUqd+iW7v2Us3C4MqE75o2NVHsixLdeneiRAl8Vog8z+NSsNzmyJwnW
         pOi9ibxmlDeE1+247bCaNA9/EhcAvtFwiN5jo/loS+3pUtI5WaBvXP2SNpeG5JKyWZcR
         MxDNvd7jOhlsMlOlgWswAVgrt2M68GdKJWcgjx8Z54s5BtIcXK+sTG6xddO2YDtdLtN4
         fQ8+dH4QgR4w4jBJ5W9os0+F6g9wkSfyAZLDCRGhxsQCB+lzmgNlXAzESpt56Xm9HslC
         nGSQ==
X-Gm-Message-State: AOJu0YxqwhncPnmV3YAThIyErA99KZ7twLfSmY8pV3WnXd3L4kHuv7xD
	1wvOj+eKH8xuwo0Y6dcYjXo=
X-Google-Smtp-Source: AGHT+IFn+LYvQSp5rZn6lhfAzGXnJK7HIJKtSCz+mspnLIkIgmBXG+lSxqLriZhpKyj97znopumt4A==
X-Received: by 2002:a05:6512:33c8:b0:4fe:d0f:b4f7 with SMTP id d8-20020a05651233c800b004fe0d0fb4f7mr10927733lfg.65.1695068061007;
        Mon, 18 Sep 2023 13:14:21 -0700 (PDT)
Received: from mobilestation ([178.178.81.241])
        by smtp.gmail.com with ESMTPSA id d33-20020a0565123d2100b0050317d2b0f3sm563142lfv.61.2023.09.18.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 13:14:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 23:14:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
Message-ID: <nqa7g7x3alrcbnbgkyalg5h26na6rzwid3jxdqviisi2pnkdrn@b4qvgamj4urr>
References: <20230916075829.1560-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>

On Sat, Sep 16, 2023 at 03:58:06PM +0800, Jisheng Zhang wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."
> 
> Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
> Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]

I see the series is already merged in. In anyway here is my tag:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks for submitting the set.

-Serge(y)

> 
> Since v1:
>  - rebase on new net-next
>  - add make stmmac_{probe|remove}_config_dt static as suggested by Russell.
> 
> Jisheng Zhang (23):
>   net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
>   net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
>   net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
>   net: stmmac: make stmmac_{probe|remove}_config_dt static
> 
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   | 10 +--
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 15 +---
>  .../ethernet/stmicro/stmmac/dwmac-generic.c   | 15 +---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 13 ++--
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++------
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++----
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 27 +++----
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 19 ++---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-meson.c | 25 ++-----
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 53 +++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 14 ++--
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 16 ++---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 10 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 14 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 17 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 23 +++---
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 10 ++-
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 18 ++---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 70 ++++++-------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.h |  5 --
>  22 files changed, 127 insertions(+), 317 deletions(-)
> 
> -- 
> 2.40.1
> 
> 
