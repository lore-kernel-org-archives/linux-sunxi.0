Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA831EDA2C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 03:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681655; cv=none; b=JCf5MwTP9kC1lgt0oH1CflYxZl0/inmdGDKLxtgC7hU3AU3TdNArTdyH2KxnQeeAS5H8NcCSemnvAzcrk485emGReF1p7j5k0t98MQ8bnyzdKpraGs9fJl6RXW78nn3v7MTOhGwfa6fIhM5NkQtiyHCFRHJknzPwL1akvEiKF7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681655; c=relaxed/simple;
	bh=3cQd24z258zjc20dy6ohb0HVeZL+LfFrMaR3/kR1p5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vx3Ku19dW+Tfn1WNrzpkMqKkwq1wbd+usIV2OS7MN6TUKm/RtEobdEBjCDxKfZCBXO70gPGEVxii9+V9m2mi5WoiPbrNCSzkRiBpzFTeGZIjmBYzLoSKzls+++AlWfGTr2CZQTbT+60zliedIhv3eGkqV7YBYseu88ODkDgwowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOEYErAC; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOEYErAC"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50335b926c2so70373431cf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 19:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772681653; x=1773286453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d5yl02iJv/wkdm4hWnCdO+qs5aDrcJeSjvUW0fTJuE=;
        b=QOEYErACrBZ3r20qkTrrJXxvrjA11b8J57HtjnznaF5Cvr9VN/vm5WnQDZeqS852yi
         wWAALj0lrAQyeTItOLqhHevRM45w62QT8xGXSJx+2xULkGyEeTnCgoe6T05tdKj3oVJX
         rZKCOpmu96NGkPiTQfam2DJoItL1PeplZ7+fSyaO9duSUmV5UJ0GyWSa7GF3nj9PPZWw
         iplFxUKoJf0CK5BPl7bMjevUbd1loVlqVB6UhUUtQ64Cj0/4o15dkKBnZdmSEAiCr1jb
         ij9vKxyRUKFRFKNpVlDACI/X4KWNFwhbzMsIDIgqFvWZQ4vbKyUuBZHBtPX9Ur/1TX+g
         ltew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681653; x=1773286453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d5yl02iJv/wkdm4hWnCdO+qs5aDrcJeSjvUW0fTJuE=;
        b=Cvhnqn8DFABUQeOkNqkZKeMdgI6MJCJSysWV9laq+okbHTtQkivGpKkWpml6nlbQt7
         DW8x+7AEMMquucHQr5sE3PTZkWB2vaz4ZM4fCGdKdYjKFhvLQ7ZnJGqO0ma0H9+ajjn8
         p2rWtIdruIM6wMHM0omepEJuI7Rys7unvbVDcx7ij5Q7EyvFpbKGHav+ciBnss0W6ceI
         lx6iX02NT7ULltCIupXtDOlJPNLMcYeVI3vC+3y6tetl3v4gaH474VfowWpgUy8NYapN
         sMPTeE6jhKd3KgHNySW6JpmDZ64vjWUeeaa9QiwoBV0VNjPeP721dl9wwU18dzYdW3P7
         DpKg==
X-Forwarded-Encrypted: i=1; AJvYcCWf911ECItdbyCIYKaef+3K+M7O4UirFNX8HgD7zbzC9CWPLeUibmsj1QpcxwWRggv0ogUHdgd3WWOR/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYfDodSPSGIF9zszogcFnMBQ9Okz2lORdLNIHkMDlD1nVGaznw
	pdWdiwGcUJylOY/l/yIZJ8oG6jbss4aNs0hMCO31yZJmqNtMBYeJSK8u
X-Gm-Gg: ATEYQzxSDwnTDlxXoQhiYhqNwkr2x6l8JtvUkGTAcn8fKb6hYbpy2CC4qPNHgaZdPUG
	n66WejCCA52FX1u3CI680wvbytFLR3ofOb3m+u2k27CCal6b9Wx48jGJS7LjcF03trit/znpfUR
	wLzgq69Y3lDyXto/mFYF6oXzKj2H3dMrTgDA0bniJTVfATjoiu7GfYjwixoHsgONEFFKYiACS1K
	8r1mjA4IDrPBQ7lYBqMntFWAg4dXuvVWfZQmUrU1U9MGylCsBsZBeo4j2pfEaWnGXkzqsBVvDxB
	xpjif0WZZg6lJ3qQp2uV6CSZKineiVhqkYQx2g6ACbX2l1WEmn7nA/MTkh4insMzqNb0RXVIcSn
	faYFonLx/tqa5XPMZgsR/MvmSvQlzaR3xT5h81YbOk7cdgynXGHLlqrx8+76/Wc3kBg4/x5MrDK
	f2msFtjm0lx8mlJL11zxZ3iU/I98s=
X-Received: by 2002:ac8:5a0c:0:b0:501:4b10:aa9e with SMTP id d75a77b69052e-508db2a632bmr59254511cf.13.1772681653433;
        Wed, 04 Mar 2026 19:34:13 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630b6sm190667601cf.7.2026.03.04.19.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:34:13 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Thu, 05 Mar 2026 03:34:08 +0000
Subject: [PATCH v2 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3

The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
customized version of ARM PCK-600 power controller. It shares the same
BSP driver with A523. According to the BSP provided by Radxa, unlike
A523, it doesn't require reset, as well as a different pair of delay
values.

Make reset optional in the sunxi pck600 driver and add support
for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 35 ++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index c7ab51514531..1d47bbd35ced 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -52,6 +52,7 @@ struct sunxi_pck600_desc {
 	u32 logic_power_switch0_delay;
 	u32 logic_power_switch1_delay;
 	u32 off2on_delay;
+	bool has_rst_clk;
 };
 
 struct sunxi_pck600_pd {
@@ -151,9 +152,11 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	rst = devm_reset_control_get_exclusive_released(dev, NULL);
-	if (IS_ERR(rst))
-		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
+	if (desc->has_rst_clk) {
+		rst = devm_reset_control_get_exclusive_released(dev, NULL);
+		if (IS_ERR(rst))
+			return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
+	}
 
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
@@ -206,7 +209,27 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
 	.device_ctrl1_delay = 0xffff,
 	.logic_power_switch0_delay = 0x8080808,
 	.logic_power_switch1_delay = 0x808,
-	.off2on_delay = 0x8
+	.off2on_delay = 0x8,
+	.has_rst_clk = true,
+};
+
+static const char * const sun60i_a733_pck600_pd_names[] = {
+	"VI", "DE_SYS", "VE_DEC", "VE_ENC", "NPU",
+	"GPU_TOP", "GPU_CORE", "PCIE", "USB2", "VO", "VO1"
+};
+
+static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
+	.pd_names = sun60i_a733_pck600_pd_names,
+	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
+	.logic_power_switch0_delay_offset = 0xc00,
+	.logic_power_switch1_delay_offset = 0xc04,
+	.off2on_delay_offset = 0xc10,
+	.device_ctrl0_delay = 0x1f1f1f,
+	.device_ctrl1_delay = 0x1f1f,
+	.logic_power_switch0_delay = 0x8080808,
+	.logic_power_switch1_delay = 0x808,
+	.off2on_delay = 0x8,
+	.has_rst_clk = false,
 };
 
 static const struct of_device_id sunxi_pck600_of_match[] = {
@@ -214,6 +237,10 @@ static const struct of_device_id sunxi_pck600_of_match[] = {
 		.compatible	= "allwinner,sun55i-a523-pck-600",
 		.data		= &sun55i_a523_pck600_desc,
 	},
+	{
+		.compatible	= "allwinner,sun60i-a733-pck-600",
+		.data		= &sun60i_a733_pck600_desc,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);

-- 
2.53.0

