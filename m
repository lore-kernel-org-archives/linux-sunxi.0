Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0F10A09
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610035; cv=none; b=FRWA5lxA70s3nPWCu45ChJ9PHCvMzVxhjZzwMdKu/6f5y0PIVh2P6KPelzRc7Ka086/vATLOjeSzThUZdxxhnJZ9zOM9MuSBHlDveQolrvxe9t2FmqIfCZj13bUI/EBejcyoxXTYqe4N+FemNtdfMGcybI3tVzyXVWXd3grRQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610035; c=relaxed/simple;
	bh=ljBSFfgvGrykPrloi8mah936CN5IelKpBxt/U3j3Otw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reWfd6seqgF2eP7dxT7QiLWamS1KVqu+yWVgxM+eJLgnxjxTJkS+0XLNC28lI/Z5x6/btTCt0s9ITFqRLZCri/esJVzlN4xIOVulEKXcCICDcOJPKgvwofGXGh6oCUZJTXphqex9M12e2aEaJfAJQrxnyVdXqNvHUUDgEy61brU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=RyE8yr+u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XODTywj3; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="RyE8yr+u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XODTywj3"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5635818000C2;
	Sat, 20 Apr 2024 06:47:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 20 Apr 2024 06:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713610031; x=
	1713696431; bh=LzEGC70lNah24l5FLHvq7NNVPSH92o80bIKICsuBwPU=; b=R
	yE8yr+ueuqCoMjAZs5oBnmCI4XBQPASJ4UZ2Ppxow4AGR7EFkPn9H6vcCnySLdtL
	gf4u7uzM+tJzVkGc6knXcrQzedDntMhs27jdNZ7JWxeBWNjJcKj2us+TWPt0xERd
	N9vVSZe210aNGV5V81/Xje+emUJtO2R9a1WS8BlKc6eZJHb84LYUslKywuDvDa6h
	6yFkkF9WMuGyG/K123ojiVDQ70dfpC3nPhaolEIuZJA5+uHdZ3NS9wk4iL6vlYNF
	fHyL6nK5iVbcvSG4PgxBwIdzWyU0GyqflzUsZQVAkhKJye+4cpYV6wHdYzsdMtz9
	59ctpdkpQWcsBm9ZP0D3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713610031; x=
	1713696431; bh=LzEGC70lNah24l5FLHvq7NNVPSH92o80bIKICsuBwPU=; b=X
	ODTywj3mFvUzvh7fq3b7Vc76XVhPob+TMetxt0Y0TJ7S5wqCb+rhzuBDI4jjzxDx
	lglMYoyd+CfUUqmZ2i0kpmK1cpj+Tyiv9oUEzkz7WXF/9CxCNJM3Gvt2ROq2KbuQ
	OQUWPhekF0YdEKaZadwsZM02waQz1tU7eK/f3OSZl0x/+bYcUK5/LE6dyGn3JxC6
	MDe/Y9jAX58l5ilIkkNdXWEGWJNQ18Cb16XK18GHiyPbT2b/1axCPQIb4CzSQ4PJ
	71goWymY7BQ2H48kiIiZR+QBbi+tSgVa8sbzP5HzzkEOcYoZge+AQZpceTqIFFZk
	wp33o7zFwMrwjVKC3XhJQ==
X-ME-Sender: <xms:L50jZr1wANcJYS0TjFgBFKWOiqAqM7_oiMnPkpnSfI4uv6XlJbzbAw>
    <xme:L50jZqHqqwxDYHYlxfKAjhjltke_sOp7ZTalaXv1fm9K00gOU8_Tm4VKoYuG-4Czp
    GUo_QT9WwxWdwSInA>
X-ME-Received: <xmr:L50jZr7ky7u042zpDC0_XpjW38lzHc5nZIA-RM9lprJ8X3jdAGCJNy0HtUqQT5PWrsTZ8VDYD2Aaj3U9DUrIGDWnIxIhb-Q0U71oxyYQDttNspF1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:L50jZg2FXg1JqdwbkgbY_LrPnVNR9MWx3ZE5X3-0rtulAJ1moOGLww>
    <xmx:L50jZuEYCMeNfmhIr_ntHUmqTD5sMTNK-SXRgLCLLvkTfGmu2QmHnw>
    <xmx:L50jZh9aH5PZKfyIcPdvsJWUQ8CCoaDF5TbuvLHIc38NQsjCICLTqw>
    <xmx:L50jZrnKgji9f3USMH4mZC37dNHsHCCYE3w40YkFYO9a7IO1zDo2Ug>
    <xmx:L50jZp8yTE6oBjQxAGyWB5esuENdV2OlIn_6LAoq1m2gE1gg_zjnHPFk>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:47:08 -0400 (EDT)
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
Subject: [PATCH v2 4/5] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Date: Sat, 20 Apr 2024 22:43:58 +1200
Message-ID: <20240420104354.334947-10-ryan@testtoast.com>
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

The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port to the RG35XX-Plus, and has a horizontal form factor.

Enabled in this DTS:
- Thumbsticks
- Second USB port

Changelog v1..v2:
- Update copyright
- Spaces -> Tabs
- Add GP ADC joystick axes and mux [1]
- Add EHCI/OHCI1 for second USB port and add vbus supply

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

[1]: https://lore.kernel.org/linux-sunxi/20240417170423.20640-1-macroalpha82@gmail.com/T/#t

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
new file mode 100644
index 000000000000..d62cf5cd9d9b
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+#include "sun50i-h700-anbernic-rg35xx-plus.dts"
+
+/ {
+	model = "Anbernic RG35XX H";
+	compatible = "anbernic,rg35xx-h", "allwinner,sun50i-h700";
+
+	adc-joystick {
+		compatible = "adc-joystick";
+		io-channels = <&adc_mux 0>,
+				  <&adc_mux 1>,
+				  <&adc_mux 2>,
+				  <&adc_mux 3>;
+		pinctrl-0 = <&joy_mux_pin>;
+		pinctrl-names = "default";
+		poll-interval = <60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		axis@0 {
+			reg = <0>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <4096 0>;
+			linux,code = <ABS_X>;
+		};
+
+		axis@1 {
+			reg = <1>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <0 4096>;
+			linux,code = <ABS_Y>;
+		};
+
+		axis@2 {
+			reg = <2>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <0 4096>;
+			linux,code = <ABS_RX>;
+		};
+
+		axis@3 {
+			reg = <3>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <4096 0>;
+			linux,code = <ABS_RY>;
+		};
+	};
+
+	adc_mux: adc-mux {
+		compatible = "io-channel-mux";
+		channels = "left_x", "left_y", "right_x", "right_y";
+		#io-channel-cells = <1>;
+		io-channels = <&gpadc 0>;
+		io-channel-names = "parent";
+		mux-controls = <&gpio_mux>;
+		settle-time-us = <100>;
+	};
+
+	gpio_keys: gpio-keys-thumb {
+		compatible = "gpio-keys";
+
+		button-thumbl {
+			label = "GPIO Thumb Left";
+			gpios = <&pio 4 8 GPIO_ACTIVE_LOW>; /* PE8 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_THUMBL>;
+		};
+
+		button-thumbr {
+			label = "GPIO Thumb Right";
+			gpios = <&pio 4 9 GPIO_ACTIVE_LOW>; /* PE9 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_THUMBR>;
+		};
+	};
+
+	gpio_mux: mux-controller {
+		compatible = "gpio-mux";
+		mux-gpios = <&pio 8 1 GPIO_ACTIVE_LOW>,
+				<&pio 8 2 GPIO_ACTIVE_LOW>; /* PI1, PI2 */
+		#mux-control-cells = <0>;
+	};
+};
+
+&gpadc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+	};
+};
+
+&pio {
+	joy_mux_pin: joy-mux-pin {
+		pins = "PI0";
+		function = "gpio_out";
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&usbotg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vcc_usb>;
+};
-- 
2.44.0

