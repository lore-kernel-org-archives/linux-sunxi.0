Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32C3481
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 06:24:21 +0000 (UTC)
X-QQ-mid: bizesmtp41t1627885361t7r18b0s
Received: from localhost.localdomain (unknown [113.89.245.207])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 02 Aug 2021 14:22:39 +0800 (CST)
X-QQ-SSF: 01100000002000206000B00A0000000
X-QQ-FEAT: 7laTFqblRPgAJ6jR/WR92mkDWhvfBB2kGAde6cXqpA4eyp8AfURMplyUrtDME
	Dpsmawmn8jV9+0U0826Qi/gWSBxr61sYEYe7QvWf5GzUl8eGe1wSzF5VG+zf038g1xbHO73
	iYEtFbYY0+GO119PmXdhgPwcYzN77mOsZOzlW2rFW9b6pTcd+POnMjAde2Px+cgO5ORhLPP
	mzcAGTmeaXgeAZOHFdRWDl0YlW1a/Xt/6dJ5JmHk1MuZN41LMlfhGsgYGqf+SgoWFhKGBL7
	xl8lKmyFJ3UTbPB1ZKKzrOZYnMJoNeHoSJWP97aJq4+rMj0ZQdaBhXjYqimsDSJxt+L24LF
	saoVEYJZrgwdEMMASM=
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
Subject: [PATCH 06/17] dt-bindings: pinctrl: document Allwinner R329 PIO and R-PIO
Date: Mon,  2 Aug 2021 14:22:01 +0800
Message-Id: <20210802062212.73220-7-icenowy@sipeed.com>
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

Allwinner R329 have two pin controllers similar to previous Allwinner
SoCs, PIO and R-PIO.

Add compatible strings for them.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index cce63c3cc463..802fba3fa34d 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -55,6 +55,8 @@ properties:
       - allwinner,sun50i-h6-r-pinctrl
       - allwinner,sun50i-h616-pinctrl
       - allwinner,sun50i-h616-r-pinctrl
+      - allwinner,sun50i-r329-pinctrl
+      - allwinner,sun50i-r329-r-pinctrl
       - allwinner,suniv-f1c100s-pinctrl
       - nextthing,gr8-pinctrl
 
@@ -189,6 +191,7 @@ allOf:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
             - allwinner,sun50i-h6-pinctrl
+            - allwinner,sun50i-r329-pinctrl
 
     then:
       properties:
@@ -204,6 +207,7 @@ allOf:
             - allwinner,sun8i-a83t-pinctrl
             - allwinner,sun50i-a64-pinctrl
             - allwinner,sun50i-h5-pinctrl
+            - allwinner,sun50i-r329-r-pinctrl
             - allwinner,suniv-f1c100s-pinctrl
 
     then:
-- 
2.30.2

