Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145AB38FB7
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 19:12:22 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9338e4695so77945651fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695064341; x=1695669141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymg444KdzoYqbAJJDaXLrEYL/H+uXP42VM/AMIopDrc=;
        b=mRlnhvGFXtRyYRCuPVAZSHzGYD41AqeuVhmQRjXtniYFy0gj9Ls4OnVJDc4GZZufwf
         ExVVj5pA5Wmzk5fRiMksu7yx1COZ6k3VKW/0SwZhuEbODNSDhc+dpOkW470a5fqdVE7S
         ElUTtvQeF9s6jZcePTLKWWdPmGuLOD8eQenFWrUlyWGsK7q8bRltfDlK2LQJQL+if72e
         ONGPznMWCuu09MFo/NHhpWSrCcXbdvNb4ZwRHYOgY+OfM/K0Hr+1/ZIN5BZLV9gIePDV
         l8uYm8qhEpJoJNyXNXj/Wl/cuVypVxTjZsqL9O94m0n5gPV5qaifjB3ug2Z9pAmsK0+R
         TLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695064341; x=1695669141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymg444KdzoYqbAJJDaXLrEYL/H+uXP42VM/AMIopDrc=;
        b=QNgL5Ht1Eh4KTeP7cba93xqkjfwDkf3mPqrRj8rMJR0BPgM5uWddcCoOJ1jD0uTNWN
         J0CVxuzFqBFVJd+q2onCoe4WB3CxigJzyiKai03O9ISQeUrHuzz1ojIp97w1wWzF11Vk
         nIaQywz8Jx0H26YKvw67jDrZIvQThES9kjA6CmPmSTu9feId8ZEaacwXDrD+Vxlv+aTj
         XH4VxOQ1qF/WIRlrUmbQxDim4L+zKFK3YCek5mV0FaK/Ka/zvx/X/ANliMlsP4Czhbca
         v9QZxxrf1uI8eOEeC9iR3sOwS6GtUZVz8RG30UHOltx367NYN8mT9HksPB6pQ+VAA0nt
         n9Gw==
X-Gm-Message-State: AOJu0YyAc+d8h45VUwY7zbvaYimAjRGS4/klUmfipIKexR4AjpvtF8Ce
	OTfeJCW/p7AB7JzZ6D2zxZM=
X-Google-Smtp-Source: AGHT+IFjg/ob0U+8PEhUDzZxfqbyJQBZc1GsvUR1GE+uNr8GDm+7qXSDDyadXaGQKQJr0ryj693ksg==
X-Received: by 2002:a2e:700d:0:b0:2bf:6852:9339 with SMTP id l13-20020a2e700d000000b002bf68529339mr8798200ljc.3.1695064340742;
        Mon, 18 Sep 2023 12:12:20 -0700 (PDT)
Received: from mobilestation ([85.140.3.118])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm2221659lji.34.2023.09.18.12.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:12:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:11:26 +0300
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
Subject: Re: [PATCH net-next v2 02/23] net: stmmac: dwmac-dwc-qos-eth: use
 devm_stmmac_probe_config_dt()
Message-ID: <d3vpg5jcgfoe5qpreh2hnworsa2ly3ufrgqi4mcxx2yzfs7eoy@w2hgimsg64hp>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-3-jszhang@kernel.org>

Hi Jisheng

On Sat, Sep 16, 2023 at 03:58:08PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index 61ebf36da13d..ec924c6c76c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -435,15 +435,14 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(stmmac_res.addr))
>  		return PTR_ERR(stmmac_res.addr);
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
>  
>  	ret = data->probe(pdev, plat_dat, &stmmac_res);
>  	if (ret < 0) {

>  		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
> -
> -		goto remove_config;
> +		return ret;

just "return dev_err_probe()".

-Serge(y)

>  	}
>  
>  	ret = dwc_eth_dwmac_config_dt(pdev, plat_dat);
> @@ -458,25 +457,17 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  
>  remove:
>  	data->remove(pdev);
> -remove_config:
> -	stmmac_remove_config_dt(pdev, plat_dat);
>  
>  	return ret;
>  }
>  
>  static void dwc_eth_dwmac_remove(struct platform_device *pdev)
>  {
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -	const struct dwc_eth_dwmac_data *data;
> -
> -	data = device_get_match_data(&pdev->dev);
> +	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
>  
>  	stmmac_dvr_remove(&pdev->dev);
>  
>  	data->remove(pdev);
> -
> -	stmmac_remove_config_dt(pdev, priv->plat);
>  }
>  
>  static const struct of_device_id dwc_eth_dwmac_match[] = {
> -- 
> 2.40.1
> 
> 
