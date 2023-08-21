Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCEA1C16
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 07:57:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBD85C0002;
	Mon, 21 Aug 2023 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUv1o9IMNE3avyw4itt9oKedRJf+XuJZ1Of8jI5p344=;
	b=FgVCZzjueGuohcIwUfV3YqZNYJT2uf1bFgJQnpCdGt4r3uV/NbakTu2Gn303Ss01ka5qOV
	0tI7OIaQeSIb8I6QHINr5eOboVwA16o8e2BtpqW7FchqJaXHQ3IJb62DV64FmjxrNtJey6
	bLzQySO7eo7MS4r0y50ciF+hdyX9QJlwrxdkBxGu/YRHKekxSedTTek6TKKvlrkLeO6nX6
	YW3ww1VDSltXcL3P52+tMpr3UdMUo8fkUh9puqQi2TQmOWcuRLEnGK6IdxM8V7zXCbpUp6
	1fNVQDUiGUHodWjOdJYtaAIMFDphPvFA/tAC4LHmXf+VZvqqo61Ps3L8eTCV6w==
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
Subject: Re: [PATCH -next v3 07/12] mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 09:57:48 +0200
Message-Id: <20230821075748.33248-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-8-lizetao1@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2b34e8bd2f582be6342a9baae31a519698392444'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2023-08-21 at 03:17:32 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly, so drop
> the label "clk_disable". And both mtk_nfc_enable_clk() and
> mtk_nfc_disable_clk() now have a single user, which is the resume or
> suspend callback, so drop this two helper function and just move related
> operations in the resume or suspend function.
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
