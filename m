Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212CA17BB9
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 19:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246195; cv=none; b=efOgunjr9m1vxFb2FLOGHq7jU5UY0Ja3N+N18K0APLTsJ6CRRzWYK/DxV3jX0ML+fg6+27Qq5cpIXqOe1Zoqo5mPjNNoWLa2kVqXplEM5XnmcSxjQO/LYx9IG//hkESw5OV1rBlbgi1frlG1arVu5JZDoGVm/O1UzlNBO22yf9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246195; c=relaxed/simple;
	bh=KSqF8dieENTc/5z9k3ogdmL+5L1K6aVKAxTyRVVL7t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qyc86exmUuWIEnDKHosVrMJojEVbd9oPLTDmqXyCnHCHG+exzX/ov5yOQeQLWpRjdZ07Mw8Gp//2YHQRcworqOxPuAGmQSMoChVb6NQz6Dsysff/OgEM6OHYt1U3vCFS5MudBZXtN4FtyBFsC0fyZhF+M3b1gM9/2l4L7Cyg+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=Qay1spRg; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="Qay1spRg"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 296BC4583E;
	Tue,  6 Feb 2024 19:03:11 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Ondrej Jirman <megi@xff.cz>,
	linux-sunxi@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-leds@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Miles Alan <m@milesalan.com>,
	Samuel Holland <samuel@sholland.org>,
	Aren Moynihan <aren@peacevolution.org>
Subject: [PATCH v2 2/4] arm64: dts: sun50i-a64-pinephone: Retain leds state in suspend
Date: Tue,  6 Feb 2024 13:13:18 -0500
Message-ID: <20240206185400.596979-2-aren@peacevolution.org>
In-Reply-To: <20240206185400.596979-1-aren@peacevolution.org>
References: <20240206185400.596979-1-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spam-Level: **
X-Spamd-Bar: ++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1707246192;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=WNZ4KASkiwSJG0vvqKpuM1/sq6GRaWdR1H4ZY5MyEjM=;
	b=Qay1spRgP5aYmwraoePTBh1gHtxv4woB4OpvvJT/IepoaKK8/tna3jZi6Ndm2hDTISODVp
	NEU5LCHZhMUB6vFi/zUKgxcw25TjByiWhfS3UdVqelmgxATldyhHfqgPBaAhHbJ3DJn8/7
	7AiPnQangsdH4xDHRe6J5tp+zwHNbog=

From: Miles Alan <m@milesalan.com>

Allows user to set a led before entering suspend to know that
the phone is still on (or could be used for notifications etc.)

Signed-off-by: Miles Alan <m@milesalan.com>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Aren Moynihan <aren@peacevolution.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---

(no changes since v1)

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 87847116ab6d..ad2476ee01e4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -43,18 +43,21 @@ led-0 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
+			retain-state-suspended;
 		};
 
 		led-1 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
+			retain-state-suspended;
 		};
 
 		led-2 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_RED>;
 			gpios = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
+			retain-state-suspended;
 		};
 	};
 
-- 
2.43.0

