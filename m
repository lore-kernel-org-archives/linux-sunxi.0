Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729495;
	b=ZUAH+haF0INoQoCSeIZ5QugJ1O3FvNqdHP2O9ggm7omcoS5CIhj89KBOA4HFiKNo6DI+
	 /LcuO9I/rHCserGLm106gTdajWfWHguExIgwO7KjmpuKXbLiwb86rHOScdeocxgtRQmqg
	 m4ZL1VblSIghzlb7zK+ZajofH8pigIbZSNnCeKYoHdY5INUi1jn1H8/jXaKNO+gNq+v4F
	 sAvvXTtcWh2dwtrTVhis90pX5XcT4Oc6IPmJY9sA1GBG2RCzmQUVjLUvXPDuDokv92gv+
	 aGUhIS0LxjwfY9GIg5TZ6nP0pXk4HV6Icwe7M1d+ozepPcP6XULefzkhcXL+ru2xToQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
	b=bCEfqdVsx/o5MgxHOJvTbouyjkle44SZqY61CUNf65iMpffgexxw7cu55odbN1ybzqtL
	 WOIw8qrikmG4vghz1DyUEa/7CCfCL3NUMZNZMDwU1JLeTlt7XLhg+Me/FUCVDaHCuu6Cv
	 HDdgi1OzIoDD3YIPRHjHM5plF201k8aYb52IoDAADFV53Jcujd1qwBSX4lNRTRyW1NEP3
	 tPkjV8smYvDSZSHUT5es0gBN9dvyp36kIRCC4O6/Mx9nEsPTPHV+sVMKUkfuiflADEK6M
	 tbVKUDYetoKHW0ECErQULTaZJJVSjyK8yxPHI0EocgXOazNIIv3BeuoneruJeZ8jnow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xttx+fpK;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967F60A263A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D967F60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xttx+fpK
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso6537765f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729493; x=1796334293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
        b=xttx+fpKY/8HZFIDsX6cjs3CPZWockgczhaokAr8XIYm/W8Bk9Cpsv3C0ZHydnmUnX
         4zGAItFtY+BVCqYwnjgcJncGC2wYofopJCWJ7EnwXrz6otynWLDXKpOHEFMSuzn7YPPz
         UrOKYsxEGx6Cvxe5OcMFAbYFmDMxt5PYXKfLhYO+fM1ImGwA3WmXnTL/u7dghMDSlzZI
         3QyxkftBBIpUg0rmylQzlIIrPK8VzsxpP8/w85oU0IRhzsEhc3yU4MJB94pFfeB8z1P0
         JZ/ijX4y8VoQkMEL5EL3t64XancVDZZ8iZP33qFeEoSlE1Mg242HolndY4BsKDa5KbyX
         xMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729493; x=1796334293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
        b=AiFMcIXUxAROH0y8FCZwWHBCAUodmCaC5qBKxzJYVFFofLAc2lGPXg0sEDlNUsUjbu
         gO+VZFh3gRWSpahusP39ihyZJ5Zr5rnX5wvE17e7kg0Ku8LzwfuMx1GahyqetcheNFQk
         2SChFv1p4pMX/ZHNvBxE+DoGlDkCxLau6XvvSqE5nTNQ6M9JRPDzuXp+DJGIWUcFbdf4
         Cwud+tVvYA2jW1AI++/O+u4Nwrme31R+uXnlUx//L4Cr28N6aP+fvx8BGXEY70ylGmH9
         cKEBoqvSAXZ/zzKCCBN0FZh+i3GksV5MZt1vNmJdlJ1Du1lIClPIfBeIOM3TbSjCtBNX
         4Rfw==
X-Forwarded-Encrypted: i=1; AL+hErFYibKn6ie7PccAxqqHyJV9wjebHigGagJ81TY8esfpIe+uR4VV7BOzAl+sglA3Vo1w95mAOy9OQqN8Ag==@lists.linux.dev
X-Gm-Message-State: APuU4Z+LYnhVbgSycsN+vrVejJyyIFE9ZlLw/whq3UtXmUcUI6D/B0Sv
	euiV8LStQY8g2R89T14MSdiHAr0y16mH13Tp8enGlnwrJjNsHx+oXQUq
X-Gm-Gg: AZFdTZeRvFVITrarVuhvV+gGs69NoBzZ3v0bS1xFL6fpafpwCATUd0RWveT8jhxl8iQ
	ms42DP41QX+sUM0NCbH2dCbaBuh4uT7neN0f8jgCsa+ySTgvKyDQsnepYJQyZVXt3w+WwvDWuhy
	iTf0sJTUPkP66Eq5w0VT4uEfpEoJK+I4/9TdiF4vX6v0uIldoxLCkwKsEYg2enDfZcPsKjI8nF5
	qx0vm5yw2sSWHBrsp/lv1gv3fxLxrlWJ6rTj210ImuT8KI5Gv76TuZbB4olIH9i/3kTcauqklPK
	IRMh1GIBaq10RmeWLDxiEVPnuIZhk43L0eoYRKtfDKkeXRt7Ic13PkLX7UCPDkZBtKf0xEQIwBo
	bli2nyjcSx7a4/VPmA40gY1OcnK5B5qMByCCgZtzchAYcH6yHaG/sxZ36u1kZLdtAyRPjiXHrNk
	orlMdm2EN8lVDkvdwyaN8oSTg2X5a2HywQUgi+jvtBQb7aXHsdy5o8m94TMBjXCEVvd4SD/bhGc
	vwJp0Lec66ABITFtbpgxAJuDFoDaFXzdcssjkMBcvdq+L2sWEQLPrqgplasrGINU3Oe21tX2CAS
	sRj/e5us97BewHATD4gnVg4UvZFdzrXts1FTimzUW6KnHbXflw4anpwtjfcYe2Tm4tq8M9MUIni
	JTRkuc9G3UYgPWubQTTVcF9FdOYLgqiyECAg/mywz6fMVRr3L47TBia1wc9Nq23tMP6Z8VDqqR3
	i0aUYgyChaX3kQIWQ/LLa5wSYa6jYHHexJ0dg9e9CJp185AWpTNKmOaeH5wwb5DOJN11sxMzd3t
	SIVekaVQiKoze6jjYm9NAgIeMXTh7BsFfj2RbUhj225Oiq1CBjb8hkj4tVdY+o=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr458713105e9.17.1795729493210;
        Thu, 26 Nov 2026 13:44:53 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:52 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: allwinner: h616: Add display pipeline
Date: Thu, 26 Nov 2026 22:44:32 +0100
Message-ID: <20261126214433.3562326-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

H616 contains a display engine 3.3 with two mixers and four TCONs.
Add the display pipeline DT nodes for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 93c3b8279241..d7ed84d3c121 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,8 +7,11 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -94,6 +97,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h616-display-engine";
+		allwinner,pipelines = <&mixer0>, <&mixer1>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +159,84 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus@1000000 {
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
+				clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+				clock-names = "bus", "mod";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			planes: planes@100000 {
+				compatible = "allwinner,sun50i-h616-de33-planes";
+				reg = <0x100000 0x180000>;
+				allwinner,plane-mapping = <&display_clocks>;
+			};
+
+			mixer0: mixer@280000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x280000 0x20000>,
+				      <0x8100 0x40>;
+				reg-names = "display", "top";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+				allwinner,planes = <&planes>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint =
+								<&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+
+			mixer1: mixer@2a0000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x2a0000 0x20000>,
+				      <0x8140 0x40>;
+				reg-names = "display", "top";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER1>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER1>;
+				allwinner,planes = <&planes>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer1_out: port@1 {
+						reg = <1>;
+
+						mixer1_out_tcon_top_mixer1: endpoint {
+							remote-endpoint =
+								<&tcon_top_mixer1_in_mixer1>;
+						};
+					};
+				};
+			};
+		};
+
 		gpu: gpu@1800000 {
 			compatible = "allwinner,sun50i-h616-mali",
 				     "arm,mali-bifrost";
@@ -978,6 +1065,339 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		hdmi: hdmi@6000000 {
+			compatible = "allwinner,sun50i-h616-dw-hdmi",
+				     "allwinner,sun50i-h6-dw-hdmi";
+			reg = <0x06000000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+				 <&ccu CLK_HDMI>, <&ccu CLK_HDMI_CEC>,
+				 <&ccu CLK_HDCP>, <&ccu CLK_BUS_HDCP>;
+			clock-names = "iahb", "isfr", "tmds", "cec", "hdcp",
+				      "hdcp-bus";
+			resets = <&ccu RST_BUS_HDMI>, <&ccu RST_BUS_HDCP>;
+			reset-names = "ctrl", "hdcp";
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
+			reg = <0x06010000 0x10000>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_HDMI_SUB>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h616-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>,
+				 <&ccu CLK_TVE0>,
+				 <&ccu CLK_TCON_TV1>;
+			clock-names = "bus",
+				      "tcon-tv0",
+				      "tve0",
+				      "tcon-tv1";
+			clock-output-names = "tcon-top-tv0",
+					     "tcon-top-tv1";
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
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_lcd1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_lcd1_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv1: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer1_in: port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+
+					tcon_top_mixer1_in_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer1_out_tcon_top_mixer1>;
+					};
+				};
+
+				tcon_top_mixer1_out: port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					tcon_top_mixer1_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_lcd1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_lcd1_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_tv1: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer1>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+
+					tcon_top_hdmi_in_tcon_tv1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_tv1_out_tcon_top>;
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
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon0-pixel-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+
+					tcon_lcd0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon_lcd1: lcd-controller@6512000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06512000 0x1000>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD1>, <&ccu CLK_TCON_LCD1>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon1-pixel-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD1>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd1>;
+					};
+
+					tcon_lcd1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd1>;
+					};
+				};
+
+				tcon_lcd1_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+
+					tcon_tv0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
+		tcon_tv1: lcd-controller@6516000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv";
+			reg = <0x06516000 0x1000>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV1>,
+				 <&tcon_top CLK_TCON_TOP_TV1>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV1>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_tv1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv1>;
+					};
+
+					tcon_tv1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv1>;
+					};
+				};
+
+				tcon_tv1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv1_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv1>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.43.0

