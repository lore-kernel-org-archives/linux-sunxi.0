Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AE4189AB
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979858; cv=none; b=ETdBD6HgqH0mU6SIO+tbLSl6KPLomXcipWIh9HMGWDFpomZWCyUBLGuTecaKvqknZSnbzx/4zK102w0vzcVUZ9FPW+xBbwZqnvfcXPS/PlLe2yzUl3J9T9G7L9cK83x2jtBkK6MgbpGyCFIgXvrrzZKkGg1VIBxdcDqO9y+UCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979858; c=relaxed/simple;
	bh=gRy0cN4LadJrCLwhwvNgyXM95hAtl0BkbsLdjuQgW6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1CgAqETGNJ2HrnQOTYCYlhuaMj+sRfCyKHomqLly48m5sVfnqt9KZgvsbBwJFCATjdUtt3uZp2mLwVX8as+WCtmQsxaoo2ubEwrc2PSVeOSVD7uk5+Q3cKaugqmnxCQOv+1J9gg2y7qxYJCZaorua9Ls+7lB9qLrTyIOctdeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qw3o6mtm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qw3o6mtm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4758bd3731bso218352f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979855; x=1783584655; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=Qw3o6mtmV6/4bWs+Zw85BPuPIxYEyLY9WUzw7R8Ae1eKUDT2GQo1wkYB4FRv/YcpId
         fyY9dzU1N7jjxi5ZYXVK/gfaKPzPciGGmJM3adTAernQDFbXSuXPYFCvOWg+yOXRTnEL
         tJoELtryM1B4p/gRSFuBM/xgZCAmm8Tz8bu/MeFy5lsR3n8/nEfsGJf/bGmKR43rEwiR
         k8Sb83Zr4LlBXgJUjv6Uqu+/kypqgNJ936CSEwyr/cBVzTZjulkAUpKbLpI9obgqKGRr
         v05b+6qFTWUBn7MKDw2QGAVjkQvY7f1m6Zk4d1ZM0CANQTs+MR2/pKXXqicda9IBZJ0k
         Locg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979855; x=1783584655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=STFrigZ2U2Sb818Sdryl34wxsPsBp6jgSxD0ECkOUWQRVkqjUAJ2F2eSArbJ4cILpc
         a2V+Dw6bzVby3Q47RLYpHeEj+RWKo9gP1gngcBxJiM9m5Gkd4Jh/MQ8R0IGTOH6U6AR2
         Tr+XH3EUQesZMdDDQcpctrY7wWNcRZJpmHu+yue0jf613y+MOa4Cz55axMwSp46FBfQg
         PweRMbr6A3opSjrvrb8XX4ewwAvmcV1GM+1gQ2m1oj1F96/U76vwY+YdyE6C2Lk+PHUv
         0bYmtHQJ0/5ipcLkM24Hh8bt1OzQfvPC5dxHVVSHXkIMTXcfcFiuL+fqniN4rRXmVXT6
         /0WA==
X-Forwarded-Encrypted: i=1; AHgh+RroejBfsN0ovl40FUuYd53npjAP/4MAr8EgiU3tmPQLc5m8L2WUEShE21zW8Z9bvUkzHgdbIVbjTp1ivA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwijosjEul4+GYfMJ0Qvz4TkeYdqD5Bu+Tmz7ZcxedhFZDrpa0/
	e4QopoY8wE0L8b2HEM0vOhLrjUWS54Y9fGu5VB5T1knmt2vS6rcOdJNhwBwWn8VR0zc=
X-Gm-Gg: AfdE7cnZiZt7Q7bzrUd4sDKrEOu/VT4N2oOV/ZGVgxTSg6b/acfyb9VCGNvdP2I1n1D
	MSB9dnBd4mpmmuMp7KArQ9Ka6WaOdChl1UQ72mw2NbarOnLoa8XkA9O6rQPdl4N9gna6nUM0FGS
	Yk70XRBNJItMsm8M4dMB4dPFJtmkvwfDc8iPLnsyw2WSlzDF3ikBxc5AAHFGC/JKA/tI78LZQkx
	p4IMHP4valvI/38bKiDbPY911+8UMKaNbLS/0Zi73cgkZHg78e2MeSv/1TujeYKTfBpex9yMN1l
	yHrFKTczfZzD7WaRg+obtsM/Aeuk0rpJUh/be8ydNku8nhi+R6AAK9m/plakRgfuwIPI5Wdg69p
	x1x2sW34WvZEjd/G9MSkFg9i7Z0pOAqqVU/qx+xlpaacE582UpKNJh/CS7CewYsXpQCiz/xtBJQ
	HmgKCpoQAfu6M=
X-Received: by 2002:a05:6000:40ce:b0:473:c2ec:7a79 with SMTP id ffacd0b85a97d-4774424350cmr7132004f8f.12.1782979855094;
        Thu, 02 Jul 2026 01:10:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db3dba3csm6687967f8f.3.2026.07.02.01.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:04 +0200
Subject: [PATCH v3 5/8] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-5-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LjKLqtELI/k5Bm86qG39EiNLmLLQg2pvRCFKcypyAtM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz6iQ4ImmQHndHiBUqhJRQYIbF2ssh6u4zet
 LAX/Wa+q56JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+gAKCRDm/A8cN/La
 hevvEACvUM3ca8OwIt1oufqC2tSNAYGaxdWOw46j08bNcil+NPfmr/5Af1LlNbH/cnK2mvD9i17
 uhUOtHab6h+C5k9mFrYY1/iEpNmMfiAqNP9b/SiohQo4XXQ7vH9aCSJwWzZAlrArxDjOkodWaUc
 h88RZxUvA7mpw29FBOGQWAxNpADzCWGUspkbA8rAQRvm8euwYNVi7o/O/eqFeiyK5NHr1BWiZjK
 qHzdkatztZ1pM4D298w9UADjl6bwZ/dDwaRXP5VQp1nZW8W8YDaCjG7yS+RO7IomoAJgRApUaRZ
 fCv2H2xgcSB9tIG2M6bbAzlbJe9oHGE8VwmGCk4XO2n42566JCVwypwJDkjpELB7bHudEQpOe0N
 KAlOo18K8PAcZ5uZNFnxWTOZXeiYLXjOxPAUdCpyQm7RyTZ7oXKsm2oT5k8painM4yMkDUXnRVB
 T03tesm9gVdVWILE+46J+kE4sOjXiNG1Pp2Rw1TPyVPSHfgQ0dFqutz5HsYLHOAQYgz67YjOXfU
 pzBqi+eTBeBslVZK09E9N6D9jQjjoLPsCuxdb87P8ml5T5tLNLxjNmQtkhUUGOERDfIenO571u8
 S/AJZCLIex6hlXowPOaM5FRdQFsxE2H3MNvMuOYOZfpG14rbnirk8o1Ip4YH603HjyOic3M3jSz
 A40fFvy4QCn3l1A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3

