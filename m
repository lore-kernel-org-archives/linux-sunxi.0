Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D8173
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 09:24:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AFDDB5C00EC;
	Fri, 14 Jan 2022 04:24:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 14 Jan 2022 04:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=prSeFXlvrMDI8QWFo7Ma/qUcvlr
	vQBX43gtdbh7zJgI=; b=CJ9Dtlwgu/hWBymnjz/DKcZgRv/QXs+/0Hadk0i1rIX
	AlwwjaJSYCye8z5INYI1pAzRyjEEIqK8PcNIRoxcC5Ab9cAG4hB1+byLXx22MN8q
	zgv+kcX90Wx6zhoZ/9OAl1ihNnySTq6+MwT34PQHlOzcHru8km9t5P94rGBygqeJ
	K3arYnD71ogVZHVHXi4AmFvzmrVbVa3z2z5WFSkG1xV2C9czl2TfZ55wiQXrzayJ
	BVjOHGT/24Vve6XznlkGCuSFncoQ9Rs0e7061brddSbQ8JPv96zFB2tVwkOTR9WG
	SkxLqrPBS4+XJxfXgdhPBhguCWxRarudBoViUo89XVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=prSeFX
	lvrMDI8QWFo7Ma/qUcvlrvQBX43gtdbh7zJgI=; b=WdLtHs9MlYy+N6eWNVAt4n
	mu1lG+eb8ztrswgFHNm49GDTcQbkP/ZJmN83CC6A/pE4lz34V8zwaHY2eFvL+brR
	y9a3uYCUy4rHuHG0V3XroWQ7bN733vs6OGXmOcRL7QR5cCs2mz6a3EV8SwwpnPCf
	clerv6PeVifNpcVzhkYfpj36GMx1l4iebgSOkjNLFeA7w4IXNiDhiWw/m2XEgDMn
	hezBrfB8BFeki7u9SH4UKoFTOcVdqW02uN5UlLo4lQ1gPKW1fsTYQVaNLKkXWW4W
	FIvLlQCEO0ULlwyagOvg9tdVAWQeckAUmnvLaUs6Jdp8S3UXVekxn0Sq1wgAZOWw
	==
X-ME-Sender: <xms:P0HhYSSY77aUzoU1JHu1RBIEaRlUv4o_dfUoaSJo33MxWpvMT24RcQ>
    <xme:P0HhYXw72ueTBSJ3CBMJRDgPDPGmvX8iE3xbNCoHpKBKj9rWEOXRnRJ69OiS0cMBA
    uajLg6kYg2yi6tbHsU>
X-ME-Received: <xmr:P0HhYf0TDR8AViLkb-pHgDhVcE8Rc6t_pbg9uYjsrZrQ0HztOsZsCXFkwi1dlUHszg0foMLXEUuWk45iXvTtFxt-2xi9kg9skQfCiqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:P0HhYeA8phCxdnzorVBL22BRBtQrColTgVrlsjDM6G1xVjkaSFUilA>
    <xmx:P0HhYbjvPAwBSaXpxzVg_qVmsPW18gyhi8bhrM19wmFrCynf3UxCAw>
    <xmx:P0HhYar91wNUa9RCbpOowiDZd7VAD1m-ZmPq0lAuavrhNyfsvqbHLg>
    <xmx:QEHhYWVOw221RtcasSpMLDg-RkkSPrrOR_RSGn_zahagg1YPoBGEKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 04:24:15 -0500 (EST)
Date: Fri, 14 Jan 2022 10:24:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Icenowy Zheng <icenowy@aosc.io>, andre.przywara@arm.com
Subject: Re: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
Message-ID: <20220114092413.exs7miua5n42kpbp@houat>
References: <20220111165153.63632-1-boger@wirenboard.com>
 <20220111165153.63632-2-boger@wirenboard.com>
 <20220112084223.j5nm4ennfv7f6ekt@houat>
 <1e13f894-6900-15a8-66ea-f5e4d65bf822@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjxfyaaz7lvw5h4s"
Content-Disposition: inline
In-Reply-To: <1e13f894-6900-15a8-66ea-f5e4d65bf822@wirenboard.com>


--mjxfyaaz7lvw5h4s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 12, 2022 at 11:59:31AM +0300, Evgeny Boger wrote:
> Hi Maxime!
> 12.01.2022 11:42, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi,
> >=20
> > On Tue, Jan 11, 2022 at 07:51:53PM +0300, Evgeny Boger wrote:
> > > We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) d=
evices
> > > in our custom A40i-based design. What we observe is that after several
> > > attempts USB device would fail to enumerate on EHCI port (HS) and wil=
l be
> > > enumerated instead on OHCI (FS, 12Mb/s) only:
> > >=20
> > > [    6.368009] usb 1-1: new high-speed USB device number 5 using ehci=
-platform
> > > [    6.818008] usb 1-1: device not accepting address 5, error -71
> > > [    6.823868] usb usb1-port1: unable to enumerate USB device
> > > [    7.308013] usb 3-1: new full-speed USB device number 2 using ohci=
-platform
> > > [    7.575045] usb 3-1: not running at top speed; connect to a high s=
peed hub
> > >=20
> > > On some boards one of the ports would work in high-speed mode, but
> > > on most of the boards all three USB ports would only work in FS mode.
> > >=20
> > > At the same time, USB work flawlessly in high-speed mode in vendor ke=
rnel.
> > >=20
> > > Looking for the differences in USB code, we found the issue with USB =
PHY
> > > register initialization. Basically, USB PHY driver sets a couple of
> > > internal undocumented PHY registers to the predefined constants. Thes=
e PHY
> > > registers are accessed in a very (and I mean VERY) weird way by shift=
ing
> > > register addresses and values bit-by-bit. This access method was slig=
htly
> > > changed starting from H3 SoC, according to the BSP source for differe=
nt
> > > SoCs.
> > >=20
> > > As a result, mainline PHY driver won't set these PHY registers proper=
ly
> > > resulting in unreliable enumeration in high-speed mode.
> > >=20
> > > We don't know whether this issue will result in broken HS mode on all
> > > affected SoCs or instead the A40i is an unfortunate exception. What we
> > > indeed verified, is that BSPs for all affected SoCs write these regis=
ters
> > > properly while mainline kernel don't. We also were able to reproduce =
the
> > > USB issue on a couple of A40i boards from other vendors, so we are pr=
etty
> > > sure these registers have to always be properly set, regardlress of
> > > a hardware layout.
> > >=20
> > > The proposed patch is tested on A40i-based Wiren Board 7 building
> > > automation controller. More details are below.
> > >=20
> > > On older SoCs (prior to H3) PHY register are accessed by manipulating
> > > the common register for all PHYs. PHY index is specified by pulsing
> > > usbc bit.
> > >=20
> > > Newer SoCs leave the access procedure mostly unchanged, the
> > > difference being that the latch registers are separate for each PHY.
> > >=20
> > > Additionally, accessing USB PHY registers is only possible if phy0 is
> > > routed to musb IP instead of HCI.
> > >=20
> > > Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
> > > R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.
> > >=20
> > > On A83t, H6, H616, T507 and probably on more recent hardware,
> > > these PHY registers are not used in vendor BSP.
> > > So don't set v2 flag for these even newer SoCs as a precaution.
> > >=20
> > > Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> > This should probably be sent to stable, and have a Fixes tag?
>=20
> well, phy register writes never worked on H3 SoC and newer, so there is no
> specific commit which broke it. So nothing to put to Fixes: tag.

If anything, it should be the patch that introduces the H3 support?

> I'm not sure it qualifies for stable too. Citing guidelines:
>=20
> >It must be obviously correct and tested
>=20
> I was only able to test it on handful of A40i boards and on one A20 board
>=20
> >It must fix a real bug that bothers people
>=20
> this bug for certain bothers *us*, but our users won't benefit from porti=
ng
> this fix to stable.
> I didn't find reports on this bug from other people.
> I think unfortunately not many people are using mainline kernel on these
> SoCs.

Yeah, it makes sense then, thanks!
Maxime

--mjxfyaaz7lvw5h4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYeFBPQAKCRDj7w1vZxhR
xYS0AQCZH5g291Vf2fh1VjfLr3vqIRsPww5ycNA8W3GTdoPpZQEAtqWnkzS5SzZH
5mZ8LMaS1EHLqo5JB8tknu7J2mvJ5AU=
=KxDc
-----END PGP SIGNATURE-----

--mjxfyaaz7lvw5h4s--
