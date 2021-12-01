Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853A168
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 18:21:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso456228wml.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Dec 2021 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oj33o1gGh0gN+CnURlKi1LWyJrpHKuLFBRHdEYnjbPA=;
        b=QM285lZA63Qd8dB3mPUlj+MLgBFaPa6KFAVyVLqCMhzrBFI03xniB+8BYEm2pcTRit
         UJHwj8wm/T3oe0EOFOAaY2OLHqhCuJ6anzMJj1lOJmqS+nYJYGFj8oGZsbeXpgnk4UDE
         2xNOlXtbdeILjJF/3I71fZtk//fuZVKtzvvJ0ltBSitJ46Aza9473HlhIHQoR1IUNskk
         XNRbXmvO7cnWW7KGige+w8+z0deNG8f8DfiQ7duF9s7MUqPB7BlQFekZ4Ck6aVrMYi0j
         gJLKa5nFQQ9LRuxIkRq8XoVDf4tmSNFipdwcryllz4dU6tygO87QOalzWJE29uJJyhvT
         G8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oj33o1gGh0gN+CnURlKi1LWyJrpHKuLFBRHdEYnjbPA=;
        b=ZjRf6cp0bDk9kKadJ13aOzbtO7khAouhJzonp8wrzIzX6X4BLvCos0+m7yDBealew7
         do3cXUX8S2fs8r1p1ipn31tAbE2P0XoZfCgf/McT8GPTjBSdhxLWU776eRR/ftPTk4g8
         UcoLyuGljRV4Pqc77ZTri35V1eBDy5p67AZGXVflCSgXd3HSwTvyQCc5HIdx5b97aawA
         J5kmtgOwKqDECCvVbiCPKfxyXl2i1MI7raCJBEhRC4O4t5UEZtug6ZskXwIDvOShhdvm
         1TyXtpwnfGkjxMTH+vrQ2tajSFyt7SpidygOQc6ATOH9RIX0N5K3B0Jm14qx5jXVGqGS
         sQkg==
X-Gm-Message-State: AOAM5325cZ2HYkr0w1eSEbhZ+oGpcSb02IFclfVtv0qvA09mKTW3FX/1
	2hgDK5x1V87JImY8xhsz0xk=
X-Google-Smtp-Source: ABdhPJzjXWpq/AyOz0Xy0C56UpP7dIFAZxQco8yWsp5qtgDwdNwytWnyUS8pU8DaUKx/FxEAx9Dh9w==
X-Received: by 2002:a05:600c:294c:: with SMTP id n12mr9009559wmd.71.1638382903766;
        Wed, 01 Dec 2021 10:21:43 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f7sm604705wri.74.2021.12.01.10.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:21:43 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/5] arm64: dts: allwinner: h6: Add Tanix TX6 mini dts
Date: Wed,  1 Dec 2021 19:21:16 +0100
Message-Id: <20211201182118.1213806-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
References: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 mini is less capable version of Tanix TX6 although it comes
with some features not present on Tanix TX6.

Basic specs:
- H6 SoC
- 2 GiB DDR3 RAM
- HDMI
- SPDIF
- 2x USB
- analogue audio
- CVBS
- SD card
- IR remote
- LED display
- fast ethernet
- XR819 wifi
- 16 GiB eMMC

Currently supported features doesn't differ that much from Tanix TX6,
but that will change soon.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile            |  1 +
 .../dts/allwinner/sun50i-h6-tanix-tx6-mini.dts    | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index a96d9d2d8dd8..8fa5c060a4fe 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -37,3 +37,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts
new file mode 100644
index 000000000000..08d84160d88f
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2021 Jernej Skrabec <jernej.skrabec@gmail.com>
+
+/dts-v1/;
+
+#include "sun50i-h6-tanix.dtsi"
+
+/ {
+	model = "Tanix TX6 mini";
+	compatible = "oranth,tanix-tx6-mini", "allwinner,sun50i-h6";
+};
+
+&r_ir {
+	linux,rc-map-name = "rc-tanix-tx3mini";
+};
-- 
2.34.1

