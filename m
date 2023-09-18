Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4A2DF78
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 19:47:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-503012f4e71so2772355e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695066434; x=1695671234; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=;
        b=DiCd3bRrhGK9FiImZjpjytKvvqyZw5x2/Dbx3NrponwPpZpAMGZVQmux/wHj5Xec75
         TbjjjI3kDQVto2P35zTnerYClxYYAeRt4kv+UCLZnZbyR7I/XMzpbiuRJ/pfRhcN3yb+
         aXD5FvlyxLLVBrXANi1gQ+s23Nyfy+d6Skk4wGP0UX/Lrm4yvtdSNk9N6/U1o2Z3SWAQ
         sFX6WITQ6kWMo65x0bl9kXu6T0ArQ0Yy0gA3tBhk8AKbrzIELgQIYsU1s0ikoPS5zy7W
         vU1yaxskqIrWq9RUcqNGGPcnF73UHxHkHhbMRqZ9BeHcddnRwQwyDYm+NsXbGFewrrh4
         Os0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695066434; x=1695671234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=;
        b=mrh/RRs1M6af3IlR8APWPS34PGfsXQM1VRVAfion0FGkA2Cl341zTMsPhwYnylYGLT
         ym2iSZ6L5dJxOzyxWIL2UGdVhE4OuBkz+aMKfYbzQSEd/nKrTLTYi69MzYYzq+PUFuav
         N8JSEVjAjpqiCJQ0K6adw1j/ARq4xXSq1R4V4NPbO4S/q99Egn61qZCPRDPDNTyYpv9a
         5Qyt/eZWcxeoLKqE1pEGGU2LilDnfnVi0REG67UWM6IsVigFZP1ubnCxLia1uNV0BO5R
         3a8bSK2+55+yNZZ0gMCOopPTZqJGImQecYtqV+0K5BIk6QegLROZed5vM4scdBDofR02
         60yA==
X-Gm-Message-State: AOJu0Yw82c8y2hqV6quIF60TxMuo8NF5X8VuI+Ud5IX9Cj9T/CjqMA6U
	XgZ+cA06OAqf/UOgaXqKHaY=
X-Google-Smtp-Source: AGHT+IFU7njRlBwGSq66q3hzfwk/hZvM8S7fmF9CZN+KqPY2x8ju4hdMyo/0KMTFfnBSlUsJW2or3w==
X-Received: by 2002:a05:6512:2256:b0:503:636:68e1 with SMTP id i22-20020a056512225600b00503063668e1mr275797lfu.20.1695066433864;
        Mon, 18 Sep 2023 12:47:13 -0700 (PDT)
Received: from mobilestation ([178.176.81.244])
        by smtp.gmail.com with ESMTPSA id z3-20020a19f703000000b0050084e55bd8sm1926434lfe.138.2023.09.18.12.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:47:13 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:47:07 +0300
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
Subject: Re: [PATCH net-next v2 07/23] net: stmmac: dwmac-intel-plat: use
 devm_stmmac_probe_config_dt()
Message-ID: <5x3xddynxi4mcf5zpac5q3kjabpq7iui6kdynasvgwp3ekzkc6@va2bm4fnh4fo>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-8-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-8-jszhang@kernel.org>

On Sat, Sep 16, 2023 at 03:58:13PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The calling of stmmac_pltfr_remove() now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 27 +++++++------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d352a14f9d48..d1aec2ca2b42 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -85,17 +85,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat)) {
>  		dev_err(&pdev->dev, "dt configuration failed\n");
>  		return PTR_ERR(plat_dat);
>  	}
>  
>  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> -	if (!dwmac) {
> -		ret = -ENOMEM;
> -		goto err_remove_config_dt;
> -	}
> +	if (!dwmac)
> +		return -ENOMEM;
>  
>  	dwmac->dev = &pdev->dev;
>  	dwmac->tx_clk = NULL;
> @@ -110,10 +108,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  		/* Enable TX clock */
>  		if (dwmac->data->tx_clk_en) {
>  			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
> -			if (IS_ERR(dwmac->tx_clk)) {
> -				ret = PTR_ERR(dwmac->tx_clk);
> -				goto err_remove_config_dt;
> -			}
> +			if (IS_ERR(dwmac->tx_clk))
> +				return PTR_ERR(dwmac->tx_clk);
>  
>  			clk_prepare_enable(dwmac->tx_clk);
>  
> @@ -126,7 +122,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  				if (ret) {
>  					dev_err(&pdev->dev,
>  						"Failed to set tx_clk\n");
> -					goto err_remove_config_dt;
> +					return ret;
>  				}
>  			}
>  		}
> @@ -140,7 +136,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  			if (ret) {
>  				dev_err(&pdev->dev,
>  					"Failed to set clk_ptp_ref\n");
> -				goto err_remove_config_dt;
> +				return ret;
>  			}
>  		}
>  	}
> @@ -158,22 +154,17 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret) {

>  		clk_disable_unprepare(dwmac->tx_clk);
> -		goto err_remove_config_dt;
> +		return ret;

Just a general note IMO it's better for maintainability to have the
clean-up-on-error block than reverting the previous changes in the if
body. Thus should you add new functions call before the block in
subject you won't need to add duplicated cleanup functions calls, but
just add new reverting method invocation to the cleanup-on-error path.

-Serge(y)

>  	}
>  
>  	return 0;
> -
> -err_remove_config_dt:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> -
> -	return ret;
>  }
>  
>  static void intel_eth_plat_remove(struct platform_device *pdev)
>  {
>  	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
>  
> -	stmmac_pltfr_remove(pdev);
> +	stmmac_pltfr_remove_no_dt(pdev);
>  	clk_disable_unprepare(dwmac->tx_clk);
>  }
>  
> -- 
> 2.40.1
> 
> 
