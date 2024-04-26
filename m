Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125413FD8A
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125227; cv=none; b=XhwDmFyOzUxtpFb5gqdAFytd1owwnOABb8DaR3FK1vtzU8jIwL9t7rLGyhtGKNVOflRBYT1/QXgrpLggDIXcm9txD6XSALtcXIUUhRrtwWUTBWquo+l0td4zWyCqk8xSrayhEsv2QubgOIh0vae1xoq10qk6Uvw4pc0mBL4yNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125227; c=relaxed/simple;
	bh=W5v2Fbnmeb3oYapw1GbAmXBUybnkEa2yBoBJ55T+qzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jykeH5qweF9/8H4f73w6Nr2MVEnXM0joIYGYH/lzvckNo9CLMXLMmzuP3ClfB6AN4L2S69vxZ0zCjhu7g4gOAqIHt7Bwb2EIYpb/mH0gcnA19+m5bEVhBHEWBHjebUGirBk+7PtSfJG1tourN2xPTMxdGTg7x0Cw5+JtmK0y/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ZQkz0Vqn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A7C4BX3t; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ZQkz0Vqn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A7C4BX3t"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id EBDB3138197D;
	Fri, 26 Apr 2024 05:53:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 26 Apr 2024 05:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714125224; x=
	1714211624; bh=yUrou0lZVWRqImzMa9lWK7pQpNJ03bYKor+gmE6axpo=; b=Z
	Qkz0VqncFi3DITDx7CcCIcbOHwLleg/iZi6GJDrFYaJWaDn0UHxteNz4eljYS+NB
	uj7iiC+CrcLW+BhCCPGO2g+Xn16G6n/6wmElF2mh+Z9EFdvQxDwfM6XjKtWRJj+T
	iHT9i6UxSlh4w9rKPi2G0yBw/dSYSrkWpmhgKMolRESkC80zZV4l0inqrnfL8xQp
	ZHblwBcuMUCh28KRyjdHZtDX//X5qIgqvxdxBA5zyGUol3jINKJzGDIXRl1u5yuK
	rXmKRukAxDItXVDe6IK0GSqCCQ3ChTlfOyHvni9re+0vj1RBUxAw0VFvi6IzjA9a
	AZHTp4+z4rNNEUHe8qG+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714125224; x=
	1714211624; bh=yUrou0lZVWRqImzMa9lWK7pQpNJ03bYKor+gmE6axpo=; b=A
	7C4BX3tsKtUILeQ6PrYDujs2E7IHXoISqCbHjFYXcU3Iw+Zi6o68SvcojEqoE1rA
	gNY3vSmKs4zNkiVxogJ6m1qc5tKvaJz/WfqEfu/IP42kDFs4jyWaxoWT6gUeyCpH
	CNPJNkNZ4v7F2zByzGn4d8MTiSAqICpITGqh4bZgFVYoX4ykb6RitWXTMs0IJcAp
	pEfwJxceaNrMP8fJq3pnIvgKgNRkK9F10gM/56W5wll5WpoLi9NLqHnTaUqGW40u
	4VsN+uWBaCHcv3MNq9KRjiJ2AiH2QDeKwB7GnMIqsDUCeYLx+QxXIFt1Q/ERq+eA
	X11HlUa9g+uipUdiyrRPA==
X-ME-Sender: <xms:qHkrZiABoHzAZRmSpjwuweeZebLI8N3w-rm9DiofgccnJyD2FqoSdQ>
    <xme:qHkrZshWmeIMcnpZtQ8Yg0AruAy_B6wUuHxhlsPJlCZATVdWXKVCkFFXCuovpTrUz
    cuWAi9PR8C34JoQAg>
X-ME-Received: <xmr:qHkrZln7AadYBnKc4l3BHR41K4c3cT5LDUNOkDQd96FX_P7lVue5EyIVL3jP1QzOkYideG8kl9JgnallFutOInBtdaILFQIxNMVboMJATug4IjQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:qHkrZgxnmQy-UPYN1CIScQNI-p78nodTE_WJeJFAh-SzNgbn2Q9r7w>
    <xmx:qHkrZnRsOdPr3vi0i8SE1EigbRaoIVY7vEUWyp6fjs1AMCf8IRPUJg>
    <xmx:qHkrZrYBupoKzyRflXJeg2oWaURUTJx2c89wLRBAxRyp1_0Kihz0kA>
    <xmx:qHkrZgTQIdlpfSVrHH-o4o3LVVtM-k2KUvFyjj9P9K3Ovd-0t-opBg>
    <xmx:qHkrZvbtSwKc_4_PD_7mGIuh8UUQPlDRDMBWVErCYicfenfEIay95Xhf>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 05:53:41 -0400 (EDT)
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
Subject: [PATCH v4 4/4] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Date: Fri, 26 Apr 2024 21:51:42 +1200
Message-ID: <20240426095141.13602-6-ryan@testtoast.com>
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

The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port to the RG35XX-Plus, and has a horizontal form factor.

Enabled in this DTS:
- Thumbsticks
- Second USB port

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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

[1]: https://lore.kernel.org/linux-sunxi/20240417170423.20640-1-macroalpha82@gmail.com/T/#t

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
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
index 000000000000..fd581360e987
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -0,0 +1,37 @@
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
+
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

