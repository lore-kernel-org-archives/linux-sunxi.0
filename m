Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A62C82
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 09:10:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id B549E32003F4;
	Mon, 22 Nov 2021 04:10:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 22 Nov 2021 04:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=j9PkAsJA7WbZrpKLzP2k50HQ2+L
	e6gnz/bXImbAiWYc=; b=Jcg4/DnG++M3g+JI3kAsDjod6w6ODFti4dpzU9OLBhe
	DOWKPPg+xLJofDXdfM5eWKyDMNKNi3qnfEeD6zLj7g9DvzeV0ZtBVQ4cSb9dG+Bj
	Q1SBL0YTpfw+m2LTjTK0FQ7o2y8b3dV1hSk8EZjhv4VSbpRIuHubhADnIiYameGR
	cnnvAojuPWSOCeeVzz40PYdFsfcixVw3CZM7fdFO2AG9CNHeg1AHRkeZiut4aeu8
	3vQznLK0UsoU8v1qbi8/CPRLi5iS4bilT+mx4dlg1tEchEq8+3p45qXKvpunh122
	gCj8obCyDFYhbJJUUuqf8ofUsSZQSAwxP3pgqj5YEAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=j9PkAs
	JA7WbZrpKLzP2k50HQ2+Le6gnz/bXImbAiWYc=; b=ilEAS5/vWBMWZA12OqH/Ay
	3UbFSIbxzTdn4DftC1Tb8PCPONaDLU4fMqh9N+pyirVCFPSzV+WkzacWxuzZ6Drt
	JPv4anX2fjZtkTrtrwfKS8J7L+MPj6sZrWh2hzq2XjAxjgolkTpKNWZnkriMtjmb
	th2Dfz3uVeoMSpt+pXFPtv9LNWd2L/2vYgW/YtkCMQbJHLmTnEWzdsZgLCifUBeZ
	vn8+ssiD6oMLAJCEFFwblSm2DUWTZLd45vGPYrt3ZjU79wKwAapdH/gi+CMEJx8u
	sN6Vas6TAF320xTgUdSzMKgdue45XDA3X7aFQ76JvjYsi7PbmdWvGej/JYVoBloA
	==
X-ME-Sender: <xms:m16bYVW3PsD6QellRttk19U7IzhvgCnE2erWDDscHss2JyVV34aAqg>
    <xme:m16bYVmJvDPnECsdOUHyiqnAQXEdM_IXqLjBafqzMYciODVG0xlRDsAUjzKSqVSYY
    pXhh8unzsooAvnY4ts>
X-ME-Received: <xmr:m16bYRbJGC7-ENaiJl-6sZQ8VADrOK0T0uEEm8fyCZceod5Onxd_YM0wPPMIigqYeEcybwK6W_xuIm01VfX09MEQEQJyKW4yE3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m16bYYXOYp7jrDcw5EOYgtaR6F3NoIEw13fu46KmpGuuRLI8hco6LQ>
    <xmx:m16bYfkwfSqCfeI8WU3X0mdSzu5ia2cij5OaDybIcvNaf-EnLLENNg>
    <xmx:m16bYVcswCVOVwZpUIAFVG3Y4K1Swq46JysHL-MQAxVLj0DvR35YjQ>
    <xmx:nF6bYdabTOs3Y4AiDzvmzpPfNphGMr8cdoEYlrdtBcSdJZUp8msMZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 04:10:51 -0500 (EST)
Date: Mon, 22 Nov 2021 10:10:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: iio: adc: new compatible for Allwinner
 R40 RTP controller
Message-ID: <20211122091050.2skbohgcfl5x4byt@gilmour>
References: <20211119191456.510435-1-boger@wirenboard.com>
 <20211119191456.510435-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcc7moh4ael7oljc"
Content-Disposition: inline
In-Reply-To: <20211119191456.510435-3-boger@wirenboard.com>


--lcc7moh4ael7oljc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 10:14:55PM +0300, Evgeny Boger wrote:
> R40 SoC has touchscreen controller also serving as general-purpose ADC.
> The hardware is very similar to A31, except that R40 has separate
> calibrated thermal sensor IP, so temperature sensing channel in RTP is
> not documented and is not to be used.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--lcc7moh4ael7oljc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZtemgAKCRDj7w1vZxhR
xe0VAQCmBz1r4RXwATjrL938HLoLE6P2ixND+9LPIg0B9MTVsQEAnRzoBZ07i5t2
2c24NDTMqyU5Grj+ttjpZHViiAqO0QQ=
=sVTA
-----END PGP SIGNATURE-----

--lcc7moh4ael7oljc--
