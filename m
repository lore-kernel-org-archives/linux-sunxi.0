Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49A172BAC
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713373473; cv=none; b=uuoSrj3bfR4oPeDYjcxhePQRy4rngarsOB1EMppppY2t/ZI2sAp3mGF1Xauq4uY6FN1CmGQCALM+1vyQqQnO/y9WkA9q7s8/TUYhvEsVIy4dZS+I441wWMGNpR6q+OUYoOklM2e2RRZqe7EYIArP9P3aBKjPkWxCk0jZRCptv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713373473; c=relaxed/simple;
	bh=yeuqhpeXoirlC61pOihh6SKMLRhOXy2QmFiICFPE+oI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jcYbREwNWtR4f8xom/1BTiIli/M0CeApUqsPvps1qQe9jFmHqveI9IiBaW4xmGCbtlh0Azff28+j03tafwhfnIGwpJHK0Q+eoGVyGolqKLaeXXaKmWshHRPIEx46NF9zaABPrf7LEwmYdIeKXqlhKyfRfL2f/ulzBSJQY6NcQjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dymmRios; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dymmRios"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6eb93ec8804so992178a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713373470; x=1713978270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=226GLZN1bkJOaHrZzvZZO9lFdGIX7oNyj3T9o9yriN4=;
        b=dymmRiosrADos+O+YCF+ZmzK0O1R60c2NICiyIfFaUrGDHSM0L7M1TWHJ/VcSot9+/
         volKToFW99y3MwY8oH6fr9GuUl3wk5C/P/qotiN/QrSMKmHAmWuQFCs18mw06P/HDyE5
         ZSf4PNXPlA5VD+2RmIhvO/FsgHAwfJM8yCbamEg7uwcM/RmY3Oxve9Y4tcl9+omRTQ+Y
         ni6+PqZLjNa4b2np/7yMJ4Q6u1aw3wuUcmNI5UFNSbnozMLlvQR61GGMWBH2XIRRm6Tw
         JpVBNSWKP37fObGE6vNFLhw7bUtt+ET2/wIcjMGvSH6xZ/+cSwXmzkpqkDD6Mn8EtEnT
         k3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713373470; x=1713978270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=226GLZN1bkJOaHrZzvZZO9lFdGIX7oNyj3T9o9yriN4=;
        b=nQvaOXD85f8362ZrhPcbhS13gToHwuIL1KPi5zgye9wEJ0S1o/hg5qHqafIXlQu2V0
         WtabC2xH6iuQvMZnoFOoLt/n7m9IwI8dJy8dozp8SDKPyDWvuovZfMml3BzBtzqkvuzd
         gb2V/BECwJwQgcjBF3vLxIosc7FLDtSXlBPZgexoy8qX2KZw2WWBMbIbwfZoqDgU0tZk
         /svqK5/Vk27ts9gsZnhuJrwQoJ+olDZXzDHunRmnvI3BpVki4dHgFtDKdvWzU+XqGMOx
         dU5ZJf7G4W9vVgDwn5EThIgDWaXlvBEa95HOAfcu7FrfiiPrmHCpdqI4HYfKpe8xGQJV
         Mhuw==
X-Gm-Message-State: AOJu0YyaFPh/3gGTS6GI+aHgr3SZ2is4mBCIq5TAbvWZB70bumy0JQ7G
	/kmFi+ROKKOo4R/mu5PGsp9yQQwSuyv8/KUwXClg7F8tuB4WiEkVR3PL2g==
X-Google-Smtp-Source: AGHT+IGJK2+91vrxlDBl/jROR8Z3vUqIrSc4m5vZDraYX2jSk17Wgxeb08jSE8DG6QAUa4CxZQYN7A==
X-Received: by 2002:a05:6830:4794:b0:6eb:7730:7f1d with SMTP id df20-20020a056830479400b006eb77307f1dmr37887otb.22.1713373469865;
        Wed, 17 Apr 2024 10:04:29 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id k20-20020a056830151400b006eb77e42ff5sm1721615otp.26.2024.04.17.10.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 10:04:29 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] clk: sunxi-ng: h616: Add clock/reset for GPADC
Date: Wed, 17 Apr 2024 12:04:21 -0500
Message-Id: <20240417170423.20640-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417170423.20640-1-macroalpha82@gmail.com>
References: <20240417170423.20640-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the GPADC required clock and reset which is used for the onboard
GPADC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 5 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 21e918582aa5..3646be2b88ab 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -489,6 +489,8 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(ts_clk, "ts", ts_parents, 0x9b0,
 
 static SUNXI_CCU_GATE(bus_ts_clk, "bus-ts", "ahb3", 0x9bc, BIT(0), 0);
 
+static SUNXI_CCU_GATE(bus_gpadc_clk, "bus-gpadc", "apb1", 0x9ec, BIT(0), 0);
+
 static SUNXI_CCU_GATE(bus_ths_clk, "bus-ths", "apb1", 0x9fc, BIT(0), 0);
 
 static const char * const audio_parents[] = { "pll-audio-1x", "pll-audio-2x",
@@ -807,6 +809,7 @@ static struct ccu_common *sun50i_h616_ccu_clks[] = {
 	&bus_emac1_clk.common,
 	&ts_clk.common,
 	&bus_ts_clk.common,
+	&bus_gpadc_clk.common,
 	&bus_ths_clk.common,
 	&spdif_clk.common,
 	&bus_spdif_clk.common,
@@ -940,6 +943,7 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks = {
 		[CLK_BUS_EMAC1]		= &bus_emac1_clk.common.hw,
 		[CLK_TS]		= &ts_clk.common.hw,
 		[CLK_BUS_TS]		= &bus_ts_clk.common.hw,
+		[CLK_BUS_GPADC]		= &bus_gpadc_clk.common.hw,
 		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
 		[CLK_SPDIF]		= &spdif_clk.common.hw,
 		[CLK_BUS_SPDIF]		= &bus_spdif_clk.common.hw,
@@ -1021,6 +1025,7 @@ static struct ccu_reset_map sun50i_h616_ccu_resets[] = {
 	[RST_BUS_EMAC0]		= { 0x97c, BIT(16) },
 	[RST_BUS_EMAC1]		= { 0x97c, BIT(17) },
 	[RST_BUS_TS]		= { 0x9bc, BIT(16) },
+	[RST_BUS_GPADC]		= { 0x9ec, BIT(16) },
 	[RST_BUS_THS]		= { 0x9fc, BIT(16) },
 	[RST_BUS_SPDIF]		= { 0xa2c, BIT(16) },
 	[RST_BUS_DMIC]		= { 0xa4c, BIT(16) },
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index fdd2f4d5103f..a75803b49f6a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -51,6 +51,6 @@
 
 #define CLK_BUS_DRAM		56
 
-#define CLK_NUMBER		(CLK_PLL_SYSTEM_32K + 1)
+#define CLK_NUMBER		(CLK_BUS_GPADC + 1)
 
 #endif /* _CCU_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6f8f01e67628..ebb146ab7f8c 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -112,5 +112,6 @@
 #define CLK_HDCP		126
 #define CLK_BUS_HDCP		127
 #define CLK_PLL_SYSTEM_32K	128
+#define CLK_BUS_GPADC		129
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index 1bd8bb0a11be..ed177c04afdd 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -66,5 +66,6 @@
 #define RST_BUS_TVE0		57
 #define RST_BUS_HDCP		58
 #define RST_BUS_KEYADC		59
+#define RST_BUS_GPADC		60
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.34.1

