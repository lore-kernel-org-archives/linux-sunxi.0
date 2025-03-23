Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C0B2045BA
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729797; cv=none; b=Psy+UNrPEkXa2170u5IFt6orGTtHLQiQv8XWbU59TNX7ywjY1fXbKlyc4TeuDr3+hTEvfSK/5XPFTewUP5VNXEvCqFjEDqKaltfnZuRPT3FqnmaVWuBeO4e/i3KmzGWvzrHjzQE/TWvieFDUWOKsDPDRv91GjQ9YRFKjk4RVjWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729797; c=relaxed/simple;
	bh=XRxrKxULtrmOE6iI31OfJyV37lkWL0PaoSq3D6+O2S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9yYwMimGnnR+KnIVn6jPdYORkxzOEcnwtF+VKIw1m5/jA9dsQemAR2cuYpLTC5HvsqeNFGIy7vvl6A5vMWP3WAnrSfItFGrljToSsnoBM5q8WIZWlqgwn6gJX8N3yvoK39v/Uvoxbz2WlWcDhsogSRFSsmonrzfb1ywTeao3xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBD621595;
	Sun, 23 Mar 2025 04:36:41 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22D943F694;
	Sun, 23 Mar 2025 04:36:34 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Stefan Roese <sr@denx.de>
Subject: [PATCH 19/34] watchdog: sunxi: add A523 support
Date: Sun, 23 Mar 2025 11:35:29 +0000
Message-ID: <20250323113544.7933-20-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC moved the watchdog into a separate MMIO frame,
and also shifted the registers a bit: the control, config, and mode
register are located four bytes earlier.

Add the new compatible string, and connect it to the new struct
describing the new register layout.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/watchdog/sunxi_wdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index 8eeac935760..467db5fe9bf 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -153,10 +153,21 @@ static const struct sunxi_wdt_reg sun20i_wdt_reg = {
 	.wdt_key_val		= 0x16aa0000,
 };
 
+static const struct sunxi_wdt_reg sun55i_wdt_reg = {
+	.wdt_ctrl		= 0x0c,
+	.wdt_cfg		= 0x10,
+	.wdt_mode		= 0x14,
+	.wdt_timeout_shift	= 4,
+	.wdt_reset_mask		= 0x03,
+	.wdt_reset_val		= 0x01,
+	.wdt_key_val		= 0x16aa0000,
+};
+
 static const struct udevice_id sunxi_wdt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-wdt", .data = (ulong)&sun4i_wdt_reg },
 	{ .compatible = "allwinner,sun6i-a31-wdt", .data = (ulong)&sun6i_wdt_reg },
 	{ .compatible = "allwinner,sun20i-d1-wdt", .data = (ulong)&sun20i_wdt_reg },
+	{ .compatible = "allwinner,sun55i-a523-wdt", .data = (ulong)&sun55i_wdt_reg },
 	{ /* sentinel */ }
 };
 
-- 
2.46.3

