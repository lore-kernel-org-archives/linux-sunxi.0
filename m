Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D81411C6
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125222; cv=none; b=kyAs8vC5GY2i5GubcKfEWJjrqqC8wUHkK6kNGMIshqWeGoathmY4lsYeh2gfvh8l3wRTkGkPq4ATKEbPPzs5pyCgAf0JvU+2lhnWCp5i7YATNwL0nyedB0CFsoPc/RgF7d1EB/ajVOZdtcRqaiSyQtsPId2l78WXGYa/vaCdG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125222; c=relaxed/simple;
	bh=WmFpmly6qyaC723Q3j2BsDA3mX56paBYzEw6pN+Ih9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAjoPCk0sR2M7doiO36sv672lHDPV9+PD0VVatLXvZe62N6CJkezVCh63KgLa4DCITzwaHApvyrq5j4JUgKVDx7QfdTj8yy4CajZo75IZD8ksuaVg7bpr1drCved+v5lmyqT/UBxzD30LQ7fEM68Kinl+U4LLSpG/6a9T95GNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=dlCHVOjB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NV04D+3P; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="dlCHVOjB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NV04D+3P"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A6F8E11400DB;
	Fri, 26 Apr 2024 05:53:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 26 Apr 2024 05:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714125219; x=
	1714211619; bh=+fz3wsY8omns20LEEBePergQs7gUwsS+LOB1ixHF3zk=; b=d
	lCHVOjBskE86jFnl9zohfcJb6jv3GAiRQRGASiUQpDFTdPpJ0XOXU1R3+OdrvisH
	oJ/w3GFxKy9RD5L5B1SKRbqJPY06N+Zvc8bJicZAtMVSmFb6NXvCbq88xy9yhCVM
	VlNWGLo5uv6Iej5FTe9aKBzfunp8VX/QTo8zpIRTcbV+lW6tCwyehvKKUKYYDeFn
	KAM3Vs9XljZAsYzFQqk3j4j+OG7qYSpt9JFd4Cx2qpR9G1A7zoqdp6c0AF8culQQ
	tjUu068UY26Xuu+yuu9YWeUDV5FlIlS0p6hhkBmZNgZISHiyGMrjJRlBXLitIwVz
	tP7cMXgfWk6xaFG5MUKzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714125219; x=
	1714211619; bh=+fz3wsY8omns20LEEBePergQs7gUwsS+LOB1ixHF3zk=; b=N
	V04D+3PfNk0c/x7Ivg0u1dZG3A04ze9hH9BP4XSdUd5r4qVo8Ku/IRm1Y939foI7
	tVyv+dNVbgM0uEByl5n76wo6irQjlbGIGQngtx2oHjb2kBANLkLqDRijlF0CHjJM
	HYGv722V4bpKPERS/+hcZDICi464z/dxWvCD68h3eRCQYLXMs7G7VTcHyXE5WAGK
	IhfH1zs8n3yMgemaSzmig/7AQxcuwJHv+YtwbHJJNqsA8LTEFHFJXyG9qMm4e+/0
	U3U0xxdzOv2kuvT11KUurTTwake9UuoEfKirBLQjJtZNYvyjZK2qQDRstI4u2Eup
	oapk1JcoAq9Hzs74j0cOw==
X-ME-Sender: <xms:o3krZpLlXo6UGmJ-N6X7kKr-KwcGZWF7xx_Wr1-teF57WuuEhv3DSw>
    <xme:o3krZlIHN2d8diduWLyDcv_RXFT-W-QDHaQHJCa0nynV1EARSe_3-LCiPHHBtPyLy
    xaxp7kzFJBa4pDzVQ>
X-ME-Received: <xmr:o3krZhsi-jVDYa2Fz6n1BSzdem_Y7IdnaBjUazCMfrbO4Gxuah7_Sdh92ApUFGMlXDpoUnIBemNTZ8NRYiwNI2-RmKO5SfwnjBjV7gybX-ZVCgZ2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:o3krZqYz7NXk05sTRh4tWiqAGQVXfx_dubofd2QxNOzOfe0j_E4rbw>
    <xmx:o3krZgbmRBn7JPf7SAp2OkAlDjaY6d14Uz61BlVK0BBzwpqLCtPXFw>
    <xmx:o3krZuDwbWuiO9JTryWwvME_tbosR-Ny0Su7-4FRxlPISGW9vDDeqg>
    <xmx:o3krZuZgVkVoKkLzPbb01VXjW334PZCQ4cMLmsp_9tdP26AaEENXRg>
    <xmx:o3krZqD74YYKUCuCYp2KTHxNm-SCqWPPxrVRHz-G8d4BgkslWc1zN76F>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 05:53:36 -0400 (EDT)
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
Subject: [PATCH v4 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Date: Fri, 26 Apr 2024 21:51:41 +1200
Message-ID: <20240426095141.13602-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426095141.13602-2-ryan@testtoast.com>
References: <20240426095141.13602-2-ryan@testtoast.com>
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

