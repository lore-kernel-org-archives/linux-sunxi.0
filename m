Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3543C04A
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752454; cv=none; b=c/A/XRPub97OYzPaufSDo3CJ9N7Vt5qbjhSs4JVUxNlyalo88GKR1kYKv62O04gWquThkBHEGcPJ7djppZQw0UbjaCKiRoD8OC/WLiJQwpHMFN/wjTnF1dgA3lukzkqRlgnAILV/0k13HkCBeVTHlwb/rVVBMdql7zWh0b/wEug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752454; c=relaxed/simple;
	bh=6esLaWMxVzWgBgD3LBUpQLC+g+cCbkEItwcvYGe7Tc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgxsDncYGkr9OJ7ydLKJXU3C39pWZWQnZYPSB8FmaYPNYsI1aflzrh7MD91KTWpMMwWpFxaq4pF+Rrkore52QFYLxeUhPh2Qg1Uwiz7degVF+GC1COoVqgx7H8qo2RMpUl0eUkL5n3G25s86fxMJY6sIy7dd4YgahZG45MRgHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz4ibcQY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz4ibcQY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4955de8797cso23797355e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752442; x=1785357242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=fz4ibcQYClXdiy2Zf0Ep3XRaOi/bJ6xm6me2+P+c9INn8MgJ8mOezR9pCvBNmwRZw/
         nOHI7rus7/+gmWvEEAZXVXZUmo4P9ToHxkkwuvOD+DkZhN2FReU0/NLOepUCDN5aCJy+
         3yI2J/cevvGBEKCqERcy26V+NSa50REOC1cbIBsBLwZFz2KX0eybO1ENZwO98v1ZVnhy
         7ROVW63I/AJngCu9rdbe+rZ1lHFUXhjXp7ASQh6HaMpQQhwGTkaKhRv9XanH0ps8glIm
         wnfIVUQWGNKJI7A+KXTepEX3R1VcTezKVLeJmrHjkOdZhk4TU6mlzVQmbx12kfdzmQUK
         S87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752442; x=1785357242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=b67+6KBHRP8+YTnucu3oxvR3NlEUKSeVoZrhTlesQi+0dL6p/Xx1VGP9v3rWZlNYCu
         Llk+Iumv2cOb3QKS006cscjpb6xSnAycQVCTMLR0mL9wXYmF9y7DvHhIKwygCI/UajGw
         xpmmEC1R7zEHhp1qlnUppA8BAqthl5SK/d1p/y7RYgZc7BjktyQJyfhIk7rIODGPy4xF
         +0cOW57dXX4s1Du39HexlUQhJbun0s8KXYioUkFxyagMHLMy2OgcXDtCjfI+gyA73gm9
         ht611qTy06gDpUdWwVuHi1jkcKHexnBmk59AwsqJaFMCo5/8Fwnywe/q1YHr5xEkwdae
         0f/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp9BDO1v6YB11B3ijK6FybM8L2W8As8EerUg32C3TFkz4jtJSJt5s9Ed2TSe/hwnDbp1wa4H8xYI6w/AA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfUEc/HuyNzvTSOaY67HA+3+XblMBwm4sKg9A9PAyt9cETgJTy
	W8iFe+eIaQR9M9Wbkfa9AIg0NCBLXeL/DUmTPvcrq15gAwedNLcmi9QCGVdmPzNaKP24BQ==
X-Gm-Gg: AR+sD10tQmT2C6m/8GyLkqsQ4TvOTYzuSDNA4KLqWPPM3Ln9qk1gwS9GT7Ji0R2syEP
	M50PUmQ1qDDrrMHxMWAIFNxWjqFpkf+Yvm9JxmDfM6wyNB+EL1JKjyQ8m63EQodM8IvVXrwFhy6
	ZFrsdFtNlb9w/cAL1FBxHgPawru64D9nudK1Mlvw2AFRdoPlV6tkKe55soQD77/W9CMlVj4XolB
	YagUYPwqROxxLSkQH+ioUzoNub2GbpyG166dNb9EeYO3hNN1ShyTFwMN6+nzyjf6vg1bjvwUh2/
	w8uaFUF961uVYpuHkJrTWbW3AKESjwE8fI/A2zIesiA9xZjNH5xfSIMWFq441ycAvWRcOu/rmov
	y9XhV1gb22vYcq85Gjw1K/u5fEtCmdj8VP9+34R+mH+4uvcFnmzGyg2+Hqwd6+YUhq5V32Hc3di
	LkQgw6ZePQX7fzrBQ5FvUpw9EK5eDolJkFUiQ=
X-Received: by 2002:a05:600c:1390:b0:495:5a0e:6d8c with SMTP id 5b1f17b1804b1-49573ce8e74mr3160235e9.27.1784752442311;
        Wed, 22 Jul 2026 13:34:02 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
Subject: [PATCH 3/3] ARM: dts: sun9i-a80: Add thermal sensor and thermal zones
Date: Wed, 22 Jul 2026 22:33:41 +0200
Message-ID: <20260722203341.2917852-4-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philipp Rossak <embed3d@gmail.com>

Now that the A80 thermal sensor is supported, add its device node and
the thermal zones to the device tree.

The clocks and the resets are shared between the GPADC and the THS
sensor. Sensor 0 is located beside the big CPU cluster, sensor 1
beside the DRAM controller, sensor 2 beside the GPU and sensor 3
beside the little CPU cluster.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
[soeren: rebased from the 2018 series, fixed the interrupt number
(SPI 115 as in the vendor BSP; verified on hardware - SPI 31 stays
silent), added critical trip points matching the driver's emergency
shutdown threshold]
Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
index a1ae092..8e7f8cd 100644
--- a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
@@ -941,6 +941,16 @@
 			#reset-cells = <1>;
 		};
 
+		ths: thermal-sensor@6004c00 {
+			compatible = "allwinner,sun9i-a80-ths";
+			reg = <0x06004c00 0x100>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_GPADC>, <&ccu CLK_GPADC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_GPADC>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		timer@6000c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x06000c00 0xa0>;
@@ -1250,4 +1260,62 @@
 			#size-cells = <0>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu0_crit: cpu0-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		dram_thermal: dram-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 1>;
+
+			trips {
+				dram_crit: dram-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu_thermal: gpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 2>;
+
+			trips {
+				gpu_crit: gpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2_thermal: cpu2-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 3>;
+
+			trips {
+				cpu2_crit: cpu2-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
-- 
2.43.0

