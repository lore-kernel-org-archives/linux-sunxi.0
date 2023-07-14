Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98815AC4
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jul 2023 17:52:21 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-345d3c10bdfso9639255ab.2
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Jul 2023 10:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357140; x=1691949140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QClPpmwO/HygdGxUVkymGnsqhcX8BPsEQP+ZwgNTHR4=;
        b=SdOXqKCpZWEFEtKppMJU9UFn98MNqD5egTPA6QIsqQx/cPY0wBVzFmeEwpdReNk04n
         Bee4zj3rzR4NlzZqLoE3Wo8bo+fNUJAw1N7NcF/Ay3y92iLqrviUo4hoNRIMkoKGqPGQ
         RFwJz1plNgXgnVXd4o+OLa8+fQpBGAa46fz5P7TAJ7Fi9+8ZQbPzLnt5M3cZ8U/i7KmM
         k6T5iTJSMf+zafL+N/pC9EEkbqAyyV3pDEEqXsGX13LoX0QkynlAlhStNUmsE8F/PLIw
         G+D5LxsCxJR1mas6qPhMnhO8OKPGlF6RMn7UcVFrEPh2CTRpDutRnvE/rEXY+kuisNpK
         cpug==
X-Gm-Message-State: ABy/qLbE/qBnZuMZ7HP0Qu1EvIsWlYuLBlsAxRGgecKC5YnplEdYksLs
	yciPs/DN8oQj76YGIwO7EmerpaklaFZw
X-Google-Smtp-Source: APBJJlEvmL5NlRfRa0C6Y6D6PT9e8Y80cl3usL+VRWP5Up+KiFH8kjMIsYgswwlSCtRa44TIyZTbIQ==
X-Received: by 2002:a05:6e02:80c:b0:340:79ff:c1b6 with SMTP id u12-20020a056e02080c00b0034079ffc1b6mr5166464ilm.4.1689357140597;
        Fri, 14 Jul 2023 10:52:20 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m22-20020a02c896000000b0042b56b57a50sm2614585jao.171.2023.07.14.10.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:52:19 -0700 (PDT)
Received: (nullmailer pid 4068370 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:54 -0000
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: sunxi: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:51 -0600
Message-Id: <20230714175152.4068286-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soc/sunxi/sun20i-ppu.c | 2 +-
 drivers/soc/sunxi/sunxi_sram.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/sunxi/sun20i-ppu.c b/drivers/soc/sunxi/sun20i-ppu.c
index 98cb41d36560..8700f9dd5f75 100644
--- a/drivers/soc/sunxi/sun20i-ppu.c
+++ b/drivers/soc/sunxi/sun20i-ppu.c
@@ -5,7 +5,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/reset.h>
diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 4c4864cd2342..4458b2e0562b 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-- 
2.40.1

