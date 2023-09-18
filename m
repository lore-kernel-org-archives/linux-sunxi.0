Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BB33DF
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 19:27:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-502153ae36cso7858637e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695065275; x=1695670075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=;
        b=hYQsnGIIVdoavAhW1s+HCBjBFArBbHzcPXmEFv7wRxT+XaDC18Yre8u1sdyg88jtcS
         WBex1RZsjjYU2L9439ImrNNtn9sbUmSLMwbCS0APCyzcyOdinaTPzaE6lsJ83/qEfPTk
         88FVk8pMe6dpX2q6mjX5e3wTTdKLzGfNQoX3jMAwU206Wmm1BpFCLOG5tRcNmdhel5+j
         aN3wRg7pPeMAw+0R6ahZXQj83Dk0acMKh3RfAlATB+aJrhGoqFvqbCfSy5T75QpEeZy4
         SvjnjTh8SMoVL2dLy2VeiRFHvNeCabeb/DH/Cvf3VAVHCAKxGEwACzyJKJwDHM8izzIQ
         b2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695065275; x=1695670075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=;
        b=Ut2Cs9TilZT0iNwK7nBimLQZGrm4xZ14zsL5na3LIpd0J6tROq+po0nlSY+ljO/BO5
         plRKQilJuXhsiGDmq36RNjSupG/8hxzeNZL3CMfJ5KSOy9uqUbDCug7Ok0dlY+Y49WZO
         ikp5hFnDFNyhEZMMRTBBtCZhkUrOigtWz6XP/gRGHQW16RtQGrFE5MkDX7aQHu/j4wvN
         hrFsIBhEhAui7Hv13sAEOn+WwsFa7LGCDlxggWbDv0gdgBv1ggZZ2syUO3o7LtXXCrQm
         Cq4iQ+exb3MjRoOjKr5YGZBDAUx56wG2TrIWCj/UeYs7lVW4TKlPGG8CRfivmkNhKJsm
         pmTQ==
X-Gm-Message-State: AOJu0Yw4ae7av1HiZT1bPtqqbxl0rA2tVqYW1+i1sGD5/j8J/x7U72n2
	DBvsQ2bpDAbj32IMLSP82Lc=
X-Google-Smtp-Source: AGHT+IHj4oSlgl2LSDqV5ANHoqz74jHZgqunRahPHglIvps97t3ij8W0vmwiuA1EgpsdIxEnzqZXEg==
X-Received: by 2002:a05:6512:962:b0:501:c3ee:62ec with SMTP id v2-20020a056512096200b00501c3ee62ecmr7844316lft.12.1695065275122;
        Mon, 18 Sep 2023 12:27:55 -0700 (PDT)
Received: from mobilestation ([85.140.3.118])
        by smtp.gmail.com with ESMTPSA id v22-20020ac25936000000b005009920b6afsm1941264lfi.9.2023.09.18.12.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:27:54 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:27:50 +0300
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
Subject: Re: [PATCH net-next v2 01/23] net: stmmac: dwmac-anarion: use
 devm_stmmac_probe_config_dt()
Message-ID: <3zzbxnzkhlucscfx5h4h6k3lyhqln2nwmcsgb3dvzn6xqkhhdw@nrpekwfahkua>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-2-jszhang@kernel.org>

On Sat, Sep 16, 2023 at 03:58:07PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The remove_new() callback now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> index 58a7f08e8d78..0df3a2ad0986 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> @@ -115,7 +115,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(gmac))
>  		return PTR_ERR(gmac);
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
>  
> @@ -124,13 +124,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
>  	anarion_gmac_init(pdev, gmac);
>  	plat_dat->bsp_priv = gmac;
>  
> -	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		stmmac_remove_config_dt(pdev, plat_dat);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

Just a general note, IMO it's better from maintainability point of
view to use the pattern:

	ret = func();
	if (ret)
		return ret;

	return 0;

Thus should you need to add any functions call after or before the
func() method invocation with possible clean-up-on-error code the
change patch will look a bit simpler and more readable.

-Serge(y)

>  }
>  
>  static const struct of_device_id anarion_dwmac_match[] = {
> @@ -141,7 +135,7 @@ MODULE_DEVICE_TABLE(of, anarion_dwmac_match);
>  
>  static struct platform_driver anarion_dwmac_driver = {
>  	.probe  = anarion_dwmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = stmmac_pltfr_remove_no_dt,
>  	.driver = {
>  		.name           = "anarion-dwmac",
>  		.pm		= &stmmac_pltfr_pm_ops,
> -- 
> 2.40.1
> 
> 
