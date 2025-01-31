Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10011AF0DC
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365444; cv=none; b=sWzNpKni7Y/vx0wurHpfyvHLwhbpXPmXcPREijpVDyFfyhZAChvYfpFF1np5ZE01IlHtDEMQYK6ja58wiFSlMtpm+faSWCf5y71fa0mUFKJBxkbUPhAV4evci1mNyQ3j3RzzA0MsatO2ARYp+DvjSvt6hauTVNNiDSCP642IxFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365444; c=relaxed/simple;
	bh=gHMiTOPVRMWnLkIZqILMO8HdLfSWIvKnxHa3x9lGjsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=man9xj/GonTU2Un/yg/oQEUHl8W2/WkRgfIVlobs4ahFbHrxQtfXooz/tXZWM82qYWuuLGpJV0eC00Pyn1lEzfuPMCq2+7ZBnu9Fja7ROj4pL63FI1Jl5KwhsoAH7FO8Knz9sz4UUMG39NFo0dKuWNaxqpLdMNjxHu4A7AT3wSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbf2ebRi; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbf2ebRi"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71ded02b779so1404716a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 15:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738365441; x=1738970241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afgQizDC60JMpdo9r7FEtCBrD/nRn7NdVuy+nRLagYA=;
        b=mbf2ebRiDQqx33B31bpgrThIVjsH1knmTpCTWMnpCu1cuj5+cadw+cF/yUNBKnFPlU
         JLBf8qXfciEs8eJnfSaAFhfNjJtqeLrbTrT++QQ1nRx3cksEkOS9P1SFjuvj+FQEa1G8
         nw+iRR4Qc9FXHNKwwR9+iiYcUCDE9nnVz9Sh0MxuBDbJqpu++4daU/UZ7daIAlqwyEIN
         GEbPkYTpl43XR3OG/mQRFAfu21KMrrGOAPrA11R7QdT3daGjcUbfgz1qC/fPlQqY77gs
         gBEDo1gtuA/kwfj5nkmgk8T7/tDCQOviljU8x2LodPw8epXW9gNlxx6R3kcsyKrY7VDQ
         TF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738365441; x=1738970241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afgQizDC60JMpdo9r7FEtCBrD/nRn7NdVuy+nRLagYA=;
        b=A9fOtRhDI7sEkhsflSzfZrVjK9uPGZ8GUfq+yyUG8LBNTXGUtUIQu+ecloMd96IQ7Z
         oDbTmyRgtzfgAIMR/yTWawi/y/8t0dapJb6+hx6Zn3SSTdYa68+fFMiAqilBIgwQwAS6
         bLKEdQw2rVHR5DPxHJ2Met7JEhwRE3WoVSrAuYLp5o0Wu9W1HIyxySlzGZ05ThkEd03P
         8EehDcNqdWfJ0Y+rpgp2/FMxKbWZojZALlguyjA+8vAGC/NIte2rI9ECRLiyDwOODu82
         hDAHExsPOslY9+DJ8XDK2eHF809jmDBC7hIbRKNteAXcXUG1k99d9F927TOclQMvy3GT
         Q0QQ==
X-Gm-Message-State: AOJu0YwPSf1n1qwJ3PPl0IbTw5DPIABFe+hVRi7iArO+A1afydGybY8c
	IXwtJqrpb+9OwfCTNTqTFvPlZh46qgauStSA7Tk5FdS1+Sb+OD59tKBong==
X-Gm-Gg: ASbGncsOVfVwVULp1J+MxCOvz4pLwmiTzKTY/UQBJu2Sis70xoAnZVjyICwy5rS/Eb/
	DCFApfBZCumQc7mB7Nd8vPaZ7bNaD2Ppo9/umTi04m6o216J9TegtNXnWiYvYdIEhXWHoyJo2nD
	VaHw3hml8XswRcsxKVf/RhI7fKGLArqodD0kVuOymGxh+nDRI9XUUZU81X3bE3/Ayg0Ui2TFEAt
	XoIwZIVqIyYcZJcPF1IgTN2Hnq7ehBaOwYxDXiLq3fCD1IhlEFEJbTw2FcFLIjKlSKlRjZ69gv4
	vJzTr3PcTeYta3pKvsBBVKKd9Ww/fCFMPvk=
X-Google-Smtp-Source: AGHT+IEEf97BL/zbgmnuNLvZSKUkJYvKdUkUca7v2YlKwxzUPi1kNoMYeklM9vj5h8C59YtQztWbhQ==
X-Received: by 2002:a05:6808:2010:b0:3e6:1513:4c04 with SMTP id 5614622812f47-3f323a5cb04mr9239783b6e.20.1738365441716;
        Fri, 31 Jan 2025 15:17:21 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d061:e6e5:c6da:b514])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365bf31sm1099128b6e.34.2025.01.31.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:17:21 -0800 (PST)
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
Subject: [PATCH 1/5] power: supply: axp20x_battery: Fix fault handling for AXP717
Date: Fri, 31 Jan 2025 17:14:51 -0600
Message-ID: <20250131231455.153447-2-macroalpha82@gmail.com>
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

Correct the fault handling for the AXP717 by changing the i2c write
from regmap_update_bits() to regmap_write_bits(). The update bits
function does not work properly on a RW1C register where we must
write a 1 back to an existing register to clear it.

Additionally, as part of this testing I confirmed the behavior of
errors reappearing, so remove comment about assumptions.

Fixes: 6625767049c2 ("power: supply: axp20x_battery: add support for AXP717")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/axp20x_battery.c | 31 +++++++++++++--------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index fa27195f074e..3c3158f31a48 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -466,10 +466,9 @@ static int axp717_battery_get_prop(struct power_supply *psy,
 
 	/*
 	 * If a fault is detected it must also be cleared; if the
-	 * condition persists it should reappear (This is an
-	 * assumption, it's actually not documented). A restart was
-	 * not sufficient to clear the bit in testing despite the
-	 * register listed as POR.
+	 * condition persists it should reappear. A restart was not
+	 * sufficient to clear the bit in testing despite the register
+	 * listed as POR.
 	 */
 	case POWER_SUPPLY_PROP_HEALTH:
 		ret = regmap_read(axp20x_batt->regmap, AXP717_PMU_FAULT,
@@ -480,26 +479,26 @@ static int axp717_battery_get_prop(struct power_supply *psy,
 		switch (reg & AXP717_BATT_PMU_FAULT_MASK) {
 		case AXP717_BATT_UVLO_2_5V:
 			val->intval = POWER_SUPPLY_HEALTH_DEAD;
-			regmap_update_bits(axp20x_batt->regmap,
-					   AXP717_PMU_FAULT,
-					   AXP717_BATT_UVLO_2_5V,
-					   AXP717_BATT_UVLO_2_5V);
+			regmap_write_bits(axp20x_batt->regmap,
+					  AXP717_PMU_FAULT,
+					  AXP717_BATT_UVLO_2_5V,
+					  AXP717_BATT_UVLO_2_5V);
 			return 0;
 
 		case AXP717_BATT_OVER_TEMP:
 			val->intval = POWER_SUPPLY_HEALTH_HOT;
-			regmap_update_bits(axp20x_batt->regmap,
-					   AXP717_PMU_FAULT,
-					   AXP717_BATT_OVER_TEMP,
-					   AXP717_BATT_OVER_TEMP);
+			regmap_write_bits(axp20x_batt->regmap,
+					  AXP717_PMU_FAULT,
+					  AXP717_BATT_OVER_TEMP,
+					  AXP717_BATT_OVER_TEMP);
 			return 0;
 
 		case AXP717_BATT_UNDER_TEMP:
 			val->intval = POWER_SUPPLY_HEALTH_COLD;
-			regmap_update_bits(axp20x_batt->regmap,
-					   AXP717_PMU_FAULT,
-					   AXP717_BATT_UNDER_TEMP,
-					   AXP717_BATT_UNDER_TEMP);
+			regmap_write_bits(axp20x_batt->regmap,
+					  AXP717_PMU_FAULT,
+					  AXP717_BATT_UNDER_TEMP,
+					  AXP717_BATT_UNDER_TEMP);
 			return 0;
 
 		default:
-- 
2.43.0

