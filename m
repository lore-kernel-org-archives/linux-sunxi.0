Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AD3481
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 06:24:42 +0000 (UTC)
X-QQ-mid: bizesmtp41t1627885378thkqeux2
Received: from localhost.localdomain (unknown [113.89.245.207])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 02 Aug 2021 14:22:57 +0800 (CST)
X-QQ-SSF: 01100000002000206000B00A0000000
X-QQ-FEAT: zuISFTXeVwLI7T7y7eeg4g78iC351nEVHKQd2b+SncmfD3a+XPdRldWBHL5MP
	U+jKj8T2vm+sT1R4NldxCktYHKAPu5c/UfCarfief8tPYl50Xoqzs4DSt5s9XXdwmmVL51Q
	b+VorZom+X2Q86oOr27dY8kNUaK6+/0ksH1sCse47cdnapwVWmzK9PpJ38dQbsdaVd0LIZH
	lX7J+3pJJAoKPXjyTbyBzy6sSf3JafkX/MJdLOvzY4+JvCDG7AWrICMCD4BYty3qHcVLYlL
	1uMggGxxMV963YowffSGLScmf1pRDxMvCn0t8dbs9JCR4PUXG4Wd2+l6O8r3KYRlLM8711+
	DOI7BmrqhOw0dTh7ok=
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
Subject: [PATCH 12/17] dt-bindings: mmc: sunxi-mmc: add R329 MMC compatible string
Date: Mon,  2 Aug 2021 14:22:07 +0800
Message-Id: <20210802062212.73220-13-icenowy@sipeed.com>
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
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam2

R329 SoC has two MMC controllers similar to ones in the previous
Allwinner SoCs. However, as R329 has no eMMC controller, the two MMC
controllers look like a mixture of previous SoCs' ordinary MMC
controller and eMMC controller.

Add a compatible string for R329 MMC controllers.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 4f62ad6ce50c..3e8c3c747a9b 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -28,6 +28,7 @@ properties:
       - const: allwinner,sun50i-a64-mmc
       - const: allwinner,sun50i-a100-emmc
       - const: allwinner,sun50i-a100-mmc
+      - const: allwinner,sun50i-r329-mmc
       - items:
           - const: allwinner,sun8i-a83t-mmc
           - const: allwinner,sun7i-a20-mmc
-- 
2.30.2

