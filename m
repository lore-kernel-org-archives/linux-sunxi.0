Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E96520DE8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713083839; cv=none; b=nmKZ67tDAjkKsxm4bHaEQUkCRRmdlTxIvR7kJYAkoSo67XfxU7KIbpqU7HPZxCVt5vlKZzTrp4AeuuF+cUlwTYneHcdSREydr3JaRHmVIXwU8Qk+zAulJIVIrMQ42f0HI6uxRB5cXQMY95yuqVYdyNgHjldATpVodaU2rbo3MzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713083839; c=relaxed/simple;
	bh=fwoMobjsymuSGlbq29FD3oMCUW05VJHFg6PKVAkjyFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tcd6SOkGIdfIoUq1W67ymuyO4kyC9cRpYuJcUUfR1Ui93qdMohC05EzcROOnUTxvY8EJt1MMqmH7qq+toJLn81MJfK1esWJl7G/yQbwAgtqKrkr/Z0rqVtvrjuPpw2IlPmLgDg1HeNt/fnnm9EigmVclzXHX/NKSf8ZGgTB+Jro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=JrF6fEME; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qY9Qqcsw; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="JrF6fEME";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qY9Qqcsw"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6287F1140118;
	Sun, 14 Apr 2024 04:37:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 14 Apr 2024 04:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1713083836; x=
	1713170236; bh=mc2x9wUk95MT4Juvop8iCfRYI54seKUwdpw98v0S8BI=; b=J
	rF6fEMEE0ijnkJbSOJ45VKMEce3EMW3K4bVRvCosfPKqSkl+pMXug/t1SMPhMbb9
	0oKBifcnskHxKa6OJwFKtjA0Y3tKbDyCJcLAG9bRk7D6hBLLMABqWbkiOyrADgVL
	/jt7UJKUOSJKqd8hFauHQrl2HunPS7DQYAe5b56bc6iCxdwMLoCfzVx4Tmjo37yP
	Kd8cHIrj7bVCZl3uuQglzaSYcK1s0vJbq+xRMnVHvuslI//AmkgOaAWWclSAgnG4
	1IU+FG2qvwbPDQVSvKMNt12Rzbgk8K29csM4+DImQDv6uJS9/u2XuSbSAL26l+TO
	dljeeYBLTNajE6ty8dxww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713083836; x=
	1713170236; bh=mc2x9wUk95MT4Juvop8iCfRYI54seKUwdpw98v0S8BI=; b=q
	Y9QqcswQkaspQ0ULQsiOx54DpAa6o6n1wWzsZ5aDd47JVHvTB3ggkbcAoyp33gok
	O8F9JIzpMmmLpMEB7M7gLA5mvfeKGP6OIrSUTj/Q047dA9hwB2ZfoXCkAyGSgLfT
	uuF5LX+MBqlHkUKtObbOoaRw/8e3+Ycc56LNBnclUtiC8FRlUZTRz1X0QJI5dVUK
	TtYc+fxCAVBWUpe7/FS/L9342Z8B69W4SckKaXCSCYtk/iZBnTF61jG5VCjssk0p
	Ktz/WMcA8U9rcSZ9w/YX+nBGIQ3b51MA4igQRG9dnlBYM87UFqNtdXNpjpPpXoY9
	wpkct6/WOdBfuTohvwg/g==
X-ME-Sender: <xms:vJUbZn4TydHI6Qw10To-YZ_TsPTcOb13R1c28K7EAn58JI0fC6D7Ag>
    <xme:vJUbZs6cPn5X5_Gi-LBBQQBp6BujeXOJan2_L_RkklpF66MGqzs65oFtenng-D4nF
    WuIUs96oAz3ymEgsw>
X-ME-Received: <xmr:vJUbZucv0ioNx7ioQtOY7LCR4He7yiODbOIaJoGmJoYic0In1fZIwocwXQvZaio60tZ6HXlFIIBnes3r9CuUXh4qYg8U_4VevpiTJWVh5zr7TVBp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiledgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:vJUbZoJbX9Kk6GatPlSGzgvage1csEJqkdtBkf7mlMDllWI8YSxv1g>
    <xmx:vJUbZrKG7JJzmolUcMqcgujXXOHUOCaK5D6xhVYE9L1f8giBV6-zNQ>
    <xmx:vJUbZhzitxiDHCIAOenGWrAubo-dsDfgOQl3frxZwMB2iZHH3W9uAw>
    <xmx:vJUbZnL_3eebvY8M76fMk-uBzbLBcIhs0-tFCHDF8pjpZG2XKmEZRw>
    <xmx:vJUbZtyzuunZ0b-l4LMG5_vpvisU9SnYUtBFE6IAQo_kg0DGKNcVGeib>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Apr 2024 04:37:12 -0400 (EDT)
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
Subject: [PATCH 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Date: Sun, 14 Apr 2024 20:33:47 +1200
Message-ID: <20240414083347.131724-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240414083347.131724-2-ryan@testtoast.com>
References: <20240414083347.131724-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan Walklin <ryan@testtoast.com>

The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).

Enabled in this DTS:
- WiFi
- Bluetooth
- Supporting power sequence and GPIOs

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-plus.dts      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
new file mode 100644
index 000000000000..b9a163ed5d0b
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h700-anbernic-rg35xx-2024.dts"
+
+/ {
+    model = "Anbernic RG35XX Plus";
+    compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
+
+    wifi_pwrseq: wifi_pwrseq {
+        compatible = "mmc-pwrseq-simple";
+        clocks = <&rtc CLK_OSC32K_FANOUT>;
+        clock-names = "ext_clock";
+        pinctrl-0 = <&x32clk_fanout_pin>;
+        pinctrl-names = "default";
+        post-power-on-delay-ms = <200>;
+        reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
+    };
+};
+
+/* SDIO WiFi RTL8821CS, powered by CLDO4, regon=PG18, hostwake=PG15 */
+&mmc1 {
+    vmmc-supply = <&reg_cldo4>;
+    vqmmc-supply = <&reg_vcc1v8>;
+    mmc-pwrseq = <&wifi_pwrseq>;
+    bus-width = <4>;
+    non-removable;
+    status = "okay";
+
+    sdio_wifi: wifi@1 {
+       reg = <1>;
+       interrupt-parent = <&pio>;
+       interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
+       interrupt-names = "host-wake";
+    };
+};
+
+&uart0 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&uart0_ph_pins>;
+    status = "okay";
+};
+
+/* Bluetooth RTL8821CS, RST_N: PG19, BT_WAKE: PG17, BT_HOSTWAKE: PG16 */
+&uart1 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+    uart-has-rtscts;
+    status = "okay";
+
+    bluetooth {
+        compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
+        device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>;
+        enable-gpios = <&pio 6 19 GPIO_ACTIVE_HIGH>;
+        host-wake-gpios = <&pio 6 16 GPIO_ACTIVE_HIGH>;
+    };
+};
-- 
2.44.0

