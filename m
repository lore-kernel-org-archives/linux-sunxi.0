Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FE6482D8
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216018; cv=none; b=SlXn2IGSYirSYkeoyDIFtYqhsFAYUtqqp180K+1jxYO7LeU/9tIlTnmo81Xxurdpjhd5D8BugJIqRW6D+CJgS22/69i08ZX46cpJH1D2OlYXz6Piay8r185wIu3rGnKEsdkqaIlFi+RNvQnwvF25APZpM7PcRL47G2mosdMZYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216018; c=relaxed/simple;
	bh=fdnynBB7gTBHRy1V35JHx+dSspzWoejQL/R4WcC7bf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUVMFd4tRRihNICnSfHp2T17TBKyCZ4yLOwzBFdyyFkfFyjS30fjYHYlJYKgIsfLa2v+BXD9+SDXTDsIxZu5J3gUDT4RJVwFjh9zr0QRxw6Z6OAQac79ThS0lI2N8BEU0gyDflMsELjnKKdKYe6QVUH+Z7/jl6o1JE9WHzOg53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=BSVIVIcS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AJU6A/tf; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="BSVIVIcS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AJU6A/tf"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 55E0213800E8;
	Sat, 27 Apr 2024 07:06:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 27 Apr 2024 07:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714216016; x=
	1714302416; bh=97C0vLSBI2B2TQFO45snXmZYrerkHt80unosa9/oom4=; b=B
	SVIVIcS1QwJhrshE8cZQyHrIq1jSJBYa6jls8/INH/EG/YGB8HwUAyT+NDPM/O8v
	0fXNFaoOUcaxFOogPNYTH9bfEBgUvhTTQEfBRl7Owlj9R5JY4luaplaWo9xNpNIC
	yiUw4rTw3CUfue1c0ShNxVld+Zgvb8/TrEtR0edJ/RNWBY2smggOMAfw87XHdPWC
	JJTMNA/WQfWjmB/E6ZX7XiXr4ehHtXiXqw7ZsiwYfrP2Sad03u1iBL90Oucuf4Z/
	axGuWVhSXXBWoX1ABzH4hc5u4FzhgvER6ng6FmPjNCvGczuMYzUK4N2B1okQEOI2
	Z3jyS/OLKqmVUaddUAxuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714216016; x=
	1714302416; bh=97C0vLSBI2B2TQFO45snXmZYrerkHt80unosa9/oom4=; b=A
	JU6A/tf0RwduVjfRVlQdGZTPbDGrqSMkY3NA4zpv4Qb9JlLD92h8Pw6hcf7gPUxa
	QUDtodXX1TkEGZO2NzLlFAgI5uguc/0EDdVUBZWG+m0dIogGnbgAEU2cQvD1pdfn
	7xSbzkZ/7ox1qInqBcGxo2BLo1wJAdLV9gkPUuSvbLsNl7BSELn6DQUB5+tFxuWc
	i+vugX5lHcKZiqkDU8JOnWi6/895lhQATEgXrbZCiDQj6p5sHHPTHNP0iQ7YRfWJ
	p/UjDVh95Q6CAFqNF3eXkbTSHw2vT3nkukh5rP20u8rdcukky2KGrPwQofHaNLZ5
	vvKH5Fd9NbnweKdqUejLA==
X-ME-Sender: <xms:UNwsZgO0PFSutIj-fB2tXxK-Of-yUatlpsBYp1VjmmDM7VQ6U-6Fiw>
    <xme:UNwsZm9zTTy4oYptu3p2tauPtePi4Io2YTcSV2V32QKOjK01BF0-mOvU0n_IVSceo
    dVfmuZDVOecdbX92A>
X-ME-Received: <xmr:UNwsZnQ4ZOYACSHxavKKimIRM1G0tYhuaCCU6dFwvu-rR5fUy_Xkm_uNZknS6uIpHawj22jzBTSMxzdUf3FrTSKaEbwXlYrZPwejlZKD553axon5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtuddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:UNwsZoutNwulYuDKAu07tLFZq4vNKbU5ipMwwdeZq_HY-QjQSZxAOg>
    <xmx:UNwsZoeKB4_aKSsrQkFPNk_plrM-8WEbcY05US_eXMbChag_-T70sg>
    <xmx:UNwsZs3hBfRG0dRy-c1S_r8wRF0YF7ueHifZSWVlnyd2c_I24COcpA>
    <xmx:UNwsZs_j-JCVpPxpzQgc7_QVGSIwLQeBOMYfWDEilWw6cOUFK2oJJg>
    <xmx:UNwsZs0BvHDzY3nV6IB8F27W-YtQ-2iFXtCD4JveSwnImRILXrDmVOju>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 07:06:52 -0400 (EDT)
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
Subject: [PATCH v6 4/4] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Date: Sat, 27 Apr 2024 23:02:28 +1200
Message-ID: <20240427110225.727472-8-ryan@testtoast.com>
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

