Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775F80D
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 08:34:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 04A62D30F5
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 08:31:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CCEE4000A;
	Thu, 17 Aug 2023 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2QxWcxDz8QQBaIieB3TDIKnaV/ESQiBsBWpBtPRVn4=;
	b=bdxpozFFU2fFnkkE/B1UBT1L01BP5ilQfq/KnE+ll1iBe/bzno0lYwYLgLmnJNgZl2sVSN
	Skfda1ztjNvDBOu6T7OZiwR89oxJNMTNwM7CNVP9ybRCDHoVlkf3jPzYl8FDRGPl3LRX4s
	a5D8NTXoQ6sSSGikstvoTUHuRHacCAOg464MHwIfYi3V4qsECjzeXKikZ0Po2DW6Kpuxrd
	gV3WmERdYPFr1PLqVZK5nK4RG2hh+ydk43QWDEzyEoqz60zM6DaeOyukH4w4l0n25b2VhS
	smob/G8UnizyJVXDGKl3DfwMenc4hpxZjwBljYoeb21ZIiDy9byizHu54mINbA==
Date: Thu, 17 Aug 2023 10:31:10 +0200
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
Subject: Re: [PATCH -next 03/11] mtd: rawnand: fsmc: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230817103110.2042d4ff@xps-13>
In-Reply-To: <20230817024509.3951629-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230817024509.3951629-4-lizetao1@huawei.com>
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

lizetao1@huawei.com wrote on Thu, 17 Aug 2023 10:45:01 +0800:

A few nits for all your commit logs aside from a comment below:

> After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for

  Since commit

> prepared and enabled clocks"), it can replace the pair of functions,

			       , devm_clk_get() and clk_prepare_enable()=20
  can now be replaced by devm_clk_get_enabled() when driver enable (and
  possibly prepare) the clocks for the whole lifetime of the device.

> devm_clk_get() and clk_prepare_enable() with a single helper function
> devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
> (or enabled) during the whole lifetime of the driver, it is unnecessary to

  Moreover, it is no longer necessary to unprepare and disable the clock
  explicitly.

> unprepare and disable clock explicitly when remove driver or in the error
> handling path.
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc=
_nand.c
> index 7b4742420dfc..ab1b9a5c93e9 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c

[...]

> @@ -1157,7 +1153,6 @@ static int __init fsmc_nand_probe(struct platform_d=
evice *pdev)
>  		dma_release_channel(host->read_dma_chan);
>  disable_clk:

This label no longer makes sense, please rename it to "disable_fsmc" or
something like that.

>  	fsmc_nand_disable(host);
> -	clk_disable_unprepare(host->clk);
> =20
>  	return ret;
>  }

Thanks,
Miqu=C3=A8l
