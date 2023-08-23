Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE1156E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E36C433C8;
	Wed, 23 Aug 2023 19:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692819189;
	bh=6pf3VF1Kgo0mcPrrysd6vBhLB10Rq2QlHpXmFT+u/Uk=;
	h=From:To:Cc:Subject:Date:From;
	b=qzGbRtFvr9LW4E9nW+OJkavZSGZh8r1RNdCw7rL4R2sexFBX7MOwOh3oRDwz2m84H
	 2bRrJcHBmYtbebEnm2BE85DD8POPQ+Y9nZ9PerTKxme7xuq17kaoNJbUMC/n1ci82h
	 xiFkQA4OjJGo6+7e1O2Z8O7OXwfsoU+qDxNSh7v/+MGEb4lYdLgKdUtlESBnCdnG9p
	 oy4TFVee+wio54v6uIrDgx06HNGS7w5aLtqRh70q7NEofT0QbqWmZalu85aIJUBsgD
	 IVFIsx95GJDlQyc/k7anq1tggB4qLl3+d0rE7n2z9bMhtSAEPUekx/Pcdp8zbL0fFj
	 w+CvQV+sDEWZQ==
Received: (nullmailer pid 2759435 invoked by uid 1000);
	Wed, 23 Aug 2023 19:33:07 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: h5/h6: Drop spurious 'clock-latency-ns' properties
Date: Wed, 23 Aug 2023 14:32:27 -0500
Message-Id: <20230823193239.2758505-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'clock-latency-ns' is not a valid property for CPU nodes. It belongs in
OPP table (which has it). Drop them from the CPU nodes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 4 ----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index a56fae761a1f..939f1c0a5eaa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -16,7 +16,6 @@ cpu0: cpu@0 {
 			reg = <0>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 
@@ -26,7 +25,6 @@ cpu1: cpu@1 {
 			reg = <1>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 
@@ -36,7 +34,6 @@ cpu2: cpu@2 {
 			reg = <2>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 
@@ -46,7 +43,6 @@ cpu3: cpu@3 {
 			reg = <3>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index ca1d287a0a01..3b56beed6fee 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -27,7 +27,6 @@ cpu0: cpu@0 {
 			reg = <0>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 
@@ -37,7 +36,6 @@ cpu1: cpu@1 {
 			reg = <1>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 
@@ -47,7 +45,6 @@ cpu2: cpu@2 {
 			reg = <2>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 
@@ -57,7 +54,6 @@ cpu3: cpu@3 {
 			reg = <3>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
-			clock-latency-ns = <244144>; /* 8 32k periods */
 			#cooling-cells = <2>;
 		};
 	};
-- 
2.40.1

