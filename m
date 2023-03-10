Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257888820
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Mar 2023 14:48:19 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17683b570b8so6019988fac.13
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Mar 2023 06:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jcxqo0ngoDPG8sfx3l2EfDlYPoRMEx1f3UACnu8WIP0=;
        b=qz8brRv6/89A41zEHV5e5OW8AveU53okmqmfAzBhEPsuQlfCS2OH6CU7TujlH9MHFq
         cLSwH7pxp1lyqRGW5nfE0A9oAJZp3x8YU5sAR2KIIzHlDjenvcKfAHqVnAon3yHzPCNo
         m5oUsaIQosgS0qWO+5DaVRtsMjDDiTcGIa0plGxjdEm2huj4HuiZPaJI5BIiOkZb8YjX
         CYtwgYcytr3TDXu/XGza7MATsp6EbgakLl324b67KzGcbnqTUY8xBHDI7pSJsVseVAQC
         NnuTAG+O9cxgSwEI0uHmkaXa6nwIaQpfiqRcEfJ1qyu8KweYliVnpkV24Hr99/peq5k8
         Yo2A==
X-Gm-Message-State: AO0yUKWo6X98xr1rkhxmlwrMtYNd96f9/5faU/8PIMLeMh4BHUBWpUV3
	jEvKAWl6DOpiPk6B5DbI6Q==
X-Google-Smtp-Source: AK7set+/NJfKhDjq/US9Zgnj2vnj5ULRkdXtv1anFiXdX/PaEZpHr9aZmeUXkDHFpmVGgwO/W+nGBw==
X-Received: by 2002:a05:6870:20e:b0:172:3a2f:c5ec with SMTP id j14-20020a056870020e00b001723a2fc5ecmr15852389oad.2.1678459698281;
        Fri, 10 Mar 2023 06:48:18 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zq48-20020a0568718eb000b00172473f9fe0sm118665oab.13.2023.03.10.06.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:17 -0800 (PST)
Received: (nullmailer pid 1545259 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:24 -0000
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: sunxi: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:24 -0600
Message-Id: <20230310144724.1545223-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index d90e4a264b6f..1734da357ca2 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -82,7 +82,7 @@ static int sunxi_mbus_notifier(struct notifier_block *nb,
 	 * Older DTs or SoCs who are not clearly understood need to set
 	 * that DMA offset though.
 	 */
-	if (of_find_property(dev->of_node, "interconnects", NULL))
+	if (of_property_present(dev->of_node, "interconnects"))
 		return NOTIFY_DONE;
 
 	ret = dma_direct_set_offset(dev, PHYS_OFFSET, 0, SZ_4G);
-- 
2.39.2

