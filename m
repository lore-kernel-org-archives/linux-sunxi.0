Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46800168BC
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 08:12:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2973FF803;
	Fri, 18 Aug 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzCVM+bK0VlZhouGuHfDfVW0KdhBecM197MixCtRvfQ=;
	b=Jmp83XkDTC2MO6piwR/S+JMNYHW0Y17nyiWqjHmyKqLeJqK0dnwSYn4/4EZ8nhuwB95D6l
	DK6mzVDiQeV2or5bZ/qCdESjI+eJ0d5I35Y4K+n1kp7aV0dBDct1+0GnUjTinv72HIAIuJ
	GXIKPdqOkWIdD19loGNKnSoo5AKAzWMX+58BKdjhkYcEZeQI9RFkgdggJNxO8z27J43LKK
	ztYe9QtVJymUiC+HoooqV10fY6+WTU0F2yUV3rd5jWJpzak1WbkF1rSa4beE/zB0TIv1ad
	+StZn7GOnXF/njiTIb/fCXUqwnHVKZyH3c7ML+WKoXdBACeSHBlBedQMaOaVMw==
Date: Fri, 18 Aug 2023 10:12:42 +0200
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
 <nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
 <pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
 <rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
 <vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
 <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2 02/12] mtd: rawnand: arasan: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230818101242.12f54b5d@xps-13>
In-Reply-To: <20230818101004.4f2cd343@xps-13>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-3-lizetao1@huawei.com>
	<20230818101004.4f2cd343@xps-13>
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


miquel.raynal@bootlin.com wrote on Fri, 18 Aug 2023 10:10:04 +0200:

> Hi Li,
>=20
> lizetao1@huawei.com wrote on Fri, 18 Aug 2023 15:46:32 +0800:
>=20
> > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepa=
red
> > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now b=
e =20
>=20
> > replaced by devm_clk_get_enabled() when driver enable (and possibly =20
>=20
> For all the commit logs:		  the driver enables (and possibly prepares)
>=20
> > prepare) the clocks for the whole lifetime of the device. Moreover, it =
is
> > no longer necessary to unprepare and disable the clock explicitly, so d=
rop =20
>=20
> For all the commit logs:		       the clocks
>=20
> The ",so drop the label xxx" is not needed I believe.
>=20
> > the label "disable_bus_clk" and "disable_controller_clk".

Actually it does not bother, just keep it.

> > Signed-off-by: Li Zetao <lizetao1@huawei.com>
> > --- =20
>=20
> Thanks,
> Miqu=C3=A8l


Thanks,
Miqu=C3=A8l
