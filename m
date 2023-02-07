Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006520E8
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Feb 2023 09:06:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 943A25C00EC;
	Tue,  7 Feb 2023 04:06:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 07 Feb 2023 04:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1675760812; x=
	1675847212; bh=pHgQUOaYyQmtUXSqG6ibGpvZ1Y53BCyC9+II4RDDp5M=; b=O
	U7P47cfgrl2zdVBqhyimE+S0ooV/81G+t+Y1OwdFmLsTqllcyWoWanAkzK4z4117
	Ghjmw5sqLR5rhWsDac0758ImGxhkx7kNuW6T70faVH645GShHffp57tNWNkpaSm9
	pXSHXDK2AxmR+Fh5cFH0zgRarNYAD+kfw4kC+n8RvuDqBDKu7aY6j0mauU9/wuUm
	rjGWCE/vy/S0OBfl0oJEgxLWkgwgS8WcyNO33axfiwH5TpGkAqm3iIl1g1aYHqBc
	C8NzaRBg6euYODk9DSMUGbBgRaD9dJ9+GrBzHTbpCKqD7opqn/BbUlThBeC3le+1
	+ZjucG+di6Ann0s4NK1IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675760812; x=
	1675847212; bh=pHgQUOaYyQmtUXSqG6ibGpvZ1Y53BCyC9+II4RDDp5M=; b=j
	PncpDrUbMVfBvaLwk76jE8r4MrhjHA5thRYzuCVWN24sJ4xc1JtkOjJg1jWfHDKp
	jb6/neoM/TH5rXZ6V6Q3ker1AIcNC3V/RITGDIgINTQOe5rlNBCEvgMBwOngUbmd
	dlYlEop46EN8BMU03wNekR2lL+/LLUBQSaVR7dozUJdXQELUnSH1p6PisuFtXTXe
	z8yW3CwJXgMKwgydFYqoOlZNIdTCfIh312kLNvuTkwLT0QMJWkZAJdOXor6vcw2w
	yXaqCjpzxrt7mxiOMofeGzdPQFaGPQ8QZbVq0M+BJ0dC1V5NemYYK5EtSidgd3ty
	TWe4thMe1i8piVWFagoOA==
X-ME-Sender: <xms:qxTiY554AwEBiLmj8iKQcAwHesc1W5-IyXwi7a37foVCvJjO0TxSsQ>
    <xme:qxTiY25rdgp9Y5lTW2sfB3E0KgJdTTKywAxXi03xfXXaxAdpgHB19A9MZV-zkmK4J
    KvkBUSEHu9S83BfsRw>
X-ME-Received: <xmr:qxTiYwfquD1gEZJaDZQSYyZC__nI3E0Iwe546TDQRhzxKtvJuZXhJsTmG0fUfzGJcQu7HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegjedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeeggeduteffkeejlefhhfeggfevieeljeekkedvhfelffdtiefgkedu
    ledugeetgeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
    gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qxTiYyJbVX-amr0tK1Bp5DXX_q13W9m07LHMXIZY2LtTTRxVIOMgxw>
    <xmx:qxTiY9Id1KIMif8PtnAP6kLKhph0h7lTKLmmZmO6EnYyrJuap9GmmQ>
    <xmx:qxTiY7z6mQHASvgjRS0nMccO2mDAMNLihZpeRvvprmBi0K2c5hR4kg>
    <xmx:rBTiY3BEnP_13D2C17npg_m46IDBR6gBQNPSfnskpfqiwPuYNHEHVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 04:06:51 -0500 (EST)
Date: Tue, 7 Feb 2023 10:06:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Oleg Verych <olecom@gmail.com>
Cc: "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	Priit Laes <plaes@plaes.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: sun4i CCU CCF vs CSI0 question (Re: [PATCH] doc sunxi: update
 CCU wiki page link in clocks.rst)
Message-ID: <20230207090648.ncmptkr7g36j5fkt@houat>
References: <CAHdV42VzJNQUUD5NtkSnGcivXAmrHH-cQGXiA-A5g-fQFNbzuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHdV42VzJNQUUD5NtkSnGcivXAmrHH-cQGXiA-A5g-fQFNbzuw@mail.gmail.com>

On Sun, Feb 05, 2023 at 09:50:22PM +0200, Oleg Verych wrote:
> Hello!
>=20
> On 1/17/23, Oleg Verych <olecom@gmail.com> wrote:
> > Update wiki page link to the Allwinner sunXi SoC Clock Control Module.
> >
> > Signed-off-by: Oleg Verych <olecom@gmail.com>
> > ---
> > Hi!
> >
> > Can I ask additional question to those in the file?
>=20
> Q:
> > How is it possible to setup PLL7 to particular frequency and select
> > it as a source to CSI0 via CCM_CSI0_CLK[1]?
>=20
> A:
> by setting clock source and frequency via CCF[2] in a camera device as:
>=20
> ```
> 	ov5640: camera@3c {
> 		compatible =3D "ovti,ov5640";
> 		reg =3D <0x3c>;
> 		pinctrl-names =3D "default";
> 		pinctrl-0 =3D <&csi0_clk_pin>;
> 		clocks =3D <&ccu CLK_CSI0>;
> 		clock-names =3D "xclk";
>=20
> 		assigned-clocks =3D <&ccu CLK_CSI0>, <&ccu 17>; /* 17 =3D CLK_PLL_VIDEO=
1 * /

You don't need the second clock.

> 		assigned-clock-rates =3D <32000000>;
> 		assigned-clock-parents =3D <&ccu 17>;
> ...
> 		port {
> 			ov5640_to_csi0: endpoint {
> ...
>=20
> ```
> [2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema=
s/clock/clock.yaml

I'm not sure why you're trying to do that in the first place, but please
note that this isn't a guarantee in any way. It could change at any
point in time after probe has been called.

> Set of other related questions:
>=20
> Q: When trying to setup main CSI0 clock to 32MHz from example above,
> it is not possible to get integer mode value:
>=20
> sun4i_csi_probe mclk: 31578948 Hz
>=20
> Why it is so, while PLL7 can be configured to (3*(9 + 23)) =3D 96 MHz
> which then can be divided by (2 + 1) using CCM_CSI0_CLK [1] /
> CSI0_CLK_REG [A20_User_Manual_v1.4_20150510.pdf p.84]?

I think what happens with your DT bits is that CLK_CSI0 and PLL_VIDEO1
will be set to 32MHz, in that order.

> Q: Initial value for CSI0 ISP clock is not as hardcoded in
> `sun4i_csi_runtime_resume()`. Is it correct to hardcode the value for
> resume? E.g.[3]:
> ```
> 	clk_prepare_enable(csi->ram_clk);
> >>	clk_set_rate(csi->isp_clk, 80000000);
> 	clk_prepare_enable(csi->isp_clk);
> ```
> [3] https://elixir.bootlin.com/linux/v6.1/source/drivers/media/platform/s=
unxi/sun4i-csi/sun4i_csi.c#L303

I guess? What's wrong with it?

> Q: Is there a good guide / how-to somewhere on how to suspend/resume
> A20-processor based devices, e.g. for `sun4i_csi_runtime_resume()`
> testing?

runtime PM is not related to suspend/resume. It will start and stop the
device whenever it's actually used instead of keeping it on all the
time.

If you start a capture and it works, then you've tested runtime PM

Maxime
