Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3D18E0D
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYgTy6DY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54cd2281ccbso3284173a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897578; x=1703502378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LeaDDQj7Ki4b0Ekhl8dm8Jbb6kPpIVsluEl7LY+BBI=;
        b=LYgTy6DYXvpIfbpjNhkyV/9iU5uM5nxjNzT9IJDmFBFCALZX8/FLAKLPApYxz55nJi
         3ECXAJ5KLvZeQPNTKyf2qeT2crDrnlv8xsnmsVFHoc2qnZ7kUsnaV2PCodfQAYPwoKrw
         fywdSb03gEbUWxcYhAUyNHNED1R+i/Svo+Qpx0S1YrRtrmbbEWlebY3TD4vnT2FVWyEb
         Tw2kETuIZfzRZIC7aQmwpksC4EeettmX32T+/paRHmotEIKLoSLnNlet0wqxPvZgVU9S
         2F/9ijrcCJ+xnkWKrQFk01fbmWqcCIoPKUemtbDBpznGhk1XkPNrIio69JZ6+DXVFWdO
         h50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897578; x=1703502378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LeaDDQj7Ki4b0Ekhl8dm8Jbb6kPpIVsluEl7LY+BBI=;
        b=RT7j7cwnpCHgSuZKt17jlN/5ZbFZzgW+O7Eq/Ry0RYgWTrNlGOKmjmEwli5fOPdga1
         Vi+gb6+zJXgka9NRNfNGrsL2yDZNwAA6qTFoHlQWgn98wcsdvBZ/pmgERKKabEEp7qBp
         aMMYkc1xdKOKVJ4YHDZVpVK+Wwlwv8itR6ePCWc2DbpTWW1TqB8NtewXyKGAMlYsQFK3
         EmEPOCtt2Ypxl5H/UOcuIbCqsLwE1mOvmBzIamL2aH2YzQJllblx06EVEvzLo8FteU/U
         TKHwpgnbiIZ817AfmgGgfjGHAp7u/kP5cNW7SYuo9W5MI3gQQj+fOwiAqGo2TK0XlPYD
         tV3w==
X-Gm-Message-State: AOJu0YwtO+r6bIdwIN9/gWBz9hHjcgcXJqrDA5cx8HZQEcqoa088vI/K
	MQqap/qeGStwzLhFtQEx2R4=
X-Google-Smtp-Source: AGHT+IGPZifkd//LzKxHy7u8xX0XqBW45bgrlj+EqkgnlzlL1DsOZUIoi9IVE+ojfJGXuEukc/v8NA==
X-Received: by 2002:a17:906:74d5:b0:a23:65ec:8252 with SMTP id z21-20020a17090674d500b00a2365ec8252mr258761ejl.48.1702897578653;
        Mon, 18 Dec 2023 03:06:18 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:17 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 1/5] riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
Date: Mon, 18 Dec 2023 12:05:39 +0100
Message-Id: <20231218110543.64044-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two OPPs are currently defined for the D1/D1s; one at 408MHz and
another at 1.08GHz. Switching between these can be done with the
"sun50i-cpufreq-nvmem" driver. This patch populates the opp table
appropriately, inspired by
https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi

The supply voltages are PWM-controlled, but support for that IP
is still in the works. So stick to a target vdd-cpu supply of 0.9V,
which seems to be the default on most D1 boards.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..2f1771c19 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
 	};
 
 	opp_table_cpu: opp-table-cpu {
-		compatible = "operating-points-v2";
+		compatible = "allwinner,sun20i-d1-operating-points",
+				 "allwinner,sun50i-h6-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		nvmem-cell-names = "speed";
+		opp-shared;
 
 		opp-408000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1100000>;
+			opp-microvolt-speed0 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+			opp-microvolt-speed0 = <900000 900000 1100000>;
 		};
 	};
 
@@ -115,3 +121,9 @@ pmu {
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

