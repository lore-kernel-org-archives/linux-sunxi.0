Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF32C82
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 09:13:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 1D04D32010F5;
	Mon, 22 Nov 2021 04:13:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 22 Nov 2021 04:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=vgUk5Jj/Tfof1XTgk+Z9aI3LyqK
	sWU0UARkwuwIu5/I=; b=Z2Qo059kOVX4UkyPLF38MTGxOeQY51u6PGqryOzr22g
	fA+IflZOmVVsZgZ5UDUKwfB7jgPAVWe5b/BRyHAczR/1YDEBhYTBCp83rnrdomSQ
	F/MkLhjlX4p6SWGW+DttqaJYfM44NH3rEb7Gs/nAruLJJD94XJ41wyxyVesDeVMu
	7ASbvz6vtuDjTJxvDPG6j25VT2nhn3frKXsH2IYlhec56QH3y4hz2uMHQpnCiugs
	ZQ08PSRgEiwKyRwblR/Mzqai5oQQK4b5b4S4J/NtUYy5tyEMSRYOTThTWwuEvn1t
	Nd/Zln7VJLXbRLjH9B0bVQKzlgRhb90b8JsuUCJzeww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vgUk5J
	j/Tfof1XTgk+Z9aI3LyqKsWU0UARkwuwIu5/I=; b=nTkCmpizZs4rzPHZBzFfCq
	dcP4Ytxw+Dmm6nuof9FDMcMhxufMXmrWQ+wDMMtco7MKZt5qqdmh0EUz7/3zmPrH
	QEFQRrXKiFYfiiifTdnnhxiX7TGPd4I5LwBZCGpJMIJha/xv3SetR4ySf/3NjQ5f
	tlHvgxfixsvLCCj0wDQWJAwEqXv9frBfxjSP/GI9IdtG0gnN8Htx873XpUDbGj2P
	GzHmzQjbd4+28xI92q84R5pFrBN24J2mePlxtYYSL6Zf3Y9SBdaVOkGf7aoL/ihm
	ZAFswlmcvZtIdeilkAA2CJY+Z+zJ1vVWNt40jWV0253YzlvC3lj3ozbjK3cE6++w
	==
X-ME-Sender: <xms:KF-bYaPJ8bzOVcOtdVF8k57FmiBIXC1CukBjrBHNDhMHQBkZazUo7A>
    <xme:KF-bYY9oVTI6Ecm0rKb5tb_bb81yhUNmp44afxnzllmA849cwywIycGYT3PIotdbq
    WmpROT5uXnykYUHU-0>
X-ME-Received: <xmr:KF-bYRRXgoecNUZh-U4su2kr-vtDSi0lD1iPE4toxf_qUD9VFPgbgCHtjO7bzIWKISQLJLN73FU2r2RtoEWA7yUVBpXnty0cGAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KF-bYat3DrCF6k1z2ZB4OPo07o7yw0IBiIowWyZ4hbvsl3yhbk_YFQ>
    <xmx:KF-bYSdalM3T8LvmvFADqt4WklP8UBOvz4L6pSTxwljsuIsHI9ZqPA>
    <xmx:KF-bYe0IBECcn6LKodEH4ME7GmJ4GXvd4JM42PfVgEMSxikru8z4XA>
    <xmx:KF-bYR5aFRvlq5P-Drh-mHrd9HlVCfCtJ3h7cI_yyzEVgQh51WQdKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 04:13:12 -0500 (EST)
Date: Mon, 22 Nov 2021 10:13:10 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 1/3] net: allwinner: reset control support
Message-ID: <20211122091310.zldofuinep2nzpiy@gilmour>
References: <20211121195337.230475-1-boger@wirenboard.com>
 <20211121195337.230475-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5a2e7pemerpscpgb"
Content-Disposition: inline
In-Reply-To: <20211121195337.230475-2-boger@wirenboard.com>


--5a2e7pemerpscpgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Nov 21, 2021 at 10:53:35PM +0300, Evgeny Boger wrote:
> R40 (aka V40/A40i/T3) and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC is gated by default.

Gated is usually used for clocks, not reset lines, which would usually
be asserted instead.

> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 64 +++++++++++++++++++--
>  1 file changed, 59 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 800ee022388f..16039784f2c6 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -28,6 +28,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
> +#include <linux/reset.h>
>  #include <linux/soc/sunxi/sunxi_sram.h>
> =20
>  #include "sun4i-emac.h"
> @@ -68,6 +69,15 @@ MODULE_PARM_DESC(watchdog, "transmit timeout in millis=
econds");
>   * devices, EMACA and EMACB.
>   */
> =20
> +/**
> + * struct emac_quirks - Differences between SoC variants.
> + *
> + * @has_reset: SoC needs reset deasserted.
> + */
> +struct emac_quirks {
> +	bool		has_reset;
> +};
> +
>  struct emac_board_info {
>  	struct clk		*clk;
>  	struct device		*dev;
> @@ -85,6 +95,7 @@ struct emac_board_info {
>  	unsigned int		link;
>  	unsigned int		speed;
>  	unsigned int		duplex;
> +	struct reset_control	*reset;
> =20
>  	phy_interface_t		phy_interface;
>  };
> @@ -790,6 +801,7 @@ static int emac_probe(struct platform_device *pdev)
>  	struct emac_board_info *db;
>  	struct net_device *ndev;
>  	int ret =3D 0;
> +	const struct emac_quirks *quirks;
> =20
>  	ndev =3D alloc_etherdev(sizeof(struct emac_board_info));
>  	if (!ndev) {
> @@ -808,6 +820,13 @@ static int emac_probe(struct platform_device *pdev)
> =20
>  	spin_lock_init(&db->lock);
> =20
> +	quirks =3D of_device_get_match_data(&pdev->dev);
> +	if (!quirks) {
> +		dev_err(&pdev->dev, "Failed to determine the quirks to use\n");
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
>  	db->membase =3D of_iomap(np, 0);
>  	if (!db->membase) {
>  		dev_err(&pdev->dev, "failed to remap registers\n");
> @@ -824,16 +843,31 @@ static int emac_probe(struct platform_device *pdev)
>  		goto out_iounmap;
>  	}
> =20
> +	if (quirks->has_reset) {
> +		db->reset =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +		if (IS_ERR(db->reset)) {
> +			dev_err(&pdev->dev, "unable to request reset\n");
> +			ret =3D PTR_ERR(db->reset);
> +			goto out_dispose_mapping;
> +		}
> +
> +		ret =3D reset_control_deassert(db->reset);
> +		if (ret) {
> +			dev_err(&pdev->dev, "could not deassert EMAC reset\n");
> +			goto out_dispose_mapping;
> +		}
> +	}
> +
>  	db->clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(db->clk)) {
>  		ret =3D PTR_ERR(db->clk);
> -		goto out_dispose_mapping;
> +		goto out_assert_reset;
>  	}
> =20
>  	ret =3D clk_prepare_enable(db->clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", ret);
> -		goto out_dispose_mapping;
> +		goto out_assert_reset;
>  	}
> =20
>  	ret =3D sunxi_sram_claim(&pdev->dev);
> @@ -889,6 +923,8 @@ static int emac_probe(struct platform_device *pdev)
>  	sunxi_sram_release(&pdev->dev);
>  out_clk_disable_unprepare:
>  	clk_disable_unprepare(db->clk);
> +out_assert_reset:
> +	reset_control_assert(db->reset);
>  out_dispose_mapping:
>  	irq_dispose_mapping(ndev->irq);
>  out_iounmap:
> @@ -909,6 +945,7 @@ static int emac_remove(struct platform_device *pdev)
>  	unregister_netdev(ndev);
>  	sunxi_sram_release(&pdev->dev);
>  	clk_disable_unprepare(db->clk);
> +	reset_control_assert(db->reset);
>  	irq_dispose_mapping(ndev->irq);
>  	iounmap(db->membase);
>  	free_netdev(ndev);
> @@ -940,11 +977,28 @@ static int emac_resume(struct platform_device *dev)
>  	return 0;
>  }
> =20
> -static const struct of_device_id emac_of_match[] =3D {
> -	{.compatible =3D "allwinner,sun4i-a10-emac",},
> +static const struct emac_quirks sun4i_a10_emac_quirks =3D {
> +	.has_reset =3D false,
> +};
> +
> +static const struct emac_quirks sun4i_r40_emac_quirks =3D {
> +	.has_reset =3D true,
> +};
> =20
> +static const struct of_device_id emac_of_match[] =3D {
> +	{
> +		.compatible =3D "allwinner,sun4i-a10-emac",
> +		.data =3D &sun4i_a10_emac_quirks
> +	},
> +	{
> +		.compatible =3D "allwinner,sun4i-r40-emac",

The R40 is part of the sun8i family

This needs to be updated in your binding and DT patch as well.

Maxime

--5a2e7pemerpscpgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZtfJgAKCRDj7w1vZxhR
xbqSAP98d/rVfrrXE3om7UCuvuy+hJy/YdkCyUChZaAz/rH8WQEAk+bisxl72Igq
EzwC2ELmB+HnCLLYkxPD5+m8IrhbNA8=
=Vn4d
-----END PGP SIGNATURE-----

--5a2e7pemerpscpgb--
