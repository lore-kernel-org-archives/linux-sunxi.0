Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495D23BD
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 09:17:02 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id A761F1BF20F;
	Thu, 27 Apr 2023 09:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1682587021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5d+itg7Hh9nGexE8xtDQBtvYxB28npggmEJJymVnOx0=;
	b=GiRAFr/UTTGAFRwKFq02UQ3SwuendpSDUVIwVn5Lk3RL8sQiji6+GNYB+ncXZGgcINis2i
	+hEu6FMUYS79zqH8yhix+kKfWPGUBo+rpAHBsdYsk57vUkb3k71Y9YsADICRi1UtCcSPFu
	SPRGwpbzcb+YwciZdpbeMznGr9bq22Rwd6b41s5jf1IaHaaRuDQd5QCwbly74kn8+BpsLU
	oAMDEFV2mXmo/l4ceJ9uWfxrqvEzrOHjpBaN2fEydUYrKIFJp5dEDtj1BaLXLnHvkAZdcX
	IP6yphZGlER3ked+FWv/4ND24J7f3rpMmHmKQ0FWg4ZnoZMg388aa3Osbml03A==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Roman Beranek <me@crly.cz>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Icenowy Zheng <icenowy@aosc.io>,
	Ondrej Jirman <megi@xff.cz>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] arm64: dts: allwinner: a64: reset pll-video0 rate
Date: Thu, 27 Apr 2023 11:16:08 +0200
Message-Id: <20230427091611.99044-5-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230427091611.99044-1-me@crly.cz>
References: <20230427091611.99044-1-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With pll-mipi as its source clock, the exact rate to which TCON0's data
clock can be set to is constrained by the current rate of pll-video0.
Unless changed on a request of another consumer, the rate of pll-video0
is left as inherited from the bootloader.

The default rate on reset is 297 MHz, a value preferable to what it is
later set to in u-boot (294 MHz). This happens unintentionally though,
as u-boot, for the sake of simplicity, rounds the rate requested by DE2
driver (297 MHz) to 6 MHz steps.

Reset the PLL to its default rate of 297 MHz.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e6a194db420d..cfc60dce80b0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -667,6 +667,9 @@ ccu: clock@1c20000 {
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+
+			assigned-clocks = <&ccu CLK_PLL_VIDEO0>;
+			assigned-clock-rates = <297000000>;
 		};
 
 		pio: pinctrl@1c20800 {
-- 
2.34.1

