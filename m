Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1EB25B693
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925484; cv=none; b=Waqz4aHatGVzqZ0j6+Zba1yERQ0pFS5nPZVQYTGk1r/+RBVveK5dywZrPvTu08Fo3bqqSAh+yG3HCKe21RY474/so0nV1YA8ouzxRMH5TnT7KOO+DkLuZjbr8ZjnVcpuR2AeU9fTcKu6tZibTfbS1zin1kU9Vtvr9jxfEmtzkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925484; c=relaxed/simple;
	bh=68iU4rFxQXzhPtCcQD9kNnXutQRyeZXsCzXowxuXzSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZGMU45XOBSeyhxZb/NH/fphLvXJwEoGV/xj4kocYWyeW5fm8esqIgieeRMR6Zd2m4qGjz/MxtqIAGp1nh/YFsXz+JGvbGb5JC8jFhWzRCpLqZiWCAETKLJHhx1C0n0JlbVA82OjEyafWMo0ZVKMMosoFqg4U7W+mCmkyPF/2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 506AD1F0004B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:11:20 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B80DAAC7F84; Thu, 26 Jun 2025 08:11:19 +0000 (UTC)
X-Spam-Level: **
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 0002BAC7F79;
	Thu, 26 Jun 2025 08:09:39 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Date: Thu, 26 Jun 2025 10:09:19 +0200
Message-ID: <20250626080923.632789-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 only has a single emac instance, which is
referred to as "emac" everywhere. Fix the pin names to drop the
trailing "0" that has no reason to be.

Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
index b97de80ae2f3..95b764ee1c0d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
@@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
 		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
 		  SUNXI_FUNCTION(0x4, "ledc"),
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
 		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
 		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
 		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
 		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
 		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
 		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
-		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.49.0

