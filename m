Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FFC70
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Apr 2021 08:20:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 26F3D2E21;
	Thu,  1 Apr 2021 04:20:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 01 Apr 2021 04:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=WSvdubl47C4t/rrjzZdaUHwHV7f
	YwQI096IWtbkEenk=; b=ZLH7twjjYE9O+XAzM6FEj+nHQKhdNwL8M3+gp+47jPh
	QFbmXjui9aoLcfWSTCoHfA+hZQTo/KyRHqAIv2sYW+zJicErJykV1i4w0HUf8ttx
	Z2QCXmldxzIJr9lbLT3UG0IBYm9k4feEtpZWb1VOPjP0QNN6g+cE2wzjQK70eKZi
	qXkMQv+lgJDIlnWxyymVeiVzb/WqiWLiA2sXssdov5pwTUzjk4R7RKtrBex5OQZl
	UGwrBizULSM8IicBXuNtPv9rjGj1Gn+BvYyZpYvdW4nmgb7ZyzaZBBphcF1/M6TY
	va4Gf79zXU9KS6r4ckAC5jzQIRnfooG21TKP/ZQ814w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WSvdub
	l47C4t/rrjzZdaUHwHV7fYwQI096IWtbkEenk=; b=FVbQ0wHs0e3bKhAZYH15Lg
	nDsklR+5o7ayZHZ8mAEidhC1tBg7VRd/l3XI2hzIYLhsBh0VXRyOVqtCiEIsmmC3
	Sv6uR/NjfhZwN6dH2LOn17AHjXy1pgdzDJ30KU410Zn7FhZ71nQ17OM2ZdWqCKG9
	w6ML6oB5e7/v7l43T6fgm3i2MD8GMx9vo8Ubhpzxip+Z4y+5HrNB/NMFPULNy2KJ
	+kaFWz4SNlGKU3Ts+eKi5aanyuBPF4lmrsXRiXhwAnpAf49FzIdXgevecRhRnS5R
	e/B2D9OjBX332T0Oy9f3vBRpPU5KwuJMWrh6fVNQQH87G04NpjkNrHbc+aJTEYfg
	==
X-ME-Sender: <xms:OYJlYC_WE79YDaZcZnE2_6xP8k1pR_03o-zI4qL8oInPfn8Sw-Q9kA>
    <xme:OYJlYCuIKqsd2YAj_PzonmkIQh8oSUvTbMbjVCmo0Qncj_bQu_CaqoCp_yWyL-UMD
    SQ1TW0e1elWD0Mp9EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueev
    ieegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OYJlYID0duCMTLEWbaqlV6dWadVYyYRxtiOMvwoqo20E5ddhlqQ4WQ>
    <xmx:OYJlYKeGNB1_7u_FaUDAlVup6s8VQQN89bljV2tv8YQERCPqlukDvQ>
    <xmx:OYJlYHMjj9CIV9wzg0JPuQqGHhp9Bogn98xjUO_nKKE7oK9sfIKu-A>
    <xmx:OoJlYN0f4a06RvlL3lMXrKs3DDrIRcifsmb7y4FKf4XayOXX2c0sCA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5094C24005A;
	Thu,  1 Apr 2021 04:20:09 -0400 (EDT)
Date: Thu, 1 Apr 2021 10:20:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] MAINTAINERS: Match on allwinner keyword
Message-ID: <20210401082006.32fbl3syqo7ufjbq@gilmour>
References: <20210331130830.64182-1-maxime@cerno.tech>
 <20210331130830.64182-2-maxime@cerno.tech>
 <9627361.1JYF2Y7Mv4@kista>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4lzzvysuzqbx2adu"
Content-Disposition: inline
In-Reply-To: <9627361.1JYF2Y7Mv4@kista>


--4lzzvysuzqbx2adu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:18:36PM +0200, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne sreda, 31. marec 2021 ob 15:08:30 CEST je Maxime Ripard napisal(a):
> > Some drivers (phy, crypto, net) folders don't have sunxi in it but
> > allwinner. Add that keyword to match on it too.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied both, thanks!
Maxime

--4lzzvysuzqbx2adu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGWCNgAKCRDj7w1vZxhR
xbsIAQDqeYXbLHnYbcPx08A3zG44XQEqqDh7+Raqgs5tTu63xwEAnJxhKxJsNwqb
siwVJUsOahBCZ7ivZ3cHsf8KkmkhVgM=
=2TqD
-----END PGP SIGNATURE-----

--4lzzvysuzqbx2adu--
