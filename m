Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F87364A0
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167741; cv=none; b=r/76IhyfjBFbl1bdqpKKePLLyfgurBeKmDK3cr6MBXIZJgVblK4Bartgv761NouSkz4hteWmyqf4D94NV3G4Z42mxMWep4gxHII+0AalsOgGWFPPDFhcyKOnrv+03Y1EtqG/jxUCIkCxwaKs16N3nAnRg+y/GJZMyRVH1MAwZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167741; c=relaxed/simple;
	bh=fdnynBB7gTBHRy1V35JHx+dSspzWoejQL/R4WcC7bf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofPyS8So76FN1hl6rvGDplzNxVShugajgahvUkRp+G/bZOdBH+EaVztOe3rG3XFFuireGvKb8EXJEiT1GzU0+NaZRx8LxgCL+yoYRt3u1Am8s3fSo8M8ty5Djrv7Ta2xICd6LGC+bz772wvBGESuT6S8vorlbjM1ypGCMaToHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=q1QipBlH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J7KZxy5B; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="q1QipBlH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J7KZxy5B"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 227461380113;
	Fri, 26 Apr 2024 17:42:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 26 Apr 2024 17:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714167739; x=
	1714254139; bh=97C0vLSBI2B2TQFO45snXmZYrerkHt80unosa9/oom4=; b=q
	1QipBlHcHFV/gU5nwUR24ZP4wcSJHlyJzurpWvog4Vuf32G7jyAUMycZgHX3RbLG
	mR9EQNEcR9wwtTKr0fORTdxXAUXveu5wR1LOsEcE6Z9fDzd+AbcObky/9xqDk+sA
	vB+9ntQGlGUhgMdCOqpNwBC4u8gQHHHyEJKpPnIYESfjUAyXlISyqf+I1pSDn07f
	F4LmOKvlazcoX8G1fHLGQcbVVNePhuUeRj1xTTavko1dTuKVfYx4veAJmEp4sEPJ
	PgWAfDqpY4/7A4s7l902EU1xNYv2zimi39kBjQ1uuA1MZX0IjnkkQMSzuDUFWAwg
	Sl5/59haHfUHz+RNCJ58g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714167739; x=
	1714254139; bh=97C0vLSBI2B2TQFO45snXmZYrerkHt80unosa9/oom4=; b=J
	7KZxy5BaVVvbt4RioyCL6nUinoWcBq9rKZrHyAFK0VNAhA22tJYqhi71qjrN6UtM
	6994rthtUtCNAMv+TnqXC+24xD4b2nxpj7fnCXnstZDiHrPn5A/+ugvHABKHzTK2
	NBLvB6Oy8jqFF9f4qtcMGZ1I47oKbmuELEKZCCtOTxHi14D0snAS8fakDU99VT0j
	nFbiILfnxEv1wJcXzoJFuHP0n/L37igstu4yN2zT2YdqHWps0AYSBY7GTL4O1pTy
	0Xy5co4v0Z2t0VulxJ3QnDglKro4atNBcUD6vTtOZo5Mr1gI9/Jab3xa/JwbaeGb
	t0X9op8d820cqULUJh7aQ==
X-ME-Sender: <xms:uh8sZvldnInsddx3-GBUdFUs3aPSBOiWu6gu1SImMtYa0ysjttqDzw>
    <xme:uh8sZi3Vg-tqws0HdzK-5UQo2aqBXm4yZVJe37rXDeWgcUC7ORzBrj9kKSQ3A4U5V
    _lpnsEngbXyxEcY5Q>
X-ME-Received: <xmr:uh8sZlqKhDu2F65aCxHQ1KW7VXMMO1GOo5MnochtGIx-pUAxe_7Kueg7kcPBElPZQxEwHvSb17DSP2_h1Yg3-PgdCRe6b2Z2Mg67tdFvejiGUEIO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddttddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:uh8sZnkwl0ePcJAJz4ZvDdRfrffa6RptJ0McSF3hXvdopJ7O_RhTQQ>
    <xmx:uh8sZt0dvCpddC8HAuB66YnGaXyI2j3dPEMYsijdNMjV3x6Zc_twSQ>
    <xmx:uh8sZmvhj-MD1klsShM_uhQdInK67cGKjoO5KuIicLFat8KVR6i09w>
    <xmx:uh8sZhWuCjSc1eYzXAFY6U5am-VkyEHWHohfsYZMMkp8q87kW4iCjw>
    <xmx:ux8sZuskXWoL-rhmfidDjewRugy3dFnBgLqp3GfyreY22e9F-EZ9m7cL>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 17:42:15 -0400 (EDT)
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
Subject: [PATCH v5 4/4] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Date: Sat, 27 Apr 2024 09:35:14 +1200
Message-ID: <20240426213505.69273-14-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426213505.69273-5-ryan@testtoast.com>
References: <20240426213505.69273-5-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port to
the RG35XX-Plus, and has a horizontal form factor.

Enabled in this DTS:
- Thumbsticks
- Second USB port

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changelog v1..v2:
- Update copyright
- Spaces -> Tabs
- Add GP ADC joystick axes and mux [1]
- Add EHCI/OHCI1 for second USB port and add vbus supply

Changelog v2..v3:
- Add DTB to Makefile
- Remove USB vbus supply
- Remove GPADC joysticks until required patches land [1]
- Move thumbsticks into existing gpio gamepad node
- Move changelog and links below fold-line

Changelog v3..v4:
- Remove redundant USB OTG and PHY nodes.

Changelog v4..v5:
- Remove empty line.

[1]: https://lore.kernel.org/linux-sunxi/20240417170423.20640-1-macroalpha82@gmail.com/T/#t

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 4217328b1889..c2c871d8b71e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -49,3 +49,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
new file mode 100644
index 000000000000..63036256917f
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -0,0 +1,36 @@
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
+};
+
+&gpio_keys_gamepad {
+	button-thumbl {
+		label = "GPIO Thumb Left";
+		gpios = <&pio 4 8 GPIO_ACTIVE_LOW>; /* PE8 */
+		linux,input-type = <EV_KEY>;
+		linux,code = <BTN_THUMBL>;
+	};
+
+	button-thumbr {
+		label = "GPIO Thumb Right";
+		gpios = <&pio 4 9 GPIO_ACTIVE_LOW>; /* PE9 */
+		linux,input-type = <EV_KEY>;
+		linux,code = <BTN_THUMBR>;
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
-- 
2.44.0

