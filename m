Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E721C31
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Mar 2023 08:47:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id 04CF52B0040A;
	Thu, 30 Mar 2023 04:47:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 30 Mar 2023 04:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680166028; x=1680173228; bh=a+Yl4odf/Ot+biMN+Oi3kAyv0TNIqouyp5L
	beLQZr2E=; b=eBNrcwuvrgSp6+31rIiAsOUqG6uMQ6QFUsakEPSuzePgk29YCc9
	21MTLTzN/CS0cDbj3MgHTvLlawIIABhYB8tVeUZEdCU8RP3ThpWear5ZNazut7is
	4EugKtcsijnzVHcF55TsVXS6TzzZY6irtPiRkPTWrn1r4CNa/05h86omoJNJtNXi
	lbHMqIU1TKVINClq2tEFyQFx7ljJNTIKaLpi+9f46H7Oz/Bv+XiK+UQmwWuciXUX
	Cq2bSBsUWwoNuOkvF05OHpxgYiGPykeRSkgrtDPU+Q/CgPi3PkKK7elxOxeTopVa
	2nvMkUmUjwfFU6aZJgdR2PLMxDB0HPklJGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680166028; x=1680173228; bh=a+Yl4odf/Ot+biMN+Oi3kAyv0TNIqouyp5L
	beLQZr2E=; b=KkP5NinBZ4i5Z6uDBmt2PRMh0y9QwGRsc8RKAe+yyjm14UEENU2
	x4I8MnhE5eD9QkL9kXH8kYjxy8DyHublTEpcbm8q4phweNClOmzuhXeNu76/LYfR
	dJ7HXAXUTn8FFPMXf97wpWYdynZ5cbq/nG5wnnx5GZs2zEYcpJ08+mzSefkH00yL
	uwBmNG4iHfDCEWSkMP/yUEjl/uxT3Q8Bo16PEdLMO3UsfhQu73q2Yj57/3f5gyXm
	m/l09tx5q0EcIvvrHoLn13GgJorLeqUc6g1cfeJ+78dRyh/a6STxiyHVh8t2uenY
	4MUgufUmIOHkwTsAOdfPbGqr6C3eBO+StFQ==
X-ME-Sender: <xms:i0wlZEaCuddUGW3jdsi1wq7rmrszioz9WVwxAcnOIa6OML_F-SrrJA>
    <xme:i0wlZPZ3hZnrNNMycM1rbJQwJfIadvqKckk_Tk1wMYR5b_nmtttrcPBHk5aHYitNF
    OQten1IKIWL3iZZTCg>
X-ME-Received: <xmr:i0wlZO9vwyktcZDHfmGyVtQII-wK1UCSTqeteVjM82YF3q2FAMBJ8QHicGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehkedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepffdttdeufefgffegtdejffevuddvudfhudegjeegkeetuefgfefhheek
    udfhvdfhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i0wlZOrO_hXCHB3ELpkaKAIkTZqrj-3baqEvgaXmy7j_ZC8oYvW2KQ>
    <xmx:i0wlZPoZYDPlHfH2bjN05cmvHZSmOtHeTHduCz8BG3H_4ixPVvZV6Q>
    <xmx:i0wlZMRHoHZzk5RsIQlsS-a9MP614RbJWYSq1EdvF4BmRnsGWqCGag>
    <xmx:jEwlZGcRbtHfHw87r7_jkOL4MI8KkEmBkky7_2yEOHqiulDfD187H2SZVRo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Mar 2023 04:47:07 -0400 (EDT)
Date: Thu, 30 Mar 2023 10:47:06 +0200
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
Subject: Re: [PATCH v7 12/12] drm: sun4: dsi: Convert to bridge driver
Message-ID: <20230330084706.lw5r6ll2r6lk5d2z@penduick>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com>
 <20230329145939.7zcex4x2pipivuj4@penduick>
 <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com>
 <20230329160652.7gel5qvckzwihjx4@penduick>
 <CAMty3ZB=R0RfU+o7LZWpS=4-ny00ocCxBu-M6yicY4q0-eYL9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZB=R0RfU+o7LZWpS=4-ny00ocCxBu-M6yicY4q0-eYL9A@mail.gmail.com>

On Thu, Mar 30, 2023 at 12:15:49PM +0530, Jagan Teki wrote:
> On Wed, Mar 29, 2023 at 9:36=E2=80=AFPM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> >
> > On Wed, Mar 29, 2023 at 09:08:17PM +0530, Jagan Teki wrote:
> > > On Wed, Mar 29, 2023 at 8:29=E2=80=AFPM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > The patch prefix should be drm/sun4i:
> > >
> > > I did follow my previous prefix, I will update this.
> > >
> > > >
> > > > On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> > > > > Convert the encoder to bridge driver in order to standardize on a
> > > > > single API by supporting all varients of downstream bridge device=
s.
> > > >
> > > > Which variant, and why do we need to convert to a bridge to support=
 all of them?
> > >
> > > Downstream bridge variants like DSI panel, DSI bridge and
> > > I2C-Configured DSI bridges. Bridge conversion would be required for
> > > the DSI host to access the more variety and complex downstream bridges
> > > in a standardized bridge chain way which is indeed complex for encoder
> > > driven DSI hosts.
> > >
> > > >
> > > > > The drm_encoder can't be removed as it's exposed to userspace, so=
 it
> > > > > then becomes a dumb encoder, without any operation implemented.
> > > > >
> > > > > Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
> > > > >
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > >
> > > > [...]
> > > >
> > > > > +static const struct component_ops sun6i_dsi_ops;
> > > > > +
> > > > >  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > > > >                           struct mipi_dsi_device *device)
> > > > >  {
> > > > >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > > > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.o=
f_node);
> > > >
> > > > That one looks unrelated. Why do you need that change?
> > >
> > > This was replaced with drmm_of_dsi_get_bridge for lookup of both panel
> > > and bridge. I think I will separate this into another patch.
> >
> > So, it looks to me that you're doing two (unrelated) things in that pat=
ch:
>=20
> Correct.
>=20
> >
> >   - You modify the existing driver to be a bridge
>=20
> Yes, Convert to bridge driver - register drm_bridge_add and replace
> encoder ops with bridge ops.
>=20
> >
> >   - And you support downstream device being bridges.
>=20
> Yes, Support the downstream bridge. (If I'm correct we can still use
> encoder ops with this).
>=20
> If we see the hierarchy of support it would
> 1. support the downstream bridge.
> 2. convert to the bridge driver.
>=20
> >
> > Both are orthogonal, can (and should!) be done separately, and I'm
> > pretty sure you don't actually need to do the former at all.
>=20
> Do you mean converting to bridge driver is not needed?

Yes, and given the current state of the DCS-in-HS discussion, I even
think it's does more harm than good.

Maxime
