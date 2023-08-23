Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A9883A
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 08:52:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ff09632194so7671230e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692780720; x=1693385520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7D2ouUhW30X6Tc9yQKY+DadfBMJeG3kxkyZx2pcZ+Fg=;
        b=sIlOYGc/ZmKfI2RhksznWNTLXphb9ZU1vnoGgw+9kpuBCsrs+KwtG7j1eVs/ryvpFg
         H6A5+1YRebYkjaA/UW6C/PPIEOXNlTcKpC4p/NtVg2r9wYMBZ7779wtWiJdrXcLFnBeH
         ZvFiQGuTARPQxbHziGh6JDOqd2xUP5ZP6CSrKgP2Qvnvtu80JtBgCbUtcK0ioi9KhuA3
         v6M+J92F0Soe/DfWS1BPm5YHlvQU4XCki6xXIrDZWoKBclI3KR8pA3JghKqS4dxvcnWQ
         n2BiuDHFkUqLAumUTHqf4U/rkl6E7dXFXirxUnz2FA61IF+LiiWNLw6bIrwwumB0Folp
         06Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692780720; x=1693385520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D2ouUhW30X6Tc9yQKY+DadfBMJeG3kxkyZx2pcZ+Fg=;
        b=HqO2mgHQgOI5MccVFG8xdiyMhoEPd6YmjfjKRJQxh/UnVZ0ceRRriGmKfD5hsHjPLn
         a/DKyk6BjLfM49kYVQYLVuofxCsp+iiNel/EOLmb3CG1eDWe0OqlIHfeNuFX4X/nDXBL
         PoQMwqgNaAngYG7DOOZOFK2+/ZG9PBhk+MrlzQ7Wm0mwcH2rBY8XwKdwdMZ3Oz1r+kTL
         CqXrL6O8d53+GHW3uiYjLZpwujhaHW4Ki3HePuT0DO4xt0wu/rCaehTNgXen9/9140O3
         uqRz58fs4akhnTHRHE6So/Eo57S0n5pbjtBi7Jv6LrTopuB+/0A/DvkKQS6nTfPAayqR
         KE1A==
X-Gm-Message-State: AOJu0YzOxKlcAgBlxoxfnR/H82PHSX+aAlYjvofQZER12JEoIGjXn6SF
	VC6h796PoHgwKnJsWHg92h59kQ==
X-Google-Smtp-Source: AGHT+IF5ZWP6+GMqNyYtzuRMXVyZPxGrTYqGvfpxsUPFPsvr3clkivSzzEml7p4XyTWsj2zwc843FQ==
X-Received: by 2002:a19:385e:0:b0:4fd:d517:fbcd with SMTP id d30-20020a19385e000000b004fdd517fbcdmr6963552lfj.6.1692780720501;
        Wed, 23 Aug 2023 01:52:00 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id s19-20020aa7c553000000b0051bed21a635sm9090986edr.74.2023.08.23.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 01:52:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 10:51:45 +0200
Message-Id: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rebased on next-20230822, so might not apply cleanly.  What does not
apply, can be skipped and I will fix it after next RC.
---
 arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi                  | 2 +-
 arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts                   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts                   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts                   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi                 | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts              | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi                  | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts              | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi           | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
index 94e24b5926dd..8b3a75383816 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Arm Ltd.
 
 #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 804aa197a24f..c7181308ae6f 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Arm Ltd.
 
 #define SOC_PERIPHERAL_IRQ(nr) GIC_SPI nr
diff --git a/arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi b/arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi
index e9bc749488bb..a415c4a78a70 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Arm Ltd.
 /*
  * Common peripherals and configurations for MangoPi MQ-R boards.
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts
index 411aa72d344b..7d4ae113c381 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B105Pv2
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts
index d011127c635b..9c5938e16d99 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B105v2
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts
index ca840fa84052..01df7cffcef2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B125Pv2
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts
index 81e5a9cb8900..a015453daf10 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B125v2
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
index c861937b30f6..b71ee6b79208 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B155v2
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi
index 6e487ebf27a2..9f1655540cb9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B1x5Pv2
 // patient monitor series
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi
index f028b6a191df..590dcc0953cc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for General Electric B1x5v2
 // patient monitor series
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts
index 407ad8d43c84..77d7600b2675 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 or MIT)
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 //
 // Copyright (C) 2018 emtrion GmbH
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index 05fd8ff4da1e..8a637fdff073 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 //
 // Device Tree Source for i.MX6DL based congatec QMX6
 // System on Module
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts b/arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts
index 0f582a9d4c0e..02813368a820 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 or MIT)
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 //
 // Copyright (C) 2018 emtrion GmbH
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi
index c4e146f3341b..f1a41c76729c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 or MIT)
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 //
 // Copyright (C) 2018 emtrion GmbH
 //
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index ee2dd75cead6..a63e73adc1fc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 or MIT)
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 //
 // Copyright (C) 2018 emtrion GmbH
 //
diff --git a/arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts b/arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts
index 33b3f11d24bb..a19c488cf7c8 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 or MIT)
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 //
 // Copyright (c) 2021 emtrion GmbH
 // Author: Reinhold Müller <reinhold.mueller@emtrion.de>.
diff --git a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
index 009209ca673b..f928cfb80b87 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 or MIT)
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 //
 // Copyright (c) 2021 emtrion GmbH
 // Author: Reinhold Müller <reinhold.mueller@emtrion.de>.
-- 
2.34.1

