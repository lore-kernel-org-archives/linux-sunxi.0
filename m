Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D68E208A9
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Sep 2023 11:19:16 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-502d9ce31cbso1372450e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Sep 2023 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694690355; x=1695295155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kiVpD+HqGq1+e/c8vvIDGsaa2qWD6QDzovb4cVyxMw=;
        b=lld/t+qxAonG3vGBF/V5jJX+R3cnQsMoaIAWsim9IeDOQWIdW7HhQXA0M5i35f3I6b
         q6zyVtdICoiqM00RfzkQPgB5sBNacroGAzhNWNvRQYtTRAJrTl+ZuNJx8Ls5Zfd/IJtz
         ZmAdXHLMbMjFcFn3F1l3q6lHRyK6VqgiU9lp5HZiu1QAOV0Yg2bf5VdN6923CUxj0YsI
         q9EW176hSk07E7gqlFcu9N1AkSfSVbzyugd1xsHR9hePVrlO71beiJ8rUafx6nLNaUAg
         nAhX52XHNDzke4a12mKNKxghnYCqGpI5VzSL45MOLIM+jNZ8qDS8oFRgL/q7XmUOpKI2
         5EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690355; x=1695295155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kiVpD+HqGq1+e/c8vvIDGsaa2qWD6QDzovb4cVyxMw=;
        b=Gy9dEyF4q5WXREN5E547MGVqjeILBBWRHA9PImUKLObkw62ck1rWdLrwwbimyArAM8
         aZCweKUHudY+3tVN+8zoZaHfouWoJI9uchTN9TUf/w7+y5eBime5JDM2fGyzPFj1lwY4
         jeCzpcAM8vPJsm+6CVNNy7AB2X+pQYsqsKjk/I/mI1UEo8pXDKwmunFwbMHv6zv67xSP
         DUuxvoMhl8F/jWO+K8y4CL7FnqPwKcPy5r9kdgujVwWAOGeUt5AXmL4R1vCt7Opb3qOG
         finyGSHHkRSy+oSiYE2YrYTsdvihPP5+QCdrcAtgdMbD0hYRPW7U5MWK3CzrEnfg4ewH
         MnMA==
X-Gm-Message-State: AOJu0YzEMDv3EVV6cyU5+sFkmqpjOd60bi1tE3RZneUH6zYtI4g+Jjey
	etGe6Lzyx6Y9/W9Nsc+aDJBEmQ==
X-Google-Smtp-Source: AGHT+IFqkXKsu67+BKk6H70B+cKDioBZ+IuAUNUhmOS/mLfep1SUOlJkgAmyyCuS8EBH4ZwvZ6equA==
X-Received: by 2002:a05:6512:3c93:b0:500:c3d1:4d60 with SMTP id h19-20020a0565123c9300b00500c3d14d60mr5381224lfv.24.1694690355165;
        Thu, 14 Sep 2023 04:19:15 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id c5-20020a197605000000b004edc72be17csm236671lff.2.2023.09.14.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:19:14 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 14/17] pmdomain: sunxi: Move Kconfig option to the pmdomain subsystem
Date: Thu, 14 Sep 2023 13:19:12 +0200
Message-Id: <20230914111912.586764-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig option belongs closer to the corresponding implementation,
hence let's move it from the soc subsystem to the pmdomain subsystem.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: <linux-sunxi@lists.linux.dev>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig       |  1 +
 drivers/pmdomain/sunxi/Kconfig | 10 ++++++++++
 drivers/soc/sunxi/Kconfig      |  9 ---------
 3 files changed, 11 insertions(+), 9 deletions(-)
 create mode 100644 drivers/pmdomain/sunxi/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 67049ebf7265..39f358f27f2e 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -13,5 +13,6 @@ source "drivers/pmdomain/rockchip/Kconfig"
 source "drivers/pmdomain/samsung/Kconfig"
 source "drivers/pmdomain/st/Kconfig"
 source "drivers/pmdomain/starfive/Kconfig"
+source "drivers/pmdomain/sunxi/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kconfig
new file mode 100644
index 000000000000..17781bf8d86d
--- /dev/null
+++ b/drivers/pmdomain/sunxi/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SUN20I_PPU
+	bool "Allwinner D1 PPU power domain driver"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Say y to enable the PPU power domain driver. This saves power
+	  when certain peripherals, such as the video engine, are idle.
diff --git a/drivers/soc/sunxi/Kconfig b/drivers/soc/sunxi/Kconfig
index c5070914fc6a..8aecbc9b1976 100644
--- a/drivers/soc/sunxi/Kconfig
+++ b/drivers/soc/sunxi/Kconfig
@@ -19,12 +19,3 @@ config SUNXI_SRAM
 	  Say y here to enable the SRAM controller support. This
 	  device is responsible on mapping the SRAM in the sunXi SoCs
 	  whether to the CPU/DMA, or to the devices.
-
-config SUN20I_PPU
-	bool "Allwinner D1 PPU power domain driver"
-	depends on ARCH_SUNXI || COMPILE_TEST
-	depends on PM
-	select PM_GENERIC_DOMAINS
-	help
-	  Say y to enable the PPU power domain driver. This saves power
-	  when certain peripherals, such as the video engine, are idle.
-- 
2.34.1

