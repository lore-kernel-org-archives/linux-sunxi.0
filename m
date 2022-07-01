Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA271871
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 13:27:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id n185so1303263wmn.4
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Jul 2022 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vElcCtw04QzuAH22LcbLyJ8OXVl5mqZvOzdsJCSKnNs=;
        b=SV30SZRPWDjribOlXEJdd/yg3juNcqboVOE6JCXCYDcrNei6x23hGFFoTjLeyG5w7s
         8oWs+rkoN0jpkAG4owViglzYHdY/zoC59LuweSuaQMU2oES6Las75LQWod71360VGQsQ
         fxqF643w/vVY4wq3myXS+WkUSXtZVMLQrFyYzdUD020PR2lwg4J/PIIorUhbPHjLyKXl
         eWVvO6aIheXIFXR7rptanl2FwKYc2LwRJXbKOgGiGarJkmhPSIpXFuqrjll593pSlad6
         njT/YBsVcJ///r28v3LoGpgwQSDPxp1VzpKJzu+OD9htbnF4+kaQ3t6G/3lIkRRyuduV
         n4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vElcCtw04QzuAH22LcbLyJ8OXVl5mqZvOzdsJCSKnNs=;
        b=68dlJ+z7DyCLNfMfg4nGt+x7kWevoP51JgdaypJ+SuLm3CM43QAodiwEk73lQIOOiE
         prSc/1VoI1oOS2pESGwXH/qqEeR60afurVA0JIxBJW1WkXuuwfYkL9GPm1nzxnV2bs4L
         2uPYPq5eWaeu2o8RJnwfPiHO+dZDo05W/1LwT4PUtPSfnayPpqDjMv/5t2RCSni62mcX
         H1/orBsbJONxTapdJtayTaQ9DT/k7maA7UvhHAkFZ4mzXbNwQYIYjx50xoFt9EczZR2e
         0pAjQ+c3ds7oZGiRSQ17uqUeFCejXDfDEqcfcCLdRBpMCRIoz982g3aLrzprl1uhqDDe
         XM9Q==
X-Gm-Message-State: AJIora9dJIpEerSBAloeK1mHwUYvHoZaBdWdsvHKbAF+9sDC6nzkfRbF
	jNfNAIJOoJloji3uj3Jbeh8yTA==
X-Google-Smtp-Source: AGRyM1sWqkqw8VCKFu9qbSXKAUEUl2mZp5uKcKNoVZAyGcrDq9btYZgn0zHEhiuQOLpImL9tx3r5+w==
X-Received: by 2002:a1c:f20b:0:b0:39e:f4b9:24e3 with SMTP id s11-20020a1cf20b000000b0039ef4b924e3mr16541364wmc.51.1656682066956;
        Fri, 01 Jul 2022 06:27:46 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h13-20020adff4cd000000b002103aebe8absm22354337wrp.93.2022.07.01.06.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 06:27:46 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	hch@lst.de,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [RFC PATCH] crypto: flush poison data
Date: Fri,  1 Jul 2022 13:27:35 +0000
Message-Id: <20220701132735.1594822-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On my Allwinner D1 nezha, the sun8i-ce fail self-tests due to:
alg: skcipher: cbc-des3-sun8i-ce encryption overran dst buffer on test vector 0

In fact the buffer is not overran by device but by the dma_map_single() operation.

To prevent any corruption of the poisoned data, simply flush them before
giving the buffer to the tested driver.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---

Hello

I put this patch as RFC, since this behavour happen only on non yet merged RISCV code.
(Mostly riscv: implement Zicbom-based CMO instructions + the t-head variant)

Regards

 crypto/testmgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index c59bd9e07978..187163e2e593 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -19,6 +19,7 @@
 #include <crypto/aead.h>
 #include <crypto/hash.h>
 #include <crypto/skcipher.h>
+#include <linux/cacheflush.h>
 #include <linux/err.h>
 #include <linux/fips.h>
 #include <linux/module.h>
@@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
 static inline void testmgr_poison(void *addr, size_t len)
 {
 	memset(addr, TESTMGR_POISON_BYTE, len);
+	/* Be sure data is written to prevent corruption from some DMA sync */
+	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
 }
 
 /* Is the memory region still fully poisoned? */
-- 
2.35.1

