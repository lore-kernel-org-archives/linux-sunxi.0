Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F152FB2
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:08 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935426tuc2k51z
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:25 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: xmzaef4TE3cLpG3oWdsSiqEzduIlfG3YNYDhrXCdaXRZl6C+1A9Sj83Y5pRSC
	h+x2rd+IfzQwDtmVXKR7YMQTal9EQR5k+8FCLc7TAnvjulzWqv219Q6IV9meDFFAZqDoIF8
	Hj2XJ3bwHC5hWRKzzNdpsfsoEPOl5QRCAsg3/sbEiaf7MVYTSlpyA0cfU815BLoJMOzVepK
	X1fWWl6SRrLY87wiV6fNKMCRylHHmMDOs4++yWl+zOUIHNFv7Q6dIIFty+tvr/S93e9ofjQ
	qXkBtO7ehFXqfBr+2vfcBJ+eG0CUJGZKtNKzYLmBfgjyynB2ccYK58URZZXDGUdebquWWe0
	95RKq+5YCZpsNljKbWoaPHbFQi3eA==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 02/13] sunxi: only include alias for eMMC when mmc2 used
Date: Thu, 22 Jul 2021 14:30:04 +0800
Message-Id: <20210722063015.421923-3-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1

Some Allwinner SoCs (e.g. R329) doesn't have a MMC2 controller at all,
and on boards that we do not utilize MMC2, the alias for it is just
useless.

Only include the alias when we specify CONFIG_MMC_SUNXI_EXTRA_SLOT to 2.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/dts/sunxi-u-boot.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
index 4a6ed3a7dd..b7244c1112 100644
--- a/arch/arm/dts/sunxi-u-boot.dtsi
+++ b/arch/arm/dts/sunxi-u-boot.dtsi
@@ -13,7 +13,9 @@
 / {
 	aliases {
 		mmc0 = &mmc0;
+#if CONFIG_MMC_SUNXI_EXTRA_SLOT == 2
 		mmc1 = &mmc2;
+#endif
 	};
 
 	binman: binman {
-- 
2.30.2

