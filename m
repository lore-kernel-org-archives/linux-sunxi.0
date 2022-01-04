Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE680173
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Jan 2022 19:37:32 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id g11so84117741lfu.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Jan 2022 11:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqDFLlq3VWxFS0cMOIJ3RThrgRba36XLCT0Etg8h8PA=;
        b=d22zZX5UQQFvYJz1V0IqyvYKI17zkeJqguw4hTlCsfuc/BeMsTo+0EWw510A+Vl/zh
         susy9OVa1Il1XZjt2DiB7jcpziadV5Xdb/el0dH+DZbLEsZwyJ9itP1EA2hoawe5d9eU
         d4zvPjoKhUO8vdj1y80LTYJIh6Er47g/qaaQLewKp/XJlhn8xDGT9F/cPeUWLDAgAFb6
         62X+j03BrlNm+5GWJtpuMwnjVzKP0DHqLsXor5OORoWBx/2Avo8UiVJy4MJKRRLRRsnM
         cxkUrbURJ5l6NkWc8smAbaDwbmR0ip0nIUrMeaWzcXuBLVfhvEoXXQ/ZAS4UEp0Xc1ln
         KAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqDFLlq3VWxFS0cMOIJ3RThrgRba36XLCT0Etg8h8PA=;
        b=DySP3N9t//g/PWyiNXkD4WQz+OJrTR/LgZdgyiI3OqlszRlQyOhHeUfiNCNOWthrWF
         gb8XCkxtqfGts6cdtdNyiQyxD1H2FI/Sszd84XpTRPNGOUpqTrzK3FQlK/m8oOV//IT1
         hZvzma2F2xAD6lBdiGK3iLWZD3U7nKvi0NzIIxjjHmKORPeEZuQLdJ+VdCjlU43UYSdb
         3aP9+/gDf3LOqmoRhIlwT8BufPzvFdLaDaCZOZyr/snIDiKUslme9ZfEepnRX0tEqRIu
         /t/fyWxAWjX510msmKBTXmADwN1A6lg/B53P1bdA1DiaudXxLtNFT4ipla9PQaKumj/H
         0MIQ==
X-Gm-Message-State: AOAM533nSoBq+9yZqY0CE7nNsJDH4pcl+KdSlifAD3e5zz2en2wn1nbQ
	4Y8v4pHLOTWSxAYGmZ0msQ4=
X-Google-Smtp-Source: ABdhPJxE1b7joWTMcKyxqd2QwxBmI6VZjwN8/Q3c0BSzizxrMwMPSblooXHp47Nc+gRbdl4accQtQA==
X-Received: by 2002:a05:6512:3485:: with SMTP id v5mr28180175lfr.495.1641325050872;
        Tue, 04 Jan 2022 11:37:30 -0800 (PST)
Received: from localhost (93-80-64-103.broadband.corbina.ru. [93.80.64.103])
        by smtp.gmail.com with ESMTPSA id bp22sm3643453lfb.150.2022.01.04.11.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:37:30 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: nanopi-neo-air: Add eMMC and bluetooth
Date: Tue,  4 Jan 2022 22:37:18 +0300
Message-Id: <20220104193719.87091-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the bluetooth part of AP6212 chip (connected to UART3) and the
onboard eMMC (connected to MMC2) for the NanoPi NEO Air board.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
index be49eabbff94..cd3df12b6573 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
@@ -103,12 +103,40 @@ brcmf: bcrmf@1 {
 	};
 };
 
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;
 	status = "okay";
 };
 
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>, <&uart3_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&rtc 1>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_vcc3v3>;
+		vddio-supply = <&reg_vcc3v3>;
+		device-wakeup-gpios = <&pio 0 8 GPIO_ACTIVE_HIGH>; /* PA8 */
+		host-wakeup-gpios = <&pio 0 7 GPIO_ACTIVE_HIGH>; /* PA7 */
+		shutdown-gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
+	};
+};
+
 &usbphy {
 	/* USB VBUS is always on */
 	status = "okay";
-- 
2.34.1

