Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70743AAF6C
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734160; cv=none; b=X9JFKdEifq0zH6/OkleqadnaQJIidcUizXnCrhTW2PdqOHJn6exLI+068dvZJ88nDY8MUFaMjwm0kX5g1ijJmNVH4TfxlY9T7EbIEj+7+rywaN6KpJ8COyRbwd6la2X+ouQfhU42bBxPW7rFrwsq2LmtJ4MC4yOnkTTCdANgyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734160; c=relaxed/simple;
	bh=gC2dTirWRvmFzKHVs4SyB39x7wyh/gb+c26PdnYQrvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIm4hapPBXi7VD1h7qnce0KCnhT5ympjDBkxtPn+rrU+8TnTqR9mGi/r0hk/8voBlUvzH8dt3DuhlqnAgfHFo/Pwe6Q0cbBGfJsgrzYMrj6Mjsys0LvZMFevUZ9KXvvCkDz/ISeF0deeAMNKaRwfF70AJjsedJtD0O25cJVkeM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5Vd9DxV; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5Vd9DxV"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6b554044fso2627424a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734157; x=1786338957; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=X5Vd9DxVAT65LmnKa+N5KTKCD3vS2IyxYuXxMGz5aeMnoEVlerxQefNDFs84D+4SH1
         SrJ1ciJdvvO+84/GKeXeFWEdbbbCudbeE61kraMFhUA2AFYlUKGEk1Z7c7V1Sx1wrusz
         dlaocWILE+Ck/kqhyQKxYlGpAwu6/u3Twjpzb6qzyGtL47EfZCQ15Y44r1DoHohHsF16
         XyQ4lwD6k0HnZbc0sjsWEGWEzYe0Uhfig81yZxxfAPDkbBCETN86Uyd8gSd2fKjxxayf
         9S+pDejxt9nU801uheXLAraMDdStNokknHfJcn7Ok/3G4/yof370B4lP0I5Lk5iMnhWr
         5H2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734157; x=1786338957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=Rlw/6lyfkNez2pcartmVGrSyBdmikYWXtUjdpZHkZswCMUzPUdEd9c6cu+yGKcDAbi
         Vpfvq86fOvCklQMTDBOEWEr12h4xbIlolwCn0MOETKodq1IEH9G+ghxLLuEmICXoFy8E
         4LL+3Wgj6qQ6WPYwvwYz7rhrDqvQCPSj4wLyO3Lptm4TJURjEFzk2nEWfRBNLpMJju/G
         FdMq5SBfoq+9ijlsN7idE4p9QX92djQyPAhs0bDyZE2ZrW3XP8SJBSxOjp8woS5Od80o
         sSuv/EmNreLjs+4xAFBq8do8mCV/d3nqKlUa6uB1X1PyCeVzcID8Q7qg+hzh6/WluQDe
         cHRA==
X-Forwarded-Encrypted: i=1; AHgh+RqhrJUlz9/MvflC2TvcVaugYDCHkAjc+L+LjngrFW9LZTH2cbSqxYwf0f+aA7L73RUvn2iJgOnZPXUBqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZY4fTNMJG/HyHLbuBe1iwLV3ch+pMNqxOhNOQqEYVLyQxsKCB
	ZnmVpf0GALz7qTyiK0OHvZuvyRn6Ni1tMGpq6xH+8dvi3YWF57KJv3i+
X-Gm-Gg: AR+sD10850Ks3CPEtewWaOy207vBM4Op0+hLgOhFsYxJLVN3oBqmVMEkyQL2q0vjyVs
	HRo6S+bxbv2XVPzL7IOTS5UFna/QaGmLDW+YwULllHHfLU70aZP6F8J6MeWkntLkUrc2aRyC0ZW
	FEankWqbnXOl4Il9izkk/F5SPU/IrU8fbY3hbpmeT32uIPheC/nsYuVsMV5/HYOBlbucH8y137u
	np33pTEH47IHQdC52pbCfxy3o7ycB9sSSRO45KD/wXaGiVCw18CpraVFRpIzMN3j3CZ37nVbpAz
	TPY5DiPxOwVpA53hS2pwQfVgtg0kasqLZF2IxP5oJ7gcwWbw9QqW1PXD9l3Z+BbeGHL6nDNiCbJ
	H026sQCJFcL023AxaGjThkwdA7VymkYcElVs+GTr1jjvfqXBor3HGz6OmiPIu5RKeJHwygryf9B
	zCJGIwIo9P8tsZdV38OiKO9NqDAGXKqgxGgOv5J2NW5CwvS/qy9azgqTI9Ifkt8WriItDjP7KmL
	iZNAXHFVaCvIYz3D2e+CkX3nKbzw7u64+Q/AfQQv+Q6L+4xixTZ/9hzDuKvuJ9skIJGbCZ8mVNK
	GgIyFKdOATvwwu7pZcG+jNNHr85gt15xIdUNFPnzZyGCdDCfKVOQup400391X6aGffqeU68dYVq
	RBGZa4HPdSWKTnFcO
X-Received: by 2002:a05:6830:398d:b0:7dc:e090:68a with SMTP id 46e09a7af769-7f1969181f7mr14873339a34.0.1785734152850;
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:30 -0600
Subject: [PATCH 20/21] arm64: dts: allwinner: h6: tanix: enable AC200 EPHY
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-20-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Enable the AC200 control path and RMII Ethernet link on the Tanix TX6
family, and provide the board's 3.3 V rail to the AC200 function supplies.

Route the PHY interrupt through the AC200 interrupt controller and mark
it as a wakeup source for link interrupts and magic-packet wake.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..6cd75961e3cc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -7,9 +7,11 @@
 #include "sun50i-h6-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/x-powers,ac200.h>
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -84,6 +86,22 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&ac200_ephy_ctl {
+	status = "okay";
+};
+
+&ac200_pwm_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -104,6 +122,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -119,6 +145,21 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ac200_ephy: ethernet-phy@1 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <1>;
+		interrupts-extended = <&ac200 AC200_IRQ_EPHY>;
+		wakeup-source;
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,xmii-rx-clock-inverted;
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -162,6 +203,10 @@ &pio {
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
2.53.0

