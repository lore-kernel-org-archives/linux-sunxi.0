Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E742F7F0E
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206965; cv=none; b=KLvlSlPZkrMAyQXpBBxnjosOV1wWiutAvTTNWbYxfZHYsGO9YKyud73/pmsCietS62O607uaI4LrNlWUjWsnLZbAYKTMcym8AUdiP0i0m5F4dmdKv3fahWAFK1ar/jztuKp5iYDLLbQcd/iqLisd4T3txBHeOg3yxKBLrmd6O7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206965; c=relaxed/simple;
	bh=RLTBSlbt/LOJRU9vPNR3jnmVXbPZkeZQlXzT4hkRuR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cK8gzMKc+WjrrNh3Z9/sfxZi8XeT3VrrzsON/i+bI44KpIwx4pnm/BRyRDB5+AtSG7hSUC97KeZpDGohCQE6Q9SunRONqq4zMjFlFPMm40B9LUXoKPyJ2LSGnAc7pqf8cX7zr4nyMV7ysDaEhrGjw+EeeHSNQkeT+9+8brnaTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJIECjId; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJIECjId"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ecf499af9so40296587b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206963; x=1785811763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=;
        b=UJIECjIdS3lzOohQieMuDK9xh2GKEKO3Yb316gcGhWFKsZN/OKKKekyk5ENpgLD1E/
         XAnm/Y18smSItSeyl/ic+WMM2vW9h/4pRwzQXFiuxkNySGWvmLViuh2XIw7ZJIe8Vvw1
         PaH0gUFxDoGrm5xOVPZGZYKoOSWJNvkdydHxap+fAJfcB5arT8i9PW/XSO23/JFi/OHi
         lsn8MqRNbsKAKD0hHVLDIc8Zx/nSGAHBbenDMz+8BurQmi6DXcVqTZthmWjcsRrGviNo
         wPo7jvLws9zVtYKgnxwQDqPnTxlVHrNxE1XXob4pbuu34r88LgpbITjpDOECDUFVMgx3
         ghTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206963; x=1785811763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=;
        b=SgjhrZVCylZlw4iwQtzN1XhoHIw6nTwm9YOEFN88qblOHyq1uKCkT+FZ9oTeXoyL9b
         FrTuyxo2jW2ckagysobEgfrv/Bb+HL2qaVFs0fkB2F2FuRSjSvQAr5Ys3xS4hEfgL/F7
         rEa0TfM/sy1zIu5nSl9WFZKvUaJYULNfuXZxx5sftWR6MXN7BhBYYSn1H9Tr1fPYD2Pp
         FhLNKVVk7huMVaD4MfMT4bzgr+za1L+njNauH+I+xaPar8gZsIO2iODDc2GngpORIhCP
         O3f3e3s98JQCtC+RPlq9ggGQm7XH8zS2XV/HTtpLxFLrsLq/iYetoD17FR3tjyl1nU6+
         u48Q==
X-Forwarded-Encrypted: i=1; AHgh+RqMkb5AAqHu/eIlzGsGSelH3C6OUbhNl8toYBykhjOCuUjGXHvspu+TtRhMpXWi6qqKnCyZtKuqEjF5fw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2lHYgi8MNGwkA6KE85/kvTMVDfK6Cl2MfISI+RAyck7J/N1I4
	E2ufdgM+bTRjkjqDCLXXivyWGUZK0RzXyWBH9hGRjPTycJL/9sNQhnh2
X-Gm-Gg: AR+sD10HmHEh5f1GJ5P+ZCHNfNyqwhzHDPXdC+D5tMBe0JYXqmZceJ0aQ0RyGwrtzYO
	BGVTwOdcqRjL4Deq/7nHgn71E5jF7JAxJNkm8hFhSvtffY5XxfXa4v6L8YPt7n4PwaHcKuB0EtX
	9haKMVo1JH6rbRrMLLlzSEucZnWm0Dw9zNWoHnMfiJ0u0MrtvinMTdXKIQq3LiB35Hgo0wULvGK
	xr9Po6lBBK2aHBVnpeDkH904DAMv92gETSd6gzBgx0SL+q3f++Hz4TatOSzfIwa4TAskXm8T05i
	wfw32C+Y8s7XUWLSthZ9/oidPgVsoWFPisbVt8HN0h4yTQsT791Qase07Zk4mEUu7XbWP/LtP05
	tPFcWr1ZFITnFw/IFv78GiIteRxtFT5eiVi8oJH8n15tNMY9ggKPHpSRhxH6fKCeQz8PsSMhOwH
	kklgkLzSf2mM4VvFvUvB7l+AMJImPkWMUQ6NlQ
X-Received: by 2002:a05:690c:6d0a:b0:81c:e8ab:c4dc with SMTP id 00721157ae682-81f992b6a75mr2515787b3.51.1785206962862;
        Mon, 27 Jul 2026 19:49:22 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Mon, 27 Jul 2026 22:49:14 -0400
Message-ID: <20260728024916.993224-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

The RTC domain instance's RX signal is typically muxed to PL11, as on
the X96Q Pro+. The CPUX instance's can be muxed to PI8, which is what
the Avaota A1 uses.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node.

Add pinmux nodes for both pins: PL11 for the RTC domain instance, and
PI8 for the CPUX one.

Co-developed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - add /omit-if-no-ref/ and rename to r-ir-rx-pl-pin (Chen-Yu)
    - take the PI8 pinmux node from Andre's Avaota patch, named
      ir-rx-pi-pin (Chen-Yu); Co-developed-by added and Andre's
      Reviewed-by dropped, since the patch has a new hunk plus
      pinmux node name change.

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..f0b74693da7f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pi-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
@@ -327,6 +334,17 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ir: ir@2005000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x02005000 0x400>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR_RX>;
+			status = "disabled";
+		};
+
 		ledc: led-controller@2008000 {
 			compatible = "allwinner,sun55i-a523-ledc",
 				     "allwinner,sun50i-a100-ledc";
@@ -927,6 +945,24 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			/omit-if-no-ref/
+			r_ir_rx_pin: r-ir-rx-pl-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0

