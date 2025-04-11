Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C910BD515
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331970; cv=none; b=QkXcD5lrxcjxp6zq4BVAKRw/1vvfhyjYxnjIiG6298EhbrNVuTN97bMnALVMxrRkEHGtsXADSVAqDexhVeMbk0wyFO5sFZsF0o9yPgCJc9YNfQ43psvAl4pkCJgRpV7o+Af5F5/ZKvfZeweJHHa+9xxvSUYFjYglPlObUvHPQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331970; c=relaxed/simple;
	bh=4drhvRp1v2mp/1rw3RlittyMG3A82PQwVLHy+wmOHKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIyt+ImgHwG7DNNG3w8PDtmNX1TusRyspjaGJptb+BD2Npb0lmIHtaki3IkLAteUk1rCDrq/Ghs7nNKbw3J20E2X6TNj/ezr7k9NycYcCuK8v3VPa+NVeHb+2gKuzrpcbRyI+je/Oc/V08ggL33VXI8ncaUDEx3YlrCMzMxkO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmZp95pE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmZp95pE"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30c0517142bso11279461fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331967; x=1744936767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgLz+wxMK3cB0CjJ97zDR/iMoodve9Fd9p0FjX989r0=;
        b=EmZp95pEA/jJqQw/RWFfUnCAn1aHLiG+LOIpLxtPec3mlabNW2Ehtuz+qdzjahVoh8
         8uAcNPMfxl0rSyQf6orSfo+fR2syi+MHSABSQSmEsNxCf/+FryTPay4EfG6FJz/C1P2I
         o5iGkS9SOeYEZsRgzfXiwSXT1cW5BKAo8vhBvpzPvYqXJIdczLixlV6ORpMRnYT1ICOy
         X+pWvLNyrcy6+/nkRcA5RDoiXIDxLrFORbq/e0GxtpX2Rn/HjIR6WwRRiFXHvAIHIHki
         ZUwZEvRkU2UbsnfRLjI+WUbubB+A6Bo5VFVsyclxZqj0ZAGx3yJxu4NvOu9y7uBfAkjI
         +88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331967; x=1744936767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgLz+wxMK3cB0CjJ97zDR/iMoodve9Fd9p0FjX989r0=;
        b=Llpg+tFUKCoVFR5m3hQo/bmKp8j05kc1VH+4/Ct+0ArrclwXKVI45r333avX1eBAJH
         ddw4XUlt/QE+5tFOsVlZEruiN9E6+XD3f9z9tpIEmqPfg79i0GnwEkm8fTuVUcoXiMsQ
         1ROM14omilY8svZYnyFcm0ZGPkzxRdgnoWj/yQlv4qDcLgaoZctk7PZj1bAxoQdlVLUE
         Kl1hc0xrk/0hqOSBVbX8KGbhG4ovHWh9zu9Z5bfXNFOH7jasHMx8kCgr+Kf2fCjILh5+
         zyXSMo1rKedtbwN60zB6+j4XqSGX5V5Pnxz7Dy96zDvy8R5jAOXkmu/OnhnfKdc/PK11
         83KA==
X-Forwarded-Encrypted: i=1; AJvYcCVEvqL65F6rSNL6aBkRlOWpbZ75VUx31R5ijkFmV1zIPUmdzny+8uOSb2qVUzAC79oS1+SLpdJl5uxANg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBRf1iWiHtz0FiXIP4U4ULLwOx1hNGlo+da3/c/2l+99oSQfsh
	eal3692w5t9y1C4dvvpsJKNA9BL6T85QzOTOJUza3UnWBPeMZYWx
X-Gm-Gg: ASbGncv3PicNBseF63l1zltKs9tMkeB//mc8aKBW/ag5LOLHa/FwVNCqa1EafpkdWXW
	PH0g1vKUybTGLd+Lw5zuP6ORG74SYmg6NaT9RowJc3LQBZoQt2IrZp2zakQzypkbQonie/8FIqZ
	ydKuodgGWkkyXsv7hHADKyJxHSzM7b6ULtz19c6jIiosgmi5vnMi4rk6n2XKw8bFyHRGqCFlAkV
	MW6enljciYcn/2neALI5PaOQ3vriNHPD5V5L9A4A00MXJmiCYUWVhFQmp0QKMTvvBwB01tuR3mL
	456YpNorwyiIEzWBz7DfB0QqYqDqGoF/H/PGTQPv0yOnAOUDgHTcQ6RkfSiJ
X-Google-Smtp-Source: AGHT+IFsLLiiBQI5ZLGY7lfwqEqas7w6lvcmymmKeoSRpIy/66PmWCqCbglM7RpgOnvLMZAozSYyIg==
X-Received: by 2002:a05:651c:905:b0:30b:ecfc:78bf with SMTP id 38308e7fff4ca-310499d40fdmr2095651fa.5.1744331966765;
        Thu, 10 Apr 2025 17:39:26 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:26 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 1/6] thermal/drivers/sun8i: add gpadc clock
Date: Fri, 11 Apr 2025 08:38:21 +0800
Message-ID: <20250411003827.782544-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
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
 drivers/thermal/sun8i_thermal.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..1f3908a60 100644
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
 
@@ -417,6 +419,16 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		return ret;
 
+	if (tmdev->chip->has_gpadc_clk) {
+		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
+		if (IS_ERR(tmdev->gpadc_clk))
+			return PTR_ERR(tmdev->gpadc_clk);
+	}
+
+	ret = clk_prepare_enable(tmdev->gpadc_clk);
+	if (ret)
+		return ret;
+
 	if (tmdev->chip->needs_sram) {
 		struct regmap *regmap;
 
-- 
2.49.0

