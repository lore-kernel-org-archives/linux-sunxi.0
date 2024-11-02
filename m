Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681C9154423
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Nov 2024 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569543; cv=none; b=beQzwALix+r09mSyP+DiXPyqYI5gCJC8dvVKHKrfmcnYBkwG3bm4uqa8NcvD9oh54Pg+fqtNxF65X8plZtraztq4QwOgfrwNZAVTLPpAcuoTFN22xjg767eYs5RPs7mTzzD8m1MGtWawGOI4p9UPZ3zb9w9rtA+XhTo5HuTd9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569543; c=relaxed/simple;
	bh=6WrhZWAJgavrSKkvG6AR5CqzWMmZYIaV6d20Lx0RzVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGhYgaCJeDx5lERuI2TYLwTksTlGHr/jHTpmYWD1a+tZkw7b4PVTNYC/ahUJ/MfX+69rpOa6VKFhIKh8d33edMuDnOzOjY3L4kOwsXxw0b6w/NMh5qDoTeXFuUIv7E+M7/Xp5cbO4GoqZX83Svi8z80jKCG3nmnojgLnOiX228M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68869FEC;
	Sat,  2 Nov 2024 10:46:04 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06EB03F66E;
	Sat,  2 Nov 2024 10:45:32 -0700 (PDT)
Date: Sat, 2 Nov 2024 17:45:16 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
 <mesihkilinc@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp
 Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 2/5] dma-engine: sun4i: Add has_reset option to quirk
Message-ID: <20241102174516.02d124d6@minigeek.lan>
In-Reply-To: <20241102093140.2625230-3-csokas.bence@prolan.hu>
References: <20241102093140.2625230-1-csokas.bence@prolan.hu>
	<20241102093140.2625230-3-csokas.bence@prolan.hu>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 2 Nov 2024 10:31:41 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

Hi,

> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> has this bit but in order to support suniv we need to add it. So add
> support for reset bit.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased and addressed comments ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>=20
> Notes:
>     Changes in v2:
>     * Call reset_control_deassert() unconditionally, as it supports optio=
nal resets
>     * Use dev_err_probe()
>     * Whitespace
>     Changes in v3:
>     * More dev_err_probe() fixes
>     Changes in v4:
>     * Use return value of dev_err_probe()
>     Changes in v5:
>     * More whitespace
>=20
>  drivers/dma/sun4i-dma.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
> index b2c1e4b9f696..9d1e3c51342d 100644
> --- a/drivers/dma/sun4i-dma.c
> +++ b/drivers/dma/sun4i-dma.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_dma.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> =20
> @@ -159,6 +160,7 @@ struct sun4i_dma_config {
>  	u8 ddma_drq_sdram;
> =20
>  	u8 max_burst;
> +	bool has_reset;
>  };
> =20
>  struct sun4i_dma_pchan {
> @@ -208,6 +210,7 @@ struct sun4i_dma_dev {
>  	int				irq;
>  	spinlock_t			lock;
>  	const struct sun4i_dma_config *cfg;
> +	struct reset_control *rst;
>  };
> =20
>  static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
> @@ -1215,6 +1218,13 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(priv->clk);
>  	}
> =20
> +	if (priv->cfg->has_reset) {
> +		priv->rst =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);

Can't we use devm_reset_control_get_optional_exclusive(), and then save
this whole has_reset bit?

> +		if (IS_ERR(priv->rst))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(priv->rst),
> +					     "Failed to get reset control\n");
> +	}
> +
>  	platform_set_drvdata(pdev, priv);
>  	spin_lock_init(&priv->lock);
> =20
> @@ -1287,6 +1297,14 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return ret;
>  	}
> =20
> +	/* Deassert the reset control */
> +	ret =3D reset_control_deassert(priv->rst);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret,
> +			      "Failed to deassert the reset control\n");
> +		goto err_clk_disable;
> +	}
> +
>  	/*
>  	 * Make sure the IRQs are all disabled and accounted for. The bootloader
>  	 * likes to leave these dirty
> @@ -1355,6 +1373,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg =
=3D {
>  	.ddma_drq_sdram		=3D SUN4I_DDMA_DRQ_TYPE_SDRAM,
> =20
>  	.max_burst		=3D SUN4I_MAX_BURST,
> +	.has_reset		=3D false,
>  };
> =20
>  static const struct of_device_id sun4i_dma_match[] =3D {

