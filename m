Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE061643D
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 08:18:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D9FDBD4D8C
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 08:10:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4AEDC0006;
	Fri, 18 Aug 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqOgD7ZoLrRwoPQ6qx0lOE1XYmfnede4CdcT9bV4Jsc=;
	b=DnB9JI4Ca7uwgiF0bvp+pcJaDAuqYCJFY4nlqFC5yPHpDNq3HQ4B2BO/O0jiugKRq+M5rS
	pHfQqN4xZ06WVRAIjE+lqx2jNgpH5a49WKKW/n+v2eHeZ+D7JBEoYxf3Y0EDEU4U89nTRV
	4YlnozEQRShzs8M472CrjUtXqqv/ns9UlZQhBoQEgM//jbhn+Hq3YhhfVzFahxMoKObu0w
	47MrHQXFEbxePXUDhEEvTjQvM9WvnWYk2mDmkCY7BiZ1PuPN+3yU9RgZWVp5g8Mnr+sg5S
	rEYfY8cWATOtHZFMNFs0jZUXnimcdlVD0joK56CH+QWcWbbm2jXtgFHq4AHd1Q==
Date: Fri, 18 Aug 2023 10:10:04 +0200
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
Message-ID: <20230818101004.4f2cd343@xps-13>
In-Reply-To: <20230818074642.308166-3-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-3-lizetao1@huawei.com>
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

Hi Li,

lizetao1@huawei.com wrote on Fri, 18 Aug 2023 15:46:32 +0800:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be

> replaced by devm_clk_get_enabled() when driver enable (and possibly

For all the commit logs:		  the driver enables (and possibly prepares)

> prepare) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clock explicitly, so drop

For all the commit logs:		       the clocks

The ",so drop the label xxx" is not needed I believe.

> the label "disable_bus_clk" and "disable_controller_clk".
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---

Thanks,
Miqu=C3=A8l
