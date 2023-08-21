Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427711848
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 07:54:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7635840005;
	Mon, 21 Aug 2023 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+g2kGOBzDKIkQEMz+5a35V4YETSzQ5TABcO8d37tkY=;
	b=e6TJ8JFxedqGlPsXUusWjKkr3z72B+pv1khOZOKYpRv1ROEOVD3qqAc+rJt/vHqikAAa4U
	TkcBiBN5tg9aQtzGapIkSvUjOA2s0Q5rdj/vUIOKVnzm+k7RPK0UNDjtDxV14NhbW1triP
	a7l0o6bGyOGT65J9F9/kJz/rZbJbAkSTrO1XUeXm/ioQ9fbbiwfnR24fmqEJxdK4kxHW+X
	wqMbFeEViqDukrDtclTwjLKrRFwQKMG5jNMrERk6wHkaIY66YDu8fZ/j6Wkj60uIgo9ShA
	cy7K3K5aaXJEpZc+7VtCmaQrXjGCu56nkVVZJ+7DpFww7QmRAO9rBx6Za4L6SA==
Date: Mon, 21 Aug 2023 09:54:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
 <richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
 <wens@csie.org>, <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230821095417.121990be@xps-13>
In-Reply-To: <20230821093825.22280e33@xps-13>
References: <20230818101004.4f2cd343@xps-13>
	<20230821031737.1973183-1-lizetao1@huawei.com>
	<20230821031737.1973183-12-lizetao1@huawei.com>
	<20230821093825.22280e33@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi again,

miquel.raynal@bootlin.com wrote on Mon, 21 Aug 2023 09:38:25 +0200:

> Hi Tudor,
>=20
> lizetao1@huawei.com wrote on Mon, 21 Aug 2023 11:17:36 +0800:
>=20
> > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepa=
red
> > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> > replaced by devm_clk_get_enabled() when driver enables (and possibly
> > prepares) the clocks for the whole lifetime of the device. Moreover, it=
 is
> > no longer necessary to unprepare and disable the clocks explicitly, so =
drop
> > the label "dis_clks" and "dis_clk_reg". =20
>=20
> This patch seems very simple, do you mind if I apply it directly into
> mtd/next for the next PR?

I see you already took that one, perfect ;-) Sorry for the noise.

Thanks,
Miqu=C3=A8l
