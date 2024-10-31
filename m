Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD49D1487D1
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358211; cv=none; b=izOWqWm71rzyMdw1Qi4UWLoccQ8fWABmLFo8Dhmekp+2V2qXPFASOYm8OyJq07P7MTP524/mrjKNS1mH3r3fUBsaSaALuJeipTVzs6sBkuf8cNHeU0NP8SxxxVQGjDsOm6jNZhMcD4YaHmeIee5tRzPUG7t3u77RvtTqdJ0EatI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358211; c=relaxed/simple;
	bh=c6mAFMfMnzUCM/bRTvKysE72zxNJKIHReq/xcIwXjco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJStr8d9G8QPP115bOYxMCVLuz8+/rCy4yD7cS+wVpz0VrOZhcvHWllS+EtGAWMAhkukfTjbxw8cdF20mNj90wTJ94F4wjv3AXbVRjvgwxwrPxxIMlGYVs7VBn5ymahbojvsqFsC75BhIlv7MwT67uO5JkHH98r3r1IISgn9ZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=KoXk0zKg; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="KoXk0zKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358202;
	bh=c6mAFMfMnzUCM/bRTvKysE72zxNJKIHReq/xcIwXjco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KoXk0zKgSRD6rk7O1qpLi4KfKia0zDyEIgURK//B54b1dkGB4gPm864D9daazG6TL
	 H1YvKFix+yllhhFpcsmA19NadDcIvWb3WNei0P8mj3LkEZL+L6ugI9YJAeFy26SCaH
	 5EjJ2Gu2NHYpQVvlzI/QPXNhFCTEdxM41HoNyP9ViLCsuPTAT/gf6EKRnn4iRyVyw+
	 rJjB9hwO0h3X094JLD1xlsuCv333sp3LOeGNGAT74lFbEPK3EZbbTai2VvrlpE6ijK
	 7DUOsqI+MEFb73MPTW/MOvMW1vpLNHMNSnU3OL2kXvZyZNtWVEctEWCcy1jx9Z16SO
	 pEf02r4JButVA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] arm64: dts: allwinner: a100: add watchdog node
Date: Thu, 31 Oct 2024 04:02:15 -0300
Message-ID: <20241031070232.1793078-3-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yangtao Li <frank@allwinnertech.com>

Declare A100's watchdog in the device-tree.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 1eca7c220ede..adb11b26045f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -144,6 +144,14 @@ ths_calibration: calib@14 {
 			};
 		};
 
+		watchdog@30090a0 {
+			compatible = "allwinner,sun50i-a100-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x030090a0 0x20>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dcxo24M>;
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-a100-pinctrl";
 			reg = <0x0300b000 0x400>;
-- 
2.47.0

