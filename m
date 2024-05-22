Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D180C04
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 23:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418901; cv=none; b=FqWkZaKqrzkf7FU2V95M92aIKoxlvZOGK3cyjjgl6853jsyoPxhoWFfidO/wFm10oEhte7WmUrlqllHTmilZ8FuFDgpZZXWb5xe+siNCP9Wskpdjn7P7GEb5CFAopmxzPuNMkjey3DoKhssg1T2nAZEzZtvzyFBeLp5SogZY5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418901; c=relaxed/simple;
	bh=LbN79ILVGJmypIKRIiXwODJW0beN4emgcWPm/0DnbDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opbblkJz+8sKYtgYktZZXb3BlHAAFJnw/XiqxgpROBBZj6XaHwvR/Bpt8L7aabGGR075TmDcxDoziEGm+tRr/XVu4j4KSCY9o25UsrZUpBUpOGFaoDk/a5c/3PojJsoMAnBhv3cE7AdoHZ+XyQvEkQ9OreUEW+dt3jmKZOXG4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFaBfziI; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFaBfziI"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2451da9b4feso2599687fac.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716418898; x=1717023698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVMsWZbFnMr/zKM0R1fwfE/XyN3eszTblppaMZhLZMo=;
        b=dFaBfziIX6Ny2ySLpTxLjGZMykrHhDxbYBjxrBvyQciv8HKe0yUV+M7x4lqDppo/tn
         dXo20cScuTbOBShY6m20ABHcuSdNAiPIWrIB80sr22aSbMjYqGisxq1pCl539FbUdbHm
         ymuo1yeHdNAVEr5ZvqHN6lLZ1wHQjiguX+WzNxp+jwvaWnS1n7kXoDnDfU0uhLwLcVx1
         EG/3/eWUJmXSwD8BRqkTclFoMw3oyH2vNli7LCkMy6KliDK1sw3aQePlEXJQ8QmrAU1D
         RE6DplixvJ5nKCbFc/oHVV3cFhsq2GJkyL798iK/vvnb0IljIjhO8JBIPn7II+egO07v
         rIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418898; x=1717023698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVMsWZbFnMr/zKM0R1fwfE/XyN3eszTblppaMZhLZMo=;
        b=vdbL2WCcX2ignEm22hYN8BWYldhrfnYkZtwr2n+MUKcmYCCGhriDYFY/3ypa2jCxIR
         dORFAxX4O36++ubXNowh/ootHxNybrfeLMRa8DTNVywGCv/1SXC8WdM7Ko7n2VPrSyXA
         aDLSAJF+iR4+YolpueJ1cMsdE4c7q0pvBG/0eCUlyKIdgg9S+MBngs0W4XW9ysDUJ4N8
         U7/0MwBAKlJh9SiolYFIOgs9rP1OEBnvEHMl0SiUEgRTFSDPXl+WhoZyyeFMtsLD/XxP
         Gayz5uZKhOcPNQxOAToFJXTMXzSf4OliZkdL7IA+qA9/uSoYeOta1ldzUxpJ3Abj4oLK
         dORA==
X-Gm-Message-State: AOJu0YxdSJPpD0eITn0NYWDNH4gqfNN0NeybzCztgBQGUaRe+5ZJrUS1
	Yx4OjPq/9kRFpW1LxeO3GIj9E2iJIEJ1kIf/jVY+JASVRUpkyaHOHVMfbw==
X-Google-Smtp-Source: AGHT+IEvLg7qLqqYzfccRkThfADAtQ4+ws5h+ipFvfeIxvlW/iwTGPjNP3BA5CsYjGoLnrPJfjrHFw==
X-Received: by 2002:a05:6870:e2cd:b0:245:3678:16d2 with SMTP id 586e51a60fabf-24c68aae036mr4869305fac.22.1716418898427;
        Wed, 22 May 2024 16:01:38 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ff995ccdsm4155936a34.34.2024.05.22.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 16:01:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/4] mfd: axp20x: AXP717: Correct MODULE_ENABLE_CONTROL register name
Date: Wed, 22 May 2024 18:01:29 -0500
Message-Id: <20240522230132.364915-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522230132.364915-1-macroalpha82@gmail.com>
References: <20240522230132.364915-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The datasheet lists two "MODULE_ENABLE_CONTROL" registers; the first
one is at register 0x0b and the second is at 0x19. Change the name
of the register at 0x19 to AXP717_MODULE_ENABLE_CONTROL_2 to reflect
this.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mfd/axp20x.c                 | 2 +-
 drivers/regulator/axp20x-regulator.c | 2 +-
 include/linux/mfd/axp20x.h           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 609e7e149681..16950c3206d7 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -209,7 +209,7 @@ static const struct regmap_access_table axp313a_volatile_table = {
 };
 
 static const struct regmap_range axp717_writeable_ranges[] = {
-	regmap_reg_range(AXP717_MODULE_EN_CONTROL, AXP717_MODULE_EN_CONTROL),
+	regmap_reg_range(AXP717_MODULE_EN_CONTROL_2, AXP717_MODULE_EN_CONTROL_2),
 	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
 	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
 	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 20bef3971fec..a8e91d9d028b 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -837,7 +837,7 @@ static const struct regulator_desc axp717_regulators[] = {
 		 AXP717_LDO1_OUTPUT_CONTROL, BIT(4)),
 	AXP_DESC(AXP717, BOOST, "boost", "vin1", 4550, 5510, 64,
 		 AXP717_BOOST_CONTROL, AXP717_BOOST_V_OUT_MASK,
-		 AXP717_MODULE_EN_CONTROL, BIT(4)),
+		 AXP717_MODULE_EN_CONTROL_2, BIT(4)),
 };
 
 /* DCDC ranges shared with AXP813 */
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 5e86b976c4ca..e0cd66bd3b6d 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -115,7 +115,7 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 
 #define AXP717_ON_INDICATE		0x00
-#define AXP717_MODULE_EN_CONTROL	0x19
+#define AXP717_MODULE_EN_CONTROL_2	0x19
 #define AXP717_BOOST_CONTROL		0x1e
 #define AXP717_IRQ0_EN			0x40
 #define AXP717_IRQ1_EN			0x41
-- 
2.34.1

