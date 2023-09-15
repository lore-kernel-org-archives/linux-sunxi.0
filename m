Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F06AD7
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Sep 2023 09:21:30 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso30212101fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Sep 2023 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769689; x=1695374489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuZx/GEW25gG646YvVI9ekfBTZl9JZLAF7Xs48rC/qQ=;
        b=nvqHe6jn6hGyQ42gnHxa4Kep46xP1NS3IfcWk8+8ssKVTGOmNLqdxJSvNtahvO3awH
         ESbCZSxFiTOr+PQAlKrxhNGrpOTiTQL8tWCz4Be1ddkWld40ng2va2aaBkR7pr9muaeB
         wGuWEC6Ba+CcHqGSJ3ylSc0B8AAPDIaFFmYV+V/hc2kI0PCehvLDrwSlOR5yUDMJa38Z
         Ppx+Dw0o0OSuWC5o0rLEmD4cbFDj/F25WcKnopl4IE+z1zLw6cjJc65ss8JPQq4BBa0E
         m/ELJ4Fc36OkZFRUGvVMPSXC2yw24WWN4n4B3KZ3FI/r4Af8Gj3WsOjEMlO5RkGQtHi2
         zVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769689; x=1695374489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuZx/GEW25gG646YvVI9ekfBTZl9JZLAF7Xs48rC/qQ=;
        b=GZmQfJRrt8nJjNtroEoJhdk75hgs41vyvdh+nvnqClp4OsZz7JU2G+rzLXGxGZwwXd
         KKNkLmuNjUZBXgDmqQ0J2Fwq3J4pFm9aOgSmZ62uyhcxYcL80BZQVQXvSo8bTVYbaA1R
         KJ8mRzrWBIuowyCREp/nVeTmHnhsPzIP4fJQtPXOh2YmRJ9DWLpgv91ClYXb8CIiWWXU
         d8yTzO89ABLx91GDZaAQ6N69G/HEeO73Ir/ilr2hnTyh9Dz4wEQB/Q6ItYIMu/TxrKt6
         XF/DuW+nwTR00MezirlNvkesjLAKi3qKCFPtlU+uZatObmh03gJQ73i+SldEiJd9K8dc
         GREA==
X-Gm-Message-State: AOJu0Yxs1Pbn44j6AHCAziUnmATHXWmh0HNGA0ZNwj8Q1VR3MbvMoq3V
	71ZO/VeQhH98eE/9BrLcz8M+EA==
X-Google-Smtp-Source: AGHT+IEVb+rybmAw/IHW2BTXH8tfpMjLEmySPO9nsUGKFLlub7WqeGnWblxKCQk1yld1rt/N2pe2jA==
X-Received: by 2002:a2e:93c2:0:b0:2bc:da4a:4649 with SMTP id p2-20020a2e93c2000000b002bcda4a4649mr1078194ljh.22.1694769689024;
        Fri, 15 Sep 2023 02:21:29 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e7408000000b002b9ec22d9fasm639376ljc.29.2023.09.15.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:21:28 -0700 (PDT)
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
Subject: [PATCH v2 14/17] pmdomain: sunxi: Move Kconfig option to the pmdomain subsystem
Date: Fri, 15 Sep 2023 11:20:00 +0200
Message-Id: <20230915092003.658361-15-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915092003.658361-1-ulf.hansson@linaro.org>
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
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
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig       |  1 +
 drivers/pmdomain/sunxi/Kconfig | 10 ++++++++++
 drivers/soc/sunxi/Kconfig      |  9 ---------
 3 files changed, 11 insertions(+), 9 deletions(-)
 create mode 100644 drivers/pmdomain/sunxi/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 2286c36076db..10c3bc2e2444 100644
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

