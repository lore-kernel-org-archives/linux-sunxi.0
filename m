Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45133499F2F
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162418; cv=none; b=B9sudxqV5Yt7vsp7EiqmACfK9NfTvzpQSfPwRQIFjQG9NZZ95FSd6ac2uMSJwS22qlcjbGn3XWYYArlOP/xkEXLDhV6agmbjNd+h0ruA1KYmqDB5b7uApw++Y0/KOSCHWY4WJA8WOeC5OzmMN6JmEtPRxvhuWXXM1JCAprdwFMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162418; c=relaxed/simple;
	bh=YxlYoLJdY1t6MwHb37LAUcoCx0jXwJZlN+NJ9mENu6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWXqAXMM6lxpKOQ21T91SsZAeJpkjii0EmbKmwhJeOQSQFraD3w22K0AumBgu4BcqAYkFOsF7448pM6toRkqWGaWveW/1OBEgK3R01OcwqwiPG8kGH/EqvYz+mQFusou8mx7l8YLu1v4EX7DVgnGwX2/K/3AG8Ml7ibesb5Lask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhW3RB5z; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhW3RB5z"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so920292e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162413; x=1790767213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=;
        b=EhW3RB5zszu/2sE1/Yrj+p0MlCQ2ZeVtOhmC9sKe6yUZiYfnTcqI+TpFLyGKSUixkv
         03S5UPlwXigzODsuwbXVX+ZOA9OizTF4aZ7GdJWriP+U3AlIxtYfsdhPLNnOL2+f2zEQ
         IK3PkL/QA3iluvcD0YamK+4Xdl6LpAUguC8UvWY5YAM2tMYub/93fFfDWAYKJdukWBiQ
         l0yCGXln62k++7C03mP6r+RABgCwzAVeaZc8HYiMsvAJADD2tHdbsMTYPMt78cInz3Gf
         aoPQ0QMHXjswBYWcwroZjyeLN48ATOnpAInpcABlMNDvTjhSLLu/SB1+tjlVIiOShu6N
         62aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162413; x=1790767213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=;
        b=CZHs/V6juluyXfZdS7iI4FsZS2ARqesFYCQYCew1MccEQdmuNGbCi4nGIlFoQLod7l
         QzxAU5i8XAHJRzwcwBsliejkDRZKu8yfuLGbdBsBqzyK5xVfK8kVPZ0l5Lbb9Kxv9If4
         4+4mMKZg4bUm8NbqtZKiqJ3BISE+9ZL8sAwcIdd9Vi1c8u8RtbSeHlowQXxHx4LsU1HV
         m6WUpfmbVupsWwod6Zkj6b+L15yLBBbqnfy7SFQHij+ZLmY61nAWwnax9FQd7rQ+AFdT
         vQq+yJgcTPT4biDFEauBhZeG23Dk6yTvE5k1Sh/yLUGTHO8GVuCqydpUkjdtgQDwFfHJ
         Lf4g==
X-Gm-Message-State: AFuF++nx0tYvHI66XkSHvO733RrnF+Kkp2Y1JECYD+04h74LgwEZTVbv
	ihxrudiAXytLcBJYI3GOM9ko9Wgx4l5O0V+JLGxuk6FRoJSLFIPN2vgi
X-Gm-Gg: AYBFou1ksFbE9s2MmFZCLVy58eboCeDbPQzIWJ9YnvVuFHAzmgNxdkxYNWQjmLQgDTZ
	C0sqCCPBkmG9CmH3srtFqfqpiBtsYUbiVC6VtYZnpwwXywmnDtzD2xAk4sun6OAGBcBrzkTrIMK
	2u8UqKMzxvdpqsYg/HszM5MmD7Y8tHNO0e3Yc4v8WG3Jg4cMNYkGcKSqfznlQFi+G96RJnt/aHw
	z5lzqN0YisH+o208ZCUZQ0NqwzMcj86/i/uh8UVBV4BppH3Mt3exG5lBLXr5gpnauYYzOVrkGoQ
	srSwwGt9T2NrYPrmk1Zd3MFUmIIhtX5mQJzYX8S2vpAdlhfZw4vX7yq0zaxPL/3rhWaE/G3aasZ
	kfrAZzsw/XIZdoJKf0LJJWE7ZINf5H2nR3uDSlVrULTLVZmfefU7ALHi6aU9mIgykIvyKwVz1Rq
	a1dLcODfEUPbm72rCnrnR3l1KU4DaR+RBY1LDvVVYJ53b2To0saZbrTQGVAeoiBkjWil7knOcfx
	q4psaq7ToNa7zvUPS6ZXxOBcrDRWg==
X-Received: by 2002:a05:6512:2252:b0:5b7:55ba:1914 with SMTP id 2adb3069b0e04-5b8d8967ac3mr763907e87.28.1790162413121;
        Wed, 23 Sep 2026 04:20:13 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm516505e87.82.2026.09.23.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:12 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 16:20:08 +0500
Message-ID: <20260923112009.1062-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923112009.1062-1-anykey196@gmail.com>
References: <20260923112009.1062-1-anykey196@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18) and
gates the RTC 32 kHz fanout clock (PG10), with the 3.3 V and 1.8 V supplies.

The pwrseq clock must be named "ext_clock" (what mmc-pwrseq-simple requests)
and its output pin must be muxed to the clock function, as done for the other
H616/H618 boards.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352a5..39f580af15b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -189,3 +189,45 @@ &usbphy {
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
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&x32clk_fanout_pin>;
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

