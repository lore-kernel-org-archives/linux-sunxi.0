Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33CF23D4
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 07:36:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id h126-20020a1c2184000000b003cfdd569507so1871980wmh.4
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 23:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSDVCUIFMlfZ7nF9KUJuPkMn+99GuqCPirWDXaDIqPw=;
        b=lOwSFJwIzEoH9+BBlsV8ydJ8KFWxhnO/GNq6VadaMp8sZTEOlX4BPNGNaeJnzIi/Xt
         Hfh19SvvnzbwgS5c3uyGDzfyDi8OWtaOmeqs+zLuz2h7IW1isXGZ98sMl+Q0yMTeJK+w
         pMdu5rlXLrAAgP4iMPPPheHaN1JToL4kfYHgIhb+IQKUW5mVYoRgI9ZxU8h68z4QQDTT
         /8QHLCsHmJhvP5JTTxUbteVbS6fdRWB15waJ0AT7O9Od9p5GUjceBEFzM3UXdkR2uh8S
         qNXWaF+Lop2CJA8VmNfJviN4sIcaLNVoTm4BljVNj2E6yiORQRjnSm2kLQYGY92g9pzh
         vp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSDVCUIFMlfZ7nF9KUJuPkMn+99GuqCPirWDXaDIqPw=;
        b=Z02PVXpk8B2DnVhpeI5WShWQajCjF/tguwQT5ptOMrbePjaBR8Mq+woHKr3ve8usm1
         q+rw/d0EMPh7qadl7BgBoWANKkLOc7Kf2/t/rD+931yxnMqkcJ3zh4zk46YOWkEFKksC
         lqir0Net2PvDavD5B7Ldr6F6Nl6pekPCWW5nDw4Na2D4sqee/Z9OiH3dDO9CmN7KZ9sG
         Gmhe0YtWFzmuW6SK7wLzNqocoWb5XX08Vh8JoUVVyJg6ZhlM6SBEUoDYkxLihq7UjrgE
         gKX5/viB4lCzbAggAQ0fkWCpyfgwGQkKsISzVVhSRCpeKPivn3RTcDiTJA5lIJOYc9JF
         Yy7g==
X-Gm-Message-State: ANoB5pmwIx7VPJwBtnRcGxUtD+yzFnrnnVMZ4X1OJPKARGj/PfFMb4kv
	OnNIERPHxM3xk5sR0NDcePAlQA==
X-Google-Smtp-Source: AA0mqf5/iPOpLCFEROZe7VK4xD8+ELw0YH0zY4IuN7pcxcBQWYaCiKyhhLH4kU9hJBpYwKCM40mpPw==
X-Received: by 2002:a1c:720f:0:b0:3cf:6f77:375 with SMTP id n15-20020a1c720f000000b003cf6f770375mr20265wmc.102.1668497775128;
        Mon, 14 Nov 2022 23:36:15 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j13-20020a5d452d000000b0022cbf4cda62sm13836811wra.27.2022.11.14.23.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 23:36:14 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 3/3] arm64: dts: allwinner: orange-pi-3: Enable ethernet
Date: Tue, 15 Nov 2022 07:36:03 +0000
Message-Id: <20221115073603.3425396-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115073603.3425396-1-clabbe@baylibre.com>
References: <20221115073603.3425396-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ondřej Jirman <megi@xff.cz>

Orange Pi 3 has two regulators that power the Realtek RTL8211E
PHY. According to the datasheet, both regulators need to be enabled
at the same time, or that "phy-io" should be enabled slightly earlier
than "phy" regulator.

RTL8211E/RTL8211EG datasheet says:

  Note 4: 2.5V (or 1.8/1.5V) RGMII power should be risen simultaneously
  or slightly earlier than 3.3V power. Rising 2.5V (or 1.8/1.5V) power
  later than 3.3V power may lead to errors.

The timing is set in DT via startup-delay-us.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index 6fc65e8db220..081b004f26ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "xunlong,orangepi-3", "allwinner,sun50i-h6";
 
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 		serial1 = &uart1;
 	};
@@ -55,6 +56,15 @@ led-1 {
 		};
 	};
 
+	reg_gmac_2v5: gmac-2v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-2v5";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC jack */
 		compatible = "regulator-fixed";
@@ -113,6 +123,33 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rgmii_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	status = "okay";
+};
+
+&mdio {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		/*
+		 * The board uses 2.5V RGMII signalling. Power sequence to enable
+		 * the phy is to enable GMAC-2V5 and GMAC-3V (aldo2) power rails
+		 * at the same time and to wait 100ms. The driver enables phy-io
+		 * first. Delay is achieved with enable-ramp-delay on reg_aldo2.
+		 */
+		phy-io-supply = <&reg_gmac_2v5>;
+		ephy-supply = <&reg_aldo2>;
+
+		reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
+		reset-assert-us = <15000>;
+		reset-deassert-us = <40000>;
+	};
+};
+
 &gpu {
 	mali-supply = <&reg_dcdcc>;
 	status = "okay";
@@ -211,6 +248,7 @@ reg_aldo2: aldo2 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc33-audio-tv-ephy-mac";
+				regulator-enable-ramp-delay = <100000>;
 			};
 
 			/* ALDO3 is shorted to CLDO1 */
-- 
2.37.4

