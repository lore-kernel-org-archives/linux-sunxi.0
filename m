Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837AD3ACF0B
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161085; cv=none; b=aiZWilAyeD5u4i+M53e4AEvD2IallU/uReVJNUWmNPxQFmwjm0mb8XOjItLbiGaCRMu3DRhpcjF591Mjnn083mqZpnpzAplZdiQM2eR6/eVIUjKuG5Huw5KV33iDe0Wob8w4L12oqtKVUzOWM3AMtZVm64IzR8HxEcMmipv8Njc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161085; c=relaxed/simple;
	bh=VkwdKB+MXQWKmoYFPDHYwms7Ci1KdIZEugREExK9jsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAGlQTula6vAM88Mkc0yYhwtgqNb9GxqQkMnTETKkcIZwckHTCUVES8K7lPrB5gqUZFrJ05grOUI4c3fpgTU9/soF+oCawDaWWhOlrXlDG7XvZqOsZn6Crcincy6j7UeCCWFu8jH+KdNQL4P76lvp8olfQw0j2qh58eoJlg6CGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4vlUOnA; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4vlUOnA"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso605937e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161077; x=1790765877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=;
        b=k4vlUOnAd/xYxdjSUr+YCRxqawMp3XFSqiLWLX4bPGRIpMFZZvOPPEpBqra/xtvhGj
         8Qe2h6d1sPRqN8QgWmkX+8Kli2iMzF4pzvLNwaeIgSTqYKV5hnkcqftrV70ihW3rvoIm
         Sel7oXaFeZnBycRUI+AixukcuVw7hp2o1AQLVnN5ck9tWmKE+5ZD3XT+7v90oyzuXgka
         uQvzV2V9XU7roDe0/oU+aBEl6TjUSWNzfXV5xLT8/JVY3pprEHi3YGrhPRZgHCvT4L8Q
         +orMf72Q7/xpb9dkQ3m5274gQR7VGQxcpn+z5e/RGURiV/3+dEOAs1wYywRnab6QFDqe
         HS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161077; x=1790765877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=;
        b=1UX5EmRlV2PXvnNqI8sL3BQr8nBo0gh/DsQacvfgOxr9kfRDkG6ftXaOTo10tcl7J5
         smKkwYhaxOnNbsaXljueCIiImaeHm0th4T5sLFFXakXfxX3ydYXQUHgE7g1V4c3qF75k
         Jzy0mdIlyaVFIZq+cyqL8fHB8JWeh0mWcDFogoBpZqrmfPyhBAW7A+CE8nhHM2lXJfrc
         iX+gsL11tMoK8gnephlTzha8Ekg4MVimLFJy2tqfTef9TKctO8MUa1f50ALjRkPdBPeQ
         l53rWcBqvFA6UmdAnIOjLBx6KBoIw/njYy7MOWepDepgFl9GBrpFrsloE6ZnCmY27djj
         8w+Q==
X-Gm-Message-State: AFuF++m2LlZKQUbYlGsN9lczMpjLhVebzHHCS72+3bbjHfoovXzhhXv6
	+503Orq8RLfiGNT3+1ij5LOd4vTCnBFKcit9Z/e0Yf/O0plrS+pfsigU
X-Gm-Gg: AYBFou0XQcMSgPaNmjEZj9WU028xNFws3WsRqqkqMWAGJrhatcdnzsGkm1FcoCSy/9c
	SSdU6LBRMmqEGsfweUGuiL905lqTkWEBGwr39nnrNrb+9ikGeqYbCBiDMN4LfW3GXvxrmhvtp/w
	JwD/IDNDz/F30O8L1gtJb7BRAIVIIwMzFGlzoc8QRlyAi/B6fJmF8WBoAeY/is9Dx0VE2NCtcuX
	XC3cD//HwV5Ln0yj4O7COBE9tTCKfCyPgggSWVLug94ApyMDbvbcUso2dzV9AF1AN/YmjSLJRW/
	qzOpPRcXXcxlQGIjdmywM/wy6aGDxGnvLSC8cEBGJ817WN9WchV6WZtb8Mc6+YdclockwyylLKm
	E48ESNI86c2lB6nADNnJ/3A7f01RB0QaHvVW2BXri8WZVN2EoW5bKlQBQki5/XSJVT72QGX8a+R
	gSBGAZV+mAeCafUrPPPbofCZenc6VY7n77oUaCTkyXIDugYM/Ec5xzxoloTqzZ2RTFPn2yd+328
	0HQa8Gc9FNWKnRPUVk=
X-Received: by 2002:ac2:5696:0:b0:5b6:1a7c:59db with SMTP id 2adb3069b0e04-5b8d89c2a3dmr808727e87.53.1790161077408;
        Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm506392e87.17.2026.09.23.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 15:57:51 +0500
Message-ID: <20260923105751.435-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923105751.435-1-anykey196@gmail.com>
References: <20260923105751.435-1-anykey196@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index 1b690e3cd..3ec060228 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -218,3 +218,43 @@ button-1600 {
 &ir {
 	status = "okay";
 };
+
+/ {
+	reg_vcc33_wifi: vcc33-wifi {
+		/* Always-on 3.3V regulator for WiFi and BT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc33-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	reg_vcc_wifi_io: vcc-wifi-io {
+		/* Always-on 1.8V regulator for WiFi and BT IO */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc33_wifi>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc 1>;
+		clock-names = "osc32k-out";
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc33_wifi>;
+	vqmmc-supply = <&reg_vcc_wifi_io>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
-- 
2.53.0

