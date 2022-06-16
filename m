Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0866AA6
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 21:33:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g7so3877503eda.3
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laSJoDIgvQBCTId5pVKj53fMxGvIURwK5+ffKs0ASlY=;
        b=UBd17f/1SnZchYlExkTEs7FEuYTDz5ujzCzXm/SGFxfc7vQJ4lD7bhjBqiIPj2yGEY
         OwWwEycnPAU139vVsRVxUyNnf6H75fg5PESXPcSy4hSPmAVLjAgzMN7gutw+N7PP/V/n
         4Xha3koafKzw6BNAP+dZFpiWU3OKxLzLTXz5t7r/ZXiv/OgndLmncmtxxVKo22qgcomS
         nTxiiFAiPY6wxRbda4CwsKu1nSWydVfLTtRpNEv6aAzv+AsbfvhPMIOeOhCoOLZPP9Ws
         w+cmzNI/W2M1sMrVY8ka2YLMDqLl5axbTOql/Vt16eIKZ39AGlUcV6dPfCwO1RUQQdn0
         B45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laSJoDIgvQBCTId5pVKj53fMxGvIURwK5+ffKs0ASlY=;
        b=MNtslsvXFjpHRknGmEfvrx7hKXmOuVUOU44bqU75XoQJ9HAeks/CZNCaBsLTdiHOgo
         /VecmhO1f2o0unMVddCDcgwGb1fqIb3QI9x17fUIiV9EimY0ZhdIT+iAguo6bSt5lPvC
         NFgCQDPqHgh7eMZAKaIOM/EqHuFRDiEwJ3ok3FEj5I1FmmWLNuaGzd8+swlGRflfASH8
         AYfu4Fs1+wlouk2eTU+t/R4oJ9nKM388SoulsPUMZ1Z7EOGnwbSo8CEoK2tbCkfuaV3J
         XvUbRmi1DXrlntsQP7lOPQ+xKW11eNDjWydFCI7BIoS5kT8XhsZKWYR1AJB77u8Wc3pO
         FHIg==
X-Gm-Message-State: AJIora/n9NP/3E1jyAyv7kzE0IQKKIEVpVlmuuuLhl2zMUzRqoVwoUm6
	JhG/8TQxq6sDkS3msbBz+OY=
X-Google-Smtp-Source: AGRyM1smWRQNfSGi+fNS3fxjPTkk1JtE/FL1CrltkwNtsatE8j54xbfVNS+Jv1BDstvw0sEj54qO3A==
X-Received: by 2002:aa7:c857:0:b0:433:5c62:ddbc with SMTP id g23-20020aa7c857000000b004335c62ddbcmr8865690edt.218.1655415189047;
        Thu, 16 Jun 2022 14:33:09 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906304500b0070f7d1c5a18sm1241230ejd.55.2022.06.16.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 14:33:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@linux.ie,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: Add DMA mask and segment size
Date: Thu, 16 Jun 2022 23:32:40 +0200
Message-Id: <20220616213240.392041-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel occasionally complains that there is mismatch in segment size
when trying to render HW decoded videos and rendering them directly with
sun4i DRM driver.

Fix that by setting DMA mask and segment size.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 275f7e4a03ae..83f4e87f77f6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/dma-mapping.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
@@ -367,6 +368,9 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 
 	INIT_KFIFO(list.fifo);
 
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	for (i = 0;; i++) {
 		struct device_node *pipeline = of_parse_phandle(np,
 								"allwinner,pipelines",
-- 
2.36.1

