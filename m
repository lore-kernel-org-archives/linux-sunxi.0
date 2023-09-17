Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B83C15
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Sep 2023 14:42:19 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bffc55af02so8130741fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Sep 2023 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694961737; x=1695566537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=;
        b=IAUR4LAkg6CyMZgvmtIbzAV50oGpYkSzRnvc0whORYN+aCXPI4H8SUr/LPTzepgs3z
         G84lp4uOl3VlVQTWtp3yBQuxNDt6epWCad8uEQ3ZMRNTBGNiRVAdk1Nec41cOVB4U+MK
         U5rmVWLyGkpDpaJvs8YpHfalB31wV48R8GL+4e92iCo6j/FSHVMMbIxOhTv8WoZILH+j
         i7ZPt/qUkV3txVCeFacSwRxj2Xe1zO2fAR1v5Zc0UQWDiBmcr9gArkOAp/yiwXOZqY4K
         XbITNOkVV+mtN1fS6C5Rdg12d6LmJ3p691uEVOuNhgwKEEPbCwN5r9Xz7aU4lTwDJ1TM
         7cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694961737; x=1695566537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=;
        b=NUi8Y2abxLHlhK81yQFgGC/9xm3hrepct+Qit7jZEJ0iZ4SaNUswpW51p1tkTa4UGW
         +/iWJsqbMW9VbLcD6CiBr2Ox1iT1S2odUfdYezv8yG1TIn3Z3hKBeACHajB5z5d4S5xp
         2XMP7dGPY7nVHvvOaprjB0Gypba/+sVvlRxniuWlNycCSPHylVux2yHykZ7L8hwiyg6Y
         15xeYS7eCFgQY4AIk9/StYe/+4Gfe82JZWtCBlLqa/ZkgGrodFlCU4BqvYjnut7s1oC+
         SaR0iZvc/SgNldGwtlrHpoE6o+7yDxMpHOxGVKBLYj2Mz00qrq2vMMKs1GlVSeYjdbeG
         NQhQ==
X-Gm-Message-State: AOJu0YxQ7e2afYClcdbpBso4+euOf1xFasLv2vM0YmHVk1NlOfVRO8kO
	KigVlup0xMqi0cl0omtMfOE=
X-Google-Smtp-Source: AGHT+IGCwEla40TgXmbfl+4SNqk+BjMa1n4H5XAPcLrxUPNV78F+jE9Mq3MjRLIpRqip9g6ySlXEyA==
X-Received: by 2002:a05:651c:1245:b0:2c0:d44:6162 with SMTP id h5-20020a05651c124500b002c00d446162mr250029ljh.12.1694961736917;
        Sun, 17 Sep 2023 07:42:16 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net. [46.123.246.155])
        by smtp.gmail.com with ESMTPSA id gz2-20020a170906f2c200b009ae05f9eab3sm624439ejb.65.2023.09.17.07.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:42:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH net-next v2 18/23] net: stmmac: dwmac-sun8i: use
 devm_stmmac_probe_config_dt()
Date: Sun, 17 Sep 2023 16:42:12 +0200
Message-ID: <2701959.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230916075829.1560-19-jszhang@kernel.org>
References:
 <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-19-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 16. september 2023 ob 09:58:24 CEST je Jisheng Zhang napisal(a):
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The calling of stmmac_pltfr_remove() now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c index
> 01e77368eef1..63a7e5e53d7b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1224,7 +1224,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) if (ret)
>  		return -EINVAL;
> 
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> 
> @@ -1244,7 +1244,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev)
> 
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> -		goto dwmac_deconfig;
> +		return ret;
> 
>  	ret = sun8i_dwmac_init(pdev, plat_dat->bsp_priv);
>  	if (ret)
> @@ -1295,8 +1295,6 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) sun8i_dwmac_exit(pdev, gmac);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
> -dwmac_deconfig:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> 
>  	return ret;
>  }
> @@ -1314,7 +1312,7 @@ static void sun8i_dwmac_remove(struct platform_device
> *pdev) clk_put(gmac->ephy_clk);
>  	}
> 
> -	stmmac_pltfr_remove(pdev);
> +	stmmac_pltfr_remove_no_dt(pdev);
>  	sun8i_dwmac_unset_syscon(gmac);
>  }




