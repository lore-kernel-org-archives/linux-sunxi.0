Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13202582
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:03:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id C9C55582063;
	Wed, 29 Mar 2023 11:03:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 29 Mar 2023 11:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1680102219; x=1680109419; bh=K2
	0fsOhg+vLZkzgTF7tMB4jS0IqXYodIByC6uEoduaQ=; b=dcqVt1CftKkmEFlhA+
	aOiURFLLuXg9F3fCMb80o/A0C6pXoSTQ9EAi80tVrRlGItHiYi4fcOHXtqRcr4dA
	rsvr5aLS5spMJ/RBwjzF10usaznM3gM0ptdHwagUwajYxvW7NEe9BIFNnnLSrZWa
	nlpP78ehuzFNrjQv28Gnbk6E0Fg7omUkUbE19MM6URUF/2VKMdx5juf4lZCorG0D
	E60/lfaIIZ3C1NW/DxrZq15vZyhirjv9Qh5VnKxp4MKynITU/f8LvVLxS83Fg2TP
	5IHB+VzFHX+FvE6bdSjVdaYfa3CakBRhl+9CI0HkX7AIa37gmum+22WeutnlbBmf
	PUlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680102219; x=1680109419; bh=K20fsOhg+vLZk
	zgTF7tMB4jS0IqXYodIByC6uEoduaQ=; b=g1Uxe8rdB4qbec0xJ+fatyynl5wUs
	hI05spyEIsmVIZuVf7mTWJifwi7jxOo5M99CwQFSWSTRjoBkhQGXxVLWDdt8uoUI
	7qD+ByCOABSeNw/5KWFGwEAGWKXxTTyLHdKjQu6xKE+Bdcvc3oaklodCcRbmIsMh
	FqWk4vJRVX36d1b+MerwS9B0+D39D8Ande9HpMYcuDpoDmyG6VItWfawmxvdi8E5
	sPgka40+Q0T95d2hukuTp5in1pPM389WSzgub7TCyUNC4O+14yI+dGpDoqXYLRS8
	gHMCvmch8AViRblK/sZyBSiK6MTTP/OJKncn5LUcFubpcSlQvGQkqSweA==
X-ME-Sender: <xms:S1MkZBK2HGGs7qEpRQ7JQKxK1-Y_supwOiO5Sq4JAhDw8aO3Y1crRg>
    <xme:S1MkZNLNW-FCeehuAMp_LEfIT0H17tp1PXLuZPksVC9SAbmwry3IAclClbh6N45Z4
    xGMFxUaNfger-dsyiY>
X-ME-Received: <xmr:S1MkZJum-T-S-a1UFYqO2-fDEbVQ3KpBhxtzPd6ze_n1ecQdaHBcD91QQQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S1MkZCaews5Wr_TMWSm1_01sHGtx_lRvkHnNQXxsFbFdEH-TJDtZMg>
    <xmx:S1MkZIY-P97PO3zqJtVt6z9gdUIOJ2dh8D04CFF0KKvh6Rh6zWbQNQ>
    <xmx:S1MkZGCfiMuYHOmACOAkXzUPgoPZnpZkph1ygdRvrcM3Kqb1wX4BPw>
    <xmx:S1MkZIM_scTgLi4bwdm01gw2xSenepub0hhSTSKwt42Te685av8duA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 11:03:38 -0400 (EDT)
Date: Wed, 29 Mar 2023 17:03:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [PATCH v7 02/12] drm: bridge: panel: Implement
 drmm_of_dsi_get_bridge helper
Message-ID: <20230329150337.ua6qz7rvupk6vizl@penduick>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-3-jagan@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ljsqm2m3jhzjakbp"
Content-Disposition: inline
In-Reply-To: <20230329131615.1328366-3-jagan@amarulasolutions.com>


--ljsqm2m3jhzjakbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 06:46:08PM +0530, Jagan Teki wrote:
> Implement a DRM-managed action helper that returns the next DSI bridge
> in the chain.
>=20
> Unlike general bridge return helper drmm_of_get_bridge, this helper
> uses the dsi specific panel_or_bridge helper to find the next DSI
> device in the pipeline.
>=20
> Helper lookup a given downstream DSI device that has been added via
> child or OF-graph port or ports node.
>=20
> Upstream DSI looks for downstream devices using drm pointer, port and
> endpoint number. Downstream devices added via child node don't affect
> the port and endpoint number arguments.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

If you intend to use it with the sun4i driver, then don't. The sun4i
driver is barely using drm-managed resources, so chances are all its
resources will be freed by the time this action will run.

Maxime

--ljsqm2m3jhzjakbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRTSQAKCRDj7w1vZxhR
xWkLAQDKdxnGogs9xO7ZMu/Rv+wkevLJj7FxIC5ShbdCE04h8gEAx1vP1JqLCeBi
rKCBc8nwgsdozelmB6QXQSsY/3wbNwQ=
=SDoE
-----END PGP SIGNATURE-----

--ljsqm2m3jhzjakbp--
