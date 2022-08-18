Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDDF4A04
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 20:39:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k16so2986477wrx.11
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Td0HtrFwZXDLpWYj5HjBTBE2QqzOwp8JQZQ9XJ4Wlqg=;
        b=azkTqCcmKEAtMXuuCKQu7HAAZz0/4HJwQTove9ishZrhEvfDo16Wwdr8iDSJOW6YzS
         ecEtk3iZXCcMxKl3u4IaK/tANoJIKSjs+wAY25F9/FYtsqPmQMqcJ9VFiLw43skN/Wvt
         Fay0Abh+Dln/a2xzDZalWgRdYD3zKI4+V4sroq2t66Yx87CRm2b76mxDQWIg5B84q8T6
         KQEJi3l6kQLolNd52OBcnoPJaB5VX4SKTmhGMUhfwxD/5gzv59pk6TAAAC3442qpRk72
         mbPp2sU74kgtwToWRlN4Eb17EEpbrIsHIPBmkR0mKpLw/eUOXlYrJ7pyJMY5cbifcP1s
         lsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Td0HtrFwZXDLpWYj5HjBTBE2QqzOwp8JQZQ9XJ4Wlqg=;
        b=Vg52j+BlsMUkPMofba/hS2yCvJLpV2wE01APK/CxfIwbX68EcuKGH+8W29arWlq0hD
         ao9HcCDLcGISVwoYg+K5ZOS2JlXPj3i1ogPmnCEcf8M5E59OieaISuIagqZzOjudQF+p
         KOuAE8up3GoeEzSUaZegEuooMjTii/EN2mlDZX4jYRhGxy0sEbjZ8FpKLPPvcdC/TxdG
         8/h1NcEEF8qr/AdGbL6IM3i0xm7Fsp0M12oE3uWfR3ID+yjoqglVU/hEvYoWRwYBK4WI
         zqhw2/FITK4Ml/duOAF6Y+Gg3uVVfpsmAB17olY/ykXtcM4HmcyzDBSlSk1t4hmtTSs3
         NqhA==
X-Gm-Message-State: ACgBeo3lsBbEIH15YHkwEdiT7qrJRg/wwI+CV/MEK442jm7kWw7asNE1
	yC+2BYr+ikAk7UOdyAWC8rXySMwVPl4WLA==
X-Google-Smtp-Source: AA6agR5/+/njOHXTPadSzJKps8hv8RfrWwnKwcNcbGPbhMqQQdU4Idp/sXEYLwt2QNNJkscw4T0Ryw==
X-Received: by 2002:a05:6000:1f0e:b0:221:6dd6:a2a3 with SMTP id bv14-20020a0560001f0e00b002216dd6a2a3mr2545931wrb.574.1660855178926;
        Thu, 18 Aug 2022 13:39:38 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000c0d3d00cc34c67bc193cac8.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:cc34:c67b:c193:cac8])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b003a54d610e5fsm1571648wmq.26.2022.08.18.13.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 13:39:38 -0700 (PDT)
From: "=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?=" <peron.clem@gmail.com>
X-Google-Original-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: allwinner: h6: Add GPU OPP table
Date: Thu, 18 Aug 2022 22:39:27 +0200
Message-Id: <20220818203928.131059-4-cpe@outsight.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818203928.131059-1-cpe@outsight.tech>
References: <20220818203928.131059-1-cpe@outsight.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Péron <peron.clem@gmail.com>

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

