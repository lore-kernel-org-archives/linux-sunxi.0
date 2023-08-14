Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367011FA9
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 06:38:27 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 262A13EBDC;
	Mon, 14 Aug 2023 08:38:19 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Date: Mon, 14 Aug 2023 08:38:11 +0200
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h616: Add SID controller
 node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-sid-h616-v2-2-0267749b4471@somainline.org>
References: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
In-Reply-To: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691995097; l=864;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=q8Z3frbl92CnDSxzHRzs0CQF73K+Zv6PV4C5pSkxRc8=;
 b=jRKm1OBlKfkJYm1mrQQkjhF+MB0uew5IbHFuh7QGVphZY7vhGXUBJBFTJVy67nzyv4WiFSjjM
 1TsBswmpDgYDYrWK4jzHeF9K6rukviQm3Xx54t6TXb6uOxX5+kYuwgZ
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

Add node for the H616 SID controller

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 74aed0d232a9..d549d277d972 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -133,6 +133,13 @@ ccu: clock@3001000 {
 			#reset-cells = <1>;
 		};
 
+		sid: efuse@3006000 {
+			compatible = "allwinner,sun50i-h616-sid", "allwinner,sun50i-a64-sid";
+			reg = <0x03006000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		watchdog: watchdog@30090a0 {
 			compatible = "allwinner,sun50i-h616-wdt",
 				     "allwinner,sun6i-a31-wdt";

-- 
2.41.0

