Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8832C9E
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 09:45:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A6A895C00C6;
	Mon, 31 Jan 2022 04:45:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 31 Jan 2022 04:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=OEWLDL/FcN4j0YUVdIMua8neLJfK4MwNh246ii
	mUMs4=; b=LtH0Ysw8MWl2FchRPkHdLHZhOjPMHnm94FSR0FQ8g8SIo8T3ieZCYL
	AUGdJKqRRmm7ZE8/5+qWdmeinuxqVK54u9S0zN2D73OMODil+mLhJgF3eXnGxg8J
	aEgEzom7oF7tMrifgF31MeQZ2tqzrgMZ2sKBo104B8ZPkuGY8tz3n/H3Rs4v5y7L
	QOT5NJxBHhNrM688qOS0DcQKeZAM1TK9Fy5mZag3/qEo2uBup71U6xBDP7uSBgdt
	bQNhjbBcxTt0t4ZXfIHPk9ZC8Fv8/qT/h2xfmkuoGy0Bc5eVc07se5Ow0lG96u2w
	qOBrQ5QIh+bBcRjGSuS9aoGSvmOK1LpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OEWLDL/FcN4j0YUVd
	IMua8neLJfK4MwNh246iimUMs4=; b=XCT7bvbAMaRHhoXoNHh9vkYGuQ/UPrQrX
	2POh0qyCeHWBSbSnYa6gs2y5dsTnkIlYy9tHU0qakXaqEX50WV1KTjBQ3ThAEk3I
	RXhkMtsWaaPVSB6P3jtHhJdLlw4O6cDkUOce/A+JqfxTjQDEngPCzXnN933mWnjZ
	bhzWJZoa+1bzvzM5Epq2SezEHTpspwWh1XLHzPqZdQfpWIBMac2CmP+Hvz1jKpUB
	29TfOBpCcKmn9f65JUmN32lWU6wBXuVOBKE53R/qfAgviuGJQmfL5MHHnfg+jhm6
	p41CNnnhYHvCBxnI1tswF2VVvJkt+vUCBz0fB3945E737w6FBCf7w==
X-ME-Sender: <xms:sa_3YX3sR6PmhiUGq1OmbCeeraaWEcmgEktO1cBlUc_o5N3T1m4-OA>
    <xme:sa_3YWEbStXZIQ9Ati3ompPI-LFg_pWNKvSuGIR8MlQpFP6f9-ptLuFsn2BvALLdt
    lyksd2o1ypzgpB6ZIc>
X-ME-Received: <xmr:sa_3YX4m87dfzbouOBeh38IbljcXWFkAa65TG8JRKLnYF5oZpNmx56tOvnM9CYrZfcbZPUDuPqBcvMWhkTat7ccyBrhn3bAiapoe90g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
    nhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhfdutdeljefgleejffehff
    fgieejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sa_3Yc0DKMzuzjCcza5bMCB1OrzoTKXnuZue15mvm4Mrx08WTBnj9g>
    <xmx:sa_3YaGQs2O8TcpCedBs_2PWnmXUn9k8qCDoNN72E7JXO4yP9WC2CQ>
    <xmx:sa_3Yd_WtzogaSdGFbwBsWv6BpHzCT2i15vVXWvyom96eiGWpBzJtA>
    <xmx:sa_3YWgtY5ji836PKF5OJPIZZMuO2OfDnCOik0ycPOQ-lLocGr1izA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jan 2022 04:45:20 -0500 (EST)
Date: Mon, 31 Jan 2022 10:45:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, andre.przywara@arm.com,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mmc: sunxi: Add Allwinner F1c100s
 compatibles
Message-ID: <20220131094519.24xonxizaoejjmt6@houat>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
 <20220130220325.1983918-2-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aspkofvbtc35kzor"
Content-Disposition: inline
In-Reply-To: <20220130220325.1983918-2-Mr.Bossman075@gmail.com>


--aspkofvbtc35kzor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 30, 2022 at 05:03:23PM -0500, Jesse Taube wrote:
> Add binding for F1c100s's mmc controller.
>=20
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Some description of why the A20 is a good pick compared to the other
variants would be nice.

Maxime

--aspkofvbtc35kzor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfevrwAKCRDj7w1vZxhR
xRe5AP4q7SMWvfWzGn55Ko8duFNSbBV7gb5pfVZtRpGNnhmWsAD8DEfPv7lBpMnr
XJnIA+WbGKP72iO5puNHasksfaAS7ws=
=ioOV
-----END PGP SIGNATURE-----

--aspkofvbtc35kzor--
