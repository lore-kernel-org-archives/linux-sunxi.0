Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6B168
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 16:11:22 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9B7395C028C;
	Tue,  6 Jul 2021 12:11:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 06 Jul 2021 12:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=KliTMefJzAYxrzLSNlhl2xYe2MN
	Ej8H99kpUpPg4XGs=; b=EWUh5GLHdZs0RGGSax/o/pXeDSvIz56CzeDMA3U9P6m
	x3yIA4OGPWywJ/GgrjM5C24T+lUVNKI3+OtIZ1rra0hATQVfdb3J5C/w4t3i/F5E
	HOkP+1rcwbsU0awucBl/cxBfBfPHyN/qKrbTObX+allKyVbM5gJbM88AEune248W
	QGTH9BOdk3HpPfBWDLn3iNh2iSpUz61JZo5byquJQsHcY+GQ9pB0dFKlwvGNOYkA
	s0FxTC2Bvuip8ttZQX6nsZIDiPRWOcWUSiDHZy2x14ZL1z5B3y6uat+QnG5IRHx4
	uNTWDqWUhOiXv3jR0WSS/cA8loL2WJWhKqlHehbOUAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KliTMe
	fJzAYxrzLSNlhl2xYe2MNEj8H99kpUpPg4XGs=; b=lwfXiN8MUo0ZdyRmCkNvzu
	jRhwf4i1GWbBhXi83RuVyNCsmb22jd8dEdWIfKy8wZkEFlvY90tcEPfcSBe1jQL2
	hTHOeS/R5jq7fytr8HUoNuUhvD5it3Vp1YkLPnZGo4NxBG4s/88lgJT5Lq8oIQa+
	9B8NYRX4kKI8v8HV/uGR7VwsCJ0C30wjAV2yB7a0kh/qJVglTI3LrzqNeJibubIW
	s5xu+bCGCWE8UQb8xGZ747qAJ+BM3vdlEyl/GqVuy+tKPxve9HQQqoRcaRgf7yhh
	AKcOJl9aixAkgyq1kR2nMb32a4IYa66XhuAF+dxbbc/7gNLeye2KZFa51GwwK9Fw
	==
X-ME-Sender: <xms:qIDkYFxsqfn9JEJWjC7wkeYqttCdV4z2t6OJgApuLybxJqHT4gdTrw>
    <xme:qIDkYFTnQ3mHtHkn_cm3-WL4dD_a1iUxyyT2u2WnTxJpxCZg8wEpmpE6rDYV9gOHX
    4JvbY66LQn_TXHt-Rs>
X-ME-Received: <xmr:qIDkYPVOj7TemAlU7saHI9XawRiOzhh05FC3v0MqeNYlaDlbGID5kDdKXXZ39BC9eFVxNjISpWIJETvKryPOacZNm_VNaIUj5KpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddtgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qIDkYHgotCbYdGTc01aLthtcA55Zw_wKrugBY-qh0AZlgTNHllYgmg>
    <xmx:qIDkYHDP9PHYCPvsA8Dy3ijawCM6xQbvCi4_a0LUrlMtUfclvEi5NQ>
    <xmx:qIDkYAKPwdOWlYy1gKv1soGvIY8ahwEknxpMG_NCdVjPdt4JMzmfbQ>
    <xmx:qYDkYJ2g-vt_JXa8yIvfe8gwAvb6TOwLwiEZdDsr7qEyYdLwwldGDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 12:11:20 -0400 (EDT)
Date: Tue, 6 Jul 2021 18:11:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] cmd: ums: Enable by default for sunxi
Message-ID: <20210706161118.im2majzm4kwhuqw6@gilmour>
References: <20210705232319.15149-1-andre.przywara@arm.com>
 <CAMty3ZDv3WPqRAMQEZe6D8BxJgz+MhzxdaKMQLUcG5K-CL7=Ew@mail.gmail.com>
 <20210706165732.7a532568@slackpad.fritz.box>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qsp4r3pxjv2y6osi"
Content-Disposition: inline
In-Reply-To: <20210706165732.7a532568@slackpad.fritz.box>


--qsp4r3pxjv2y6osi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 04:57:32PM +0100, Andre Przywara wrote:
> On Tue, 6 Jul 2021 19:56:24 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>=20
> Hi Jagan,
>=20
> thanks for the response!
>=20
> > On Tue, Jul 6, 2021 at 4:53 AM Andre Przywara <andre.przywara@arm.com> =
wrote:
> > >
> > > The ums command (presenting a U-Boot block device as a USB mass stora=
ge
> > > device) is very useful for accessing eMMC devices via USB-OTG.
> > >
> > > At the moment we enable USB fastboot by default for Allwinner devices,
> > > so it makes sense to do the same with USB mass storage, which is
> > > actually more versatile and can be accessed on any USB host easily.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  cmd/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/cmd/Kconfig b/cmd/Kconfig
> > > index a9fb4eead29..7b1c96910a8 100644
> > > --- a/cmd/Kconfig
> > > +++ b/cmd/Kconfig
> > > @@ -1347,6 +1347,7 @@ config CMD_USB_MASS_STORAGE
> > >         bool "UMS usb mass storage"
> > >         select USB_FUNCTION_MASS_STORAGE
> > >         depends on BLK && USB_GADGET
> > > +       default y if ARCH_SUNXI && USB_MUSB_GADGET
> >=20
> > UMS or any secondary-emmc accessible are considered in production
> > u-boot config instead of mainline u-boot since we have fastboot
> > already available for this kind of purpose. This might be one of the
> > reason not conisidered UMS by default till now, atleast on Allwinner.
>=20
> Well, I consider fastboot inferior to UMS. I understand that
> Android phone hackers use it all the time, but I think having a block
> device is far more versatile - you can partition it as you like, create
> and populate a filesystem, dd an image to it, extract or update
> firmware, etc. - most without extra software, even on Windows or Mac.
> I think fastboot offers a reboot command, but are there other killer
> reasons for it? And having the ums command in addition to fastboot does
> not hurt, both would still work.

fastboot abstracts away the storage medium, whereas UMS doesn't. You
cannot run UMS on a NAND or SPI-NOR, while this causes no issue at all
to fastboot.

Similarly, UMS exposes the whole partition to the host. You then need to
have a driver for that FS on that machine, otherwise you just can't
access it.

Sure, it's convenient, but it's far from being ubiquitous and the silver
bullet you claim it is.

> So are there any real arguments for not adding ums as well? I am not
> sure many people tweak their config, so I would like to offer a decent
> out-of-the-box experience, even for casual users.

As usual, we also have to balance that with the size limit, but I'm not
sure it's an issue these days?

Maxime

--qsp4r3pxjv2y6osi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOSApgAKCRDj7w1vZxhR
xf2LAQCJg6BGZ03KCmVckLHFXECjm8293eLHV3kyf9giRqNd/AD9EJjK79BcMKFV
LjHE+2dvURGDYay5DjROxTg2gYNPBwk=
=grQz
-----END PGP SIGNATURE-----

--qsp4r3pxjv2y6osi--
