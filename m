Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812215AE3
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 08:21:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id F045EC5BE3
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 08:11:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F8D1E0003;
	Fri, 18 Aug 2023 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20wNMj8fVoVyKhboSQHfoKHw647G9BheWqVVEyUS5uM=;
	b=E1kP1jnX29Q4qu4glrInautWz/RFHmzs5BNl+IerHY5vYL3V689QYZSLwGU3EW/Kj8mcTa
	MY+D3fgMG+MK5C1j4+xNmHyEgANAJi1Na5Syh9v4yUsJj71FyBGTcgDjSlynxglSMkgrhk
	QSq+PLzMOiHWIs8s4nI6ofe1I5XX0eZuv7nGJVhRniU+3RhgWwxSQESkuqPh9S8jkwHKMU
	fEZlgnpP5gP+gWcqvXHpywClkvqh8XMuNDsemLABP9mFuz+FOwuh/QuU/Fz2e8It0nhUF3
	/vwUryhfRLuFEHBth5h38xGCZ5eIWq8Uu70+nwW0kLYDz2hiF0Ttkun/IsrPDg==
Date: Fri, 18 Aug 2023 10:11:10 +0200
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
Subject: Re: [PATCH -next v2 03/12] mtd: rawnand: fsmc: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230818101110.23fad57d@xps-13>
In-Reply-To: <20230818074642.308166-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-4-lizetao1@huawei.com>
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

lizetao1@huawei.com wrote on Fri, 18 Aug 2023 15:46:33 +0800:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enable (and possibly
> prepare) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clock explicitly. The
> label "disable_clk" no longer makes sense, rename it to "disable_fsmc".

Yep, please keep this last sentence here, it is useful.

> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---

Thanks,
Miqu=C3=A8l
