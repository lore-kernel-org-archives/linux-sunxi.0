Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85388173
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 09:41:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A509A5C00DF;
	Fri, 14 Jan 2022 04:41:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 14 Jan 2022 04:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=rNAiTiR8/FMAVuyHL7ug4y3np8a
	xgmmTM0zAKSsR9Ks=; b=RZtRhObvaqp+4pkup4dOD0JOBXzkU9DfFCNACOzTsfR
	uj8r8L/1SKbC1iG/p6pZzKhUaeF4OgM4ThsTs6oa836mEVnAuB/9EvDpO/ns0v0u
	C3bi2wlx8O8zCcknlCO2QNXo11W0Xx87vobmz5FLoVKYQLn9FnhfIp79F10GA7bL
	vnegm2BED3xf6XPpRj4UJxMM7bBx/j092rX2KvYDKsHaYXdzlKNJSSzXmslTm4LK
	eTT9Pg3YlqccimLuFNTQCCnKDwOgDmpE24OG/ggyjNG7hmLh5QQnevJ/602KlQ6w
	ZxetER+rVrSBAvSfHXWldIL8Fwy0dnZFwHN4lZLBKCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rNAiTi
	R8/FMAVuyHL7ug4y3np8axgmmTM0zAKSsR9Ks=; b=AdCtwey1+YqZPE/xz94SKc
	lFEjWZwOIqM298bkZcxB+uuk9Pt0E8Brmvjzujv8aTXDnUMJFyWVR5teEsywveEh
	kBmauaYjUivBpBoJ/WapZEdaX2d8rolwiVzjBBSEMl+NEgkGHD07aubG6Bppf3kv
	9mFf+CvjKXFuTvM4tE0AVNlw+xuWPPaDQTa+ijuap9gf9UQYgtaQbmTw8d5i17y6
	W7RGyW8YfOIKs7X7Dx5yzseRBYtMfDNQy+Rtiyo52RphVPC7ycAQuNwbtcrt5IsR
	hTm1ouMJjMJXazo6s3wKFYjafc42xDkHXSd/bvwCwdpXIHTTaJM2qCZid/yVi9DQ
	==
X-ME-Sender: <xms:N0XhYbC5bAp-6gsUafbtjKw_BiRJ33abnL7cwViXz2A5KB2RMJltsw>
    <xme:N0XhYRhMVTXEw_UpD-g2_0Ofk8gtzpwo8X-rvd1t8_6zNfTGCtVdqJO5WKj-qPGBp
    ytd4hbDc5ydFlrx4Bo>
X-ME-Received: <xmr:N0XhYWlOL0UNIvNzxFvoZum8wmi28Gr_r3UEF7OAyHXGMLe__6mwogV3fTwqglg-ym0NudGdVpi4HTS6uFNLPNWVFBzD34v9RPxuDkY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:N0XhYdwkRpElId41tZ3k-uca9sCyhO2UiggBVbURIY0d_ZBN5IQ9SQ>
    <xmx:N0XhYQQeD99nKDt34yOjd-fZ1_JjOizhGatwi1J-D54IgVQ5CGGjaQ>
    <xmx:N0XhYQb8_TKgX2FQCjvlB8Q4Ue84Rw--_4OD3hR2mHmGm3a3MDuI9g>
    <xmx:N0XhYWPBvaQdA5CswnHT27h7r7EJUJ7EIDxa9ld0c6uYQf308FBfEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 04:41:11 -0500 (EST)
Date: Fri, 14 Jan 2022 10:41:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 2/3] dt-bindings: net: support for Allwinner R40 EMAC
 controller
Message-ID: <20220114094109.l2xjbdxt77aqaxcq@houat>
References: <20220113053734.105813-1-boger@wirenboard.com>
 <20220113053734.105813-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="az6qbs37g3myot7a"
Content-Disposition: inline
In-Reply-To: <20220113053734.105813-3-boger@wirenboard.com>


--az6qbs37g3myot7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 08:37:33AM +0300, Evgeny Boger wrote:
> R40 and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC reset needs to be deasserted first,
> so resets property is required.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--az6qbs37g3myot7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYeFFNQAKCRDj7w1vZxhR
xcyMAP9y/SIROUIFIkZskBfjrsyJya8+/iHl3H8GJFEySqOuQAEAzaiUH5AXufBk
NbTfAangJVXiJC4yVkKCF3uWKg+zMA0=
=g1iw
-----END PGP SIGNATURE-----

--az6qbs37g3myot7a--
