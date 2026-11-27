Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774138;
	b=X0h8d76L8D5t2lQSa9FbymBlpzmudAsPKFeihsurqHAIP45VcuWYctqAg93Z+I2o4Vfu
	 7s68CFp0Rv5i6MqqRAkQ/XuP96FEenN0BTggkn6xaH5SzqRaeWVxA4l+TKjxwnQIG/v1A
	 2HkDi7j5Hp3V3k39d9tUEfxgVkqO899fMWGlMMEusLOSIlaGp3phMJ+4+pEeAGRod73xq
	 FYaaWITXDWxYdT2qMMq6RUrVtIOWCwNhN8Eg1gzxU4sEQJXXnJ8xv1k0uyzy9umTesmgR
	 0/ny35Mn9k3RdOWEkiHo5UIwozV/xd+/kMn/34TBy/d/1qScRURKRIRtqrV+22icFvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774138;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gF3Bsu5rs/jn9aSqs3fra0yM0c4EjWfoKhWHUIYkMjg=;
	b=pBi3Kvr280IgrzRkpZfRhxlhIUqXSAAWjnTUwbqqf+QiKXfJEyhs3I08e3tqOzOLH71z
	 hJQrbK02AE5wHLufR3eUPEo6G2uWmmoFL6JiJEdLBAL9vmVVGkOYoSBG5vKgjtm1YVtur
	 Upb2QYrJe75xzOuHPjQZXKuh1gzu7cZjwpeHIc2c6ty/LiuxBvNSBmdB5fKqOBIlsG6ns
	 Ym6ygZjKAD37A7LEn88mLR0v65E0uFZNTi2X4Njl0gyiB4FeqpKfFy6aTEo6aeStrxA3a
	 L3syxDUdq2DK4jr8er/+fh1adIvk2LVH4VP/VMIObb218M2gtEL/GreJMQKKXKblqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="EOz/mUod";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E7606A32F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9E7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=EOz/mUod
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A1F614C987;
	Fri, 27 Nov 2026 21:08:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gF3Bsu5rs/jn9aSqs3fra0yM0c4EjWfoKhWHUIYkMjg=;
	b=EOz/mUodfEY7o5dFFJYYi5p8ug8dn2IdhwIKmhpxtkGSTseTYKrpUL7N+geZ/vwv1MFw6r
	bCRpUG2txoYUzBS0B7OCdzIgCydddEYhsxS1ARjeFOfye30e48PG8q+fLmHWsSjN747o/X
	9IZymWkexF3JlOGPfGf5MLqiwpLScRMOdnrQ0bUF84KV/Bb04Quqwm/7uptRkiKpQAPKeO
	cD2R2/IObc0Kg4XNRzeE5aI2n/YVrSCDBBQeMQu88tbqJCvcLsBufo53qgyiVzwVafYJTz
	iLHKK+RcUZj9tyAGzgm2S7qyfTKd1j7ysZepI3AdQ8luW5PPS5H4ZPVDpPCtcA==
X-GPT-Reason: This is a legitimate technical communication. The
	email is classified as personal/technical as the sender
	(alastair@d-silva.org) perfectly matches the intended recipient's
	mailbox (alastair@d-silva.org). The content is a specific, non-promotional
	Linux kernel patch description regarding hardware configuration
	(Allwinner sun60i-a733) which aligns with the technical nature
	of the domain. There are no phishing indicators, no external URLs,
	and no urgency or marketing tactics present.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 6/6] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 2.0 host
Date: Fri, 27 Nov 2026 21:08:08 +1100
Message-ID: <20261127100808.2292229-7-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
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

Add the 5V system supply and USB1 VBUS regulator (PB8), and enable usbphy,
ehci1, and ohci1 on the Xunlong OrangePi 4 Pro.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index 374287d962a8..327c996c7e7b 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -21,6 +21,28 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+		gpios = <&pio 1 8 GPIO_ACTIVE_HIGH>; /* PB8 */
+		enable-active-high;
+	};
+
+	reg_vcc5v: regulator-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ehci1 {
+	status = "okay";
 };
 
 &hosc {
@@ -36,6 +58,10 @@ &mmc0 {
 	status = "okay";
 };
 
+&ohci1 {
+	status = "okay";
+};
+
 &r_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_i2c0_pl_pins>;
@@ -73,3 +99,8 @@ &uart0 {
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
 };
+
+&usbphy {
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
-- 
2.53.0

