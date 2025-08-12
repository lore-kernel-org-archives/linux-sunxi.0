Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBDF23D7E6;
	Tue, 12 Aug 2025 17:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021575; cv=none; b=tVRanKmw7vIRUqtzQSU8qaxDX00CHikNIkbFcQfZBu3zMChaAySAIyouPnZ2FpDY4MAMbRVhsmE+6MhRgXLhve5+slKtNt3chV+lh5ZXPbDQA3iIzZyvXjnBiZ2LyiYW21W1fnQr3xIxgzxgA0cGK8Z9wSvpslcjvs7qDYnpCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021575; c=relaxed/simple;
	bh=gTNQRpJNsegfD6QsXYbhdr6zYCeN0parfn9aqx8WjLg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tx1q0aGyum+sRhvmHFJaZVArTth6e+jXB5grPJmA0pX0U83ArB3WQJuvkhlCPv/CW6oRQYFuAAA+6utQ+aBgYJJ8xGHx9K3hSSsW4QCF7EzPi9Jeh5m5o5+6n0AL1HG7S86Zq/3Enu4lu+XBHyviYvY9d+JlzKDdSKKw34JNDzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrFQOx2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrFQOx2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CC1C4CEF0;
	Tue, 12 Aug 2025 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755021575;
	bh=gTNQRpJNsegfD6QsXYbhdr6zYCeN0parfn9aqx8WjLg=;
	h=From:To:Cc:Subject:Date:From;
	b=LrFQOx2SO2nY7CFh4Qngy3zJq8WfeEvwK/TFxKW2h9PQx1L+bFj92wt1Q0cC5xuz1
	 NYIbuaHqzir7bDKPjpUbikXuv1IBGPgPW4xGA3XvDaJjoLQNHfDF4JNsHMxi+M1Et2
	 sWJ+JIlSzQtzSd/r+kDK4mGSettZfapmCWib73E8ulCSbDRT8+D8rVd0+tIITBi5lM
	 8JWSoN4tZ+y0GNnt2PxEIov08e1HRO4Kczx2gy9R1FymE+w2Jm6tC/NwMo7W6UxJLv
	 xle2EMKeMX2ngR4TMrM6Yq62phLrD4/bx9AT/4iQahF9ZtZuKtW58gp/O08fMBmgV/
	 Xof+Os5herYNQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 328315FBD7; Wed, 13 Aug 2025 01:59:32 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
Date: Wed, 13 Aug 2025 01:59:27 +0800
Message-Id: <20250812175927.2199219-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

The Radxa Cubie A5E has a 3-color LED. The green and blue LEDs are wired
to GPIO pins on the SoC, and the green one is lit by default to serve as
a power indicator. The red LED is wired to the M.2 slot.

Add device nodes for the green and blue LEDs.

A default "heartbeat" trigger is set for the green power LED, though in
practice it might be better if it were inverted, i.e. lit most of the
time.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index fce2b7d1ba3d..cb2a2b62a2b2 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -6,6 +6,7 @@
 #include "sun55i-a523.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Radxa Cubie A5E";
@@ -28,6 +29,24 @@ ext_osc32k: ext-osc32k-clk {
 		clock-output-names = "ext_osc32k";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>; /* PL4 */
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+
+		use-led {
+			function = LED_FUNCTION_ACTIVITY;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply from the USB-C connector */
 		compatible = "regulator-fixed";
-- 
2.39.5

