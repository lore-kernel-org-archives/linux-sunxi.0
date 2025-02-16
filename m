Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9C188733
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698162; cv=none; b=djQyEdFQLORHvKZ7pt7II6o8A4Vb1L9HZ78fHlYbti1cHwR1xMMzjIAFCR9Pxpx4haEE7glVwUlsld6A4yE+Z4bEGOYHIEx5KQBpbbOkRLgxhVgzJXNU7xaulaGgSkJ+zOsQjj3sDwYTp81Zy/zBMQdzUt4q1XOQSGmiAqWHy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698162; c=relaxed/simple;
	bh=XL+U69dYyvh2rI1YOKtdl5pGD30gCdYh7QO+rVfIbfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyCLJqcdXRB3RYGp2eLqCZjzq6PHrQC1qOgosg5bVjWX80Kf0FTfRP6VB8zdIe1v6EG14XhFgblldUWjp3y0GEQGuGkQt1ZeLEfDdrFHSbrEvz6ajbIej27lmA3pvwaS/cRE3AB4u6AQkdY0RpMD2u3oc887FAL42vLfR3tDOoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Ipg3QvbE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RYpXxJlh; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Ipg3QvbE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RYpXxJlh"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 56E242540112;
	Sun, 16 Feb 2025 04:29:18 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 04:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698158; x=
	1739784558; bh=2EIzP0HgejNa9WUiq2oxdXd+iKdqm6aPx/jw2TlMIfA=; b=I
	pg3QvbEv5maekN3iAiiOwaXgrFKgRl1h1s8ryRkAFWu2eeiC+Oc4MH9/MQFC3tNj
	Jqx7xohzHq2Q+MeOOtn2tCUr4L9i3fMh5gsjIfHRzQPbU/8z6R4E3UR/pRR4BCUz
	AX8O2G2zFeJ3LJ3nRHVrUS5FsRd+rTUEyVzoMKxf/wHg/yYb144U8lT0FwQDm7Yw
	OkVQT3NsFQODcM7A5QS4roJ1QOHZRyS4T+ol4+vZpu7XN3o0/bxRWmXho3s3nbLB
	8LaqRdH3wykbXnVctqN1vkZyD3DuW7UN9kiemDy9wJPeOdsxmwZGlf7/wvr3G2oc
	RnSqUBqyWJQujcrpzCv/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698158; x=1739784558; bh=2
	EIzP0HgejNa9WUiq2oxdXd+iKdqm6aPx/jw2TlMIfA=; b=RYpXxJlhCVl9Uj6DM
	IUp56tQvUACh7kvMnMnDFrc4QEDOcjeALbdYZKtI7DF5lppK4yodFNJgfavASMU9
	04FRtqYctuid+S4ytM2Rxynv1oyTLLOjZOxpPen3H35fdAJHe5Nv09NbgsdgAjLp
	eAiPmHyeTVGqUY0i4jhxo3jJzVPK2lxRJX4Lh6WGvdqE932DuE58WH+v4G4TRMu+
	bu+cWTlo7DYAKX6cqPAD3azSUX+oQ72aYh+u8QF7m4WEfcWnprbm/+EsxNi4ykc5
	TfwX4TUhmQC6OZQQZSv2e5gVyCq50cGkv5xZ85El33SfAdIRKKQvWognEysvdp4v
	3BomQ==
X-ME-Sender: <xms:7q-xZ-_WL5QEcU2wKu4rzpF4e2o6-XgE52uJM6byJJj6quw2dwsz_g>
    <xme:7q-xZ-tZw8HQQQN9VdyRm2WGQxnBKGxGhBI1hztZxFgLkSKqOd4FS-hVpw5xuKMyM
    -JffcaHociemXMYGg>
X-ME-Received: <xmr:7q-xZ0DD-qjatzFaf1gBcpYLVRoB2cde8HxPDqbHE3fCLRI_S-2aXD-TepDhsO6kXwni2MEHLrj1qzO4eaMHuELPsHRKL3kfI4FgpafmS-oi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7q-xZ2cOFAKwvpsqE0llPKnIExYzXSeSwB6vgB6UGjC8psvQ6JRrUA>
    <xmx:7q-xZzNwsrzZSom4AFqg9ogT5ICOAtUPbv7_kMK6Ab5AlYp8WF0l3Q>
    <xmx:7q-xZwk0stJZMjc4MLW7WN4iGx-Hu3I7g5toKI8neJbbwc9yRfRWVw>
    <xmx:7q-xZ1vPiQnYCDMOQ0XNGk420U7hFhgIqiw50aE9ApyOJvlZhmiQgw>
    <xmx:7q-xZ6mLqkOnbs0l1gq8LvFYhjt1Wfbix4R_QlhEu1IuVAfeAWePPClS>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:29:13 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 7/8] arm64: dts: allwinner: rg35xx: Enable LCD output
Date: Sun, 16 Feb 2025 22:27:14 +1300
Message-ID: <20250216092827.15444-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RG35XX has a 640x480 RGB/SPI LCD panel, supported by the SoC display
pipeline and an NV3052C controller. The H616 SOC's GPIO bank D contains
the muxed display pins for RGB and LVDS output support.

Enable the display engine and LCD timing controller, configure the
panel, and add a fixed 3.3v GPIO-controlled regulator for the panel, and
a VCC supply for the display pins as per the other GPIO banks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index a231abf1684ad..388487d4720e2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -175,6 +175,49 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_lcd: regulator-gpio-lcd-vdd {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vdd-lcd";
+		gpio = <&pio 8 15 GPIO_ACTIVE_HIGH>; // PI15
+		enable-active-high;
+	};
+
+	spi_lcd: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
+		mosi-gpios = <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
+		cs-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
+		num-chipselects = <1>;
+
+		panel: panel@0 {
+			compatible = "anbernic,rg35xx-plus-panel";
+
+			reg = <0>;
+
+			spi-max-frequency = <3125000>;
+			spi-3wire;
+
+			reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+			backlight = <&backlight>;
+			power-supply = <&reg_lcd>;
+
+			pinctrl-0 = <&lcd0_rgb888_pins>;
+			pinctrl-names = "default";
+
+			port {
+				panel_in_rgb: endpoint {
+					remote-endpoint = <&tcon_lcd0_out_lcd>;
+				};
+			};
+		};
+	};
 };
 
 &codec {
@@ -187,6 +230,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc1>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -206,6 +253,7 @@ &ohci0 {
 &pio {
 	vcc-pa-supply = <&reg_cldo3>;
 	vcc-pc-supply = <&reg_cldo3>;
+	vcc-pd-supply = <&reg_cldo3>;
 	vcc-pe-supply = <&reg_cldo3>;
 	vcc-pf-supply = <&reg_cldo3>;
 	vcc-pg-supply = <&reg_aldo4>;
@@ -355,3 +403,13 @@ &usbotg {
 &usbphy {
 	status = "okay";
 };
+
+&tcon_lcd0 {
+	status = "okay";
+};
+
+&tcon_lcd0_out {
+	tcon_lcd0_out_lcd: endpoint@1 {
+		remote-endpoint = <&panel_in_rgb>;
+	};
+};
-- 
2.48.1

