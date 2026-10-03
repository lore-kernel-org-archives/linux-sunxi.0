Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB091F938
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Oct 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990848; cv=none; b=amLTyUp9aiqEFEdLrrdL6HMISdy7EvfsLMHzrhcebcTvesempEAFkoyE276umzIx8tI1TALgUhCNloqa/Lkg5hHmDoYiGGwRSwA5xFk/rrGj9fibobqXkt8lD/tsvGX3OlszGfuWCxXHcq0RhwOZzFkKnLG/o/TXKRr7HUNc4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990848; c=relaxed/simple;
	bh=sAvpzAz2NZN5YAKhznAkiQ3ghITlK/H3MC0boz/bWb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKvxJTzqeb4hJcjf9FhV8r2VgkkugeJUhZzQSzU29inPEe/3RgBV7zzpFv6lIV5i9RdWpNGOvRamYWxOtowoj62YdiRNvWix7dwjGBM0IGOnwjGzvb5lLw6thBj/3+7UbPWUlwoPGznAkxITeQTpfcX5nCqyV1GcnrDjEgOldMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so172808eec.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Oct 2026 18:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990843; x=1791595643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luvk4RSDKwxoXOLtb/naS+7NpP4AkbeMINi5BwnyOQg=;
        b=FvkjcJwsjWWSy4En2voVkwMjTEcVfb06/OgGogUU8Z0W6ymwRTskAwAPfUlstm9/Fg
         ljMWa9p1eRl8cLniq+IJXG9uwrW5iCvLzpZneB/go21yf28Cj0KfOwjGP33+LlrWmJ7g
         Qx/PNh1j5QZJQ/UchxWZ+TrQS5XFnW5ovJAaYfp3zcXxcdttLMCB6dCo4dk/5xSF++X7
         0mimfdCG9Sa2bMxgKtw1ttz4Z/NYo1QoPGE6x90pxFG8bQD2eALBIX5bFgwkyTsd2k9R
         JUX14r7ybHymsdWrwS3urXfi45hacd7W2elbKhh6EopVn0tPf3otJLYSs0lAh1oFmpCZ
         jd9w==
X-Forwarded-Encrypted: i=1; AKwUvBz0APR74jMU8bqMvBLeq95jXjsjk97kHSBIoY4dnJmXnImYm2dUyHdqSFQ4Hf9u96TkUYa91fG1UDfdjA==@lists.linux.dev
X-Gm-Message-State: AFuF++nHRRyKfTiWpWy2ICDyOUqnqnX2YcxBhFnhDkhypvgU4C9oVo5+
	F+MbS9ThTzL8dZ8HyBr+PaqO3P1MqXHt60D0Zdg3ezTf2RTG4wRvpzmR
X-Gm-Gg: AYBFou1QWX24BdEY7wrQ2QA2gouM//YBjkT8zeFDNgxDmwgcdU/P9ah48l+oGDgbS+m
	LpnmnsiAqewVjA/X/3QL4Z+tJVfheqw0/hwHGaKgPkzIH6rqEqI80aP4x3Css0/lIzxB9fbWqt0
	zPkO9Fhr07p7PrvDAL4EzZVvGlhPqYdVeoaBwykcaCQT4/ayMjM/GFbTmbVjxdCXREQa2d0DEdr
	d/Omef47yoq9QYJypF9DhLtUc/d7sGcokvuk/2d+Zqbwm9sr1dDAYWEnhKOZ8iBGd9CMzffxOYe
	7IbzqEcGQ2X+UOBx3YZp7rkE9gJpdbRCPsKVJEsirZTTFllmLKUSJytPb6JiQIwpV1L6eDH1l7v
	NxESuBoE2ZCNanY3IQBcBgvTSM6psh47u2g2Qa/X1lkaGhYix0MoG1Ph1rWbcScfin1tQFYC1nI
	Ss8CP/usiHtZhqOCgbzaMAj9ErFIL6bjddy6l3eMoxki62LXG2F/OsSOaHO7+SDQFG0gRemP1bx
	eOux2+YXdkp0vrC/kW5udN6LFkMd3GELVXRiMfGcG/JU8YXiJktnp9X3vQ8CMoi50HJdRZLSXMb
	nHH79pIj6uOeTpn0uNOd9317wKNeaz0yKpEh73/y1BtQ
X-Received: by 2002:a05:7022:f51a:b0:151:cba2:effc with SMTP id a92af1059eb24-151cba2f2ffmr1217637c88.30.1790990843319;
        Fri, 02 Oct 2026 18:27:23 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm1116843c88.15.2026.10.02.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:22 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
Date: Fri,  2 Oct 2026 22:25:36 -0300
Message-ID: <20261003012534.418820-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without the calibration cell, the THS driver leaves the sensor
calibration registers at their reset value (0x800) and the reported
temperatures drift from the real die temperature by a chip-dependent
offset.

Add the SID node at 0x01c1b000 and wire the thermal sensor to its
factory calibration at eFuse offset 0x40, one 16-bit word for each of
the two sensors.

The R40 user manual gives the size of the thermal sensor key (32 bits)
but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
but that word is zero on all the boards checked. On an A40i running the
Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
eFuse word at 0x40 (0x08780875), which confirms the location.

Tested on two Boardcon EMA40i (A40i) boards: THS_0_1_CDATA now holds
the eFuse word at 0x40 of each chip (0x082d0822 and 0x083d0838) instead
of the reset value 0x08000800.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index f0ed802a9d08e..c7c9cad695ca4 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -485,6 +485,18 @@ ohci1: usb@1c19400 {
 			status = "disabled";
 		};
 
+		sid: efuse@1c1b000 {
+			compatible = "allwinner,sun8i-r40-sid",
+				     "allwinner,sun50i-a64-sid";
+			reg = <0x01c1b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@40 {
+				reg = <0x40 0x4>;
+			};
+		};
+
 		ehci2: usb@1c1c000 {
 			compatible = "allwinner,sun8i-r40-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
@@ -832,7 +844,8 @@ ths: thermal-sensor@1c24c00 {
 			clock-names = "bus", "mod";
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_BUS_THS>;
-			/* TODO: add nvmem-cells for calibration */
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.55.0

