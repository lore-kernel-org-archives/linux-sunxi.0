Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762717;
	b=vuSy5o14lJPlgITnm13MPADxokDd2qsfmGsiq9dDWhe9gdkKX/fRJdOIJDPozpkTnzye
	 O/R4DsWOvh0qvO0VNp/3PvkzItbc4Tfw8pHvXRLNmiK8Uz9LanevuhrCh1NadSxcBhvGt
	 j7+jJInkogUYjC+pi4ppB/zdnJV/9nOe6UwQYfm6op1ThWS2t+9ghnydJ+FmHVrT9XZ6H
	 x7HGx6R7v1KSW+dWZmpNJz/OZS5ZUjkNTJoAdp5bwsXU1IJXU9hn+P20CNw9711ysugG1
	 R9vNaj6MDUVGPyjz0MaAJjC1JQV1rD5ItRqNlUBOI52imFZMt0cIMv2pUKkcX3LVyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
	b=lkjoqvhNasb6vdyyM6yd0cCQ4V7Xj+UH0xguWnf+nS9kyamafSNvAuGaASfFQJgtu2W+
	 TXkp+kH1HOJNn6tSP5602l6GFXykRKmEbfRnZfc7nGgGu7dLqBLMNNTPiDrxemWqsIMwO
	 GasH+0vOVMnVQTVsUtTctTUMuY+zttBS2TkggIyAMyf+nadyg9CShtrms9qGXwLqUU6zZ
	 kpq4yzmJ4tGkrlp3Czm0Ub/QqR6/v9CgjN7GtqpdAqdAG2LBs5ChmOz0QU8boewNKlAbO
	 0SSiIzmr/9UXb3EeExBXe0RyffljYpNwRX+KMzZ7kBVJWT4p2ADYq8xhOMXL4meHDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqXIfaR8;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE460A261B
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AE460A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqXIfaR8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso5966135e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762715; x=1795367515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=SqXIfaR8Loek54H4IY8aTrl7Gbb1qCzfD3TP0ZbtyI6u+OiJZ93QY5JfpMWhn5fo3n
         p1wkjpW0R2hiIuY/V6LYySZDD4NZfBs9F4PAXGnv0s+biKnd5jGJb/Rk/tR2SfvfWdRx
         t4LyM8s99VGKrF7vid4w7IAvAsgxWAwYvHwR0BiyO6nHtDgVkWZY2uoJ3HU3Bn0+TriC
         I80Io7mrduoW3/9knHOLFY2GZTDapT6XWh9nDCGrjAMAxIKcPFj3seQPIBX5l9j0bZ9/
         FzJtlxEsOnQEw77dscBD2PM3YR6ZQh1ORshTjAbv0jAq/ukeIawtBmP+ErMOe0gyVLUg
         9LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=xLtsf2zb61+yoQS7ZGRFTIS3tYc6ibK5FtTJK4jbb8a8zk6RSsHO0H/5W0fDcrxAhW
         WLOPFe2QOW13VMAntBLPoLZku2n42xAxAVdINnjrKh03YaRelsfbkgzNQpI7MFrAH1DI
         CTL+BFXnDMTMBwLTcp1DZPAcjvS5yzJLEahVZ7+3iKWk37VyBSEq1kY8QRijjFu/Xogb
         1c/8gT5OHy7uv+cwL959yADBKx6bSKpXQeklbzIqoV2bT5hUiuLdcg1WSE+nlND7D3e6
         gqSq/JGtNVtu7Do32FEGnIQCNMf3hL7e6B5scewTNUnR1gCZsRuGtXxIKMzL1DPTqgdz
         uZIw==
X-Forwarded-Encrypted: i=1; AL+hErGxlgnEcAx6Wzu1YH8KqNaLpVUIQPdx8OsFxSsSqC5MbTogr9McET9/orPEvW+cWwz/D4ae7WGS+HxszA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/KrrmYp6+7T3pHLG9zLE4UkEl9oLhB6lTXiCLVtlIEyQIYgjia
	24gWdqX6niLlHTs6ScgHt08fTiEDHp/5JFGy+pLluZdumfcbAtjGrroz
X-Gm-Gg: AYBFou0zRSgb7YTEEITPjdtQUsuHdnGuVc4axxKDVjJrEHhgwbeif64DJp1TA/oMS+q
	6e+fHgQU5tkaVPnw/DarApfKR0yGez/GpsN5BUEjs6dx/paXYCipKtRTlRhV8iZHMz+iyaERue+
	/WcIPpK1OJE3KusLu2TrFAntCC7stsS/gG7Qen2q8hAWelb4lj0F3ZMrHLoqdxeNPYfuWerGqjp
	3DEchkcKvBGoU9ON46kfk0o5zHdpBqp+pyPWf+35FaRBd3l0gwKxckMt3wgMLmnBoCIE64SfeQK
	PyVFp6HtCoXQhrBFRd4cuTmzMrvUTWE0XSb1IFfOCFJbPgkE4CxE2cdKBpK+EmxelkF+yHXFdlm
	O06J6EZCovMOzgbq8WbP+Cc0gXKbHpHUsDnrTVL6LwQ8AY/uxQRgodaTSoEljjX7aKrIsd8KA8n
	NdulXjD63KAHXy8ad7leg5UX+aotTEtDlnJ+E4JlXGS9TPikYGS8J9PGShTR9no0zZ64aJAvYbJ
	RMzZ1fJotlmjDUZPwHAxGIgkRjaa5zbba3xY44EsfuHRyqinfnMYZy8pPmBXq52ep0tIjxHdIoI
	PK/GfpHrqi201iH0q0S7lf6v0r/ytXKHCn6YAFaexoBzDC9y3xAtpRPk7kT6O8NofjbjBWHiR7d
	8EOylK4HMPGIp0G5w+tTQ/iixQUlSGuXeHj+EpcMjb2OKhSDJyEO1VTd+TlyE3sp7B75vq47YO2
	qMBmPk9FJRkuQXBL3pltXO2TIz/pSMZRcoMy6dD56ed19xYpZbxvbeHdWhUAvIfS4IcfqFFBu4Q
	LSN6CKXMDBzpw==
X-Received: by 2002:a05:600c:8b38:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb55a7b45bmr192615255e9.10.1794762715336;
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: tanix: Enable Ethernet
Date: Sun, 15 Nov 2026 18:11:48 +0100
Message-ID: <20261115171148.37784-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

The Tanix TX6 and TX6 mini have a 100 Mbit Ethernet port connected to
the PHY in the AC200 companion chip that is co-packaged with the H6.

Enable the PWM controller and the pwm-clock it drives as the AC200
reference clock, enable the I2C bus to the AC200, and describe the
AC200 Ethernet PHY package on the EMAC MDIO bus, so that the EMAC can
use it over RMII.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index f08077175549..d101001b6f70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -85,6 +86,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -105,6 +110,14 @@ &ehci3 {
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
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -120,6 +133,29 @@ hdmi_out_con: endpoint {
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
+		vcc-supply = <&reg_vcc3v3>;
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -163,6 +199,10 @@ &pio {
 	vcc-pg-supply = <&reg_vcc1v8>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_ir {
 	status = "okay";
 };
-- 
2.43.0

