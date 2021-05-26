Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D682FAE
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 10:54:10 +0000 (UTC)
Received: from gagarine.paulk.fr (gagarine [192.168.1.130])
	by leonov.paulk.fr (Postfix) with ESMTPS id 223D8BFD41
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 12:48:40 +0200 (CEST)
Received: by gagarine.paulk.fr (Postfix, from userid 105)
	id 96CDC60B9EC; Wed, 26 May 2021 10:48:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ef4ac936a982
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	autolearn=disabled version=3.4.2
Received: from collins (unknown [192.168.1.1])
	by gagarine.paulk.fr (Postfix) with ESMTPSA id B099F60B9CB;
	Wed, 26 May 2021 10:48:31 +0000 (UTC)
Date: Wed, 26 May 2021 12:48:27 +0200
From: Paul Kocialkowski <contact@paulk.fr>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby
 configuration for MUSB
Message-ID: <YK4ne9OtEON85akS@collins>
References: <20210526005718.23767-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zMpn7AkXVOPg+bqr"
Content-Disposition: inline
In-Reply-To: <20210526005718.23767-1-andre.przywara@arm.com>


--zMpn7AkXVOPg+bqr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Wed 26 May 21, 01:57, Andre Przywara a =C3=A9crit :
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Recent Allwinner platforms (starting with the H3) only use the MUSB
> controller for peripheral mode and use HCI for host mode. As a result,
> extra steps need to be taken to properly route USB signals to one or
> the other. More precisely, the following is required:
> * Routing the pins to either HCI/MUSB (controlled by PHY);
> * Enabling USB PHY passby in HCI mode (controlled by PMU).
>=20
> The current code will enable passby for each PHY and reroute PHY0 to
> MUSB, which is inconsistent and results in broken USB host support
> for port 0.
>=20
> Passby on PHY0 must only be enabled when we want to use HCI. Since
> host/device mode detection is not available from the PHY code and
> because U-Boot does not support changing the mode dynamically anyway,
> we can just mux the controller to MUSB if it is enabled and mux it to
> HCI otherwise.
>=20
> This fixes USB host support for port 0 on platforms with PHY0 dual-route,
> especially on boards like Pine64 (with only USB-A host ports) and
> TV boxes without OTG ports.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> [Andre: tweak commit message, use IS_ENABLED()]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>=20
> for H6 boards to work this requires a DT update (to get the <&usbphy 0>
> links between HCI and PHY), which I will send later.
> Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi M6=
4,
> BananaPi M1.

Thanks for resending this, I've also had to revive this patch lately to get
USB working on the V3 so I definitely second that it's still relevant!

Paul

> Cheers,
> Andre
>=20
>  drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index 5723c980323..e6ceafc7648 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
>  				    data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
>  	}
> =20
> -	sun4i_usb_phy_passby(phy, true);
> +	if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {
> +		/* Needed for HCI and conflicts with MUSB, keep PHY0 on MUSB */
> +		if (usb_phy->id !=3D 0)
> +			sun4i_usb_phy_passby(phy, true);
> +
> +		/* Route PHY0 to MUSB to allow USB gadget */
> +		if (data->cfg->phy0_dual_route)
> +			sun4i_usb_phy0_reroute(data, true);
> +	} else {
> +		sun4i_usb_phy_passby(phy, true);
> =20
> -	sun4i_usb_phy0_reroute(data, true);
> +		/* Route PHY0 to HCI to allow USB host */
> +		if (data->cfg->phy0_dual_route)
> +			sun4i_usb_phy0_reroute(data, false);
> +	}
> =20
>  	return 0;
>  }
> --=20
> 2.17.5
>=20

--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--zMpn7AkXVOPg+bqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmCuJ3sACgkQhP3B6o/u
lQzDjA/6AyNtCyP+on9ckrglR9EMgWI6bdKJEV8hCGMyGINxpSz7ozMs5CzBQqX7
iQLUyrOBXPi8Y0aHDZwilsSm9vWVVym+4NeXuEKtipD7N99bXAv4EYyff1jjGJFJ
iYnXJNzwFy94xz+EFthYuawfYaXUHFPeX9m0G6OblgbsrOLJ3bmQtBcj0gjSBH2/
0UH/Xf4BtvfIREdeTuwlqmhMtwkmYtvJ0s6jNz2Eud4oEkAg+n/Qoj4/qEqjzGHC
MTxpQZrU0SMSq169MSzAteQqVKKVPo5piX3gmbCnn87S7H93sB1wJAvWIUhzZdzL
LZiyFPnS61VCY2mlTkiFB4GBE06aD85bBcn5/xQUdXbzm3NdFVVeYogIg+ffm1hA
abWnQbDiv6sO/LydOzrL2sLvAKEXkFwmZKoi0zKuwGFbCaatFnigvnupKjNoGYL9
nwbqP/S6ydkh+QW/MLGRc29TmEgR2O/ygr4BZ+gnzI+5zEdS+PdNqs4ek4Qmly74
n0ecTZgJIredUcx2YUj7dyTKdrw5wN5zESYf8xDZAJSdmno20n8PahCGaMi5LXan
dEc4c0tk+0Z5udKz5yZcUwvQzgBJCvgAtPF1td2yMO2RGhtzSwjPT69zWWGWGMfU
po0CX7otDWdQak6MpSw3FC2dgeRcDFIfaG/izHqpVDUWiZJGShI=
=q630
-----END PGP SIGNATURE-----

--zMpn7AkXVOPg+bqr--
