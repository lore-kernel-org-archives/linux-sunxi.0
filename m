Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681BB45C70B
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160753; cv=none; b=poK+AzzcXKnq8ijUqlGM6WBKEJTX3c86lD5emQJleXe+m0hRNGSjJNYaZZQg2+tb4mSwC8LM8k8lxRFt9Y2TyE/de1q6TNJe94tPaxHt/2DuOfbPsm7Yo0fy2OOpPhmt3vQb9WXc1EmS8HCccZ0EK054MkcQ4aMitsRwJrLOjWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160753; c=relaxed/simple;
	bh=+KflBh12ZZZI8QcMSmdzFFhMsVPlKrJGgBcYyD3jgy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=og3zOvtpfLdEAxRWCZLyVGouVWEphVyTIawxk4AaISB3em1YZCAGTKq7158ncwvGXZmcNB+ALkg/RzGo8iZTG0japHA4hCpW3WYbxhL1mjLtd09t9FpM9kdQ9JkTpglR+kbpdB7p4QXvqGVnNIA9vrudV4CIGVHE1YuBiHmjDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXKZ83nf; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXKZ83nf"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso609862e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160735; x=1790765535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=;
        b=cXKZ83nfu3ozW1Hlcp+/Gi8hP7pkyAvDlhg7owRd41WGfd1a6NmCH5/O5YW5V2+3GL
         wGp2Crzxgt4K14X503kP/1SJte4A4blLS5G6SsyfJzNVDLQGcZxdPkTTKjxSnOv5CPtC
         zmS7e633bTiYOBad51tim9hH5uWOC2FQPX7oipn5VfWCmwx1QLrVlxGS+FPtq1Cv3iRz
         wG6ltY2O0IaWizJmZ2n5B/ERQXovu/o4B7BVK3qXZN6cLvMpgcdp/wKIDA/qr0cPJqIA
         3xALSxxe6BcDBQ7oIg6Ks0486f4FWvxCUSGfh7zSm9VmJOgNYf1ArTk8PTJfgcr6dkJ4
         h5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160735; x=1790765535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=;
        b=RsM2dDt6AJ+1DcafCqNzGpgPDgO05zr4uh8Y2IE0t6g7zQkmO6jDjphpruWdv7XZri
         zMLZpzBezOapUxJ7zguFB+mV0AF3KJc8gvsY4LCVC8BnAYCbGMus0JtB8cpfGjincrqq
         Vp00YeBpJC7uYLUtaSl7ymLUDK0lezF8Y/PcwlRkT98omIDfyklUj6/jqGMInMhPK1RL
         QeNQmllBzQDEzrjVtNrxUGQ441Qp21UkOa22jw3/h8vXsM9l5iwDFNduTxB71oCeky9K
         amTpCJVgtl8d2OOzHxDe6aA9rsbZ3fHTW62RIH4pGL92vZ1Zuduk5YBaTQ4/hQ+DD4an
         lzqw==
X-Gm-Message-State: AFuF++kp8tcImEBB+LlwfGoXlAIIzWdx31rQmnKRS4empzFP7IAxuTBP
	N0tzvM9T2CRGPym2fu5IpJEWFCHosFh9mMqA+RRANjlFpUCui7ZaUhK1
X-Gm-Gg: AYBFou1OC8pIrbGAgXmrgSc4IF74s7BKOOOGLpwObTdgCjEP1bimx6BadAPqyZbpt99
	tn8Begw79VhWiu5Bc8vg0q2g90E5gV7JR111u0Q3rE/G4I/ZOyLQKF2jY9x05CERSKu1xzzK1WQ
	h/gGooMeUcKHJDAmEJNcUbzfKIk7TonE/Ja1CL60xhIdWYthoaQwH0FoqT9kXXQS6wUN862tnIy
	8bFrw6lxzAmZTW+822lvvixsilfz4VZ99IgVBhzZvNNEjYS4sN6JHp4iL6pOSxr+x5Q36n06Hp+
	0xkxYeNlTitmwN+xbUIDpjhqO9qYVmqvNxvo52NbN+8DhmQZIrf4mjCbjhZwpqbHdi/tBFC+McQ
	YMs/1P5xZkw+RFC6B9HgNMpRFqRZlaf8ygmsAxZcHV26eFCpui3lgSaIJZznltG9tE9VpPQvc23
	FPzfFlB43b+IuKwBTMmrkXUpmw+RSkpYs0y4PSehaAUah4Jl0cRvGaj0MODrbMryC1or50Q2Dcf
	4cxBfhj52rpHoLQKU3vR+qcZo5ZdQ==
X-Received: by 2002:a05:6512:a344:b0:5b6:183b:d214 with SMTP id 2adb3069b0e04-5b8d89cf47bmr634761e87.59.1790160734896;
        Wed, 23 Sep 2026 03:52:14 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm497428e87.7.2026.09.23.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:14 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 15:52:08 +0500
Message-ID: <20260923105208.198-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923105208.198-1-anykey196@gmail.com>
References: <20260923105208.198-1-anykey196@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladnwx <vladnwx@users.noreply.github.com>

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -218,3 +218,43 @@
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
2.45.0
