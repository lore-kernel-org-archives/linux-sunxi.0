Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1064AEF7
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216013; cv=none; b=gWe35NXg0ZuIDZAT82ONds1RBhh+qE/Y4pEn1fdHhgG2y3eTs9Hl8mmmBgKT+Gywc48p7qh5OWxmEZyvRp7bM3edKVY/9DZZsy6E6R8vyUqQ2Sw5p7jvA3T9VMnVWA3epjli2dAKftKgTuMYL1aQg80y+DE8/FPbZU7O95ctBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216013; c=relaxed/simple;
	bh=l9ll46tEFf24Z25BbGjTvd8fUJlKHRDdmxgNtMIO1R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miVYTWndhnDVYxvSzC20VO7mYK6irCNtIqK7cGl3DCO6tVw5fykhz/GlokI8sfu4m8gar1WImIc7spZRfiuUrm2BT6+5jWhFVvM8g2KgQWI+o8kVzxorfbpF4dyBA4cLqfZsvCo7HvtjK6Cpb8cSnNjMzY3r7cM5AGzEMv1FVss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ph2cHQqh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MiZFZpDl; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ph2cHQqh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MiZFZpDl"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D3498114013A;
	Sat, 27 Apr 2024 07:06:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 27 Apr 2024 07:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714216010; x=
	1714302410; bh=Z1apldijlyUlJmE3AuajoRDLvwCNFadsWNEDp4XPtdo=; b=p
	h2cHQqhhAZhTPUsgOyxD5JYhi8M5tKhuAH/cZe6SlB4XPzIgTxLPH+wkaWM1/Uf/
	zgAuSwB+yFq00M1tIJ370ZevfEpw55yOYFjDk0wz9KD1wikijYCrLKS/xqLGBifv
	ubcRnG/6IYoyzSngHqxq7i+iUKBcuCvkAPDLIPjc2Z4hG/lwEMZj8x4tF/O69ZIk
	s7M/ZT3wXviH1mft0Wnp3H4vrGgtGhHrgoa5Qi+4AsMMC8BjKDVJrX0Pu8npMlbV
	fh3i30thZXQh3RLF9VeMzhZXeeC/UE7T/FwpMk/7DwoL7dHJXRc8cpJnrRo6UvNn
	fqcMI1i80JYbgwDRxTT4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714216010; x=
	1714302410; bh=Z1apldijlyUlJmE3AuajoRDLvwCNFadsWNEDp4XPtdo=; b=M
	iZFZpDlHPDFfFrEvAHcQMqS3lu4rvlFAOQExbIO2FhB8RC8ETCEOtUsLxK2Z+ufD
	CFfq07fHUjJsjT9GcO+BAiehRjR1ueSDItzg03lcAJbaGGovUaYehLB6NE0mKs8N
	ZgsUR3jhC3dAHIv6qA/GEqAYYrYoswLWLZk2uUxfpfAl6nkt1dtuUsy4k1EizGQA
	wGRPEacvvwwHj7Im2sb7sbFoDguOe0yY0zbRJjIMSTZUzNXo7OwNiiwFg+Txqq7C
	wSi/6m2q5JBWdrb1IF66Yp9fY96MGNNXt4MuItxZJe6OiJ9NPaW2l7TcOqa3CYAC
	Ag7qHppk4vBXMPQJE0ueA==
X-ME-Sender: <xms:StwsZh7NoeTB-2T4GXOwTFiwrf7wwx9EIWvfpQliZqpsDHY3E9JAwA>
    <xme:StwsZu5lyxrVIDmH00J_Bp2TUndAA2L2pRGqpNhZV9C0MBpOgCdKMSkLyrPRBM4Rj
    fmNvMYaaFb4YS3dxA>
X-ME-Received: <xmr:StwsZoeS9njL_qFdcBG6z125yokZgylK8U_QhTXp_yv48ValtCSUGUhoRlNDhTWKAVsRxOf7DdnQFj3ZjnALEFUkLHT3ud-QWFp9yUKYfDPiy7uT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtuddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:StwsZqIZ-XPlh7Z0HlVY5gp3DlODcRGuz0Sadk9iEUm0HBshSBJYMA>
    <xmx:StwsZlI6s4cT_Saal25W0-N-VteVOdmbSXZdl6toqTRSZ9_HzJluyw>
    <xmx:StwsZjwdNC6x9_5O5eSphwX-F1DnURmwTcwjlQiCATAVu36tL1cHsQ>
    <xmx:StwsZhLsYez0MQYr-343wZ_tMOccLTmdlHTYasrK0BEizpCxovghpg>
    <xmx:StwsZvz2OyFM41X4BAfuES5i9Jj0Thc1hWTy43hF1UwBIcAmcZdwnYcj>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 07:06:47 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Date: Sat, 27 Apr 2024 23:02:27 +1200
Message-ID: <20240427110225.727472-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240427110225.727472-2-ryan@testtoast.com>
References: <20240427110225.727472-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).

Enabled in this DTS:
- WiFi
- Bluetooth
- Supporting power sequence and GPIOs

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changelog v1..v2:
- Update copyright
- Spaces -> Tabs
- Remove redundant &uart0 node and DTS version tag
- Add GPIO bank comments
- Use generic pwrseq name

Changelog v2..v3:
- Add DTB to Makefile
- Correct Wifi vqmmc-supply to ALDO4
- Move changelog below fold-line

Changelog v3..v4:
- Fix sdio_wifi node indent

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../sun50i-h700-anbernic-rg35xx-plus.dts      | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 6f997157968e..4217328b1889 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -48,3 +48,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
new file mode 100644
index 000000000000..60a8e4922103
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ */
+
+#include "sun50i-h700-anbernic-rg35xx-2024.dts"
+
+/ {
+	model = "Anbernic RG35XX Plus";
+	compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&x32clk_fanout_pin>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
+	};
+};
+
+/* SDIO WiFi RTL8821CS */
+&mmc1 {
+	vmmc-supply = <&reg_cldo4>;
+	vqmmc-supply = <&reg_aldo4>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&pio>;
+		interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
+		interrupt-names = "host-wake";
+	};
+};
+
+/* Bluetooth RTL8821CS */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
+		enable-gpios = <&pio 6 19 GPIO_ACTIVE_HIGH>; /* PG19 */
+		host-wake-gpios = <&pio 6 16 GPIO_ACTIVE_HIGH>; /* PG16 */
+	};
+};
-- 
2.44.0

