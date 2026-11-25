Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640760;
	b=KfYfYlA/t3gN7kQC7k2tmnASny1X7xsfxSQCdYWxncS8BbHwGAjkC2umSLMbDItN3UBP
	 fB+xpXUFiy2AiAkgLj3wctZEykpc5Whic/pEwmna1r+UeYiwm0oUSjMVw+kPi+VVDEQoT
	 th1dYoMdw+HcDn4b6t9yZQmt8gy2oP1YLROhvCR1VIRy4+bZdjKtsB1CWP/JixFb5ps7+
	 aHF5mZTvA0LwZ3i8oQulFTsIa7dRc1PwZLF69EXGIXiwVXAnaWqxd/GdmDvlEJDnARl3A
	 luX6yFTV3O6bbsKmeHgfS6qmI4KeNrn5IjLk8GuGm2j2vlxeunM3Byw6ukP88RKma0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640760;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gWjlCw2QTfox0g3HZN4BoH2IX2GuKXUdK1WzuqrVMY=;
	b=YO88SufQoFi7kqmwF79wgluRrllfCSbOB7Fmp9/IRnnCSZ4Nh+C8g7waMWModyEdpoYS
	 XEqnpWH4MhRcOLrJbHhqkzcciYUaKLnhNeYzyMMeHBqatmJZimaOjGSDvp5a0vjorMV7s
	 c4y9WlTkzYW+MNaKmN5YL6WIbCeIo7uEEmEi08rOaxjEYhgR9C2WEajVvIMnGnXBGCE+c
	 Mi/yMOMhQjiNqqOLYZ/JDU1bEu0GhScAaNgXZPEu5Vnsy2OsX+XahrJ1BdYS8nMHdYFzO
	 KN3Wdz2er5Fr2WOsR/Mob5kjpdGZk3YaPRuAWhw84ql1I+YlIYksTBy5Jz40ooCo+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=PaJhxzGc;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A35606A329
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 21:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A35606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=PaJhxzGc
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 152E34C963;
	Thu, 26 Nov 2026 08:05:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gWjlCw2QTfox0g3HZN4BoH2IX2GuKXUdK1WzuqrVMY=;
	b=PaJhxzGcXr8Ch81hdMGSPnW0TTTgkQsuIC0uqpn3u2c+fTVO3jgQoCJPEgB/zBra8B7YRH
	eNHCICrA9VYJRyl7dQDR5An3UE/VK3xkTGJjIOsGZ3PkVB2okGVqOMVsDqW5ScvWwmXSUf
	v/Gk86i2r2twKLRkOIkdZew3Y4ymLNo0CJpUw7rZY+zIzSgMfbvnxv7Anlm6y+ggtU0e1I
	32r/KBLiRhu4zOsK4ty+P5OT9Yg9K9SuqEScUY3gro7zGZazZ2YIY1nheX5e+oFe4qzXCa
	6OOdKdl3CKAyrozG1blmJUyquqVIYjscwBggTSVm7HW/Kqi578kHrJ2PsxA4sw==
X-GPT-Reason: legitimate personal/technical communication. The
	message is a technical patch description for a Linux kernel or
	hardware driver update, which aligns perfectly with the personal
	mailbox (alastair@d-silva.org) and the sender's identity
	(alastair@d-silva.org). There are no indicators of spam, such as
	urgency, marketing, or phishing, and the content is highly specific
	to software development (ARM64, dts, Allwinner SoC).
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 3/4] arm64: dts: allwinner: sun60i-a733: Add Crypto Engine node
Date: Thu, 26 Nov 2026 08:05:31 +1100
Message-ID: <20261125210532.695823-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125210532.695823-1-alastair@d-silva.org>
References: <20261125210532.695823-1-alastair@d-silva.org>
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

Add the Crypto Engine v5 node to the Allwinner A733 SoC dtsi.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index f4fff495e234..c15899ee0eec 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -241,6 +241,18 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		ce: crypto@4603000 {
+			compatible = "allwinner,sun60i-a733-crypto",
+				     "allwinner,sun55i-a523-crypto";
+			reg = <0x04603000 0x1000>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>,
+				 <&ccu CLK_MBUS_CE>, <&osc24M>;
+			clock-names = "bus", "mod", "ram", "trng";
+			resets = <&ccu RST_BUS_CE>;
+			status = "disabled";
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x1000>;
-- 
2.53.0

