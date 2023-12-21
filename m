Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F4D4F8B4
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyOtQWcr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a265d4f78bfso49749866b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 02:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153458; x=1703758258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFf3Xy2cMnTXIbMlXJLnwk2HDFYZqTaJR84g5dBGsLI=;
        b=iyOtQWcrL/90ehk92JFiPlvPt8fpaSAhOiw/O2aYAMU70RokcycegJ6teIZM/n9BMd
         J9+7TuqSyzfX2ldlzOKsthDkr0XvkvHE7+UcxIPtaRUJ9zYhkTNUJCWOKsr6UmOKshLi
         vKYjPaEXQsZ5cw9B+EbtHgb69UYM+zYvjqMZtma4eQDn0HnZuH9JNUxtM1mDySQ3qeNP
         e+xBp4PLjKU4kcpKezP0ca1n94AbEzEof+253Ok+A8ikeitAnXUMuaXnY+g+Qqwz32H/
         I8oLC6dkONxOMWtOZvI1HKFbWKldrQdRz04sITrahgL9RROYOzij2PTJrTdMFLHeJUkF
         LEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153458; x=1703758258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFf3Xy2cMnTXIbMlXJLnwk2HDFYZqTaJR84g5dBGsLI=;
        b=f71gRFaoUM+McJJGtYq51t9OMTyCCqWIfXfVfV0UYy/1t9l08qQggKRfueK7sim9ol
         foxUzgZq4p2fJy6PrAjEqRH2EVegD5GU9mN83cYICIHovrNGVHWBjiKqfVydXckGpRs+
         Le7iJWwHWDLXMNGwB4bPp6wPULcohfz5aK5GeakTsIyfvO/fAtLUXmVK2J/eE8n6sEBM
         Qj3Xeh6BX/JCRgsqHjSLswCP46UBXu7zlXOcUite2guCXLxEJEkhfjwKHgZ/Twhlsbjk
         LsQiuDQoSWooTA7BkUG/TezadYoDFs+vDFWPFOOQDSACL1FhR45bQ+I0GdmyOLvysXEL
         x+AQ==
X-Gm-Message-State: AOJu0YxGP4uDTSsLFPhCAs2yIHhZtSIhKgYlIbcgYwuerPDx+rRLhg6X
	hbN9xGR6rC6w3N7+WCwlyrM=
X-Google-Smtp-Source: AGHT+IHdyV4OQDmEi6Na15vJj61uqzNpkif4Hepo9TNBl7sFfbA0b7Ola/s2/GZQujvgdIcyNME+FA==
X-Received: by 2002:a17:906:159:b0:a22:eae6:1657 with SMTP id 25-20020a170906015900b00a22eae61657mr8537126ejh.33.1703153458485;
        Thu, 21 Dec 2023 02:10:58 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:57 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 3/3] riscv: dts: allwinner: Fill in OPPs
Date: Thu, 21 Dec 2023 11:10:13 +0100
Message-Id: <20231221101013.67204-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231221101013.67204-1-fusibrandon13@gmail.com>
References: <20231221101013.67204-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify two voltage ranges, in order of increasing stability,
for each OPP.

Link: https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
Link: https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..7e2e015e0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -39,16 +39,23 @@ cpu0_intc: interrupt-controller {
 	};
 
 	opp_table_cpu: opp-table-cpu {
-		compatible = "operating-points-v2";
+		compatible = "allwinner,sun20i-d1-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		nvmem-cell-names = "speed";
+		opp-shared;
 
 		opp-408000000 {
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <950000 950000 1100000>;
+			opp-microvolt-speed1 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed1 = <950000 950000 1100000>;
 		};
 	};
 
@@ -115,3 +122,9 @@ pmu {
 			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
 	};
 };
+
+&sid {
+	cpu_speed_grade: cpu-speed-grade@0 {
+		reg = <0x00 0x2>;
+	};
+};
-- 
2.30.2

