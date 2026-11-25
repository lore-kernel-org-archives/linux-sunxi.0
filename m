Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612017;
	b=BXjVj0MHGuPHln36ImISaSuU/nuX5DiUmuUsAm3t7zrPiB69V+V7/iWQ8OnZ84rR0f17
	 +ePYUVb6GYDzwLqGNlsi0R5kbGCdnjSAc4K2/JpuSqAEs2fChmfXVXAKSN2IMQmuUQ5u2
	 7U+B9rZczOXc+INuuQ6rollqpCh4a4IbQEJ+72nQj+/A+UBZk11u4FkhAglFG0eAS4C02
	 t4+qXUxj0uMYA4E13osADklrFB6GhC8sXPsXOnHSGU3UeSKBu//3o0C9KQg0D/OgbLfd8
	 rrj+BjBqwIAEE66P2t4u3gWSXCLlsJqEQggnDVvMNtB/v7E1n/n/pPbZDwROx8YeLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612017;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vF8ClDyYjBjfdosScJT3agBtoqapkEK4lyeehSTezSo=;
	b=pE4ZnREDdYgtATE728I70KJPv0S/9+icGLYgX1G6ak9bg0Z/VKyFeogUuNN2rzrFIXp7
	 mNw9gSI7YwRbFC1HtXJM+NggonhXXUNs5BmLNloAIQezWZWZvhOoHBLsb83NgIl5ImyTR
	 ZEEn/RjQ+TtGUW1TofCceSviI5dTWhQsHqyGf6uvaNpk0mBkjlAK1zQc/h1LahCGfuyRC
	 84LzV5m3jfNVGuYqnJPtp4ocJdF95iU+no1Dbz26BewdGR0uQlfKSC+vJ9LehCC7oXluD
	 9f42MuOUVqyhCz7GQjjUWqZKp31vFVx24j8lhO+ye9ub2V0J4xOsTxP0nA3EXisKO0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=0YpT2Pos;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572E606A329
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 13:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7572E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=0YpT2Pos
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 0989A4C952;
	Thu, 26 Nov 2026 00:06:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795612007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vF8ClDyYjBjfdosScJT3agBtoqapkEK4lyeehSTezSo=;
	b=0YpT2PoswEmtMtzXIQHKBbfwznS8rA/bcBZnXH1dS3SgTlVoeXAT7wkok7kJYHjbU88r0Z
	U8gWkWZqr8WI0EKDwJZkh8P9WuZpTyIKsILk4904btT3b9LBJJrNZpYJi/DRF13i3Gm1jt
	0eN1r+2+umek4jgYgZoqHAYobzl6eAC89kf+9/F+GruYW8CqhT3fd64hg4/XADxRQjkNTx
	J0BH6a9YMDCr8Lr16Mn3LTR+7Tfmwrrbur1KYzUxXIMerYelwpg/UwTKP8aGeZUBnwhfKo
	9FkDBbWxyzo8YkfTgeIqHqKIfSD1s5HAUeMS6ysWLMVNB8FDILuNTcuYe429Qg==
X-GPT-Reason: legitimate. The email content is a technical software
	patch (kernel/device tree) clearly related to the sender's domain
	(d-silva.org) and the recipient's mailbox (alastair@d-silva.org).
	There are no signs of marketing, phishing, or urgency; it contains
	specific hardware parameters (GMAC0, PHY-side delays, clock frequencies)
	consistent with an engineering or development workflow. No suspicious
	URLs were found and the sender identity is consistent across the
	From and Signed-off-by fields.
From: Alastair D'Silva <alastair@d-silva.org>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 5/5] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable GMAC0 Ethernet
Date: Thu, 26 Nov 2026 00:06:13 +1100
Message-ID: <20261125130613.4191841-6-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125130613.4191841-1-alastair@d-silva.org>
References: <20261125130613.4191841-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi 4 Pro connects A733 GMAC0 to a Motorcomm YT8531 Gigabit
PHY over RGMII without PCB trace delays. Use phy-mode = "rgmii" rather
than "rgmii-id" so PHY-side delays stay disabled and the MAC applies the
calibrated TX (2160 ps) and RX (3780 ps) delays directly. Because
mainline motorcomm.c disables CLK_OUT unless requested, specify
motorcomm,clk-out-frequency-hz = <125000000> to provide the external
GMII TX clock while CLK_GMAC0_PHY supplies the 25 MHz PHY reference.

Enable GMAC0 with its reset GPIO and 3.3V reg_swout1/reg_swout2
supplies.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index df70967264ed..26f97318b842 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "xunlong,orangepi-4-pro", "allwinner,sun60i-a733";
 
 	aliases {
+		ethernet0 = &gmac0;
 		serial0 = &uart0;
 	};
 
@@ -27,6 +28,29 @@ memory@40000000 {
 	};
 };
 
+&gmac0 {
+	assigned-clocks = <&ccu CLK_GMAC0_PHY>;
+	assigned-clock-rates = <25000000>;
+	phy-mode = "rgmii"; /* MAC applies TX and RX delays */
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_swout1>;
+	tx-internal-delay-ps = <2160>;
+	rx-internal-delay-ps = <3780>;
+	status = "okay";
+};
+
+&mdio0 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		clocks = <&ccu CLK_GMAC0_PHY>;
+		motorcomm,clk-out-frequency-hz = <125000000>;
+		reset-gpios = <&pio 7 16 GPIO_ACTIVE_LOW>; /* PH16 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dldo1>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
@@ -34,6 +58,10 @@ &mmc0 {
 	status = "okay";
 };
 
+&pio {
+	vcc-ph-supply = <&reg_swout2>;
+};
+
 &r_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_i2c0_pins>;
-- 
2.53.0

