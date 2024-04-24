Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280315A480
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957206; cv=none; b=EcGrD8u36ClKhpsUzRa6wOrZAfmSuSbj//jPrVettDJemHyaRFtoWlFuCPzp7s1Wq4jsLLTgC/4ZviAs/TwfSuuCrUFcoYqpcenW6ScMYp7XLB4eSZVCKSA+jpiG6v59oIXZu+DSMfVqqYVDp9iaMoJCmuvC6rRQkVN8Y3d6y74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957206; c=relaxed/simple;
	bh=lxh/VK9Na3xrl9Us5g0+gy6vmsM0S2e75FXkwzopRIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNReYLlsmBgQTmaMEZJFWxDs1//5gijpwnZG3zZYPITOJ0OaHRDkWZgKAFyWOradQKLTbebw4rFFk7PN+XbeC3dxTMC2nfdTf1CcFhMHrATdaS+a/8q5mEG8nAg+rYB2gVAIxDHhdVlsKVzBnHUTtsG1YPS2FV3mrJD6ZXOyvWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=f4u5dzft; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LnkOKR8r; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="f4u5dzft";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LnkOKR8r"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BE97411400D8;
	Wed, 24 Apr 2024 07:13:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 24 Apr 2024 07:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713957203; x=
	1714043603; bh=/5EFYcKMjjY1ppVwa8l+OQfNgVz/mubEaaUdpg5NYGY=; b=f
	4u5dzft6Ud93obvWKvljsSQf/cqKcQUI5MJFalgpDXj3GYbG654YZOnBDfN6seSv
	CXSidCITROXayyC3UEeZIlEEDPB2sdb1vqzGSXhvql3pUMfyxtAb4Pip9JaxbzfM
	E2B1xvvEFEwBdy7ZleYsFwpuQUtguuyKv+GxbW3eh3jZRgKVr0nu2XTV2EQYjrx3
	9uaM8/XS3NSKjwlKsjk9QFil0yJzqL0ySKoPfssR+SqoAuFwX9TTEoEKo42ufccJ
	5R5SkcAhliY4sgwUaPv2umyj1W1X0q7hqGSwJgAleh9Qn0PBKqMCbnHxoGhvd4ji
	F6onEB5OCc/2S0BlxtuQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713957203; x=
	1714043603; bh=/5EFYcKMjjY1ppVwa8l+OQfNgVz/mubEaaUdpg5NYGY=; b=L
	nkOKR8rtsQYDgXWl7vzSsn/OB2JpQcJZJ7toWg+3HGFhgA70ErAjuqDm4DdBO+AO
	EyOcTxZL1MY32f3ltVvRy3xTBYB9oHbgc/8ie9XAc8i1p0LzmKNi13miemeeUSZx
	O3qeJlISQ9HbGeeqI4HJRO08J4RKicNlfYlc09y7Nsa7yIM7dk320XxK7Gseh9ry
	W0jNKPaMJ5i70wR2eD+k85MgIe6xUcHnkSzufwlQm9ji/b4qHqrcrDmU1uCPs2v5
	jD9+K94FUEfKyVty/Azr90jvNSJ7OW/rBe5R6CDUmk3P8qcGDGFuJcOHFa4x5S04
	0twjyou9Ya8nL4MfdHaZQ==
X-ME-Sender: <xms:U-koZkAvTEhUW0t_s9Yyt-UjrM1yAPfr74729pKJ5v2Kd20NmQ_zQg>
    <xme:U-koZmi62ZHuXYwXl_kA0rtdmGl4KT5byMyRXjDc00eHKVx0Q8agyxEoFLkrAbqj1
    PG-O7FNK9rzRLwv-Q>
X-ME-Received: <xmr:U-koZnkmbrZKsPnp4IJ6RlP56RPM90qP2sRIhvwAeP46lyCF6SDZ7LAFFaizh8v9nn4E4F0eZsaOewbpbdq6COXwMwcHzGAOwYetmJxUHgYH3Pdh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelgedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:U-koZqyD5k2V0Le4GiqpVHjDPyaLVW1n5BwQJ9XNpiTVLG7I8HL2XQ>
    <xmx:U-koZpRcRgxGEzCTcU4HjifJotyOTFo78pg5nSkUcUp4-u2ChDzUvg>
    <xmx:U-koZlb_eKL-RyGQulRkV8mb5RpMADPzgQKOWxnUI5L_8xHhU9Zm9Q>
    <xmx:U-koZiSN0UynOuQGl5s0_Ei-ViZyuxA3C_wUMIcUWTBYT_YkRu1f7g>
    <xmx:U-koZpaTRWRlzbM8gc5oiYFRrVRx8AfaWgxQbYZenrZGiy3-w9z-sRv9>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Apr 2024 07:13:20 -0400 (EDT)
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
Subject: [PATCH v3 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Date: Wed, 24 Apr 2024 23:09:46 +1200
Message-ID: <20240424110947.9057-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424110947.9057-1-ryan@testtoast.com>
References: <20240424110947.9057-1-ryan@testtoast.com>
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
index 000000000000..7e9d45eccb10
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

