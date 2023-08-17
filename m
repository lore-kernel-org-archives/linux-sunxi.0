Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297261379
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 08:34:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D571740007;
	Thu, 17 Aug 2023 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BF6h8GPK1HKwPQblEC4BrTzenLHp9nKopnnC/7OFI4=;
	b=mkAXKPfGKRDmwH0jRlMeFRcGqW8gaHB2vsewulwhhhOYbDDuWvvqvuev/QIHWcCCyAL72h
	AxBg9ZnUkAZRqu5JYHlmD/5TqedBwuVgOyfdzGIujvUvFQNXgGSWAOje07NeEq1MDryuW/
	PYvUp92GBcxFqKiKL+9YkMTMSvBkDZDKVYzF7rE3AqU+KWNcV8WR3duI6YPL2XZjlB7Sno
	L3E1yyGsqN4Cm1jqbwKUoGGSzhKcHYFlLeXKMCq1kbakNDlSwF2iSLu6heqxZ4xMpq75cP
	FrKxphMkKl0kQmRUH0Mx8/HKTzh6vbw+HjPNgG1jgSi9KYq0fPW/ClmJkacCzQ==
Date: Thu, 17 Aug 2023 10:34:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <michal.simek@amd.com>,
 <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
 <frank.li@vivo.com>, <robh@kernel.org>,
 <martin.blumenstingl@googlemail.com>, <philmd@linaro.org>,
 <geert+renesas@glider.be>, <u.kleine-koenig@pengutronix.de>,
 <rogerq@kernel.org>, <paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
 <yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
 <christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
 <jinpu.wang@ionos.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 07/11] mtd: rawnand: mtk: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230817103444.521d087f@xps-13>
In-Reply-To: <20230817024509.3951629-8-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230817024509.3951629-8-lizetao1@huawei.com>
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

Hi Li,

lizetao1@huawei.com wrote on Thu, 17 Aug 2023 10:45:05 +0800:

> After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
> prepared and enabled clocks"), it can replace the pair of functions,
> devm_clk_get() and clk_prepare_enable() with a single helper function
> devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
> (or enabled) during the whole lifetime of the driver, it is unnecessary to
> unprepare and disable clock explicitly when remove driver or in the error
> handling path. The mtk_nfc_enable_clk() is a helper function that enables
> the "clk->nfi_clk" and "clk->pad_clk", it can be combined into
> devm_clk_get_enabled().
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/mtd/nand/raw/mtk_nand.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_n=
and.c
> index b6eb8cb6b5e9..0d185e650aaf 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1545,40 +1545,36 @@ static int mtk_nfc_probe(struct platform_device *=
pdev)
>  		goto release_ecc;
>  	}
> =20
> -	nfc->clk.nfi_clk =3D devm_clk_get(dev, "nfi_clk");
> +	nfc->clk.nfi_clk =3D devm_clk_get_enabled(dev, "nfi_clk");
>  	if (IS_ERR(nfc->clk.nfi_clk)) {
>  		dev_err(dev, "no clk\n");
>  		ret =3D PTR_ERR(nfc->clk.nfi_clk);
>  		goto release_ecc;
>  	}
> =20
> -	nfc->clk.pad_clk =3D devm_clk_get(dev, "pad_clk");
> +	nfc->clk.pad_clk =3D devm_clk_get_enabled(dev, "pad_clk");
>  	if (IS_ERR(nfc->clk.pad_clk)) {
>  		dev_err(dev, "no pad clk\n");
>  		ret =3D PTR_ERR(nfc->clk.pad_clk);
>  		goto release_ecc;
>  	}
> =20
> -	ret =3D mtk_nfc_enable_clk(dev, &nfc->clk);
> -	if (ret)
> -		goto release_ecc;
> -
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		ret =3D -EINVAL;
> -		goto clk_disable;
> +		goto release_ecc;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, irq, mtk_nfc_irq, 0x0, "mtk-nand", nfc);
>  	if (ret) {
>  		dev_err(dev, "failed to request nfi irq\n");
> -		goto clk_disable;
> +		goto release_ecc;
>  	}
> =20
>  	ret =3D dma_set_mask(dev, DMA_BIT_MASK(32));
>  	if (ret) {
>  		dev_err(dev, "failed to set dma mask\n");
> -		goto clk_disable;
> +		goto release_ecc;
>  	}
> =20
>  	platform_set_drvdata(pdev, nfc);
> @@ -1586,14 +1582,11 @@ static int mtk_nfc_probe(struct platform_device *=
pdev)
>  	ret =3D mtk_nfc_nand_chips_init(dev, nfc);
>  	if (ret) {
>  		dev_err(dev, "failed to init nand chips\n");
> -		goto clk_disable;
> +		goto release_ecc;
>  	}
> =20
>  	return 0;
> =20
> -clk_disable:
> -	mtk_nfc_disable_clk(&nfc->clk);
> -
>  release_ecc:
>  	mtk_ecc_release(nfc->ecc);
> =20
> @@ -1618,7 +1611,6 @@ static void mtk_nfc_remove(struct platform_device *=
pdev)
>  	}
> =20
>  	mtk_ecc_release(nfc->ecc);
> -	mtk_nfc_disable_clk(&nfc->clk);

mtk_nfc_disable_clk() now has a single user, which is the suspend
callback. This callback does nothing else than calling
mtk_nfs_disable_clk(). Can you please drop the helper and just move the
two lines in the suspend function?

>  }
> =20
>  #ifdef CONFIG_PM_SLEEP


Thanks,
Miqu=C3=A8l
