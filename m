Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA6388E49
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521933; cv=none; b=iZwW2XWRoTHTIi0bbNpTQ77FG+Ih85/zfPwZDa2El8kdguTRR7e98ogGSc6C37XsastPsAafcXbLnc7DbHj33G61SH+SvRg9h2kgaNyNCtVcptZ6TBiXvwlJ3obdaoG2y/Hz73p0ntqGq2ylfCzaW8ge6gfGGRr6O0Ih8oYeMXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521933; c=relaxed/simple;
	bh=96ftkQ5iFQxw5QZ9xU7GhEsTXdenW99uAU0uo70hPRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeQWc2LVIvM2Ce0wleP14x+nJb5TpNwaPfIuEoi+Fl4FtLNeClmx+GmPoiLRGKrsbtyX2eEtpj0YlHopEA2S1/Bts3a81DMHXkBrSYp8IN+i+PmuQISjLmnNPxLdHNwZG/4oG1rUVkqqv7aPo9j4avvMXyHiQhaexi1zBDXTivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvyvEGSZ; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvyvEGSZ"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso775301f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521929; x=1791126729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=;
        b=EvyvEGSZh7YualpRpy0GcZdWkUw50aJhZyYd1krofQwj7zpfui8WPTqC9gtgEHb+gI
         LTlEHuby/hxkQTyntUcb4E671VQxAio3fNsX43wLjB3SbxseU1wUHVjFrgpMlVSKxFCr
         b8kzyM5LjRXS0kU43UF67X/xsta4toNnBaOvTpV+qK8SBueEJekXfGrmFjh1XeOLmRKC
         H9qBA+gfeU5A2GVW5w03IGMn4iNFhiCRtG3gCK/j7AR23O+TaXMsdWy3USUoWuou8C13
         8SBbuWE3StZWPaURftJ3iHgj8Okc+AK8R6g3VM58PUZOa/Dj2M/ggePvFKgy4dKGDREy
         PTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521929; x=1791126729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=;
        b=u5OJSYvy8W5xzjwhrok17iGXMHS3x6F1Iix6BNi5UkPKmRS+cgofnmrrOe6Ra0HKtM
         fLEHS/Qq/WUYc04TqXbfN9Tn3sY3/q5wk3ANV0kNjTjMZyUf4hoEVxT+2DIBkwwxrrfY
         iXKUTsx08fgPAJbY5NEBsIXaFl6lRuZgLXNVElKaIs78Zf4OL1MQHzYbBovyDP5NNmHZ
         kpJurMqW34VF/fv3QocuSZQfnvRE2wqgfubznF9MCC/BFYrdi/rjRZ4Vz3wVNHA27kiR
         A8yAaIz/Yajlln0SrOu8LkbwN5cmEfO/F9sQQhw4J73W/nvMvjB/I3mOfDsrIXskEf5f
         4QSw==
X-Forwarded-Encrypted: i=1; AKwUvBwywAvtypwT3lkRXVqokZyA9A339YZEfpDiAwIPAmHWidwDJBVGwfU+yslCdA1P6qokgATlywOyxddOow==@lists.linux.dev
X-Gm-Message-State: AFq9FYKcLd20sHdIJMrMuIi8Xx318nYN1Ofaneh9Mv67HrMgajo0X4Qg
	55QvlnpjlOlIb3eXvMKYWRzVCN8yt37pOPzj6o0fbAFkdylR/A8FzKtY
X-Gm-Gg: AYBFou0Aor6+vUU36YQDF1ry6Z2JkB9xR0+4vIZ3mp60qQ+iCK8goHnOrPohgwLXGe/
	W9B4Noybht/HM+xf4ZxE0e0HniQNiBJwQ6/leCigbM9GUCUtaJVG/etkMRZ1hi26SnH3vodQ//M
	2T0m1lzsmhZqrp21jd7yGZSIFCEfwu7dUulSlzsB5qLhtyWvnvBUhL7EGjxC3uWZWBZT1kM1duZ
	8nHkdcHu/6QDnsJRNFB4b1EX5yKHZFxh+qdx2niNS9aIEY29U5hTq2Fd4H+OlfhH36mqvLn0lQ4
	v1FFPB8jLMH5BMg2sQw/57kD+A54sLii3CRCsVOoE/EFw1fML7AZHf28onenVPhI1k1x1CZ1prG
	ReW/RuezqNuFks2+JrVwPM8sP4e4N6st6adMeU4kw9OLvVh0XhtvJ4MU1XJNOjpmbERpKVai1Dx
	mESUIaV2P5CeO3CJzdrI4EtdY6t9jD7s1Wbj6q1uh1Wihkr9AEPh5ofZFcKdEkWvGH/dkR5TH+A
	Y3KUQ5M9g2XxYmbOKssUm/678tn3MND
X-Received: by 2002:a05:6000:4692:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48884e0d903mr5840808f8f.52.1790521929459;
        Sun, 27 Sep 2026 08:12:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:08 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Sun, 27 Sep 2026 16:10:09 +0100
Message-ID: <20260927151016.186493-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

80 pins across ports B, C, D, F and G; the mux values come from the DT.
Port C has no external interrupts. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              | 10 ++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 53 ++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348..a08186133090 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+	help
+	  Say Y here to enable pin controller and GPIO support for the
+	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
+	  as the PocketBook Verse. This covers ports B, C, D, F and G,
+	  including the four banks of external interrupt capable pins.
+
 config PINCTRL_SUN8I_H3
 	bool "Support for the Allwinner H3 PIO"
 	default MACH_SUN8I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f..5129c0f19f3e 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
 obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
+obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
new file mode 100644
index 000000000000..98dd4ead4c32
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Bank sizes and the interrupt mux derived from Allwinner's BSP driver
+ * pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+/* PH0 exists only on the BSP's FPGA platform and is omitted. */
+static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0, 17, 15, 29,  0,  7, 12 };
+
+/* Port C has no external interrupts. */
+static const unsigned int b288_irq_bank_map[] = { 1, 3, 5, 6 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= ARRAY_SIZE(b288_irq_bank_map),
+	.irq_bank_map	= b288_irq_bank_map,
+};
+
+static int b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
+					   b288_irq_bank_muxes,
+					   &b288_pinctrl_data, 0);
+}
+
+static const struct of_device_id b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver b288_pinctrl_driver = {
+	.probe	= b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(b288_pinctrl_driver);
-- 
2.53.0

