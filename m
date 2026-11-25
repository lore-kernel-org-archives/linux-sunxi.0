Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637386;
	b=u3KP/4gCQ37pVzxrl+iERNlP+0cj/DEcpkL13BUOM+hVKNa21qExZuYCD2V4rORDQjN5
	 wMsJAr7tDmEFO94AezdcN3Pgr+Vk77INQitxcXm3pnaWA9klVWMU4AXljie/ajNv3YkVk
	 lZ6kixyJScs8AQJmLs4F7NVBZ+2QCbvWOdDkZgKhihbNJBd/ITsg4AoyJO4zvzJ3SAyE/
	 JTTkQ23lRk38TQXc6mmxfoqHy8ksMTQYbuBLWg0cLK54J0U/MXps6TWLkZ9lJzgo3NGcR
	 X8p0tzF9Gaw+bX1GJ2r19m3a72tLIguxQaIaa8pDVSi7/3/34XyAjUaIe9c8gYTKq9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637386;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XOx6J9QHFAsKuOFnB4I4H6oCEUTT94WpnmLj3jkDPUY=;
	b=xG2SG4MqMCcnk6OdMbEZUwR27hxH3dUXFki1N2WVC5qCvEz4FQ+vHbAkWRAewbGpynA8
	 5qaKWgAaw2peD0zxpC7Dk1dLXxuS1togZ/GKzNzH10bZvzd3BQ1acqCh6GOUW9D1NKegt
	 /SGe4Sv/YzLkYr0UdhAnKFB21h3j7AduP/HOcyGqsCKQsnVvwN0OfqwAnpqesfSecg+QJ
	 oX1nKxmXZ+Z79R0VtR2sB+sinv8zqZG7+SzaCNvosevgNLskWCit+vq5Jm7eh+612M1bU
	 kpk8tLzDCiWErhaz0sA4eJ/8zvzrVpfYV5nMZSSG3T5ZNjKUkX6tfXTD+Ynwks4Q4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=x6VOEvq3;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A175606A31E
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 20:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A175606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=x6VOEvq3
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 1A1E540963;
	Thu, 26 Nov 2026 07:09:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795637379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOx6J9QHFAsKuOFnB4I4H6oCEUTT94WpnmLj3jkDPUY=;
	b=x6VOEvq3go3JNLHycFLj8+pWhe1zzcCpy8ZNCLGJcUkTm6vYc7who2oEtZsTWDr8U2TpHZ
	5NiFqIVyyHXMRNk9ZrNKoMaa25jFz8bI2T8HOumIO5b767nPr9cI5kfT45fDJqfknM/OkQ
	E3LBhThNBwkkr0hkpwtJHZy2GZ+zxUwYxcOEG6owU3xG+X0OwO2G1bbHkFAGirXZJYodh4
	Q6tq//JyZPd7sfZ888ZeAufpxPBTqBUlehLnuEbuCMZm0R/RpYbRAlrxvYDcAojYl0UNMG
	3YMB6sXktGH1YlgPqvp1GmoYGw+d64MIlfAcNNjlR7NjWjhZ+jmztZugwlcw4Q==
X-GPT-Reason: legitimate; this is a technical commit message or
	patch notification related to Linux kernel/hardware development;
	the mailbox (alastair@d-silva.org) matches the sender (alastair@d-silva.org);
	the content is a specific technical update regarding SPI0 NOR
	flash for Orange Pi 4 Pro hardware; there are no phishing indicators,
	urgency tactics, or suspicious links.
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
Subject: [PATCH 2/2] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable SPI0 NOR flash
Date: Thu, 26 Nov 2026 07:09:27 +1100
Message-ID: <20261125200927.515136-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125200927.515136-1-alastair@d-silva.org>
References: <20261125200927.515136-1-alastair@d-silva.org>
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

Assisted-by: LLM
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

