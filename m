Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903817F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 15:28:36 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 39D825C01B7;
	Mon, 24 May 2021 11:28:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 24 May 2021 11:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=ApdjlJQhNbdhrMC97f4bM4yvooC
	lEtiPXbuXH/XWmG8=; b=Zxi0K2SHITvujt1m5HU6I9QO6sUB5UNotbxM0NtkQVV
	aK/pxA5FmZq/t1nHBi/RAZ6FAOOPsaAGhHyhWG1UXIC72K2hhX6LhpTO4GdiFZlT
	K3VpZo+NYU9AlaICwmny/JVsSu257t/ASilwVREadPFkEFweZEkLzm4zTCt4rN2F
	71ywRt0ZXKj7OT4d3LN+ImPgvhGxgoKjSmlNzPP1+swxEJTBI12o2UJ9dZ5CZx7x
	0GCORAMmh/1Yoq97Hp6AxgR3iY1EqMfsUWt7eOz5Zetz0kwXQY+0UqdvUUY3F0He
	WUZRg+l1AOFqI3zwDduQhZaaxjNO3rlPUJq94ucrPaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ApdjlJ
	QhNbdhrMC97f4bM4yvooClEtiPXbuXH/XWmG8=; b=FASLr2p14puz0x53uXx1Oi
	OgbNn63sCEpHgEzt6MiLlADOn4ZZWs+9NYU+1QM8uwIiHXlH482XDm04xs6DHdxT
	8WQ25ZWFajBtAh6jwnBGd0OAKK5mcX3Qq1ie5sh1NwYbbkYwmTDntDIyCo0sWuXh
	uVfJYoKBHenI6wj2YkSidY7wmRNEaHEwydSPItl9pSAIxxWkKtpD7XrswQIImEJT
	lPB0iQwhJolE+SmKn0MVrmDYwCHp5yX2OuTy6wtR3/0kFTdXedHz0mZuez6Sy8Gw
	TfCP5tJ/Tvu54uX8rTUh+PEi+R8BJZcLu6UY72nR6kiNlCSM7nT3FFi5KhSYzxYQ
	==
X-ME-Sender: <xms:IcarYNmK_PJaRkDaC3yzdOuKIJREbDQ19I_rVgPRXyzw2DQBLe3l_g>
    <xme:IcarYI0wSNDsoBdqsHQVyOiM2uGQwEUWymDprpKzfopV4dBCnA2EjRv3MX4GzjKlW
    MxSjtjs_FZAEhxRn3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IcarYDqyt4n_8aQfzDtBQxpgSMzLY00clFHdcbeqomgqnvSV2kU37w>
    <xmx:IcarYNlqsotQYyUly81E2c3EoMDi7UHa3Rr-HfTgNVbb8IqqjBQgwQ>
    <xmx:IcarYL04RrHK6WuIDNZzvpwVR3Es7X3RWV81wRsoIs7UGO8U41HkVA>
    <xmx:JMarYAn4AkUEQnNCk6MyebUP2KtNRHzneAPTw4V8uinaKiHuhe6tWw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Mon, 24 May 2021 11:28:33 -0400 (EDT)
Date: Mon, 24 May 2021 17:28:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Heiko Schocher <hs@denx.de>, Kever Yang <kever.yang@rock-chips.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC PATCH 0/3] fastboot: sunxi: Determine MMC device at runtime
Message-ID: <20210524152831.unrg7zexsdbz6uki@gilmour>
References: <20210524003650.24469-1-andre.przywara@arm.com>
 <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tux4h6zn6mkojyko"
Content-Disposition: inline
In-Reply-To: <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>


--tux4h6zn6mkojyko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 10:37:31AM -0400, Sean Anderson wrote:
>=20
>=20
> On 5/23/21 8:36 PM, Andre Przywara wrote:
> > At the moment the fastboot code relies on the Kconfig variable
> > CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
> > flash command. This value needs to be the *U-Boot device number*, which
> > is picked by the U-Boot device model at runtime. This makes it quite
> > tricky and fragile to fix this variable at compile time, as other DT
> > nodes and aliases influence the enumeration process.
> >
> > To make this process more robust, allow the device number to be picked =
at
> > runtime, which sounds like a better fit to find this device number. Pat=
ch
> > 1/3 introduces a weak function for that purpose.
> > Patch 2/3 then implements this function for the Allwinner platform. The
> > code follows the idea behind the existing Kconfig defaults: Use the eMMC
> > device, if that exists, or the SD card otherwise. This patch is actually
> > not sunxi specific, so might be adopted by other platforms as well.
> > Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
> > this up and remove the implicit assumption that the eMMC device is alwa=
ys
> > device 1 (as least for the fastboot code).
> >
> > I would be curious if others think this is the right way forward.
> > The fact that the U-Boot device numbers are determined at runtime
> > seems to conflict with the idea of a Kconfig variable in the first plac=
e,
> > hence this series. This brings us one step closer to the end goal of
> > removing the "eMMC is device 1" assumption.
>=20
> I would actually favor removing CONFIG_FASTBOOT_FLASH_MMC_DEV
> altogether, and just specifying the device explicitly in fastboot
> commands. If you need to dynamically change the device, you can create
> some aliases. E.g. you could have something like
>=20
> "fastboot_aliases=3Dsetenv fastboot_partition_alias_user ${mmcdev}.0:0"
>=20
> and then run this variable just before calling `fastboot 0` (or whatever
> your usb device is).

If we're going that way, maybe we can just pass the interface on the
command line like dfu does? That way the new requirement would be very
obvious instead of introducing a new environment variable no one really
expects?

Maxime

--tux4h6zn6mkojyko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKvGHwAKCRDj7w1vZxhR
xcGwAQDdy4fSSSkba3DvR+5rpSnX86q+gfEuLzYH6t0vEGmJSQD6AyyvFl5VzPrh
gGkEsLJ47xPwAUNl2FQukhSvqWmsmwA=
=fL27
-----END PGP SIGNATURE-----

--tux4h6zn6mkojyko--
