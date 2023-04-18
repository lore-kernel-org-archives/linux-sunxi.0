Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43D185A
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Apr 2023 07:40:58 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id CE320FF80B;
	Tue, 18 Apr 2023 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1681803657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S23886ftCV2z3JzYA86agYfVu4I9nMhyGAcsGtlcMm8=;
	b=KqlPh3QYAhMULC+tUHT6fKDlldWSan9BP+wzcUnwqTptWA3xHs6WPMAX8ATFDDqGmGKAqG
	deAgqYnh+zZ6BPJFdCu+Ri+cWVow+Wgk+pi+EjxjqDVWpyZZwC90K+XowyaY7KKosN6z5R
	pF4GmBeuGH1MJti+gQztzLPvC8+4biLctajpgfmlFSL6P9aeyid8tm5m2p3+JNc3GS/88b
	GqHb/norXazE7TzuxCmYLxW4kYGCnBGEOQDO/g2a1vNuEeIPi5GvJebNVB8x3+IHQ2DdXs
	OtR+AXkfY67hQkxcT1yYgcDxW4s0sR53Pxp0F1q00skCWFBhbAVGnn34RaiuTg==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Roman Beranek <me@crly.cz>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Icenowy Zheng <icenowy@aosp.io>,
	Ondrej Jirman <megi@xff.cz>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] arm64: dts: allwinner: a64: assign PLL_MIPI to CLK_TCON0
Date: Tue, 18 Apr 2023 09:40:05 +0200
Message-Id: <20230418074008.69752-5-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230418074008.69752-1-me@crly.cz>
References: <20230418074008.69752-1-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign pll-mipi parent to tcon0's source clock via 'assigned-clocks'.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 62f45f71ec65..e6a194db420d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -411,6 +411,8 @@ tcon0: lcd-controller@1c0c000 {
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
+			assigned-clocks = <&ccu CLK_TCON0>;
+			assigned-clock-parents = <&ccu CLK_PLL_MIPI>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.34.1


