Received: from out-108.mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31D363
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jul 2023 02:37:28 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690771046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YGR95yRmO0NXcTKJauK/6i2H1oijVAsHSX5nYFdazBc=;
	b=y7HgKG+7rXDVvsXLOtTK3gUkLL9pojDYe2EIkTioUg9aJ++0jNY+cqS8szvjRCFr6nHIW/
	vbqgd9yWjb3/Cpf+XbKHMIoBeYm5nFbGDsswyNFtYj+3qm4gl+iW1+cWcZdkDvV+dnS4l4
	w07+fv3tQn2y/bfWm7P58PLUYNJ9OnC8Wr5k4++4ytaf6Er/gNVXiqJaWYh4TAwVVcVa6q
	yXH7KehaoRVpsOYt3X3ZbszDzQFVusO8jjCKTQNIobenGbTUHqIpSXPUnnTMKs5gZ/rci3
	UV51aD7vttu3otTGMjHmhqWN2AYeTPkzK7g1AE8NhXpkdy4MRj+dIRjgTx6VnA==
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: John Watts <contact@jookia.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Mon, 31 Jul 2023 12:36:59 +1000
Message-ID: <20230731023701.2581713-1-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

There are only one set of CAN pins available on these chips.
Specify these as the default to avoid redundancy in board device trees.

Signed-off-by: John Watts <contact@jookia.org>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 4086c0cc0f9d..b27c3fc13b0d 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -898,6 +898,8 @@ can0: can@2504000 {
 			interrupts = <SOC_PERIPHERAL_IRQ(21) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CAN0>;
 			resets = <&ccu RST_BUS_CAN0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&can0_pins>;
 			status = "disabled";
 		};
 
@@ -907,6 +909,8 @@ can1: can@2504400 {
 			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CAN1>;
 			resets = <&ccu RST_BUS_CAN1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&can1_pins>;
 			status = "disabled";
 		};
 	};
-- 
2.41.0

