Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9917D406
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Mar 2024 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710271523; cv=none; b=nZZi79LlUL7bN8tCsYAyfCVaFcEWZHPcBte+W79ZLNVRUdSc9byX813ggGoZ6RUG8EYy1/4KOxZ65EgBQVtlhhmjwkuuGQpIX2ZDUZLxDTToGiBb4qkMLtC0zz0pJ3CYeR3gM2Qszjm53o2qrbsy4O8bCcVrUmrzKgk+3ecpwyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710271523; c=relaxed/simple;
	bh=fs2JqTkeVhbTOJnRKJDW1DTPhU/mIIt/BnLnniKqQfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UNfhmdd3gDmWce8WbU4jSbXf17h6MOPCJkdKmEhq50geOfa0Stzv8scxw6TTLPS0sryaLMTlZ3p2xwCyaNPwVljRHIedSaAJYrozKpdLdH5GO9epLR7+hlimxXZuuuqj2PawF33Ppu5Uc6UK88KIIf++/feUsuJ3PkrmJnrolN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LECxpUoG; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LECxpUoG"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a0b1936400so178498eaf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Mar 2024 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710271521; x=1710876321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTNA6eQOgVZeDaw5GSB+YIN/6xC4LtEXiiAUCgqLZn8=;
        b=LECxpUoG30lUem0xJk+EP418ozHcnEUck15LRfdSev2fE//SUzrrG2CkTsfzkw8vAf
         6qQt65kLCWIanbQ4Q4zVcrzDzI1EvSYfDUewBPSs8on1c91zLp9lcdz41eFA373Pbflu
         9sGZ5t/Nks+tEr6o0z5qwHYHLr1Hx6IsIpnkV+V2+CONg2bx8PpzUjWT/Azy4Vq9h8Yi
         HGi9K8oP6rMZOroHS/yhISTIeB3DvY25veyKOxxYGDOWztU92h4TOkfmj8GrBwSLZuSU
         7vuQB7c2DTIrdIbQa4k8QiuJJpzL8GCR3RAQZudz+/kxWLlwpBYLXcXvO4q4+jo0WoMp
         Q+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710271521; x=1710876321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTNA6eQOgVZeDaw5GSB+YIN/6xC4LtEXiiAUCgqLZn8=;
        b=pfTV40/eZ+UgVPTJbk7gbgWht7kc84FEubty7YTbvyIXNGLoxdndn/wllXmEmUZnmf
         x9HaMpY0YAjGunT4sa7bho+aNZIhjv3s+Hk+VN13rhQk4Ngek2Z1elNzx+x95nK23yOW
         jTr5o7MVgN7Vptahp/PjpDrGIv2/GIq/S+EmQ5Q5qlKs2inCYASoJisMbTu7DhlUsDG9
         3E8O52mplbiob/Sef9weV2oYKwWC5c8i2jB2moC8BFXTVXzOGaZk6oSVBJOagGhfm3mY
         3sn5PvobuvlqAZoRQ0uq8JquuAuvwyhZGRJIZLwvxYB0ku55G/jMYRiBYrJnlvqhz9xq
         oNeA==
X-Forwarded-Encrypted: i=1; AJvYcCUkCPBd7MGCi39bUw3z4qTUEfBgm687b0OMd1/WcOaSHvSiuiZutXqNOgfBk/0Zq9erL+lzQohYdxbbTlRDord06BmAP8vRuJmNB+Q=
X-Gm-Message-State: AOJu0YyFawXQ3e9PY99v2unvYK8FzfyBsvE3MFdWiaqfLeGSjj2V468b
	UeLhysSanwgVKeOIt9pKXR72veryFAvjzqtt/yDwS0hlKJn/kAH+6cw4M8IO3XI=
X-Google-Smtp-Source: AGHT+IFiOD7raCGAFJ0jxa2JFYqQhVuwra5l6CJlnVTYYffky42xgWMsOYtz4U8W+MEtKqq5d39gvw==
X-Received: by 2002:a05:6358:720e:b0:17e:4fc7:d95 with SMTP id h14-20020a056358720e00b0017e4fc70d95mr1605796rwa.17.1710271521355;
        Tue, 12 Mar 2024 12:25:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id p1-20020a63c141000000b005dc389409c1sm6331177pgi.93.2024.03.12.12.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:25:20 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a platform driver
Date: Tue, 12 Mar 2024 12:25:06 -0700
Message-ID: <20240312192519.1602493-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a
platform driver") broke the MMIO timer on the Allwinner D1 SoC because
the IRQ domain is no longer available when timer_probe() is called:

  [    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
  [    0.000000] Failed to map interrupt for /soc/timer@2050000
  [    0.000000] Failed to initialize '/soc/timer@2050000': -22

Fix this by wrapping the timer initialization in a platform driver.
builtin_platform_driver_probe() must be used because the driver uses
timer_of_init(), which is marked as __init. Only convert the sun8i
variants of the hardware, because some older SoCs still need the timer
probed early for sched_clock().

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/clocksource/timer-sun4i.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 7bdcc60ad43c..728dac2baa84 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
 #include "timer-of.h"
 
@@ -218,9 +219,24 @@ static int __init sun4i_timer_init(struct device_node *node)
 }
 TIMER_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
 		       sun4i_timer_init);
-TIMER_OF_DECLARE(sun8i_a23, "allwinner,sun8i-a23-timer",
-		 sun4i_timer_init);
-TIMER_OF_DECLARE(sun8i_v3s, "allwinner,sun8i-v3s-timer",
-		 sun4i_timer_init);
 TIMER_OF_DECLARE(suniv, "allwinner,suniv-f1c100s-timer",
 		       sun4i_timer_init);
+
+static int __init sun4i_timer_probe(struct platform_device *pdev)
+{
+	return sun4i_timer_init(dev_of_node(&pdev->dev));
+}
+
+static const struct of_device_id sun4i_timer_of_match[] = {
+	{ .compatible = "allwinner,sun8i-a23-timer" },
+	{ .compatible = "allwinner,sun8i-v3s-timer" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver sun4i_timer_driver = {
+	.driver	= {
+		.name		= "sun4i-timer",
+		.of_match_table	= sun4i_timer_of_match,
+	},
+};
+builtin_platform_driver_probe(sun4i_timer_driver, sun4i_timer_probe);
-- 
2.43.1

