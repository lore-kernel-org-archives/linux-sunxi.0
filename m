Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D48F51D524
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557619; cv=none; b=qtDEOogWuzeNSSLpZrzpKcb3BmOPA5KkOW/lZ/vX9BHAKvWmaLmYD5t6RrAJCcvS6e4VbqCdDUHhJ1cB/YU5K20RjRWNKqzr8/cEpo5Nb3hDy16bV8shsye1/B1I4By/oqFTc4tVt7jhmfwtB9p8EU4diZrOTsOMNb/FB1+lNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557619; c=relaxed/simple;
	bh=GHXhp2MUxIdV2IGw6djrOuEq3lqK+9Rv3RiIzHRNkEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYqOSdQ+nDbz2Jho29HUcDGqEN/GLtvmJOkKS5M+ugXOpe0BES203kJGxNGWhfeBVzdUKOZZHzUruPR0BZx/Rf/2cDQ4XJsURju5TsVSBoXlP9j+/qp7dL39NRK19jK6qKqprT67OzUZsodAfAPYVg8C8jB68CoDnc4A7pZnHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gROoarAv; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gROoarAv"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52fa6005224so13691531cf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 14:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557616; x=1789162416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWoJYzcW0AWxwtfPly+dHtM2f9cvjv3KZD392LRH0AA=;
        b=gROoarAvQH6u80zFXRF/LPKxBqMu3uzRcw41KYwV54aDHjZSyqsxLHhCSTF+RxoSi7
         NTRxAtPFMBtYn+SRaJJX1l5PFajN8UHSrC7Rh3FJi7SnjX1FxZwbJQmUjU46tW2rkEX0
         y1X0RK7laWFcN1B680QYOcCQNPq7n4ypDpqYQzv3Lx6htCtcUKWW2/rzfhcbVmaegiHm
         O7dpAhT5J3iKaI2G5YewGX+7hz9v4vkDTnEkf6/cH5G8kFvuAqdoSnjz5q1GRGsVNahH
         CUdwCUhAKDW68JfIejHzhSyA2fcY25jCvS6EA8w873tdhZ4sAOnF2cr9+i7UGAr6GOke
         a7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557616; x=1789162416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWoJYzcW0AWxwtfPly+dHtM2f9cvjv3KZD392LRH0AA=;
        b=dfNB8asThOZvxrKV5xSYosMgYYsqDE1fu7n4xHi9M1GZbGfe/00q+72VZ5ehIpUJ7K
         fdA5NoQ6y1M/wa2KSlLjmQJk85uca7hyVHzhB+Lg07bDsoJrIPkxEyoSR8I9LUCwVi+L
         6NE5zUSUylE3LUXxlUZLVOSohrkkJceGsEXEI4zwfEY67yrEHX39wJaA9fn8r7Hqdv3t
         ECE8OceP6josrMvhyx0Rp3wDRzKstB9QJoF75m6jqsG7Y4Ns/wUtCWleqLQrGQRupmfb
         ee4bidIWREMtEtZn1/F/tP5ddFVCybl7/9X/cRhrQa6pgVCxUzv08N8CxfmMdSCptbdO
         1LBg==
X-Forwarded-Encrypted: i=1; AKwUvBzggeH4hlKiUlCRezmi59hnoGNpMxhbolqiPh7JtP41Bopi0wQuSfPtSB33i3XHzsQ2B9avos/7nCENPA==@lists.linux.dev
X-Gm-Message-State: AFuF++ny0VJTONGA2+iYgv9ukdxOGNazm2fpM4dnRsX5aetQDFic3iF7
	HRvX+SyqX0wQH7hIkQik5h24A4CfdgS3WXXKr87o2EgDWSzk/ulndaM=
X-Gm-Gg: AYBFou3jtfJa7+KEVYfuXgXJbpHHvvl5/G7+8Zc2RCGWHY8vSkaHtc8XR7ad/QyjvOR
	CpJqZItWLzFUyUmzS9shjCbh3I4OUZLVxzGDckmf0evTdR5AClEMKAIFtkmNYVAJNwi53gawu6k
	hDnk4aCzqetBXegtpT/YcVFNaPPQMIZp4iqSCZh1dtmaQAlPuklOLYZQy/Btsg0LyshbO7GueUo
	bVz2zp3nRhhfue2S0nRsEM6nHPDZ6ChSZOFe/X7PbY9Rl/ZTLuK+yKi+7yA8o0qOw0DY4AUFk7i
	qcOEEJufzFi2agrTZfXx+HioDUUa9BxFBeeSrV58BScGNXbW95HiNdQtyZkWwOR1W8kzl6r1atB
	j+vDlaAQzYBMQU3z+tnKDbUHsIc8o12aivIXPOjO7yXSSZIv0qXN8ZmF5XA9bYstLS/M+WuterO
	O9IuvpLe6rkgo1QeJ/X9IZmGW6mlNrimCTcnOwtAoHxcpOKePJo9qB5Cdeir/NZKS5kK1W8IctU
	G0G5t6DC4woQ1yuhP3ZJZ0p5w==
X-Received: by 2002:a05:622a:11cd:b0:530:27d9:ffc2 with SMTP id d75a77b69052e-530546cf80fmr94981561cf.5.1788557614529;
        Fri, 04 Sep 2026 14:33:34 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:34 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: h616: add display engine and HDMI nodes
Date: Fri,  4 Sep 2026 17:33:28 -0400
Message-ID: <20260904213329.3910099-2-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 and its variants (H618, H700, T507) carry a Display Engine 3.3
(DE33) block feeding a TCON TOP, a TV TCON and a DesignWare HDMI 2.0
transmitter with an Allwinner-specific PHY.  None of this is described in
the SoC .dtsi, so nothing probes and the HDMI port stays dark even though
the DE33 mixer support is present in the sun4i DRM driver.

Add the display pipeline:

  display-engine        - the DRM pipeline root
  bus@1000000           - DE33 bus, holding the display clock controller
                          and the mixer
  clock@8000            - display clock controller
  mixer@100000          - DE33 mixer 0
  tcon-top@6510000      - TCON TOP, muxing the mixer onto the TCONs
  lcd-controller@6515000 - TCON TV 0
  hdmi@6000000          - DesignWare HDMI TX controller v2.12a
  hdmi-phy@6010000      - Allwinner H616 HDMI PHY

All register addresses, clock indices and reset lines were read from the
vendor device tree shipped with the board and translated to the mainline
dt-bindings macros; the clock and reset numbering was verified identical
between the vendor and mainline CCU headers.

The mixer's three register regions are named "layers", "top" and
"display".  On DE33 the global control registers moved out of the mixer
block into separate windows, and the driver looks up the latter two by
name, so these names are load-bearing rather than decorative.

Everything is left disabled; boards opt in.


Signed-off-by: Barzin Lotfabadi <barzin221@gmail.com>
---
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e8625..21aa94482 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,7 +7,10 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -94,6 +97,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h6-display-engine";
+		allwinner,pipelines = <&mixer0>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -965,6 +974,188 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		bus: bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&sram_c 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_DE>,
+					 <&ccu CLK_BUS_DE>;
+				clock-names = "mod", "bus";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			mixer0: mixer@100000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x100000 0x100000>,
+				      <0x8100 0x40>,
+				      <0x280000 0x20000>;
+				reg-names = "layers", "top", "display";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+		};
+
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h6-tcon-top";
+			reg = <0x6510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			resets = <&ccu RST_BUS_TCON_TOP>;
+			#clock-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_tv: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv_out_tcon_top_hdmi>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						remote-endpoint = <&hdmi_in_tcon_top>;
+					};
+				};
+			};
+		};
+
+		tcon_tv: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h6-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x6515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv_in: port@0 {
+					reg = <0>;
+
+					tcon_tv_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv>;
+					};
+				};
+
+				tcon_tv_out: port@1 {
+					reg = <1>;
+
+					tcon_tv_out_tcon_top_hdmi: endpoint {
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv>;
+					};
+				};
+			};
+		};
+
+		hdmi: hdmi@6000000 {
+			compatible = "allwinner,sun50i-h616-dw-hdmi",
+				     "allwinner,sun50i-h6-dw-hdmi";
+			reg = <0x6000000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>,
+				 <&ccu CLK_HDMI_SLOW>,
+				 <&ccu CLK_HDMI>,
+				 <&ccu CLK_HDMI_CEC>;
+			clock-names = "iahb", "isfr", "tmds", "cec";
+			resets = <&ccu RST_BUS_HDMI_SUB>;
+			reset-names = "ctrl";
+			phys = <&hdmi_phy>;
+			phy-names = "phy";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					reg = <0>;
+
+					hdmi_in_tcon_top: endpoint {
+						remote-endpoint = <&tcon_top_hdmi_out_hdmi>;
+					};
+				};
+
+				hdmi_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi_phy: hdmi-phy@6010000 {
+			compatible = "allwinner,sun50i-h616-hdmi-phy";
+			reg = <0x6010000 0x10000>;
+			clocks = <&ccu CLK_BUS_HDMI>,
+				 <&ccu CLK_HDMI_SLOW>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_HDMI>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;

-- 
2.51.0

