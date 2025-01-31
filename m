Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DCC1B87E7
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 23:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365445; cv=none; b=dm2bG2GhCUe/zh5sW6tfIgT44NpM/jN1jFfin1xzjstJdCcyjwMNV0uNc5oas2YaLE1kgo0LOHW/Ojf180TBEvU5Wf9xBpIRQ+JeICcoOKwdcsDOItiFOod/7MK8LifKWKSaRkK/FUF39wIGat3Ig4u+vmZIy3/+ZjKNk0fiCEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365445; c=relaxed/simple;
	bh=IEY9ErTuFfVaSJ9cLvDWiM8qfCPKp286AcHbTTYJngI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUNVbhpRVu+bv5VuhTGknruYgulkPuk8owRdbg7szBmR4lIY/Oo1XDFcmW1AQZcu8H6435mIm7BSZuJueBRhKj4X2cowmIIkhR3xJ8cRQ7YSNg38z50SlWXrBztE5cr9OlNd4W1d7WJRDtdV4PfQ4rX5OdUgn9F9mbDnyCUEWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AES5u1z+; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AES5u1z+"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb9bbcc936so1517249b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 15:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738365443; x=1738970243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6RZRMBZ4GNAqGDERJs8E4i7kY25Yy4QpxNyKVAYuxs=;
        b=AES5u1z+FjjrkH4aI+FLjCBjEhGuYN489RPxxsroWA42w48LCCAEI7PFKR8tEp2jEk
         4yXtO9JJswVoF/jdXwSlGDdPmBnkSPRSbjjgD5/2geW2VQFFhvC3fccP6NO4vjfQjIfP
         ElGNUez+FWHC4UVOYQtCk0lg2GYwOCo+IlyR0tgllHHE7Vy2jcVi8JhfkjpxBb+Almcu
         b/DxTtv0EO6RPeyabfH/ec/TSjtmyqu6wrL3ZMj1K/xBERJWNjDrxvpoFIN+epDh8rxX
         XpORFeGWyHZT/Hvif+Qpq/bsSSd69GAOztSyJljQxqMvPXD2lnKYsIFZJTHLAl7bg63Z
         VX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738365443; x=1738970243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6RZRMBZ4GNAqGDERJs8E4i7kY25Yy4QpxNyKVAYuxs=;
        b=wd8hX0QCpBQrmX2P5nwCEK1i14W8gY/EKIJ/MyL/qmbRF9fkLJHeAGqw1xkNA+bGnA
         1mzHf5Zx4GkomdpQif85SXSzyIt2zoM3pQS5/akZqGNeIKb6X3JeWVYWfnV6lZXTnV2K
         wNqxjzk1TVbMxhqINaTzE9x2XOyQb/7rLj/kP3fbU2tNw4oXe+i5oqAhRx8CLf/dBPCp
         HrAwniq0xoZSILEdHZYWre+SFY8yB9CPLmNdc/5siW86aLIXCK8wP+YNMl3Ec2g87lU8
         85a243bz/Mjb7wJbGPeEJW6DUrYxbiR8ODKM25gSPj1gol9xgFRk+a1FwgyABDFn7s/G
         TEjA==
X-Gm-Message-State: AOJu0YwKVJpOCfXyLHP6eK9ci9uh35GDrQYv1o0Prpkt5LkF97JK2eP/
	JrYcycifgoTFPOI7ZF307jUHvJfX4j8QspZQMovM7dd4VgRvK1wd7aV6UA==
X-Gm-Gg: ASbGnctfqAV8JfwzXvdel7lQg6il6guT5o5+F4+rsuPSgLFZ3wITAqR3VpPsmRUSyJn
	yTI5bF+QaVw/y7FTku77WgmROrR8CFkOjMAlin9smjchKXw7qo+Z720SxxcWM8xeHYbf17jAuQ7
	lRz8KMbSip+6myQEoMhctK18m7J4AAfPYg9GQP5d9O9X0T8GG/1H8iLE6wf25pOJ/g8JJGlpVvJ
	nSskuJOTZ12dJZJiZFAhjxv3JipGL+JkOm+L5Xhqh7/e2qGxKlBSJSeddsor82O1DiDYnyE3JwG
	BHogI68EY3Y3cvBby4ikvbsPFwKtjhLukmQ=
X-Google-Smtp-Source: AGHT+IFDTbTeKnf7somAR/gbcEcKZyGG5BhbzPu0AxnisSfPlBNH3bQ3i0JKMOx/PEVM6WOznG5JOQ==
X-Received: by 2002:a05:6808:19a4:b0:3e6:580e:f12c with SMTP id 5614622812f47-3f323a3eb95mr9621238b6e.10.1738365443167;
        Fri, 31 Jan 2025 15:17:23 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d061:e6e5:c6da:b514])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365bf31sm1099128b6e.34.2025.01.31.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:17:22 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/5] mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable regs
Date: Fri, 31 Jan 2025 17:14:53 -0600
Message-ID: <20250131231455.153447-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131231455.153447-1-macroalpha82@gmail.com>
References: <20250131231455.153447-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add AXP717_TS_PIN_CFG (register 0x50) to the table of writeable
registers so that the temperature sensor can be configured by the
battery driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mfd/axp20x.c       | 2 +-
 include/linux/mfd/axp20x.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index cff56deba24f..baf51dea98b0 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -222,7 +222,7 @@ static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
 	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
 	regmap_reg_range(AXP717_VSYS_V_POWEROFF, AXP717_VSYS_V_POWEROFF),
-	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
+	regmap_reg_range(AXP717_IRQ0_EN, AXP717_TS_PIN_CFG),
 	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
 	regmap_reg_range(AXP717_ICC_CHG_SET, AXP717_CV_CHG_SET),
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index c3df0e615fbf..3c5aecf1d4b5 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -137,6 +137,7 @@ enum axp20x_variants {
 #define AXP717_IRQ2_STATE		0x4a
 #define AXP717_IRQ3_STATE		0x4b
 #define AXP717_IRQ4_STATE		0x4c
+#define AXP717_TS_PIN_CFG		0x50
 #define AXP717_ICC_CHG_SET		0x62
 #define AXP717_ITERM_CHG_SET		0x63
 #define AXP717_CV_CHG_SET		0x64
-- 
2.43.0

