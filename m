Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761870;
	b=DyAR7eWO8o1RG83wqdswysN7ldnAcTEwc2UbUpsj2W870JueWQPT6/iYGeepIHsFzdHx
	 SVoRies7SK35okFY2Ima1vQbPROzv78gOeVON4Qrt/rptlMgwYnWaYMVjMpccy2CqGZ7R
	 Ffj+wmmiDKJdtR7S72mPzrb3MRq+fY6v6vAzNxUGlTE+QN2e2sWwHbUaUibhI0ZBmXY1T
	 CGI1yAW9VkRZQsDRI9zawjc6RZBqKhcPtvdLyK9SkIPlmFVOCl05oZyAAbRwyQPde0Y9s
	 PeLg99aIefvsxoeU2MfpUZgTwRQUqQR+2lJsdgZJSGEPYK69AoY3PYEAQg+bsVJZJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761870;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k3KnFF+jQuMamSCMGRM4IiQplf2ksxu6lK+S7xvE/bE=;
	b=toYxQyBfXQO0h3+gVNQQLrrAMvY5JwUeqSmzLcbsa6z2GjEFxC2v/jUaApoZ+qPWZ5OT
	 EmdgoGAXdd5sAa5Gec9K5/mpzVwRZ0WuVLa+Qo6pL1wDqAQ9G4JPvq9UZTHujYMlNzkUa
	 DTHRuxxN95q4rrUlf28c6nPVuWuNKqamIT6NftFnlxrdSOcXrKVPNcjjIltlIpcwrzL92
	 +1LukCkbTUVGb3aNrgFDSwhg+tBu+grXS4d8G25qUO10Pb3P1/9yUzARYabg3NpFQ86np
	 24rVr+XdpYFyOkiGlMvlHdq+aIfxRkQTeldJUcv9DbRm1rrzZE+xZqnHYZB26jKQB1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=tQv692Ii;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA46606A326
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA46606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=tQv692Ii
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A439E4C94C;
	Fri, 27 Nov 2026 17:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3KnFF+jQuMamSCMGRM4IiQplf2ksxu6lK+S7xvE/bE=;
	b=tQv692IiFOuy8Kf1yAEFScRgiuExVeO67dldVyYPJrCyDhthgPchtpKsRs7XjAamsIUgjX
	fp6E3dR88Zgyr100OkD7XrgplKwSvjqFooEzyoJL7uIC4fRd6Xfw68+53EoQxFt2hc1oIZ
	PRLbo3tMxe3gJiftDVpSwePELvvolyZzfJ3LBGO7JbohGbK0pdr1bjRoKDuDqU6IAswc58
	e7J7HE/ZLptNf+lObCLP9yZhAiATmWlnvBm9fgVPaLVKmaHMgJJBWsB/gd8HrBlyQVBP6i
	5rcrG3ujeTcMFw3wupZOPCGYB6jxrYtWvUVKCB478oozqJfRTbXv6sS9lquVzg==
X-GPT-Reason: This is a legitimate personal/technical communication.
	The mailbox (alastair@d-silva.org) matches the sender's identity
	(alastair@d-silva.org) perfectly, and the content is a standard
	Linux kernel-style patch for an "Orange Pi" hardware device. There
	are no signs of phishing, no external links, no urgency/scare tactics,
	and the technical nature of the "arm64: dts" subject line is consistent
	with developer activity.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable SPI0 NOR flash
Date: Fri, 27 Nov 2026 17:44:08 +1100
Message-ID: <20261127064408.1344250-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127064408.1344250-1-alastair@d-silva.org>
References: <20261127064408.1344250-1-alastair@d-silva.org>
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

Enable the SPI0 controller and onboard JEDEC SPI NOR flash on Orange
Pi 4 Pro, supplied by AXP318W BLDO1 (1.8 V).

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index df70967264ed..92f31bf9f64d 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -34,6 +34,10 @@ &mmc0 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_bldo1>;
+};
+
 &r_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_i2c0_pins>;
@@ -56,6 +60,13 @@ reg_dcdc2: dcdc2 {
 				regulator-boot-on;
 			};
 
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-1v8-io";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
 			reg_dldo1: dldo1 {
 				regulator-name = "vcc-sd";
 				regulator-min-microvolt = <3300000>;
@@ -76,6 +87,19 @@ reg_swout2: swout2 {
 	};
 };
 
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		vcc-supply = <&reg_bldo1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.53.0

