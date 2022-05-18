Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC123A8
	for <linux-sunxi@lists.linux.dev>; Wed, 18 May 2022 20:09:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id k26so1728436wms.1
        for <linux-sunxi@lists.linux.dev>; Wed, 18 May 2022 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gmIO/D4Ceaesv/SdaQGf7VpiPn4xB80QGFNJbqSVbYc=;
        b=vPcmgPS1Zkav7EL8kAY3mLgR+8wgJTaoIpwtC8pZglq1poCcoa4VPa4pSJdm98yba3
         Dc9i8L8D17fg1dDV1MciA85vi0SwtvTf0cIWWa0jaWi7FlHTh81D3xxtAYUio5a7q9yo
         oVb1izlVGPk2k31vczCTsEvwhVj4scccR45jYEXUJzfd+kt6Y1S3y8bdLsIML35boUm4
         D/00jIZVyCNxRNFcViiyr0lvuZb2bnlheBghCO/T6idKUPOe+w2viE9ZGodiSxZ6rPym
         6w1tRY/kpkOqM0ShsI/anVPC7SJgVvi0Sd3tKll0sY9mdRGB6Bc1w3QjAdiKooMiMpPO
         ODTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmIO/D4Ceaesv/SdaQGf7VpiPn4xB80QGFNJbqSVbYc=;
        b=iyr9281wt2SO4LChPAwpNUA+8J8VruK5ikuNPUkXUJXTQL9kU1iPBYQZC2FJ53aduX
         u5xXda+Ru3DrWOdJdwn+FOBmNguTbkqqgyzMZDMI+kSUn9oX35IW3w7Uz90OEUrOZY0G
         d3muRoPDx/u4dP307U8cJ4tkfXzIYqKuyYRbRu+HVFYqblGX/Bd/+7Tm4NDQHGGhFPPm
         pJNcqDGsnoMovKrxyy7bqAr2rRxI6qoXGObJNqG43Z8O3VMECgeNhp90rfviXwPnun5E
         /2/3EvwqVF2jl/ZGjEjbGPvai/GCmczpu36K8cxsNoFp7780SjvbDme1Oudx6TsclV+8
         SGtA==
X-Gm-Message-State: AOAM530Cw13Q8wGdo0cel6nEpAdom9mSyh0uQePzrKdi4q2iyKJRwSXX
	iOSw/HBoeHCUSp3rzyDVa4EQww==
X-Google-Smtp-Source: ABdhPJwlu63b6+jK/4XJihJY2QnEy9b9pt9pGCMB3OHShfvK84RY+TPog8SwVoHsv1ZZ3Xh7i0PkEA==
X-Received: by 2002:a05:600c:1c84:b0:394:5de0:2475 with SMTP id k4-20020a05600c1c8400b003945de02475mr888627wms.27.1652904592329;
        Wed, 18 May 2022 13:09:52 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o23-20020a05600c511700b0039456c00ba7sm6859281wms.1.2022.05.18.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:09:51 -0700 (PDT)
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
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 5/5] arm64: dts: allwinner: orange-pi-3: Enable ethernet
Date: Wed, 18 May 2022 20:09:39 +0000
Message-Id: <20220518200939.689308-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518200939.689308-1-clabbe@baylibre.com>
References: <20220518200939.689308-1-clabbe@baylibre.com>
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
index c45d7b7fb39a..c3749b7302ba 100644
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
+		regulators = <&reg_gmac_2v5>, <&reg_aldo2>;
+		regulator-names = "phy-io", "phy";
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
2.35.1

