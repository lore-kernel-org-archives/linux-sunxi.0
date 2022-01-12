Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBEC173
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 08:42:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BE0B05C0038;
	Wed, 12 Jan 2022 03:42:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 12 Jan 2022 03:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=CZ6UEiDAUTGgktCS2fUXMPiPqpq
	20n60hrnBeV5qqoE=; b=bGC9ieSi+Iwen9Gb1AAu/zmuj5/MPr7cP7UI9I/DnYg
	1ABxsf75NeTzR/QclmMQoZZtnH9PaYbGoE7IczXoVlp2d8wHnR4ZIYNDux86/Kz/
	JnMhXRgiJvtaqGfxX+Ghqlc6QGWDTU918VXLe3HHC6ygr2JqJWP7SqaE+ulwbfKC
	GRtyeN6GCCGUIYthxtp4Ysn3p8TDintUC0D6xOW5dsqUXbXaKkuAaWJBe5asnnuU
	oJpysaaIf9baAu54h2ZryQKKNjQkPepYuizSvXa5qC9hARHVPucQmvVUkyo0tL5F
	sGyVipIMYrd/tAVQ9Pp8TDNb8MODYdcbagGbqwgBhYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CZ6UEi
	DAUTGgktCS2fUXMPiPqpq20n60hrnBeV5qqoE=; b=c+qUCDndjeuLR+Ij/ge67c
	o4ya/mMxFxBlnmRXRtONwiZ1GPI6X7THCI5DmhEdUbugDFZxQeZPTuwmLK2Wt4dY
	FQzAQVXrVGs1tAsr0CYxgJMPFJgIA5CoFW7fsuZBe5rzixCqJ17XHGl3slkaEK1e
	p0dp9xmTNiWOLBTHGrF1RTNVXRGXqMm6gegQDAzFxPIN5049/irw7vaEJh0DjTQH
	c/PnwmT/IT2dUGxyrBezjOcvqOR5Pr9ObCmz8/hV4vP7SjUX4hsjGCZSZxI3tyvO
	+BMqgY9JFXBxUEDtnLRjm3pILsIJQLfPtaXQd9g8+NvFYoSURhCUCD8sxtd9EH1A
	==
X-ME-Sender: <xms:cpTeYRI9fiQnmYmFKS3PBYMsT0UQWYuHb0IEsj_-TPBDHyjjZTuUYQ>
    <xme:cpTeYdJILCWDU8aMDMkRVssP5AHZzN6nFl57LAvp2D31s0CZECKlaAkFh2Ob8Gmoq
    RsnqSr3VDRSl3avvNM>
X-ME-Received: <xmr:cpTeYZsFQNJ-k1WJMRWIkHtZahR8X8pT_lL-xQ-__4_1R4bom5Hfu-1ggoKndOV55SXyU0WFoKOD7qKNLnGG-cCiEqn6nSMr_kewmlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cpTeYSYRE-RfDYatcvsTQlzGUfCbLoYHyvHnq7paxLfxSDUcWabmCQ>
    <xmx:cpTeYYY10jyZJ9z28lOcBbU7VF8Xkt4eBgGMAmCGlD4ZpWUlNHkFAA>
    <xmx:cpTeYWDKBc5T4dXaPRPtwdVgiQ77fN7YePpQAbskPzff7yGDgpjk9Q>
    <xmx:c5TeYdMKHVg6xPRhj-ioHjkVr8f_n7ICG_BCOWNMYp6AtBxbV2h91w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jan 2022 03:42:26 -0500 (EST)
Date: Wed, 12 Jan 2022 09:42:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Icenowy Zheng <icenowy@aosc.io>, andre.przywara@arm.com
Subject: Re: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
Message-ID: <20220112084223.j5nm4ennfv7f6ekt@houat>
References: <20220111165153.63632-1-boger@wirenboard.com>
 <20220111165153.63632-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zf3c725svl76a52h"
Content-Disposition: inline
In-Reply-To: <20220111165153.63632-2-boger@wirenboard.com>


--zf3c725svl76a52h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 11, 2022 at 07:51:53PM +0300, Evgeny Boger wrote:
> We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) devic=
es
> in our custom A40i-based design. What we observe is that after several
> attempts USB device would fail to enumerate on EHCI port (HS) and will be
> enumerated instead on OHCI (FS, 12Mb/s) only:
>=20
> [    6.368009] usb 1-1: new high-speed USB device number 5 using ehci-pla=
tform
> [    6.818008] usb 1-1: device not accepting address 5, error -71
> [    6.823868] usb usb1-port1: unable to enumerate USB device
> [    7.308013] usb 3-1: new full-speed USB device number 2 using ohci-pla=
tform
> [    7.575045] usb 3-1: not running at top speed; connect to a high speed=
 hub
>=20
> On some boards one of the ports would work in high-speed mode, but
> on most of the boards all three USB ports would only work in FS mode.
>=20
> At the same time, USB work flawlessly in high-speed mode in vendor kernel.
>=20
> Looking for the differences in USB code, we found the issue with USB PHY
> register initialization. Basically, USB PHY driver sets a couple of
> internal undocumented PHY registers to the predefined constants. These PHY
> registers are accessed in a very (and I mean VERY) weird way by shifting
> register addresses and values bit-by-bit. This access method was slightly
> changed starting from H3 SoC, according to the BSP source for different
> SoCs.
>=20
> As a result, mainline PHY driver won't set these PHY registers properly
> resulting in unreliable enumeration in high-speed mode.
>=20
> We don't know whether this issue will result in broken HS mode on all
> affected SoCs or instead the A40i is an unfortunate exception. What we
> indeed verified, is that BSPs for all affected SoCs write these registers
> properly while mainline kernel don't. We also were able to reproduce the
> USB issue on a couple of A40i boards from other vendors, so we are pretty
> sure these registers have to always be properly set, regardlress of
> a hardware layout.
>=20
> The proposed patch is tested on A40i-based Wiren Board 7 building
> automation controller. More details are below.
>=20
> On older SoCs (prior to H3) PHY register are accessed by manipulating
> the common register for all PHYs. PHY index is specified by pulsing
> usbc bit.
>=20
> Newer SoCs leave the access procedure mostly unchanged, the
> difference being that the latch registers are separate for each PHY.
>=20
> Additionally, accessing USB PHY registers is only possible if phy0 is
> routed to musb IP instead of HCI.
>=20
> Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
> R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.
>=20
> On A83t, H6, H616, T507 and probably on more recent hardware,
> these PHY registers are not used in vendor BSP.
> So don't set v2 flag for these even newer SoCs as a precaution.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

This should probably be sent to stable, and have a Fixes tag?

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 44 ++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index 788dd5cdbb7d..cf10e385f199 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -119,6 +119,7 @@ struct sun4i_usb_phy_cfg {
>  	bool dedicated_clocks;
>  	bool enable_pmu_unk1;
>  	bool phy0_dual_route;
> +	bool phy_reg_access_v2;
>  	int missing_phys;
>  };
> =20
> @@ -192,13 +193,38 @@ static void sun4i_usb_phy_write(struct sun4i_usb_ph=
y *phy, u32 addr, u32 data,
>  				int len)
>  {
>  	struct sun4i_usb_phy_data *phy_data =3D to_sun4i_usb_phy_data(phy);
> -	u32 temp, usbc_bit =3D BIT(phy->index * 2);
> +	u32 otgctl_val, temp, usbc_bit;
>  	void __iomem *phyctl =3D phy_data->base + phy_data->cfg->phyctl_offset;
> +	void __iomem *phyctl_latch;
>  	unsigned long flags;
>  	int i;
> =20
>  	spin_lock_irqsave(&phy_data->reg_lock, flags);
> =20
> +	/* On older SoCs (prior to H3) PHY register are accessed by manipulatin=
g the
> +	 * common register for all PHYs. PHY index is specified by pulsing usbc=
 bit.
> +	 * Newer SoCs leave the access procedure mostly unchanged, the differen=
ce
> +	 * being that the latch registers are separate for each PHY.
> +	 */

Multi-line comments need to start with an empty line

> +	if (phy_data->cfg->phy_reg_access_v2) {
> +		if (phy->index =3D=3D 0)
> +			phyctl_latch =3D phy_data->base + phy_data->cfg->phyctl_offset;
> +		else
> +			phyctl_latch =3D phy->pmu + phy_data->cfg->phyctl_offset;
> +		usbc_bit =3D 1;
> +
> +		/* Accessing USB PHY registers is only possible if phy0 is routed to m=
usb.
> +		 * As it's not clear whether is this related to actual PHY
> +		 * routing or rather the hardware is just reusing the same bit,
> +		 * don't check phy0_dual_route here.
> +		 */

Ditto

Thanks!
Maxime

--zf3c725svl76a52h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd6UbwAKCRDj7w1vZxhR
xeUiAP9QBs5Oca1bMSGeSecThO/W3ubYAwze8E/7eI+eEFJspQD9EpvfKjgr4JkH
041Q2D4gwDf+sHJQxYNlg6x9lyEDZg4=
=xIKG
-----END PGP SIGNATURE-----

--zf3c725svl76a52h--
