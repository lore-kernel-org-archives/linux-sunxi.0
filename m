Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830191867
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 07:44:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BD7E8C2D87
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 07:38:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 792C92000D;
	Mon, 21 Aug 2023 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692603510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QK3U5LxVPsGAtMpHf99XsK3RWiIrIgeXRCnQNtREf94=;
	b=IyoUAE5wemosA3+nhqaCdLSyUqJGm03o6EPOIsUaupaO3ylJcHnZcxVlzE28kcX6ITK8ps
	Q0GeWeku+SYHd79w95phK1UTiaNVU5WOXmzxa42AxM2sDqj+vQR4l1ZEyzOf6jjcIR0M08
	OMrHgLhJRxvMnne+/++Yzq9UhGGGXrwdAccc2BP7u8Xf/Jq0aE/YP2t8XNsBODbHvlZav5
	K4sbqPdJrty/sW4PyokWyo5vxNckSq8L9myGxdqKFLmPAdj4obA3kUGVKwMoXMSglds/3w
	NUOaYoMwyelaAgmYJxInrAKqam37BJWfbQ9zq3ghDmRcbt/a7EojbJOW77vC8w==
Date: Mon, 21 Aug 2023 09:38:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
 <richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
 <wens@csie.org>, <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230821093825.22280e33@xps-13>
In-Reply-To: <20230821031737.1973183-12-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
	<20230821031737.1973183-1-lizetao1@huawei.com>
	<20230821031737.1973183-12-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Tudor,

lizetao1@huawei.com wrote on Mon, 21 Aug 2023 11:17:36 +0800:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly, so dr=
op
> the label "dis_clks" and "dis_clk_reg".

This patch seems very simple, do you mind if I apply it directly into
mtd/next for the next PR?

Thanks,
Miqu=C3=A8l

> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
> v2 -> v3: Modify the syntax error in the commit message.
> v2: https://lore.kernel.org/all/20230818074642.308166-12-lizetao1@huawei.=
com/
> v1 -> v2: Modify commit message.
> v1: https://lore.kernel.org/all/20230817024509.3951629-12-lizetao1@huawei=
.com/
>=20
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c | 33 ++++-----------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/sp=
i-nor/controllers/nxp-spifi.c
> index 337e83bf3362..5d8f47ab146f 100644
> --- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> @@ -394,30 +394,18 @@ static int nxp_spifi_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(spifi->flash_base))
>  		return PTR_ERR(spifi->flash_base);
> =20
> -	spifi->clk_spifi =3D devm_clk_get(&pdev->dev, "spifi");
> +	spifi->clk_spifi =3D devm_clk_get_enabled(&pdev->dev, "spifi");
>  	if (IS_ERR(spifi->clk_spifi)) {
> -		dev_err(&pdev->dev, "spifi clock not found\n");
> +		dev_err(&pdev->dev, "spifi clock not found or unable to enable\n");
>  		return PTR_ERR(spifi->clk_spifi);
>  	}
> =20
> -	spifi->clk_reg =3D devm_clk_get(&pdev->dev, "reg");
> +	spifi->clk_reg =3D devm_clk_get_enabled(&pdev->dev, "reg");
>  	if (IS_ERR(spifi->clk_reg)) {
> -		dev_err(&pdev->dev, "reg clock not found\n");
> +		dev_err(&pdev->dev, "reg clock not found or unable to enable\n");
>  		return PTR_ERR(spifi->clk_reg);
>  	}
> =20
> -	ret =3D clk_prepare_enable(spifi->clk_reg);
> -	if (ret) {
> -		dev_err(&pdev->dev, "unable to enable reg clock\n");
> -		return ret;
> -	}
> -
> -	ret =3D clk_prepare_enable(spifi->clk_spifi);
> -	if (ret) {
> -		dev_err(&pdev->dev, "unable to enable spifi clock\n");
> -		goto dis_clk_reg;
> -	}
> -
>  	spifi->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, spifi);
> =20
> @@ -430,24 +418,17 @@ static int nxp_spifi_probe(struct platform_device *=
pdev)
>  	flash_np =3D of_get_next_available_child(pdev->dev.of_node, NULL);
>  	if (!flash_np) {
>  		dev_err(&pdev->dev, "no SPI flash device to configure\n");
> -		ret =3D -ENODEV;
> -		goto dis_clks;
> +		return -ENODEV;
>  	}
> =20
>  	ret =3D nxp_spifi_setup_flash(spifi, flash_np);
>  	of_node_put(flash_np);
>  	if (ret) {
>  		dev_err(&pdev->dev, "unable to setup flash chip\n");
> -		goto dis_clks;
> +		return ret;
>  	}
> =20
>  	return 0;
> -
> -dis_clks:
> -	clk_disable_unprepare(spifi->clk_spifi);
> -dis_clk_reg:
> -	clk_disable_unprepare(spifi->clk_reg);
> -	return ret;
>  }
> =20
>  static int nxp_spifi_remove(struct platform_device *pdev)
> @@ -455,8 +436,6 @@ static int nxp_spifi_remove(struct platform_device *p=
dev)
>  	struct nxp_spifi *spifi =3D platform_get_drvdata(pdev);
> =20
>  	mtd_device_unregister(&spifi->nor.mtd);
> -	clk_disable_unprepare(spifi->clk_spifi);
> -	clk_disable_unprepare(spifi->clk_reg);
> =20
>  	return 0;
>  }

