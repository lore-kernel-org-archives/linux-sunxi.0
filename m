Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC6214AAD
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610030; cv=none; b=pBEotAjSes+4PJ6xUzrWPqF6u5L0MA9NSm2apnOlGCweBmcE9G0GjQvAPZv7IcWxIfc4oAxhf7u9k5988YCF4tdIH4Ye+ppwrjHFotZEFrzfWe8ao6aohOJUAw2pLcrDV+/vXD+2lJOXikOrqflSEAWyeByKUB1akw6x6YChX3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610030; c=relaxed/simple;
	bh=a/3igmsTecLDRS5e3XdIwCRqmPKV2kX+TTpKwgy+qSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAAAr2cquZNOuv7X8qddVQzLRpJnoByFpwMdraPOqr1uumOubOedkdhCNng5csLwpwHVsc1ECp6WkT+Us3K6tt7of1Zlki/PFazue/4J01L4V00LwZ1PYq39DjQnMmF7c8T6vNDRV6jMSAVKP8Z2aD122RMN9y9yOhFOWeazaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=i4rcl6s3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eqpExNsV; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="i4rcl6s3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eqpExNsV"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id E4F9618000C2;
	Sat, 20 Apr 2024 06:47:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 20 Apr 2024 06:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713610026; x=
	1713696426; bh=RirmrxstzKzGXympbNjEqgnr/tSHp2TmDhRHoCQzAYw=; b=i
	4rcl6s3kgBqc8cAMifJbNU3RSVAp+pnVpK97RJuG/q2nGmGgIllTSujprfNz/PCu
	i7hDwOo02/EfH2PolJISO13gFscSHXBYckmwcyKG27kkN4+wgQyq5VU0RTtLyFVd
	xOel5l4sdbipc4BO4D+p4/rAU8EPKzVEuAPB+WsVrKvZWX5U4ooBt7tteb5rQjDD
	CGcK8r7eMVmWQzS50zqwE3IihfqOWvb/YMF+wfea/YvqezCZyTKSfzCszkE53JjP
	p5RE0EQvf2Tm2y/Yi5E3/mSBV5VEn0JefMp/ip87VW2J5yFacYTMNwoYy+3YEgAF
	NMmEDMhqDEgWu5Lqbd2Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713610026; x=
	1713696426; bh=RirmrxstzKzGXympbNjEqgnr/tSHp2TmDhRHoCQzAYw=; b=e
	qpExNsVP5xm2PTmt3w1H/KfjJABpAbQkgGP7HwNdqzt+G2hRFcF5++8tbGa+9Srl
	3vVrNcrTpBpP6ZJYcFP9qCjdaJtvRgOVk8UjtdNqJyRfeE/oCBIWow7qBRn/kEjJ
	+EWOMCYak/8orqC8wQKn+l9c4KFhlAhcwanzNvlnJpMl9tal7VbwdimwOY9haHQZ
	Lr105nr9Aw/nzuQaQfNNvJ1tz45eiqMQJIFY3gRqD2cN/oxJiVSPI+tB5zViAOvt
	FMaHgc1XXA93+deSgqRHrDcAVQYBhipWUJ1QjASgRgVi637D3poWkSzAgSnlxahE
	O7iBvqsn2Bx4w2lWrBPxQ==
X-ME-Sender: <xms:Kp0jZoFuwyNjn5c2ioVixSUgfblHEnA3PVsNpgIPm06x4QaoH1ncug>
    <xme:Kp0jZhUPYNQ953VzhaJBqfJxdM2UkDl1gx0AqT1oqcq7AqpJDqOX9IR9IBJLxAg5R
    S70GY5ZTs2bDz_zBA>
X-ME-Received: <xmr:Kp0jZiKiL88OnnF7Bs3tJBmpLY-_AcRTZr-w84jsBcqd_eb2llJ0opY8T9NKJ5q-DM02C2j87nbOiLfbvhhYTO47z6nalF15bDgRsUHToKQ6USxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:Kp0jZqEALjsnSn9SDLGw7m7K_VLSBaElGQsZzawXOF9iGavW8ZwSFA>
    <xmx:Kp0jZuWu1vXDT3Vl_tEJCcnxDIZRHGjfA_7XJfdmBByo3VnVkQ45cg>
    <xmx:Kp0jZtPRjN9f8iX1GXE1R1KKZ50sIrppslCA6Xvj5w9vzZ2J4zzHAg>
    <xmx:Kp0jZl16mo7Iu_koHwRgesjt_7JA4DivHMO80njZ7itaclqD17rHIg>
    <xmx:Kp0jZlP_lk57JVPOBnk5g4nPdS4aCgnb42jJzYXkILLNAKshI5GUYMlR>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:47:02 -0400 (EDT)
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
Subject: [PATCH v2 3/5] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Date: Sat, 20 Apr 2024 22:43:57 +1200
Message-ID: <20240420104354.334947-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420104354.334947-5-ryan@testtoast.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
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

Changelog v1..v2:
- Update copyright
- Spaces -> Tabs
- Remove redundant &uart0 node and DTS version tag
- Add GPIO bank comments
- Use generic pwrseq name

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-plus.dts      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
new file mode 100644
index 000000000000..67ba1c7bb3ca
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
+	vqmmc-supply = <&reg_pll_dcx0>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+	   reg = <1>;
+	   interrupt-parent = <&pio>;
+	   interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
+	   interrupt-names = "host-wake";
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

