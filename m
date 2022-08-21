Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A73220
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 17:31:10 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s23so4521637wmj.4
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rVeHL3XvYGZ6orYIoYz1XXXquShX0TNS4nHwqMLcSJ8=;
        b=BWcTk6yoxL1icGJDYiDE/gy02YAodotBzePCyFqUDjMk3W3m+9a/P1wWigW0BwdqGW
         clnaCETFOGOYLBzqxPUdJxI2fsY3GUPPZnISYqp3Z5tDW50VnienqWRueZFhwn0Az64n
         VJ4rTgYFx9ANOhpJD7xa4JCM51yIAol3DG0HgX9coAz3acighJ2rKXvbR6SYEn7NRgM9
         f/DPDF3JalF9uGY2J3HYKkfBG29ZZbp0tEGnaoth8VXutPSL5Ep1zlCF/dI2PwuJg2nJ
         ZY1HXi/jT3om7aeE6z9PM4m7AIx0A3MO3A3BPkEUy9x3LT5uSfMF+aXrDzYZ0o0cLT8l
         eb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rVeHL3XvYGZ6orYIoYz1XXXquShX0TNS4nHwqMLcSJ8=;
        b=TpA6UAFuE334h+oe5oE/nlQoJMWt75UIsSxVxgZO/VY2YcnguaINpu8dbCp5PRrMJ/
         vqU2oiR4ws3OT0ljR7GIqxQKUNE530fZk4786gb3feEyMeMeLs/ZiINMi8IbeyokVVEn
         MSlEXMqZKnLbl+gmU1z89/8rNHC//dMuPemoDL1KBgyaPD0hm+t8IMegKWRC5mfzJYpA
         rI+TKQaRvj/oOgXTCbdDP9FA9yMSTL9/vHI/yIve5/aWZ7IRJb4RQY1iLmoSwWsWLbm7
         XDoOKIrBDOnasgffdAbtmCjyOa5ONQP1qTUY7CmdyT/D5XgFwUK9/nRDigx8Kl5GcNdY
         0O9g==
X-Gm-Message-State: ACgBeo1UD3NqkEF1KdyjbR9uf0GWYXv2l/YycWDegVoQxVKCdJHjVh8m
	56BbpRY6mpGQPwYA5DrQ46k=
X-Google-Smtp-Source: AA6agR4O1FHEREDqGDsj8VJ42P/BMWkbYBZbIH43j2PApyw1cDuPDlt54sD4PfatY62c4hcqxfxxbg==
X-Received: by 2002:a05:600c:3846:b0:3a6:5292:f8af with SMTP id s6-20020a05600c384600b003a65292f8afmr3625313wmr.50.1661103069186;
        Sun, 21 Aug 2022 10:31:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:a77:3d70:9d84:ec8d:98d9:c29a])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b00224f7c1328dsm9387205wrr.67.2022.08.21.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:31:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: h6: Add GPU OPP table
Date: Sun, 21 Aug 2022 19:30:50 +0200
Message-Id: <20220821173051.155038-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220821173051.155038-1-peron.clem@gmail.com>
References: <20220821173051.155038-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an Operating Performance Points table for the GPU to
enable Dynamic Voltage & Frequency Scaling on the H6.

The voltage range is set with minival voltage set to the target
and the maximal voltage set to 1.2V. This allow DVFS framework to
work properly on board with fixed regulator.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
new file mode 100644
index 000000000000..a66204243515
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2022 Clément Péron <peron.clem@gmail.com>
+
+/ {
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000 {
+			opp-hz = /bits/ 64 <216000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp@264000000 {
+			opp-hz = /bits/ 64 <264000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp@312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp@336000000 {
+			opp-hz = /bits/ 64 <336000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp@360000000 {
+			opp-hz = /bits/ 64 <360000000>;
+			opp-microvolt = <820000 820000 1200000>;
+		};
+
+		opp@384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			opp-microvolt = <830000 830000 1200000>;
+		};
+
+		opp@408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <840000 840000 1200000>;
+		};
+
+		opp@420000000 {
+			opp-hz = /bits/ 64 <420000000>;
+			opp-microvolt = <850000 850000 1200000>;
+		};
+
+		opp@432000000 {
+			opp-hz = /bits/ 64 <432000000>;
+			opp-microvolt = <860000 860000 1200000>;
+		};
+
+		opp@456000000 {
+			opp-hz = /bits/ 64 <456000000>;
+			opp-microvolt = <870000 870000 1200000>;
+		};
+
+		opp@504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <890000 890000 1200000>;
+		};
+
+		opp@540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			opp-microvolt = <910000 910000 1200000>;
+		};
+
+		opp@576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-microvolt = <930000 930000 1200000>;
+		};
+
+		opp@624000000 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-microvolt = <950000 950000 1200000>;
+		};
+
+		opp@756000000 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-microvolt = <1040000 1040000 1200000>;
+		};
+	};
+
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
+};
-- 
2.34.1

