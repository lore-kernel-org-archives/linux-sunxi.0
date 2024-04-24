Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DA1598E7
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957209; cv=none; b=fqcpnDQCip10shJTSVeVFvsJWYfa4Vi/ucQUmqtDsHxWfbdYUSjoNbHHZLBMuJSNiYFP3UI2FughgVVGoQ+YxtAMKAhk5QfdimqKIDk0/LttR46b/ZFexNfwinHmVFscsvBrS8HjscoPVEL9QbxBd9kJ5Bk80t5x7U31LKloQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957209; c=relaxed/simple;
	bh=kw2vMaX1ZUuMTVvFVOwhlwIWPQOSEFxjvq47tC9URic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTTxjYPx8y/ib62Lf0RXBTclES6MlSoIuvpJMTR6lj+oCpPAyEoEYItIBuVbwEIjGKV10k2xBiGmq4cSW/MbneiFM0dBS+YX26dPjnaaLBVPVStsaN6KK4a8bWDCp7KHgmhAiHGwj5W8nfSkczJxBwXXF1u4sAYtHvOPHxxA3dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=QxqdGQ3c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GZd3dQYG; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="QxqdGQ3c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GZd3dQYG"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A6B3A11400E1;
	Wed, 24 Apr 2024 07:13:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 24 Apr 2024 07:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713957207; x=
	1714043607; bh=vYYN4qahC1ybtAHe6uYJ6nvepaqypAGfYCtqK0iimEg=; b=Q
	xqdGQ3c+HiDnoiHLb3cg6bL2H+rP85Z+PiFzLz6dnjPFg5s0dxROPUezK5YeZyCb
	NI9l/VdQmj4OFdg40W3LHLycY+Z44sgRj13I4j8COv79dbUQrIG5Uz1EGwGJYjgo
	NQxo59NVhzbM8JQd0BebvAVdfEd5cyYFsjxvO+jj4RuWCxC8/Bja6+XZsvB/sFGq
	H2V5ond/hR8NZ/FY+WG2FfNRbfTHImoRD4sSVH21ChMCgOlvMdS8IZVj8YZWOTra
	fqM8pp2LlfCoXqQg4NPoxm5JefwYslkP/eTM0iU2po2pbx1cGR7ZaEFjrwktfnGj
	nUf6hCAH8EwR0/5DQifag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713957207; x=
	1714043607; bh=vYYN4qahC1ybtAHe6uYJ6nvepaqypAGfYCtqK0iimEg=; b=G
	Zd3dQYGh6/KPrG3bKVYAyZJwsjHqAGQXU0faqOnc2wLXyLriajyiTD9Xgm2DxQzJ
	GzwMV6mShDLf2k73jdPq7uALJqrNrITDXmbjDios287VLK7/yHJJhFKwiEeLwC8/
	pnRkn99Z6p2SuHa61wz8ge2vkViabprHhTqzZ10lx6bDpytsbggyBN4o1U+7bYQ7
	c3zFZ1wFI6vIxrWU9eJ6yisSaJTe7uN1+RLPTOonFpiubPQCqt+Bks7ZxcDslJu3
	kZZmsIfMSKw+9Sv1EASK0sX5Fr5cqHgXEibk/Uzf5lWIDzxeGpAN0SG0hNrzD9pk
	uE/z4NGD60iJ7T77ALT0w==
X-ME-Sender: <xms:V-koZmpU-vpWQpjb7hPblx3RJapZmQJpTAG8rAprp3C78JxbbUEYHA>
    <xme:V-koZkpJG8qkS-VOACSYYfwUI53DOmTt4SJej_9GZ5t_9m_7SUtWxsHfD3fS6iQ_a
    xEnAtWsteb6PPtLlg>
X-ME-Received: <xmr:V-koZrMID0U6OEkdIQNgR-HOjmMm1wNYV1ruglplRbfZfkiDlhZiGQgDFaizgNbjWNhrWrfl07ooNDQKoEUe5i5xO3EaQvIB3ulUMM7aI4fp1K0H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelgedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:V-koZl7yHm0kTSs26NeS90uzj7iAXb3Aiehld5S-7jrJipX6h1eLRg>
    <xmx:V-koZl5q2XJdcT4Xw7VKDyVhKyvQxXibknn5Na2sz8IU6G5PuUdppg>
    <xmx:V-koZlhasU-jMaf6wmEGYETbLGWsdrGpCc7HMxhUhReT7ul9o2ETiA>
    <xmx:V-koZv4YbFEdK99Re3vzDkNwcHKW0YAy5uVslfnhDI1SwmofN_f20w>
    <xmx:V-koZhizMs2U-PPvhV_cQbkCwYv25Hq5ZcShmZnxuybTSlpLTHBhkrlv>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Apr 2024 07:13:24 -0400 (EDT)
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
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Date: Wed, 24 Apr 2024 23:09:47 +1200
Message-ID: <20240424110947.9057-5-ryan@testtoast.com>
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

The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port to the RG35XX-Plus, and has a horizontal form factor.

Enabled in this DTS:
- Thumbsticks
- Second USB port

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
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

[1]: https://lore.kernel.org/linux-sunxi/20240417170423.20640-1-macroalpha82@gmail.com/T/#t

---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
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
index 000000000000..3f4435ff9b71
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -0,0 +1,46 @@
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
+
+&usbotg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.44.0

