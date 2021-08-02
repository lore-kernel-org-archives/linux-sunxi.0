Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6873229D6
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 06:25:11 +0000 (UTC)
X-QQ-mid: bizesmtp41t1627885381tjgna1ec
Received: from localhost.localdomain (unknown [113.89.245.207])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 02 Aug 2021 14:23:00 +0800 (CST)
X-QQ-SSF: 01100000002000206000B00A0000000
X-QQ-FEAT: XmdeD7Vz7XKEsenA8qfKJDlKqKH3OcmWavfxlSV4LwfNutVbexd3xxZ3DfGKr
	mkLVAcjVB3Ej69bBWC/TkI9LF6AkY88Bl07MScJP6Z0YBgXxjG7g/iUKKtp70SX/mYdNYsx
	zWSYTTI60ch03XlsFcIq+/lge06X5JNocvmgFeA3J9SmlxiGHUDa4CK3WKvFZqvzhizUGAT
	AMX+NdR6Yu0nKcMCytkB3g4yqf5925emvg7E/gTDy90R7W8+sln957rLMzIHEDgqG/1KzAe
	QLlRCD0MRhim3nUhx75OVleBhJJT2PTI3L1p4iKeRRXZ3mK1NlmQsR2J44J5BGHLkLqoqLo
	f9cRUElgITHg9pOrUo=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [PATCH 13/17] mmc: sunxi: add support for R329 MMC controllers
Date: Mon,  2 Aug 2021 14:22:08 +0800
Message-Id: <20210802062212.73220-14-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210802062212.73220-1-icenowy@sipeed.com>
References: <20210802062212.73220-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1

The two MMC controllers in Allwinner R329 have a mixed feature set
comparing to the previous SoCs' ordinary MMC and eMMC controllers.

Add support for them.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 drivers/mmc/host/sunxi-mmc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 2702736a1c57..0c9f66785286 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1199,6 +1199,15 @@ static const struct sunxi_mmc_cfg sun50i_a100_emmc_cfg = {
 	.needs_new_timings = true,
 };
 
+static const struct sunxi_mmc_cfg sun50i_r329_cfg = {
+	.idma_des_size_bits = 13,
+	.idma_des_shift = 2,
+	.clk_delays = NULL,
+	.can_calibrate = true,
+	.mask_data0 = true,
+	.needs_new_timings = true,
+};
+
 static const struct of_device_id sunxi_mmc_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-mmc", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-mmc", .data = &sun5i_a13_cfg },
@@ -1209,6 +1218,7 @@ static const struct of_device_id sunxi_mmc_of_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-emmc", .data = &sun50i_a64_emmc_cfg },
 	{ .compatible = "allwinner,sun50i-a100-mmc", .data = &sun50i_a100_cfg },
 	{ .compatible = "allwinner,sun50i-a100-emmc", .data = &sun50i_a100_emmc_cfg },
+	{ .compatible = "allwinner,sun50i-r329-mmc", .data = &sun50i_r329_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
-- 
2.30.2

