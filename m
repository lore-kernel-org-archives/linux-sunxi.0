Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22248D892
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400176; cv=none; b=HeBSJ6DiRDS69NeZ0g9y5xpCtIl6XlAczbn0HPrrWDtplIPHffugXjIO5lA0TAL1PIOsCqY9R/iu24HnAKRzV1T8/iNIy+eAa6M44n0vJCteGW4Z6NFT37BbNCstYUKPh8pz5FGEymZlLxgkAjbm3aNrpoCPgwhh5muPHM0R/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400176; c=relaxed/simple;
	bh=LL8QY/9fCkNOJSEC8iJ9zLBPd83MFEPaR5ruU/87nRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz8M8YkXrqp92ocG+04Gp2mS6FARwRK7JVzZLDzmWO0gOkuu/DT5iG0MgqSOY6SEA3baS0yutieONSrqRB30LLBIt2hwSqUEzm6LIDYlJ3kkoC7Ip8blPT91rhX+HXpPJ598JmYEtKls56/NKs2kNnUoArgX1SxPiXhfE2v+GX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: mkl@pengutronix.de
X-PTX-Original-Recipient: jre@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: o.schinagl@ultimaker.com
X-PTX-Original-Recipient: wens@kernel.org
X-PTX-Original-Recipient: broonie@kernel.org
X-PTX-Original-Recipient: mripard@kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-spi@vger.kernel.org
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: jernej.skrabec@gmail.com
X-PTX-Original-Recipient: mr.nuke.me@gmail.com
X-PTX-Original-Recipient: samuel@sholland.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6979C202898;
	Mon, 14 Sep 2026 17:36:08 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x68j2-000vXD-16;
	Mon, 14 Sep 2026 17:36:08 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 14 Sep 2026 17:36:00 +0200
Subject: [PATCH v3 6/6] spi: spi-sun4i: sun4i_spi_transfer_one(): report
 effectively used speed_hz of transfer
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-spi-sun4i-fixes-v3-6-9fe919d5cecf@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
In-Reply-To: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=MrrqtD52OenwRKyrrH1p/AW60SPcbwdUEu6x2Et8yiE=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshaIZK+Lerw7Qb/R8qfd7LZHfqpxnKnYNpJLRaNWP8S+
 7n9SQ3bO0pZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABN5a8HwP2rT2+nWUtNncDc0
 30tbKxLNbJhpt+R4bvbrExVLhWbPf8jI8G1SaC97ZbbXza/2hZd21jSb/7zhq+3T2nK8LD1JPCi
 TGwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5

From: Marc Kleine-Budde <mkl@pengutronix.de>

Report the effectively used speed_hz for the transfer by setting
tfr->effective_speed_hz.

For more information see commit 5d7e2b5ed585 ("spi: core: allow
reporting the effectivly used speed_hz for a transfer"), which adds this
feature to the SPI core.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-sun4i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 94e1c7bbd632..59941b38b757 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -310,9 +310,11 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 	div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
 	if (div_cdr2 <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
 		reg = SUN4I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN4I_CLK_CTL_DRS;
+		tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
 	} else {
 		div = min(SUN4I_CLK_CTL_CDR1_MASK + 1, order_base_2(div_cdr1));
 		reg = SUN4I_CLK_CTL_CDR1(div - 1);
+		tfr->effective_speed_hz = mclk_rate / (1 << div);
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CLK_CTL_REG, reg);

-- 
2.55.0.806.gb8242b093d

