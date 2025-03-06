Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA8627E1DF
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Mar 2025 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305521; cv=none; b=dW2u5UpWAvV3FLww+zWgx7WA0W8Oo478ZWkbNUz8XZwzSqumHeVsD+2zsSjj7QbLFR9gy00/kTJESY1Ptkb1hZzjvi/pSQmrg6G9XOuIu7/kATZEAOj6XxSazcqHOXeh5UEC7UAqLmWsCxANMk8PhGrfoi9zsqSExIF/SMswuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305521; c=relaxed/simple;
	bh=5RJmBGdQq01xTcYm+s8xV1oDkuVt2q9zI2oB4WIjmcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDEVg7Zkess+DGyLrK7qKFxPp8SDWIL6UihzTvPNOQgHrPUDRe+l3dQxhdshczT93I/uIf4rcoGpWs50jWUZG4ChD5evWBt/xpVn2T+2M5sTIo2vpBTiOmmZqERWuMwu6j20IBFgdYdDwsU01GogA1sWCmueDr0CWuqB49IVf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C57A9169E;
	Thu,  6 Mar 2025 15:58:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57F933F673;
	Thu,  6 Mar 2025 15:58:38 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] pinctrl: sunxi: increase number of GPIO bank regulators
Date: Thu,  6 Mar 2025 23:58:21 +0000
Message-ID: <20250306235827.4895-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By design, the Allwinner pinctrl IP always supported up to 11 GPIO banks,
though no SoC ever used more than 9 banks so far.
The Allwinner A523 has pins in all 11 banks, which exceeds the number of
per-bank regulators that we currently support, as this was set to 9.

Increase the size of the array to hold up to 11 regulator structs, to
support pins in bank J and K as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8e2eca45b57f8..fbbf070a87542 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -155,7 +155,7 @@ struct sunxi_pinctrl {
 	struct gpio_chip		*chip;
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
-	struct sunxi_pinctrl_regulator	regulators[9];
+	struct sunxi_pinctrl_regulator	regulators[11];
 	struct irq_domain		*domain;
 	struct sunxi_pinctrl_function	*functions;
 	unsigned			nfunctions;
-- 
2.46.3

