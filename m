Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D07468
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Mar 2023 20:21:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9ACEA5C0055;
	Mon, 27 Mar 2023 16:21:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 Mar 2023 16:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1679948489; x=1680034889; bh=8Vjdev5ADZiIQjX+11brijMcCAIrAR/4Z6M
	sEqOQPlQ=; b=VOk7TX1SfOOMP4TLMo7EnqPSuWhVlcaALyUyUjYryMgvezfrHOU
	ouESupwdeu7EtYjmfqKtVHnUgFsevDA29Mm6WCehm777mawg6IInLkIpDr4ol8PW
	5FcyHQUFu5FulxZL3R/9ZoSEUR3Z8ar8IHKTbQH1vdDlP14uXX9KVRBo7u/f+Nl0
	a6KlCi/Der3Nr0AIChlO9HnGdo0ljTptnU/JX6InNWZLTDmkafK56BGOHWK9MWT1
	/xX/I3EfwAxM+AQ8ZJ3EAwoiZQTrrLjz7TBcqDBtZM7r9cLCiwKOcgrFF9P0jqcm
	Uee4z1a3QtBtQ+GVZcfE3WYzDAEfHLvxyEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679948489; x=1680034889; bh=8Vjdev5ADZiIQjX+11brijMcCAIrAR/4Z6M
	sEqOQPlQ=; b=lIU1ZjB8L1fZGkqqzrco95xtB/BySO1OGloC3neoUTevm6bBOuX
	6dN4aLRqLBbjeXV3QQ+92sO0cdLYsd9kHaq2kzvDZgee/WbBuyuwxHfH/wPQZrc3
	SeN9J5IHGmEFkAQUrEY8gN975/Yh/kSSk534otd72p+QCj3RxRM7F+PAOGO2rpfh
	cghyG+yDhQlPPLfu3iDk5b5hMGtlGcydl88SmK4x1KLwHcK5HHG9ZwOZ3bviyTp0
	MOYLIONsWt/IsD/55/L2DZ6lkO9nSpxKlaMPaV3iMbCbTWgRB7PgxS1udgmdtmIa
	iZqFA8ygLm/RkaDFV9hRG18XgEp0pE2iX1A==
X-ME-Sender: <xms:yfohZIK1ABIg339I3uxXBfS5jtfiaYKOgRihL9x1l4tt6d93EKbTMg>
    <xme:yfohZIIwLqUpYrYwX04IbJ6C_7oSg_NCemJyo59lLwOZmJbh2nmQPGJasZPnChshv
    bkYQ0lSKchKROhRZVo>
X-ME-Received: <xmr:yfohZIvLdz8HcwKbLhOShVBEKY_0AzDXHFEd_1YY7iWN3Kl1w9SLRj2WAbWS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
    teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yfohZFb45xk2RuI-_9HXBGVlf-7ApvAOnASfWzCZNWpWa2c9dAGA1Q>
    <xmx:yfohZPbEbTDI3g_-MLZZCxY1sjoB88KgyRJOkkD8AOCXsYHLHq0RCw>
    <xmx:yfohZBB9YKUW9LU9fMr-ea2jMBpNjzFTEkJZpL8RjFjQYDNkUbyJtQ>
    <xmx:yfohZNOsrJ9fbWDEQ_RHPuP5yc9lSL16RAVRM8fv68byHe_0SonQ7g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 16:21:28 -0400 (EDT)
Date: Mon, 27 Mar 2023 22:21:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <romanberanek@icloud.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Message-ID: <20230327202127.oaqhtzwna2vhbtyp@penduick>
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <20230321145646.w6kr7ddurfxpg5rt@houat>
 <CRCCWA4HQQX4.YATGMBYCEH72@iMac.local>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CRCCWA4HQQX4.YATGMBYCEH72@iMac.local>

On Tue, Mar 21, 2023 at 09:53:11PM +0100, Roman Beranek wrote:
> On Tue Mar 21, 2023 at 5:50 PM CET, Roman Beranek wrote:
>=20
> > > Also, how was it tested/confirmed?
> >
> > By counting Vblank interrupts (GIC 118).
>=20
> Sorry, that was perhaps too abbreviated. To test this change, I set up
> an A64 board running kmscube on DSI-1 and verified that the rate of
> Vblank IRQs tracked with a video mode set on DSI-1, once with a 2-lane
> panel and once with a 4-lane panel.

Ok, as long as you confirmed it with multiple panel and multiple lanes
count, I'm ok with it :)

Maxime
