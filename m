Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F35419FCC
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161665; cv=none; b=EbdvG6bOjhVQJQ+EPPEFf9HILmHwG1TXQOefPuIKV01VzyanL0J1wrEtn1Rn96N/nLdr1TUS1vpi4bgOLdavglrpVEGf+Tqou3v44blYVKQbAGUC/sxmFvfKzLx5MgTlxYJaw8sZHztMLKKfgbEIrm49UrStYqnW6NmaHemOl5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161665; c=relaxed/simple;
	bh=xtOAejtWejOvGymCLEMJYwRbC9yecCdHVku2MEZH2vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXJ24rycZRFB6uZl/Tb4xbkKHD1c9qJsTWh/zjMQQbthaXkY4rDsdho52lpjVpWxZd86gCD0fClrr8k87DKun/SAq7ji6/Ho6+14EGHDLgJ2OckTE+/mNFwPEY1drPoVeYjPjbXP6pPKenBgjyMav7BJNqRqIdw5sMwOoIZ9I7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYf/eW8m; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYf/eW8m"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c06eceso6564911fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161661; x=1790766461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=;
        b=GYf/eW8mzlLv2LXehkZwRZduix5/VfiFf3iAmcENAHGskNi97MkpUf1GhTgT6kjJdb
         xKBR/1/SeOqNUt9bOQTx7j5eOVAQRKkZi0YEDLz2DlU/x3hqOppk9MeYG3u3j8prCxAm
         SEd4UVxCCTCI9eBR6N/fyz0iewyNbDdE2LhW3V+8uSu+QaY+1tMJDGUniJJuoniIx5Rn
         APJnTYoG7tQnW384N+sl2Zg7uY1B06rlBrdvB0Ku4AUlHrTQUkLJt7nVRfIJwQKA+nsF
         N27emIp0QbHGgz5R0YNduPd+/Y+9Gx5n6lnFXeAHazrJBhUzH0QyEqxlvqoT1egk/8dt
         pTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161661; x=1790766461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=;
        b=Gl/puL6qP37CYnXZyJVMC/kZMPK781EbSiOCwzT671wq1MPv6Xn8IW/xteweno8A7o
         wl3TWmrVTrdWIxepgNQ93o1wNOIsIthCN30XtRZXLpr48BTVaRC+bb23Nmz6x1GfprUr
         wB8qddY4zFIbcuUnTR75R2vbjPlBy1+r4nZhzdxCHdHxIrL7YfGcBXyJjPl0z/8ZV5OQ
         dducsK3IY6vxWMLFeV1LEcFY0xV9o8UVthA8inELFHDp6V4DZgWhbh9vlYZmrmwG0CdX
         IMapVGrdOkRYHk8lmNrPlRqyqtOm0eRoS0g7HGkGcS7HVkfTE8n54SNIpjsy2CcXKtaX
         /3Sw==
X-Gm-Message-State: AFuF++mrQB8bU3c/21hysl9ZvtQVR/MmEvWsENfaxAdQNJ3EXYu09Gyj
	XtjVQVIBXiZOG7NWlL+6AFSOPjdzUfWsheilUpft3Dcm+0BjlIfivJPw
X-Gm-Gg: AYBFou2nu8eb2ypASRKcmNkxiUEfLtWtbCHgIdJhdsMHim+/L6k6m7QE/QcVrTj4npX
	b6Qcsr6XDG7Ns8Up0V3i1JBRuMzTyuvQkppzExqleLtu8W8g9PG9iQ1Q2Nm/Xy2tEo4/EnwvdF1
	SUcKHfEyczBgvlVid3TJHavP3q7gZXhsMAjZc+XwewD5ap9Qn9Vv0eVd+qEIwmVTre6ommbObSe
	b1ot6dYv4K9axq2qgETWYCIs2MM8MnzxVDVImCVRYh43Y1ixM3NWOluyKGD541s7HA5g4hfl+xh
	1dsOPvVNWxGP3wudj5NestgnBzD7mQn1SZRS1FIbOY9PVDOFeoOCGAxiC3OkjM61hDBagOb2OmZ
	lQDhkwZAhPkiNgk73NiOmjuuNI4LcvWKYWeqslYl75ePL7E5vHPVXOOSpWs0VZOwStWjRZdqavH
	H9Yv0ExKBI9s6D2MUarz4a4sm+AJ8lTHimMQRtTJR8XmUiOfcBLNnPP+y1S1rO9aKeBA1D/OLsK
	Y4g17gUVbQICncGyr0Ru3TwGXsa2Q==
X-Received: by 2002:a05:651c:4ca:b0:3a5:b0f1:7d56 with SMTP id 38308e7fff4ca-3a63050057cmr5356761fa.0.1790161661320;
        Wed, 23 Sep 2026 04:07:41 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f2f4sm521750e87.65.2026.09.23.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:40 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 16:07:36 +0500
Message-ID: <20260923110736.10-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923110736.10-1-anykey196@gmail.com>
References: <20260923110736.10-1-anykey196@gmail.com>
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
index ff9b40352a5..7d473274c06 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -189,3 +189,43 @@ &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v>;
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
2.55.0.windows.3

