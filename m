Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AEB509F19
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Sep 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795137; cv=none; b=m9xDAUEdM9ZVzujvnvQ1pSVJY9nBcizUnyDJ3Mo5eeiAGGzJy1pgmIn27bK2NOfn8ocAIOzRnmYdo2BkK0C43mONB9z/ztUgaRSiGOpngb+oJ5JXKEfchbn2cyjJzYu3x9NKzjc47bsarOA8vQG7uRhMmzNbry77gr+LVblh1mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795137; c=relaxed/simple;
	bh=drC6FXUT8sD00Zc/eQa38tjuPOCL2PtR/zc6tWq5MmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va1NzIX6EqJmeomM0UNjA0MWaFder3unhupUCPVqCbWp2yh4ociPiFC0W1GH34H90FEEBbTaXGIqyC9cq3bBv3L2DABx7f0qZ5SprPObpUyUF2S4svbkj9gL9BRSdEWKhEzPzjjVDfdAn4n1BYPmHh7FV7EF2GbT8zgSETboMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: samuel@sholland.org
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: o.schinagl@ultimaker.com
X-PTX-Original-Recipient: broonie@linaro.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-spi@vger.kernel.org
X-PTX-Original-Recipient: jernej.skrabec@gmail.com
X-PTX-Original-Recipient: mr.nuke.me@gmail.com
X-PTX-Original-Recipient: mkl@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: jre@pengutronix.de
X-PTX-Original-Recipient: mripard@kernel.org
X-PTX-Original-Recipient: wens@kernel.org
X-PTX-Original-Recipient: broonie@kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 68275202012;
	Mon, 07 Sep 2026 17:32:04 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x3bKG-000Ym1-12;
	Mon, 07 Sep 2026 17:32:04 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 07 Sep 2026 17:31:44 +0200
Subject: [PATCH v2 5/6] spi: spi-sun4i: sun4i_spi_transfer_one(): add error
 handling at clock setup
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-spi-sun4i-fixes-v2-5-7e805662b9bd@pengutronix.de>
References: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
In-Reply-To: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=drC6FXUT8sD00Zc/eQa38tjuPOCL2PtR/zc6tWq5MmI=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsiad+PzyQP37gb1VZ4u0Lyy/E+6WceXXZWtH9bdyPsiN
 cFU5N5Npo5SFgYxLgZZMUWWWDU5BSFj/+tmlXaxMHNYmUCGMHBxCsBEZLQZ/pdv/HCpto53K2e4
 zdn5xkG1udVqbxavORwV/It72e2qzMsM/8wyJ1285Hpd+f4eEU5ZvR1mmgcmuSamNOy/d+x4PPe
 pRj4A
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5

Bail out if clk_get_rate() or clk_set_rate() fail during
sun4i_spi_transfer_one(). This might happen if the clock isn't known yet
or fails to set the requested rate.

This also ensures that mclk_rate is nonzero and can be safely divided by
in a future commit.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-sun4i.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index ea8be0170fbf..94e1c7bbd632 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -279,9 +279,17 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 
 	/* Ensure that we have a parent clock fast enough */
 	mclk_rate = clk_get_rate(sspi->mclk);
+	if (!mclk_rate)
+		return -EINVAL;
+
 	if (mclk_rate < (2 * tfr->speed_hz)) {
-		clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
+		ret = clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
+		if (ret)
+			return ret;
+
 		mclk_rate = clk_get_rate(sspi->mclk);
+		if (!mclk_rate)
+			return -EINVAL;
 	}
 
 	/*

-- 
2.55.0.123.gf60db8d575

