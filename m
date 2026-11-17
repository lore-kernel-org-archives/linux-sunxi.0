Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925298;
	b=tevMOQko0fP/LMPSqkMSq7gfAGCco08DIexDV+Dezot1lCyunAoftTvJZ2T3iPJpA0Q/
	 CuwdS9WDjaXyNohihAaw17u+Qwmy+WJu8kg/sDPDj0cKG+/Dn+RvVagRPNfWQXDQ/MVLV
	 akAEhMx6k1+/EaS+rzTvLi0zy1IXiZaQI1SMEXk0OFLwR5QcfkQh+LxDFvxD5vdEGSsSw
	 Tu25OExZ9Y8LEePTvjys9EcKdmvGRhP2CvNa85Rytb4hj8L+OCNnijaRfhn7gQq+nTLCL
	 3TpUOzxTXD6biAPEYl93Bu9YEfkw54k3SeDrm7gmJSDsb94+WYtPqOzJWdmxuub89kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
	b=2Uyk5NngiuovMCLq5fIJZP8m4hn922X/2BJHB5lgd2hOq8k9Uz4EfuTm6se7z25g1JnW
	 4p/4jBctspoqsyW4oT9+gvofDoBTihOaAJe7Xj4nuMHS2ABytpk4DtJzWcSXR9thV5Km+
	 qadt9mqywsLa4VIhijHOwkn8NJ4whtOiZH9IAoLePEVcnFGJLoRslPFYM6nkx3a8J3mMq
	 PiqLL7NVLGeTUpNN9+5v84yR0LfyfhAKsqfiKnLeA8WyBFcK/TzWE2fCTy5nRv86AAhUR
	 Vky2gITM5vgdpk0YqTxkWtTgWjRcPfaPBAi3Gz6cCIKocJ+V0V9bE1cxwKvjU8mQ+Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+mKfOp6;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EFC606A32C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 14:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EFC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+mKfOp6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380b40319bdso2284500eec.1
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925296; x=1795530096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=G+mKfOp6zJ6/jXtPT8pBsjfWo+JJu68MMYkPbOduzMgHCa/zPvmbzSbZWpzZEvBBxp
         ltQ7AF6hnIvNU/2nmkJftduo9LsoXiFbT7DIlBft+lWZixIEzs8B5iklXg2KT9iUTmD0
         6t9QyFAROVcjwiY/F8flIBEiVTVlI7Mz0CAk2NtjDKFbuhTBbzfLagzFVcyotSGcO6LS
         SlMKnzL0Uv2IdwAh9aJac1W8HWWMw6Ru8go/d+rkgDZ1FKOlfV40Ov6l2rRw/BYS+bvg
         IaNc+CdFOF8tMsLHDc6+tYbqG4d3AHF2nGTPcOycZGWfqqV8wvVLncy1zHOAsrGwmuzE
         Z5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925296; x=1795530096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=RGpoDbeYuMahtwPX9RC7uKELQFmnZjRiaIlIlImiWO8xg4iCnzEoxe1M9mYgqqWABM
         BnQxticO5SxR46FkrNRIjhRM8ezX45RIW9r6yNixpDv2lNp5t/Ua4ItMSTUfDxQVvm85
         DMWc4agiPOUatPtKr4KiYzYVZARo1KHEzj7hiAI8FafyMKgDdCOXGWCfHM8AULg7dsp3
         IZgVNavJUA8oAYt2lKUiB/FcKSFzn5IvPALZX1YY+WWGe/h3mnOWvQG7ivqM2MgttYca
         RhGRX8mUZXqJUiaP4Ewn10WiWZOQDfO8W0pEvz3WtGjjeFbhWeeE3sc8TNz5XqWtTip4
         wYqg==
X-Forwarded-Encrypted: i=1; AL+hErGw+t1jCEvPKAGns2gRT6BhRNxobiM70ltXWZcrvgb6baHrgS0230jboK224gCE47+l9kzeGlAUa9k1wg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/d85oXOiF9L/7C2t/wxxPCD5OKGRdsnV+TdWBjnuqErDlUEL+j
	l6aYq7/lUJpzN5mk+vRrw5eiTocl8st+idphU2M98zkNWVWp0/qmr8nc
X-Gm-Gg: AZFdTZfZ+3QGSYlCG5mxiM0idpsfV4u29nkyaGooRJ6EPYWVKB3nOWd+unVbN9IO3wP
	BGQ5fbxnprVby/pQbn00FkV4ygAKAnL9msg8CeHoBvbON3Bs5iKvfiX3DHysTrC6LkuGUgtAfaA
	W+31EI7xm+1USBnwCiXDsLOHRvN/XMkGet9Y3GCKdJvhEWEtq+n+m8LwqIHwbNJijGNgj0UbzlE
	1o/Nlaed3RpYO/LKrqd9FCzTw0TE/vqS0qDw/61EoEFGXeP/RwsUr/SFzbfu5QNP06e3lUN/vlg
	1rqeG04aQkEzuaRQsisUM1G34agsalmnS/ZbZY29CyW7ZhJvtTa2ri6Gj8E8UrBzn7Jo3rB3euf
	RkoWahqEuqp5LRakWl1Zv5+desVk8GMHY+31RVUlmdrHtzzruAncqXqgqBKzr3UGvlrE889Arp8
	Rpgpal5fVLiQJ868AH+Ux2A/s2C5YIhJ1rhlYlSXtLYPZ88wFK5VW5axj3tYGFzF2TxxBs9FxsJ
	xCZh3xWOtCajt1gvY6QeJpU1aXuRpjwO7qaR0R72mSN+Bg611A0UdXkiITCZQd307eiuZiIIz15
	5rmUdGo4nQJWgOEmsKiiLfAlgNYirE4aKtFwVIw=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr13477392eec.29.1794925296009;
        Tue, 17 Nov 2026 06:21:36 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm43828258eec.3.2026.11.17.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:21:35 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 22:21:21 +0800
Message-ID: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
integrated into the co-packaged AC200 of the Allwinner H6 SoC.

The AC200 derives its 24 MHz reference clock from PWM1, so enable the
PWM controller and the pwm-clock node that supplies it. Also enable
I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
package on the EMAC MDIO bus, with the EMAC operating in RMII mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

---
The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
description this depends on are already merged in sunxi/dt-for-7.5.
---
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
index 225f42bd3b9e..9b192caeecb2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
 
 	aliases {
+		ethernet0 = &emac;
 		ethernet1 = &sdio_wifi;
 		serial0 = &uart0;
 	};
@@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
@@ -107,6 +112,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdcc>;
 	status = "okay";
@@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ethernet-phy-package@1 {
+		compatible = "x-powers,ac200-ephy-package";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vcc-supply = <&reg_aldo2>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200 = <&ac200>;
+		x-powers,xmii-rx-clock-inverted;
+
+		ac200_ephy: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0044.1400";
+			reg = <1>;
+		};
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
@@ -173,6 +209,10 @@ &pio {
 	vcc-pg-supply = <&reg_bldo3>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.56.1

