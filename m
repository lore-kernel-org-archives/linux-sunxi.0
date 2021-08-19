Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800012FAE
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Aug 2021 07:44:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BD7C45C01CE;
	Thu, 19 Aug 2021 03:44:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 19 Aug 2021 03:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=xFMK9gG3s52qYq8h607lGxdA1y6
	cTYaYPZrSITimwBI=; b=4FVndveDHDId5GBAVO2f2Y+XA6bR6EStzHcBX2VhVic
	CJWuE8piNmSjyftb60Pbx7co6ZIx2gHZf5wziSQp1K6ZmJ22WIheoWFFndKaOpSb
	LO83r/V2M5fXTFI4EidK9RkiQZhC+l4STdGPZXIAizmjB70RjwbbmC9eaKXqu5rZ
	VGLxJ/o9sDEwwQ3dwlbGexz1NN5rrGNS1Lr2E6cGtRtNl+Jjd+4WHJh3fgxdmW+o
	LlWHCxilQ8fyVo9g7lI4Gpz8Pwvb6NC2LzniyJg+5B/yYOU/K9Kf6tKuK5PVO6YE
	z3YxomH2veDE3TD1n+uvt/tQk1+gTj4ZHxRVsYrKDlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xFMK9g
	G3s52qYq8h607lGxdA1y6cTYaYPZrSITimwBI=; b=sgZc2hBi5CO6XRctiB7IQS
	+wz9S7J6Sv/WGZuYSYp826OQ4ujk8u4RaFS81APElNa4ddFIhraEYqAWt1sKm1vC
	46rJS0FjiQOjcEwAzRqpKjoudnq3PHQ8mD6tuMfH9xHZ7IsfPwEzu3GLT9MxcoeX
	rISLbjUCdsJOGauXs2K+bmVAWDvOwLKlB6LmEn34wKr56JgC6KYEx7eeyWYViqCx
	Psmq2S09eYkNKKBxul//Zkmx6aLaUuSwW/NjIrsm36DQfkEngeHXSqrqEyxLukll
	r35pTnRVNWIUZfWtDjktyM3M1qq2wMQawHy0Lynn1dR0/tHtFf0EwzPWfro3dSeA
	==
X-ME-Sender: <xms:0QseYanV5qUm0qPY879yyTZArLQssP90OoVYBQ3ZN8zi6gfEDfWFQQ>
    <xme:0QseYR3rANVlMWOaMKPTVPU-8EA4OvXB9lCR9GVullNkBEsQ5j4KnC4RDyDrEOvR5
    mC99j-U3kAK03ghr98>
X-ME-Received: <xmr:0QseYYqBvGD7uiMkrinpr3j7ZUm8BuclPpFjLJ-c0sGr00-zKmCgDMDXNrI9Jg4m8j1PxLV4Bxq0OuVJ9F2CWMPQmh3lzY_j9ES1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0QseYemPwOjppitTTOVmZHGMTZHHjQ8g48wx0fuY-GGFntTPUX0IZA>
    <xmx:0QseYY1gWBBwc4xrTHVBSnHJDQ1oyxzqpUPBx_cFTuUoRx9jWS-Guw>
    <xmx:0QseYVtmQiWTqpeR3kD-2XknEbADG2HLS4Wr6GW8DJhswHulSAgGww>
    <xmx:0gseYc9MWG5Fzr5wVRw_c1zlPszpcH-L46e48DcJtN3y9ibllHLbiw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 03:44:17 -0400 (EDT)
Date: Thu, 19 Aug 2021 09:44:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jason Wang <wangborong@cdjrlc.com>
Cc: wens@csie.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: sunxi: Add a missing SPDX license header
Message-ID: <20210819074415.2qaevcwqrnuxc3jq@gilmour>
References: <20210810133138.109309-1-wangborong@cdjrlc.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oblq2e4bjdpzsnk4"
Content-Disposition: inline
In-Reply-To: <20210810133138.109309-1-wangborong@cdjrlc.com>


--oblq2e4bjdpzsnk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 09:31:38PM +0800, Jason Wang wrote:
> Add the missing SPDX license header to arch/arm/mach-sunxi/platsmp.c.
>=20
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Queued for 5.16, thanks!
Maxime

--oblq2e4bjdpzsnk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYR4LzwAKCRDj7w1vZxhR
xSk1AQDRcSuh7Snj1R7lGnI4pInJrn354lVxGvbMQBz+HQ+Q7QEAiDz0E1/zrjDw
XkmFAiX8YCkIFXRWOx6H1DtZ6VpJIQc=
=hpGl
-----END PGP SIGNATURE-----

--oblq2e4bjdpzsnk4--
