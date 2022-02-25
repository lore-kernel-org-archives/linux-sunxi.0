Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9F7B
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Feb 2022 08:21:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 137E45C01C1;
	Fri, 25 Feb 2022 03:21:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 25 Feb 2022 03:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=ZaFrC2HxiD2voL0XEad3KDb3smnYmstLZS5qZ8
	YOuQo=; b=YXFCgz4Ih6NtyR3sPBu2n8qXjgDquykOTPOzfu6k51rNsqKiANfZ3h
	bvFeU7abQU9iHENq1Q5CtLY/SGF90KbihDO/TQzUt2VEi58nJLewUbOn+WhlcBOt
	UwQflwqlb/UgD4IuS+QvxneDr45sXqhnD3t8wpLp6QznzOTHpIWqiyOXBV/uqrbK
	sQJH766qT28NkkGU5NqT4lTparJQ5Iii31gIYVVuokkI9/yz08Cn7CoqcuQSKqH/
	WdupORwWgEkHps54NjLTBIhnd/gJgmAeBnwU9crHPtopemM2EUwJhjGpgw2IiY8X
	sqmFKs7hx7RKNsrvxzVOKSYJfEkI+siQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZaFrC2HxiD2voL0XE
	ad3KDb3smnYmstLZS5qZ8YOuQo=; b=G9hrAk2JHBfbO741TcyfhE8snxsz6/BhU
	uvGLeXBKRgU7sPQNn7moW5/cgOuGXlEl+yMJS0qmLX/Xj9WyO58XBANmz6SGR4Cz
	aYKxEZnuhoQsh9LaUaV4bKzrScg4j0PGuWGDE4ww76JkKbArfjlaxktHDzRyjTmg
	z+eRLLkT6fq21ovfpxiMJxSnpuGWVGKlgfsOHesRyMIBXdTEWw8qqoElAnjp3mn2
	6YuKoNjzuR8YBRdwwMaDAscC6JR+43aNSQSQLm1m05OHeHBEx41VDOq2Tp8xPDLI
	X+sghraQFhKOsKIEd3q0oMq5+N2334QqS931XKvkfQUbkI0cxtRJA==
X-ME-Sender: <xms:dpEYYhEIlaehYfFquwwtcSnKh7R8LLcBBlHzXRwS5YAociiC2VImng>
    <xme:dpEYYmXRVbXzIj2DUtkcqhti_tRaG3T3JJVXE5DTjMuvvFchqMoyLQrpbc9_Q1jT7
    gKGy-fkDtZrs9JxDGE>
X-ME-Received: <xmr:dpEYYjI-J-bzpe_ievKVW8SqPdvVCY_-T5U3wAVPZnVWTDZuiwwsIVoFT_YO6hK6SU4oTSb7l_khXWqjIAVNxt6U0JDhBLteaFsyAec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleefgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dpEYYnHTkTeCYZnnYrPqXD5RIxniGonhQc9cedZS4lBJM5vh_3iqyQ>
    <xmx:dpEYYnVRftPnILzxhtc-9dW1ykRYP1g54xSiwiHD1-vcYgAp3qZ3xg>
    <xmx:dpEYYiNpuphRgPF8tE5_E2zO5ZkQNjGjxFPgaIdcvTJ_mvs2qWmDYA>
    <xmx:d5EYYte5BBHyqsq0IFOKT3Zw-Cp_K3FuJB-liafyW4Yf-GEE5juogA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 03:21:10 -0500 (EST)
Date: Fri, 25 Feb 2022 09:21:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: arm@kernel.org, soc@kernel.org, Jernej Skrabec <jernej@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	wens@csie.org, samuel@sholland.org
Subject: Re: [GIT PULL] Allwinner DT changes for 5.18
Message-ID: <20220225082107.pjeqpg75tkl3wxci@houat>
References: <YhgMJ0AqaHopzaW3@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="by5vcu3wu4uusknp"
Content-Disposition: inline
In-Reply-To: <YhgMJ0AqaHopzaW3@kista.localdomain>


--by5vcu3wu4uusknp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

On Thu, Feb 24, 2022 at 11:52:23PM +0100, Jernej Skrabec wrote:
> Hi!
>=20
> Please pull following changes for next release.

I'm stepping back, so you should expect the PR from Jernej and Samuel
=66rom now on.

Maxime

--by5vcu3wu4uusknp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhiRcwAKCRDj7w1vZxhR
xWzLAQDHjzeEZf57rDWwkIl9KSlcIs9LeVmJ5R4dGluuATtpvgD+JYCKJjr7lkuV
wYslkpwbKes10LjyTLPPTl04Eng4fQo=
=n2ff
-----END PGP SIGNATURE-----

--by5vcu3wu4uusknp--
