Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF52EF9B7
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555585; cv=none; b=fH8ZO2vT9W51PmsuMeM6IWbNRfk4tkJh0kmb52L171k90SU7YfOofELcqfwZqWXp5ihCC29QutiNZoSHecXsXC49fDwhVpSldIAsMsD/1XUTHM7cQgwl0bXFesP2q0qZW7JuZ5wRMjhURyvDz1oQkDjRbIEHrSjEP3unKMAmGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555585; c=relaxed/simple;
	bh=iboJ0KlMSWJGY+VsG4+b/czJxm0Le+jeHStxvFchug8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1YNavgYEtZb1P/D2xesXEp27t1gzlgX0+8VZ6Lx0hd35mMdArSl8cUO2WlIKDeJfC8GkjSjfMa9GOu8C4MwVhxNGXU/f2oadk4hhhUFXePREWELR5eGMvktvbqKs2BkECG7INeohh/3Dwxp81wo3QJQBqB/RqK1MWq0nbTmd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/UnxIyn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/UnxIyn"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5550dca1241so41958e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555582; x=1752160382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSM5+fYnMtOsm8GdwVjstZSV2NM3rH5RSvo+XZzua+E=;
        b=L/UnxIynKsO7j7n41gOYvJis08zrQyh2Lw2aABS7fmyP9mG80jfCY5/1WmNRl+YBMQ
         n4gdcoAYKlSdPdigC8HyW+IDNQIrKNh6xGRUIc0XrP8KNMXfq9tzxFtWXHe+8FVBC+l5
         iMmNx9g+voCU4cjWNRo6m4p4A1At3Lb7OGa2XkQkQAllbn8YXNL9jkMtL67ZajG1oPou
         UscC1TQmlcBrDZbZ4rDhHACaf968MILr+29tC8o3FTKcGtnNnn3GFkspVwzZjDao6PNk
         70VlBOzl1gmjmlkNpUP727SGXRq06lrL/FcB8U4bu2PQyadcI8xHgk3qAe164EDEwzii
         Vuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555582; x=1752160382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSM5+fYnMtOsm8GdwVjstZSV2NM3rH5RSvo+XZzua+E=;
        b=KaJJ63A4zlVXZOz9XAngbNguG9uIbVDohqJcV3DQVh3h8zpxmW1RPsHFFpvH8+g1w1
         LJ372fQ8lTXfMS7RT0I5XAf4/gp1cZ4kJuVOUGgCpxyqsJRdhdS9vFPCXEA5EgRdOiLS
         GehZdpd5ZybAzlhJ4Daek3DY9pMOpPTYlg/zEUkghZRMh5SFYFyq0hbTtXHIQ2Q3k2bM
         0n1GfEfIb0FV9BuJnn46WhJzES+pUcDFJeuB523vYTcG2CulnPLYZsOcMg4IjQwIlsif
         ECHdhFFIEDoI/YxjvwkORC23NMXli8XFZPva8H2Q3fmTnsIdvXWp3YqHIVGvD3Q8WCEk
         rBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU282SZO4b/+B1B7rOqUcntJH+tSkBUMPI8Gkqh9xQgzIrg3/rsk+VahcV7zEYnEEdMH/Cx2+6dDkfF/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkLlSGm5GazAEP/JlC1JTP89KDMXKaq99+tVjSwf1dJLXjeFDJ
	PLX4EFVK1XZLdtY4GVkDJhgR6nuhZkxFt509XUUnJah6CaxPIs6f5zOU
X-Gm-Gg: ASbGncuT77DJNhICoacHggNl8tuAYyXGp9n6k0JmikIBR/uc5InEzaZ4e6BWbOpiXmo
	HlfK9dm7VwJbw5QVo7JrXPs3q9H8rXd5wKeVBLmvS8Pf1hlx53lPMQQlV87QDY6onLGYDDh2zDt
	LQsEeKqS9dEO3m9Rjw2ZNSPwv/yr+tJTCK01X6OXO02ArYjPyUQHUqjkcQXunWrxk1b7t0hr2c6
	JH5Hbv21qLC/A5e7AYQwEztAm0uJRCJZQt1gk79D887IfyU14DSt/XEu4w6bkyyF62oqHmWj4j5
	CDHe24PnZOH1XHXwbz1LzTpMxIKanv8GwzWgYqU/4IN5v1aRZeRuaUv4AXiTiX3qGOZg4Ag=
X-Google-Smtp-Source: AGHT+IHcwagZ0bz8urHkgSxiQduhEhToNj/qwjiDIvUuGgoplh+L+oS4JKl6ajnw+KxoaxGfavI79w==
X-Received: by 2002:a05:6512:1390:b0:553:252f:adf3 with SMTP id 2adb3069b0e04-5562ee3f0e3mr1589090e87.16.1751555581341;
        Thu, 03 Jul 2025 08:13:01 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:00 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/8] thermal/drivers/sun8i: add gpadc clock
Date: Thu,  3 Jul 2025 23:11:27 +0800
Message-ID: <20250703151132.2642378-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Some processors (e.g. Allwinner A523) require GPADC clocking activation for
temperature sensors to work. So let's add support for enabling it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..45aaf5348 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -66,8 +66,9 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
-	bool            has_mod_clk;
-	bool            has_bus_clk_reset;
+	bool		has_gpadc_clk;
+	bool		has_mod_clk;
+	bool		has_bus_clk_reset;
 	bool		needs_sram;
 	int		sensor_num;
 	int		offset;
@@ -89,7 +90,8 @@ struct ths_device {
 	struct regmap_field			*sram_regmap_field;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
-	struct clk                              *mod_clk;
+	struct clk				*mod_clk;
+	struct clk				*gpadc_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
 
@@ -417,6 +419,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		return ret;
 
+	if (tmdev->chip->has_gpadc_clk) {
+		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
+		if (IS_ERR(tmdev->gpadc_clk))
+			return PTR_ERR(tmdev->gpadc_clk);
+	}
+
 	if (tmdev->chip->needs_sram) {
 		struct regmap *regmap;
 
-- 
2.49.0

