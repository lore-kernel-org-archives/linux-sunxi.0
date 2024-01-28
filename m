Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038E3D3AC
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Jan 2024 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706474931; cv=none; b=aIcsMzZDiRr2wJeOLwaK6gzHX9FxPZ/JE50Y4KGSzH6sQXs6r/ZyK7Is9mpaRXF6B952XFCgyU9jm3r1OAJd984GUIgRPxgoSdGPvqlOWiJn8xFBse+Y2BVwcFvfDfdkzKc+Zj5jjhKf2y5DBhQA+pFwYu8A+kTv8oz46gmZjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706474931; c=relaxed/simple;
	bh=0llpIrBcrSsgkq+tDt1UudYHAWxp0O8mGXQOF1XSgn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZvA6sQ4USoboChA+q6kOVAh4CgAPlhUiIEY5JXtLE3vg0J0939YkohLC/srJm1YlSGkUZWVJJLYS+kk868NP7lhcGdqcI0vPS/8Oci+m/UY4IcN9aCsxKKfMJiPSWXDJApS7gpNCS6icfV3nUuxaDDL00r3EFGAoUO/eGOuLCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=LCKLWsPl; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="LCKLWsPl"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id F2CFE46366;
	Sun, 28 Jan 2024 20:48:48 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: linux-kernel@vger.kernel.org
Cc: Miles Alan <m@milesalan.com>,
	Ondrej Jirman <megi@xff.cz>,
	Aren Moynihan <aren@peacevolution.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/4] arm64: dts: sun50i-a64-pinephone: change led type to status
Date: Sun, 28 Jan 2024 15:45:10 -0500
Message-ID: <20240128204740.2355092-4-aren@peacevolution.org>
In-Reply-To: <20240128204740.2355092-1-aren@peacevolution.org>
References: <20240128204740.2355092-1-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spam-Level: ****
X-Spamd-Bar: ++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1706474929;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=d/DBwpJ+je99z0h/gXOCUsLpwa/Zbmn1hRkJbFumB7A=;
	b=LCKLWsPlqvRQtiFZG1vk9RGo0PpHdusVxfhM+KBizv3IAzHDsEBOKiiqeQm2cRJysOQFlj
	yPD70phfaq/ONb8DwmyRcEqXprMWwQOEdEHKTscwSMPBAhH8XM4LwjOs+hHD/8GPzG1smq
	Sh/bcnY8qMKjVHRvgiSCewPgy+j4XG4=

The status function is described in the documentation as being a rgb led
used for system notifications on phones[1][2]. This is exactly what this
led is used for on the PinePhone, so using status is probably more
accurate than indicator.

1: Documentation/leds/well-known-leds.txt
2: include/dt-bindings/leds/common.h

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---
I can't find any documentation describing the indicator function, so
it's definitely less specific than status, but besides that I'm not sure
how it compares.

Please ignore this patch if it's not useful and/or just causing churn.

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 6eab61a12cd8..4f39cfeb13ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -40,21 +40,21 @@ leds {
 		compatible = "gpio-leds";
 
 		led0: led-0 {
-			function = LED_FUNCTION_INDICATOR;
+			function = LED_FUNCTION_STATUS;
 			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
 			retain-state-suspended;
 		};
 
 		led1: led-1 {
-			function = LED_FUNCTION_INDICATOR;
+			function = LED_FUNCTION_STATUS;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
 			retain-state-suspended;
 		};
 
 		led2: led-2 {
-			function = LED_FUNCTION_INDICATOR;
+			function = LED_FUNCTION_STATUS;
 			color = <LED_COLOR_ID_RED>;
 			gpios = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
 			retain-state-suspended;
@@ -64,7 +64,7 @@ led2: led-2 {
 	multi-led {
 		compatible = "leds-group-multicolor";
 		color = <LED_COLOR_ID_RGB>;
-		function = LED_FUNCTION_INDICATOR;
+		function = LED_FUNCTION_STATUS;
 		leds = <&led0>, <&led1>, <&led2>;
 	};
 
-- 
2.43.0

