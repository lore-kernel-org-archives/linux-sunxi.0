Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D83FC4
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Sep 2021 19:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DCC1668BCB;
	Tue, 14 Sep 2021 21:39:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nv9AjfJ1uAC; Tue, 14 Sep 2021 21:39:32 +0200 (CEST)
From: Dang Huynh <danct12@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1631648372; bh=21YM0oEBGyLKOXXb7tgpuU14Cr9ptLcQQ8hfRWL2FKc=;
	h=From:To:Cc:Subject:Date;
	b=kWG2gAO8TwaAORW4zhxHelTwQIg9vEXo0AhNBPrRIm6XMz7vKtIbJdwLJVQVDzznY
	 rjG7Ns8pkGFGcFvwj0oxYPyJNOQYO+zUXP2u4YJoHDaq5dHmkSEioKvfRQwyQx9cqH
	 j+V56niiiWUcNXfvGOOyEYEk/xm1Hx2a31lFndTPlXRakdShm84BRBRvmnOJRiWO9c
	 seymZjEXaPZLFCDAlS4cSS7rlpAbtngn77ULqOq3TtD/Mbed3JEOcx2UcnWk0yAF8W
	 sVxBXIfWK2QN6Xm+5Fpz+x04o6Oa7N+c5UcLAzDFDDCuBRn3f9Sait67hKR53gD4n6
	 v8Ccbh6Xhn5yA==
To: 
Cc: danct12@disroot.org,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: pinetab: Add HDMI support
Date: Wed, 15 Sep 2021 02:37:32 +0700
Message-Id: <20210914193732.3047668-1-danct12@disroot.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables HDMI display on PINE64 PineTab.

The PineTab has a HDMI Type C (mini) port.

Signed-off-by: Dang Huynh <danct12@disroot.org>
---
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
index 6a4af14718f5..adb0b28b06d8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
@@ -35,6 +35,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	i2c-csi {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 4 13 GPIO_ACTIVE_HIGH>; /* PE13 */
@@ -410,6 +421,21 @@ &reg_rtc_ldo {
 	regulator-name = "vcc-rtc";
 };
 
+&simplefb_hdmi {
+	vcc-hdmi-supply = <&reg_dldo1>;
+};
+
+&hdmi {
+	hvcc-supply = <&reg_dldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &sound {
 	status = "okay";
 	simple-audio-card,aux-devs = <&codec_analog>, <&speaker_amp>;
-- 
2.33.0

