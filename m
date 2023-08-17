Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7A8F73
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 08:44:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D9722CA141
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 08:38:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 361EE1C0009;
	Thu, 17 Aug 2023 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFrTZexqLjQTWDNUsvnncrD9kb8WfaN/zu8FiMtEY4A=;
	b=lCDxw3lXC0rdW6d/sfAkKUVKB76hkI6rZgcTaNM6U7Qx6Izl1d2tvqTk7UV0Z/DOruFrMq
	e1mI0T6e/MO5/fuk6FvcsuoE4e1pdfLL3zH3dSYMf5+noGzZb2FQ5wFH3B4I66yfAGGgEd
	hVlneit7lZSNTujY0iVpbt91htI1D52CZAy5G2jOmtbs68gtApOnwZ65SN05jjoUOOYa0/
	fe0eJ7FjgBTvGTT9fL+OAMondBlTiidxhLbU+qHh7tQ/iqCMKYKGeRCRxV/hfmH5kIJD12
	HbQVMNi/JV61f4tUoUKKg03ZRWhrZ5xcDw+AYzgocORVBX/3CWpctKyyed8BpQ==
Date: Thu, 17 Aug 2023 10:37:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <michal.simek@amd.com>,
 <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
 <frank.li@vivo.com>, <robh@kernel.org>,
 <martin.blumenstingl@googlemail.com>, <philmd@linaro.org>,
 <geert+renesas@glider.be>, <u.kleine-koenig@pengutronix.de>,
 <rogerq@kernel.org>, <paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
 <yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
 <christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
 <jinpu.wang@ionos.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 11/11] mtd: spi-nor: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230817103759.3b8934a7@xps-13>
In-Reply-To: <20230817024509.3951629-12-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230817024509.3951629-12-lizetao1@huawei.com>
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

lizetao1@huawei.com wrote on Thu, 17 Aug 2023 10:45:09 +0800:

> After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
> prepared and enabled clocks"), it can replace the pair of functions,
> devm_clk_get() and clk_prepare_enable() with a single helper function
> devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
> (or enabled) during the whole lifetime of the driver, it is unnecessary to
> unprepare and disable clock explicitly when remove driver or in the error
> handling path.
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

With the commit log corrected as suggested in another answer,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
