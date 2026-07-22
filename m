Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE03859F9
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 21:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754081; cv=none; b=kMCFJveZ0QeGfZfeWAxuSqNHb0LMu3sMavgH5tuVlNs62AMbmFe9BB8mQClJoG6Af3xnGu7UxL5ZmQJMAYi8x8VGUSsXQAMUCcNiJShGbQV/sbauadMlVkAMJifXSuOe0drN5+5pecyUHtVxJ6WJdBzARNQBnVBEwwUbr33sKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754081; c=relaxed/simple;
	bh=6esLaWMxVzWgBgD3LBUpQLC+g+cCbkEItwcvYGe7Tc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2ExdW9j5XX9uBMtV+MM3BkyE75Ugu7VK7GqxUN0tyTdFxOcgtD8V/pfE91fmQwAcwWRP2IwRXeHzo4/zo2sPisNqzZrQAgB48Q67uf8hecjCLPBDOV/OW4wSTX0++HVhRqq0cMqoTNEWCFlIXFk5Cju8ouQ6UjxbFw7B4iZzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWh+5U4w; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWh+5U4w"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-475417f010dso7484790f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754078; x=1785358878; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=GWh+5U4wKMRZtH3cYlJevOJgrTH2f92O9VcpCa5tgeiqvJQT2I9vUVOc5cbuJADL3K
         zWv2Ckzs5WsgukMbP/vTZX0dxAGcWoLNlI6BAYHyuqsGZRN96Wi8K2E6mwaf/4+Y901Q
         XiMqCRYVyPgiclccrX0VUxNwQvB9O99Rs2p3KW9vKLGjGGJI1CB2/pYQg6aIossHPp+/
         xJCD7wl3nPBCuikmt1mbbW61LkBbrx1A8WSRqzKefqb/H/Z9UFrISDA0zlfurzoW6A17
         pcs0aHfWO/Zg0IUOeez8Z86tDkWIpwY3BU6RFIBBlCPFehWQq0EDRlxEKjxGHMnik/sS
         EoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754078; x=1785358878;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=AuBFFF46/m+XJ2uhzwQoYSvfq9brCLZYNXAmJlN4OKOWUpgTWIrUtV0cVgrrLSdRxQ
         Yub/cm19+iZzv0V1O+s31KQkgL0ECjko+3r97Y38LtVZX4ajftJCDktXaWASFfogus12
         w6uwSwTn03+qdrA3TFmh72bRT2nltzEJUxR39G4LmisOsm99LJ6kcXMHMxG4k3pN+cao
         vbGe2KXe9SeWRGFEPpUmsdyTBH3FxKTlrJVNdFErRR5QyehYdBCOalAwxWKaZTcHWCsY
         7ttQ9/Aa/LLkJhkLvrJLnXesE2Tey+gLuiuirDaS8oLEoRNdmdxBg5qwvOE7EI6pYBZv
         nzng==
X-Forwarded-Encrypted: i=1; AHgh+RqGfSisWCbyY5jNgwMBp2jSx9mIg3A3zUL51JN2u7lxbfF1sBcI5dt1stbR2Pfaf99Cyd91adfaR9EJNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI/KlSbj0TOnEQNEqhxHMYpS0PZ1nai2QTnitkIdAukiGedKwg
	SkLiou9X84JtkUXkQ8mj5GkS0rft8lGSO7lily11Y7TIzRHJvRTdkr0d
X-Gm-Gg: AR+sD11nNdEEWwA3vc2JlFOe6IyoE1CRuLcNfuJoHorZjMNKJOWlRUsJr52cVpbXxOa
	cVM6ZHlIBMLq3nAYwnOk4kLXB0vITrVRKXRglFUeX1N8/3BRNAoe+G6JmgdhOmLOAS7Q6Kmiyhf
	mkAWHHN6aXedTqQWATzJW8hHD8uLeVu6m9f3truzHtGVM4KcA/Ax+wxvaAJU7phf+IcWIYnjKvx
	iba+L3IL5xKaTQG9fknX3PwwGG9JESqIQOdGnSn4H7oU49tWL3f1QtNaXGaPnURLF8y0ShSxPkY
	RwQmuNJRKC8ln4vY0vNW7507rQyjuARt4yQYMISNFcH3Q+nlbtt0O1+C13smhO8qcIlkrsu1IN0
	pTaP0Vd/bfbIyts9nfsgrHxW/AZoPSTqugkLwwLmLxXWdC6Lc9svIR1rPT3eDeyCfAspk2kEv0x
	wLUKJCvq5qnhgJByn8JmyS6xMQ
X-Received: by 2002:a05:6000:2387:b0:47f:6fbd:89eb with SMTP id ffacd0b85a97d-47f8dc936b1mr487157f8f.57.1784754077794;
        Wed, 22 Jul 2026 14:01:17 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:17 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ARM: dts: sun9i-a80: Add thermal sensor and thermal zones
Date: Wed, 22 Jul 2026 23:00:46 +0200
Message-ID: <20260722210046.2932498-4-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722210046.2932498-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
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

