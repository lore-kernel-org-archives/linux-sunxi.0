Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BE4BD78D
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830520; cv=none; b=E6DFyI0P0JG6rgwVBupKTvxoHR1fqkh+2Yfgjh1QgRu89J2o1/zlBuaKm4BQTMSzbnxWHJ0GSQ3R7xKKuAgDt18NcesyI/gKRMsGt8CxFydyksAvpUjcdL+SH80VdxwTK+tB9H3QZaG2qrcHd8DKVCFcKISls8+pvzi7MTFcZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830520; c=relaxed/simple;
	bh=+7IEebuXjPysbU/EOLi4stnxpBM6T6QymSauphGxL/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMZwLSHo/6oWY0KfyBmM0+YC/nHlXb0SClVAMlM4wCiHTabeEjnJ7wK49z+RQHWHN6dthn5q9bFl8LJEnPw1UGA9doGVZ3QjM6/W3EvJCIXzkZVvWv1B892ZFfLa0t2+2VjqbYYCizKeOU3hqaMpAc62Vcj/iLaMpIGcJ+6WAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNL1evLd; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNL1evLd"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e67a6b3633so737719e0c.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830518; x=1792435318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=HNL1evLdrGqBiT9DqJlEH350rEn8eU3/Td11fPxL5j9ln2N6ELirmtRDBGFji+CFfD
         68Fztf5CLbFCFNj7LlAss5GoRdUAUnns2vpVrWQ4qp1didkqf0OQdL+LXNU97Lyk669o
         25zCJ1s6Yvxr99uo7yu++goB3kJWEVo5tT4yjls1seGZcWfc00oOCw6GE244tcRTffzl
         PJdMjl+3lmtuvcsoEYGt5/IFvi2FAxZWklzgJsarJKIcw6fANJi0LQDCG/wJU/QxbFOH
         ph65Ab/Qj2MrV7dHDGp63UVJqVqWPAoOysWMpW8wIM10OoUkO7OB86ITACDt4rG2V6ia
         Jp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830518; x=1792435318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=VbYtu3gDyA5rjf5wHgn/2DJlae7oprEL771zQINi7k8TMDaFnuNlddEch+I0rRwdhY
         Xghmpe1sUyPpC7HTbpiE9fkD92XWaD4eGp9CYFJPwCpKaFz1xzxRiB/HxXw/u3K1E6ZH
         bV9HWu2yt+raoApUFujbTtvXWVZtO6ieYlHOodvUAbbsVF5BJMS4tjRZ1l2soxMtRqfX
         Kfd/dodMOBy6f87X+ZAIS57xzhAZphvGcG1zqqNHU/9L3y3fEWgePZE19C77TrSKiFVS
         Wi23IW29Y1jFxRA5wwfUb3LrRweNsV3IZVgTkFI6ibBJzC0OgbfOS3SEzlovfSgZPKWB
         +laA==
X-Forwarded-Encrypted: i=1; AKwUvBwre9O3iw+2am//O0SsF6xYLcoAaw4F+RrgTY+AXL7a++7cbpXmbc0SMGGioiX2rWV7ZCC9HShmliB2hA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJCRzcFhfS6Ji0tyqj0lehwj5pHAYLw3lD5Ppy7kgyz2+dN+Xg0
	vWxTTHyqT6o3cbBG3VC/U6aY/zvC6eWUBDGXwtTQRYQfMxxgNQl6Y+zI
X-Gm-Gg: AYBFou32W6q3EaDaFj6UkID+9r+q5LVs03OeYnjsQ3psyTrlAbsrHFbaQ8m5tJ1m8iT
	L+x4Qm8COXNS/wGs8SxWd3gOG03YaGg1hoxKkZmOMOCAfylQp45ELi3PnKfBickywtFa7C5nGf3
	V/Yd9j5LBTEnopq65QalHzxwkDO7p48lbksJrO+YhL3ZQ0fpATBKkcQnK1784XLwmfzU8KQgMbw
	WszXt28O+rL8OSCenZsMFWMb7v5ALd/LAZl1PFxl66J+moyZkl+aXTpWg3bpaJnCb0rKnFjiESm
	rw0BOlgyaBfHB5MH2d41/lHBbrkhe7VEh5900cbmOo59p9B4BvMW98Dj2fLXcOS/pRFr+Ht9P59
	D1vytkpe5gieSsx0BMVXx/HyeYoqOK/Ad6z/Em+T8DWEAfCoRvAYfXR/F8DB++hx1qTYzPlIHhV
	4rA5vGQBmkJfswqwMrttQCtiY7RIt8pEnxr0cHRwcEs+wk0i5pihQ7zzH4rIri3XwMorxFXlA2K
	b2J3n9smigT8oxpKBWAh92FF+jduUm6fAl0FiS1XNDbtMl8yY6g0lXaIiZLvt/5bXbwrq1XHR6K
	Fxq8RyJqiinJqScNQQ==
X-Received: by 2002:a05:6102:26c2:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7cb377f59d3mr2545886137.36.1791830518290;
        Mon, 12 Oct 2026 11:41:58 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:57 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: sunxi: a733-r: use the A733 I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:29 -0300
Message-ID: <20261012184130.548261-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 R-PIO shares the A523-R descriptor, and with it the A523
inverted one-bit encoding and the access to PIO_POW_MOD_CTL. Its
SGPIO_POW_MOD_SEL has two-bit fields instead, and the manual documents
no control register at offset 0x344. With PL in fixed 3.3 V mode, as
read on a Radxa Cubie A7Z (0x000aaaaa), running the old helper on the
host with a 3.3 V request for PL gives 0x000aaaab, which is fixed
1.8 V. This was not run on the board.

Give the A733-R its own descriptor with the PL and PM fields, and
leave the A523-R as it is.

Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1aa7f32035e1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,11 +30,33 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+/*
+ * The A733 R-PIO has the A523 one's layout, but its SGPIO_POW_MOD_SEL uses
+ * two-bit fields, and the manual documents no control register at offset 0x344.
+ */
+static const u32 a733_r_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[0] = GENMASK(1, 0),	/* PL */
+	[1] = GENMASK(3, 2),	/* PM */
+};
+
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_r_io_bias_masks,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc = &a523_r_pinctrl_data;
+
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun60i-a733-r-pinctrl"))
+		desc = &a733_r_pinctrl_data;
+
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
-- 
2.43.0

