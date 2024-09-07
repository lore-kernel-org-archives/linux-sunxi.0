Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F532C8E
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Sep 2024 05:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687300; cv=none; b=ZWfHz69LOinvhP4i1z7JwSfqq/hB4FWpD0ix9QvjIgMbpx/Q/1njU2s2k2Ya5UUKlfQ6GMUhV48mDl05ahHlZvgRGnRpgnvx42p5mmKszbMHc84nS0N2/X7yN4m1uyWXc4eVZPyxpGD7lwRZNpPv8wZHYN7hl7QM25n+glORwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687300; c=relaxed/simple;
	bh=bWdr1VYjmts1AtM3hv/151cs6BQWWh7DP6hLoyQaDLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEO2wa2vglU6rQEqU7IaxYWSErDARddY6BNK593SeCB6wzRj0c6MCvrotVgt0T8X1P1P0LMBI5uWlEoDLuSxvcM56Y7yM2STeJ73AxXveD7On8iTXlBlMNSRU6x9/m8SgoQgk4NWOhyAoSK8E2//oLEdqA6fJRwshgcNsgyklnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Ov4MO2/E; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ov4MO2/E"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mo5jsZENhQYYumo5jsI8EG; Sat, 07 Sep 2024 07:34:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725687289;
	bh=zhb/fr3/ahbe9u0OOQ3I4zVqjQ6OdAdflP4aJvLzC4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ov4MO2/EsHbrXOn9mC5X45wUoZIu5LI6TUyK0ggF1aC8TviLvfB2vCpHsKNXLYgO5
	 vBaAVBW+bZ0l5ZTWIpIqG1k5s5ogB6GbmyJep53eZUBPf7UrWql6sNXCVJAV7qwJ/1
	 IKAMTL4XPED5b32aaNhI45/3uOfPJ3CGw0qz15LWBCyr9YqZ3KUAXf9faq3OFP5C8r
	 RcDhXSGvkEV2+CZzDd2oTGxqPwspFww7txYJdfKzDwGcoeUud15+vIoJ0S0x/fCqRZ
	 1y+Kq0GAzZTDRh8RQOXn6s6TFr9lLo8cXOffoCQL4+J2ZW41amN0iv7I2iv+YmsbqH
	 V9/TpYOhfBxiA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 07 Sep 2024 07:34:49 +0200
X-ME-IP: 90.11.132.44
Message-ID: <daf856a8-32ad-47ac-91b2-0aa2253636f8@wanadoo.fr>
Date: Sat, 7 Sep 2024 07:34:35 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/10] net: ethernet: Convert using
 devm_clk_get_enabled() in emac_probe()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org,
 florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, heiko@sntech.de, yisen.zhuang@huawei.com,
 salil.mehta@huawei.com, hauke@hauke-m.de, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 radhey.shyam.pandey@amd.com, michal.simek@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, ruanjinjie@huawei.com,
 hverkuil-cisco@xs4all.nl, u.kleine-koenig@pengutronix.de,
 jacky_chou@aspeedtech.com, jacob.e.keller@intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org
References: <20240907031926.3591353-1-lizetao1@huawei.com>
 <20240907031926.3591353-3-lizetao1@huawei.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240907031926.3591353-3-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/09/2024 à 05:19, Li Zetao a écrit :
> Use devm_clk_get_enabled() instead of devm_clk_get() +
> clk_prepare_enable(), which can make the clk consistent with the device
> life cycle and reduce the risk of unreleased clk resources. Since the
> device framework has automatically released the clk resource, there is
> no need to execute clk_disable_unprepare(clk) on the error path, drop
> the out_clk_disable_unprepare label, and the original error process can
> changed to the out_dispose_mapping error path.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Hi,

I think that the subject should be "net: ethernet: allwinner:", or maybe 
even "net: allwinner:"


clk can now be removed from struct emac_board_info I think.
You should check for all patches, as asked in [1].

I've not looked all patches, but lantiq_xrx200() looks also a good 
candidate for removing clk from a structure.

CJ

[1]: https://lore.kernel.org/all/20240903151649.1b466145@kernel.org/

CJ

> ---
>   drivers/net/ethernet/allwinner/sun4i-emac.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
> index d761c08fe5c1..8f42501729b7 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -1005,22 +1005,16 @@ static int emac_probe(struct platform_device *pdev)
>   	if (emac_configure_dma(db))
>   		netdev_info(ndev, "configure dma failed. disable dma.\n");
>   
> -	db->clk = devm_clk_get(&pdev->dev, NULL);
> +	db->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(db->clk)) {
>   		ret = PTR_ERR(db->clk);
>   		goto out_dispose_mapping;
>   	}
>   
> -	ret = clk_prepare_enable(db->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", ret);
> -		goto out_dispose_mapping;
> -	}
> -
>   	ret = sunxi_sram_claim(&pdev->dev);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
> -		goto out_clk_disable_unprepare;
> +		goto out_dispose_mapping;
>   	}
>   
>   	db->phy_node = of_parse_phandle(np, "phy-handle", 0);
> @@ -1068,8 +1062,6 @@ static int emac_probe(struct platform_device *pdev)
>   
>   out_release_sram:
>   	sunxi_sram_release(&pdev->dev);
> -out_clk_disable_unprepare:
> -	clk_disable_unprepare(db->clk);
>   out_dispose_mapping:
>   	irq_dispose_mapping(ndev->irq);
>   	dma_release_channel(db->rx_chan);
> @@ -1095,7 +1087,6 @@ static void emac_remove(struct platform_device *pdev)
>   
>   	unregister_netdev(ndev);
>   	sunxi_sram_release(&pdev->dev);
> -	clk_disable_unprepare(db->clk);
>   	irq_dispose_mapping(ndev->irq);
>   	iounmap(db->membase);
>   	free_netdev(ndev);

