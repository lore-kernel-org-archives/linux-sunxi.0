Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759DC70
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 23:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 1AAC8220A40;
	Fri, 14 May 2021 01:29:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MY-t12a_7eoI; Fri, 14 May 2021 01:28:55 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v2 5/7] ARM: dts: sun8i: V3: add codec analog frontend to V3 dts
Date: Fri, 14 May 2021 01:30:22 +0200
Message-Id: <20210513233024.2076725-6-t.schramm@manjaro.org>
In-Reply-To: <20210513233024.2076725-1-t.schramm@manjaro.org>
References: <20210513233024.2076725-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner V3 SoC has a different analog codec frontend than the V3s
SoC. The frontend used on the V3 SoC is compatible with the on used in
the Allwinner H3 SoC.
This patch adds the corresponding node to the Allwinner V3 dtsi.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 arch/arm/boot/dts/sun8i-v3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-v3.dtsi
index c279e13583ba..8af790d286b9 100644
--- a/arch/arm/boot/dts/sun8i-v3.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3.dtsi
@@ -9,6 +9,11 @@ &ccu {
 	compatible = "allwinner,sun8i-v3-ccu";
 };
 
+&codec_analog {
+	compatible = "allwinner,sun8i-v3-codec-analog",
+		     "allwinner,sun8i-h3-codec-analog";
+};
+
 &emac {
 	/delete-property/ phy-handle;
 	/delete-property/ phy-mode;
-- 
2.31.1

