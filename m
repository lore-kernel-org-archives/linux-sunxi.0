Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C41C16
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 07:58:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE36FF809;
	Mon, 21 Aug 2023 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uc2Xg/1450PAikBhYpYT3mmBo7X64EeqDOUbq51ENXM=;
	b=gf7CzRkiUuhczHShIhEayXodQaO5V+QuVX0h1BjRt3TTUvAn5h3DMJxrlQ5kKoYFF44p8O
	TMIniBu7I7ZWMliERBGJ+ajrPEUgNa/IJ6+/CoKIU8O+EczLM30wCC4mzJ8R/WEtd/q9a2
	bLye2bn/nVPT1Wn1pmEBNKP1S75AdD58u7MdtTAJ3OMj9slo+Ru7G9hcHrFu42bLi//sxp
	GOIeOjt9Q9uAMTTjbuStK2t4Zpb1AJ4VDSz5Ahvv9GL5M+ULvlSgZVHBPBoS2GBrUoJh2r
	ohLN5kzYNbx3eF78qiRnw/zaf/Z4Jr+2S5BhXo5jedF4LdIhha7apuhT1Z84sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>,
	miquel.raynal@bootlin.com
Cc: alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	christophe.kerello@foss.st.com,
	christophe.leroy@csgroup.eu,
	dmitry.torokhov@gmail.com,
	frank.li@vivo.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jinpu.wang@ionos.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michael@walle.cc,
	michal.simek@amd.com,
	paul@crapouillou.net,
	philmd@linaro.org,
	pratyush@kernel.org,
	richard@nod.at,
	robh@kernel.org,
	rogerq@kernel.org,
	samuel@sholland.org,
	stefan@agner.ch,
	tudor.ambarus@linaro.org,
	u.kleine-koenig@pengutronix.de,
	vigneshr@ti.com,
	vz@mleia.com,
	wens@csie.org,
	yangyingliang@huawei.com
Subject: Re: [PATCH -next v3 03/12] mtd: rawnand: fsmc: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 09:58:13 +0200
Message-Id: <20230821075813.33396-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-4-lizetao1@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ee0152d0b4e624205c24845d3ca57015a941b361'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2023-08-21 at 03:17:28 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly. The
> label "disable_clk" no longer makes sense, rename it to "disable_fsmc".
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
