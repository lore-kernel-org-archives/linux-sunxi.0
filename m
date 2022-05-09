Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03421865
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 07:49:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id r1-20020a1c2b01000000b00394398c5d51so7748229wmr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uxjt2wTyTk7fEyfPktsHOIoGVxBZKrQOY0kyPg5icoY=;
        b=AL9GeKmvxYTPP1/F4xINTuPLMQDK3Cc2x2Gi/oKoi8VY5+aQwZBOPVxyAnDyDXfPGB
         namQPtvoZNhKW4V5gv9opgM9nQg8QQwJMPJ0vYZNK3Da7P6zfFDpq1RzaYjQHTBXzz2D
         H6Lqzzx/snqzPAtpVsfj724pqn643/4Aq3sTSltXuNd0z96MrbJLLNSssdBDmM7zygVm
         Zg8015mEJ0Nug/q3IDi7ai0AlzEvNJW9ZKjWy9nLz0rFjlWmTVZGx3YLWwTXa6P6+uph
         BgWY7S4QM9IzcepdNGcVfGmqOdrC2bHCHfK/wEWXVizY8pOT2m0ZZVAg8KTb6kV+VjMs
         8t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxjt2wTyTk7fEyfPktsHOIoGVxBZKrQOY0kyPg5icoY=;
        b=UKBjoxrLT0TclYZGY8/Tr8ThGdPReT05HDG5Ntx4JelXScKtoJtgyNWQILvT0gGKct
         YheGJyd344iSyXyzy8g2iu382TPVcCVLM2euCdn6mqN3r1D1vj+6sea3HaZglgWmY64D
         QdUAX0RlEJKPi2lc9+gF8aa+olFAF7X92DLYZ8qN4/io7gIgN40Jrq1Hl8mO+BNXQPLD
         6BgTF7BSOxzRDp+u/QCdHmi75RTEaDbqa9RaAXmpolYOHaASKPYth8rq3x+eMCN4HtUM
         GV4zUlCH4Wca3eCOjWUjOFjdQWKD8jIbCfQ/WHN+1xuM5zVoHh/ZiMKaGwZrhvRGjSt6
         3bRA==
X-Gm-Message-State: AOAM530eB+1r3l8HCNevLocc4iqZFjL72L/wP4XBLuLqyMxKU/XOD5KN
	IlNFayVXC9TmC6U+xI7MpVtBDA==
X-Google-Smtp-Source: ABdhPJzHtT6mjIAy/Bbyly4ZW0phLlVdydi8UKNC+Gmhx9pd4TeHrT2Z+doG663B1pzMfmtcJLBnAw==
X-Received: by 2002:a05:600c:1d0b:b0:394:737f:e3d with SMTP id l11-20020a05600c1d0b00b00394737f0e3dmr16721006wms.5.1652082550028;
        Mon, 09 May 2022 00:49:10 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id bw22-20020a0560001f9600b0020c5253d8d8sm11784768wrb.36.2022.05.09.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:49:09 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	peppe.cavallaro@st.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/6] ARM: dts: sunxi: move phy regulator in PHY node
Date: Mon,  9 May 2022 07:48:55 +0000
Message-Id: <20220509074857.195302-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509074857.195302-1-clabbe@baylibre.com>
References: <20220509074857.195302-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that PHY core can handle regulators, move regulator handle in PHY
node.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts      | 2 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts  | 2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts     | 2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts          | 2 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts      | 2 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts    | 2 +-
 arch/arm/boot/dts/sun8i-h3-zeropi.dts             | 2 +-
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 2 +-
 arch/arm/boot/dts/sun8i-r40-oka40i-c.dts          | 2 +-
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 2 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts       | 2 +-
 arch/arm/boot/dts/sun9i-a80-optimus.dts           | 2 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi     | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index 5a7e1bd5f825..b450be0a45ed 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -129,7 +129,6 @@ &ehci0 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_sw>;
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii-id";
 	allwinner,rx-delay-ps = <700>;
@@ -151,6 +150,7 @@ &mdio {
 	rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_sw>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
index 870993393fc2..fe70b350cdbb 100644
--- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
@@ -181,7 +181,6 @@ &ehci1 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_dldo4>;
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii-id";
 	status = "okay";
@@ -201,6 +200,7 @@ &mdio {
 	rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_dldo4>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
index a2f2ef2b0092..c393612f44c6 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
@@ -103,7 +103,6 @@ &ehci2 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii";
 
@@ -114,6 +113,7 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
+		phy-supply = <&reg_gmac_3v3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts
index 26e2e6172e0d..70bde396856b 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts
@@ -80,7 +80,6 @@ &ehci2 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii-id";
 	status = "okay";
@@ -90,6 +89,7 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@7 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
+		phy-supply = <&reg_gmac_3v3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index d05fa679dcd3..c6dcf1af3298 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
@@ -83,7 +83,6 @@ &ehci3 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii-id";
 
@@ -94,6 +93,7 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
+		phy-supply = <&reg_gmac_3v3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
index b6ca45d18e51..61eb8c003186 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
@@ -65,7 +65,6 @@ reg_gmac_3v3: gmac-3v3 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii-id";
 	status = "okay";
@@ -75,5 +74,6 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_gmac_3v3>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-zeropi.dts b/arch/arm/boot/dts/sun8i-h3-zeropi.dts
index 7d3e7323b661..54174ef18823 100644
--- a/arch/arm/boot/dts/sun8i-h3-zeropi.dts
+++ b/arch/arm/boot/dts/sun8i-h3-zeropi.dts
@@ -65,13 +65,13 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@7 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
+		phy-supply = <&reg_gmac_3v3>;
 	};
 };
 
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii-id";
 
diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index a6a1087a0c9b..b1f269bbd479 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -130,7 +130,6 @@ &gmac {
 	pinctrl-0 = <&gmac_rgmii_pins>;
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_dc1sw>;
 	status = "okay";
 };
 
@@ -138,6 +137,7 @@ &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_dc1sw>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-r40-oka40i-c.dts b/arch/arm/boot/dts/sun8i-r40-oka40i-c.dts
index 0bd1336206b8..c43476b426df 100644
--- a/arch/arm/boot/dts/sun8i-r40-oka40i-c.dts
+++ b/arch/arm/boot/dts/sun8i-r40-oka40i-c.dts
@@ -93,7 +93,6 @@ &gmac {
 	pinctrl-0 = <&gmac_rgmii_pins>;
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_dcdc1>;
 	status = "okay";
 };
 
@@ -101,6 +100,7 @@ &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_dcdc1>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index 47954551f573..050a649d7bda 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -121,7 +121,6 @@ &gmac {
 	pinctrl-0 = <&gmac_rgmii_pins>;
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_dc1sw>;
 	status = "okay";
 };
 
@@ -129,6 +128,7 @@ &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_dc1sw>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index c8ca8cb7f5c9..ab9bf4bf7343 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -130,7 +130,6 @@ &gmac {
 	pinctrl-0 = <&gmac_rgmii_pins>;
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_cldo1>;
 	status = "okay";
 };
 
@@ -142,6 +141,7 @@ &i2c3 {
 
 &mdio {
 	phy1: ethernet-phy@1 {
+		phy-supply = <&reg_cldo1>;
 		reg = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index 5c3580d712e4..48219b8049b1 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -125,13 +125,13 @@ &gmac {
 	pinctrl-0 = <&gmac_rgmii_pins>;
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_cldo1>;
 	status = "okay";
 };
 
 &mdio {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		phy-supply = <&reg_cldo1>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
index d03f5853ef7b..65f0a3c2af3f 100644
--- a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
@@ -125,7 +125,6 @@ &ehci2 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii-id";
 
@@ -136,6 +135,7 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		phy-supply = <&reg_gmac_3v3>;
 	};
 };
 
-- 
2.35.1

