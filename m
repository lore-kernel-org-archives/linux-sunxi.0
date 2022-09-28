Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3634C7A
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Sep 2022 20:01:39 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id lc7so29454714ejb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Sep 2022 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FQdphxTZ66QYAOnofKNGBcQ+Caq9QNc6A+A5EnAfs9Y=;
        b=SM+pQmHMUu1Vdwr3vzMUhNyVQ9jB8MnLgDbQ/hRsO7FdT4yxGbemcSVjmdYT2u/ZGE
         lNbO88owrJ2OnaThIlKlUxYJfAU9fA64pGyCEKoM288TgzJeWwHqEMedl2T6EncQ2S/m
         7v/kFCOJrN6Guw4DRF3G26IaXbA5dae8ufGFE01fGWOZqnxDgmfQ3Xkt/CKpcyokB5WK
         zjRoMku6hV9fYptQD318/1iiKewLG4MK8yDAmwNIU2Pxu/Q4k5GwHCUpOGv9eVc6cJXZ
         k5koN4qVNzWhiYUI4vAHYxpyAUFNdYqxOly19A7ygtdhUeeAKLnXVM4qr+Dg0C5Wtg9W
         1XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FQdphxTZ66QYAOnofKNGBcQ+Caq9QNc6A+A5EnAfs9Y=;
        b=BqXqg4KZ8BuBnBOqGmiZfQzjvZg2PcQbDu2drBGqb4x/FV1PeKQlrJPQ0DnDqBc6u7
         St6AiWIZ64esfLs97X4dlmhPHbf+50e2jl4dzgN/9NQmsNL+y2pCYa3QckMoiEo4jOHK
         j4FfoINcaL/jsB4mb7VLVSYmgXgW83HUzGK1PRey9zJpxjuLk4TNHNIBgGqU4I4t2qaF
         pU96M4x5uKnMYKt38NZhzp4usFyUDGeduZb82qNs5Y4nEQtcBR/X5EmuYqRDHq1i38d0
         eIPHfevAYX9xvv0WfYJtWjTP86hl/9x1JpDd9WtyU5TKzHk/awf7lH0qyOqZSBOlnH7X
         442A==
X-Gm-Message-State: ACrzQf12eUADp7nXy10fQlpqJnoGlXOpWA5KzfjISFchGH0Rla/FL0gH
	jO1MjlkEdO6VnZ4zhWKKUTk=
X-Google-Smtp-Source: AMsMyM7/ltV50qoXxcf2RzeCPuJDZ5lLR05PmqL0JITzHOT79EBbmXSaWJFFFNsWKyP31DkaBFZ7Eg==
X-Received: by 2002:a17:907:74e:b0:74f:83d4:cf58 with SMTP id xc14-20020a170907074e00b0074f83d4cf58mr29389544ejb.178.1664395297439;
        Wed, 28 Sep 2022 13:01:37 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id n25-20020a05640204d900b00457cdb5cf76sm3015769edw.50.2022.09.28.13.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 13:01:36 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	r.stratiienko@gmail.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Fix default PLL GPU rate
Date: Wed, 28 Sep 2022 22:01:22 +0200
Message-Id: <20220928200122.3963509-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 4167ac8a657e ("clk: sunxi-ng: sun50i: h6: Modify GPU clock
configuration to support DFS") divider M0 was forced to be 1 in order to
support DFS. However, that left N as it is, at high value of 36. On
boards without devfreq enabled (all of them in kernel 6.0), this
effectively sets GPU frequency to 864 MHz. This is about 100 MHz above
maximum supported frequency.

In order to fix this, let's set N to 18 (register value 17). That way
default frequency of 432 MHz is preserved.

Fixes: 4167ac8a657e ("clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 30056da3e0af..42568c616181 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -1191,9 +1191,13 @@ static int sun50i_h6_ccu_probe(struct platform_device *pdev)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-	/* Force PLL_GPU output divider bits to 0 */
+	/*
+	 * Force PLL_GPU output divider bits to 0 and adjust
+	 * multiplier to sensible default value of 432 MHz.
+	 */
 	val = readl(reg + SUN50I_H6_PLL_GPU_REG);
-	val &= ~BIT(0);
+	val &= ~(GENMASK(15, 8) | BIT(0));
+	val |= 17 << 8;
 	writel(val, reg + SUN50I_H6_PLL_GPU_REG);
 
 	/* Force GPU_CLK divider bits to 0 */
-- 
2.37.3

