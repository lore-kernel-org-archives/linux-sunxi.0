Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5C2FF648
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216061; cv=none; b=llTtsOvaoHOppx9DDm2S7OOX0C//Un1OrlPhnXzs1qZOX1/431TZd2cABQi6QuB+fMtcKeB//XPm/s4YMCuzmwCYfIeABecCKCX3C2zbeM9J9Gq3lzpUPYdVPu9VLWCGLRh+Q+PFEWOkNjLgC4Rd9xPG6y1VU24kK+EJ/zc87tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216061; c=relaxed/simple;
	bh=GwnvL5vMWVsQ51UjbmyDs3QGAPhCZplv1N6Us1qfLHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sal33wRrN6zec783JKYjqhWKWPhVk05WFEt7wIBohE4thtCtBbEIM6Di7Es6Cc8CiABzSvoyJAPVGlQsZ39R+lnEIu5Iulz2ewEqf12L+DqcCshsFOAzspAEK3++DKf5l3yCgSemhxfEH7WjZtLhbpPHq6hdP9ZwPMvnWmbxXhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdjaPbdz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdjaPbdz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b737c6c13e1so112271866b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216057; x=1763820857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
        b=hdjaPbdzVMdHyehdX8YSglbJZAfzWjFIVTr7LvuOA623qfmI+lNbNqr1uV19rbgRZI
         hacHkCpUTuzDwn+4yxJ0qLIMcthFsAdULw/p2jj/KxtSepFdG4VzMUYPX6KURoSVstE/
         adSNIItJmQ47sbV4iwZcM+ZrpmEMZfmQtiP8umTD2uDhp0IjmY0CYLtkYT53ysTU2qko
         DiWIpP2tFebzzSkEicWMFpBExR5HnEFq/8kARVqHvINPjRiSPLML/7wHE1Y0gQF0rAu/
         KQrpFWGLezCpg6zW7pVAio/pqvL9DB9/NnmASau1b3WzvQJcfZvclmc8ppTr3jeQBNvC
         3S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216057; x=1763820857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
        b=SZi+MeqT7ZH2+8AoE7b6neuBsNvDXUBTXhYao2KBJ014V56lXHO0w0qSDDXE7A21F+
         xrHWUmLt/GjLzptk6ik9YwNEDL1Ocl5zM21qTOrvshjk59pzVP+9KCvRR0pqXHu8n4oq
         jDC9nlm4Qy7INSDCuhDmm6dCFTX9IrOE29+OJDtq7RATW+RNjdg+AmIeNQfFPdhInRQh
         JKBdPUSBT1ec8ygZ6JBpe24+o9PSbbuEyQee5dvUiQOlowGQEIFF7DV5REyypAMQwZyQ
         PbbDpz7b7Yl1iMaJLZitX2OrEhC9a1ESSIEH2k4ZkqC0JNUKJl7xVfvHNcoGk8Vn+aNg
         JN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt/2MG0nLhnvUf4oOgHDzrUGsig172BPhiUQB1Jivvu+fSmQ0F4A35Lx/jQoghfE3/I/38PZuN96ompg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm4mwLLA8qJ8fxHO1OhTXHe7BSQtrLyy/DzWxllmxL7M9qW677
	YegY9T6300/CuaWR3539MpgOFIt+534EWth8bA0Ns9Q1mmVn4G6MvtIL
X-Gm-Gg: ASbGncuxQKT9oJJWeGLHcMz5Zi9gPUAXvKfeTAeNB39cVyq0hDZ62IihcmLyL2Vb5aR
	A80EeaRHoqkQ5FJWn4uRO8nniTFADRrmvwFa2/L7FLefjsPpFCgKUWFb+/XIuOU8U69fHZbKaTK
	u43vDuQgXwSDJoLmyY2zMiSZ+f9YdGUNPTXxHTT6MCpCG940rLhLhITyI7Zu94chU1BvbOyXl0n
	fTwrkQo6Oj2NRcoOMLMTSkZgX5ps/PV6ddr3V+fOv6wXqX5wjenTBGDYfQa1szkkKANt8g96fiy
	9Jm/snKTcZyjRz1sqQDG4Pnqzu+oDgrTCnzvXMCQccHxF9BucbyAq4I1mOavtkAUWQnirYWdZ45
	XdrbpgjISwNlL99UqZ7+d/ZsbIPev9BU7JqyHckQfx1zxxXniVMt9PeccC3I+Oy0ucbVQ837J0E
	uy4u//tCrXOiMsLnnjXMs7GfbMEGDWNJ1ULvpORph32yZDjWIFUdtY5K5V
X-Google-Smtp-Source: AGHT+IHK6phfJOgzf+aqpzFKPTHMjqJZ4C/vVBwN+Y+khMKq+c5K63YPI1+yGx5o9/adAsErm3Oq3Q==
X-Received: by 2002:a17:906:490c:b0:b73:6ca8:b81f with SMTP id a640c23a62f3a-b736ca8bbf7mr534553666b.51.1763216057167;
        Sat, 15 Nov 2025 06:14:17 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat, 15 Nov 2025 15:13:43 +0100
Message-ID: <20251115141347.13087-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..2841ec922025 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -6,9 +6,11 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT02CHN_REG 0x28
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
+						unsigned int reg)
+{
+	switch (reg) {
+	case SUN50I_DE33_CHN2CORE_REG:
+	case SUN50I_DE33_PORT02CHN_REG:
+	case SUN50I_DE33_PORT12CHN_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0xe0,
+
+	/* other devices have no business accessing other registers */
+	.readable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+	.writeable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
+
+		ret = of_syscon_register_regmap(pdev->dev.of_node, regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.51.2

