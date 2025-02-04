Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E666215184
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Feb 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684863; cv=none; b=jXD1dcHc3FJ6K+TspVMg/lru/nkpxZ/39bmPNRxIica/d7sMLTS879FyoCB4EaN4wBE6Hppvo/FB543dzO6sZJDyNWOXjfBGKm+ffaBTMBggbh9aWaDyY57bn59HyALREzqUwqmFHCGj6LFMQOvNM6zLt9XdgpAmIsUH2EfObYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684863; c=relaxed/simple;
	bh=gHtHSfNR3XwHSs8fl5jUsqaUzIZ9r16vjKwIdtE7nig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPvsD9Qxu62X0t81Semk6dCegqjk/xj5lhG4VR50WQotp9djxMOrkq6ETTg3OrvBMI+xu/nVqHikDh+3lGWV3siGpyWXxTVbq8dw3eOZsqSbYJxstTpvpPFef6Jj9oETyL6sc8grNnyF4Xx9fk6d0gbg82q1s4Lc4SV73XTaiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErECS1Yc; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErECS1Yc"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3eba50d6da7so1622840b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Feb 2025 08:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684861; x=1739289661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivl6HogrA7oXfSru2BLUm6InkAsQKXYHbfgBQ8l+uUo=;
        b=ErECS1Yc4u2kXX6I2adeyVRBgwNH9fVPnGjTdQpJo6XT5nXbLiWa1XTYrxZaCdmuz8
         3lPejVieuVf2LukmftaSxRm1ldCqHbDcHBAZVjvNQ7UQxlbGda+ZeQKc1Djl63v20/eJ
         lXYVx6RLTer+oCY8YekxPqVqLjCaLe4flBzbnMgz3Dis81lHeE28RkZ625R48m8YOanz
         3GvnRaqJDKtoU45Mpm9iL8J5YX31S1tIaNavwWnVdPRdFvq4raVqcuYqJe6bHUB8bmrt
         2RZGsEFZLY7sncoXQ9iURNWd2y9XxmUw5ZD6bWJohDe/4ItBU0w1ew02rK4SZofWQ0mw
         4JVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684861; x=1739289661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivl6HogrA7oXfSru2BLUm6InkAsQKXYHbfgBQ8l+uUo=;
        b=h2DyXgkitzQ5KQqaqi0MXl1rBXtbW6E/5aD3W+aFaLmkVKAVxsT2itVM9/ePioo4TQ
         3++r8GkDUKMGKNUmOtjrXZ9afgBfBqz2srcbkouYeO4mMY4kOvLapMg/Vye/e4WfngE8
         3uGVL8JtabxD8BLOpHz+TAD+dQezbmNta1uFP52/ofJS+O3QZZJBcEKpxUbhSVeLIRbC
         6zrTqNBmvvXiVoiaEMjF3wv0cHz5vBxijFBNqH1YdgJ8oQv7VbNTe7FWfFcJf2XFuCfA
         k/y11dSfMqgpC5i5AYiFkEGo1EHS1SiQM2PE0fAjPg+squzMrXVCVupOPjnVqVRUM22d
         0yZg==
X-Gm-Message-State: AOJu0YwwNCuIy+2LV6oPK4hDEkEPS3fi0alI5mD0NBtTlvRmlsxdxmcH
	j9CHUzFjDqOq1SmAVEu6UNQw20rtk9r6QVFqrs+ZWAs10RSol2bFx3N2lQ==
X-Gm-Gg: ASbGncs3hFDxsfex2Iv9gtSG9EA1PTVzRsj4msHRcM/TABMODtaldKKcevx0rPI3F1F
	nXMmRov2rXmQ2uVOQIufRcqeTGxeIueu1fzUJp1DFo1TfHE/29NbDXCgxv/lxaD7NlkS2UTZYAV
	E/v8hUxJnIB+1u8YMPPbwnSRTlcCk+o0HKQusOdp3oD13UlbR/O284UTyZZxHLJSeCTSFha7TbK
	AA9M8WhaxNrOVIiqh0IdwrrXYTUnWDzwTI2zvLtvJV81TJljC+YT5gpo0kciH8kNOwqFNdU5Nta
	11hftrq6t7eTJU7bOvgGoobQcx5EkuyZHrw=
X-Google-Smtp-Source: AGHT+IHy0B2vYqgAr9PIDLfyic3sok55FBROOwkHMKSQuiGSE7DGkWQzewjBscPIUMOj2/aA2OWPdw==
X-Received: by 2002:a05:6808:2f07:b0:3ea:6149:d6fd with SMTP id 5614622812f47-3f323a14825mr20694508b6e.2.1738684860768;
        Tue, 04 Feb 2025 08:01:00 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:f8ca:b029:fcc5:5836])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365be86sm3039570b6e.31.2025.02.04.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:01:00 -0800 (PST)
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
Subject: [PATCH V2 2/4] mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable  regs
Date: Tue,  4 Feb 2025 09:58:32 -0600
Message-ID: <20250204155835.161973-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204155835.161973-1-macroalpha82@gmail.com>
References: <20250204155835.161973-1-macroalpha82@gmail.com>
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
 drivers/mfd/axp20x.c       | 1 +
 include/linux/mfd/axp20x.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index cff56deba24f..e9914e8a29a3 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -224,6 +224,7 @@ static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_VSYS_V_POWEROFF, AXP717_VSYS_V_POWEROFF),
 	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
 	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
+	regmap_reg_range(AXP717_TS_PIN_CFG, AXP717_TS_PIN_CFG),
 	regmap_reg_range(AXP717_ICC_CHG_SET, AXP717_CV_CHG_SET),
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
 	regmap_reg_range(AXP717_ADC_CH_EN_CONTROL, AXP717_ADC_CH_EN_CONTROL),
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

