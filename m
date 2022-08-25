Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6363C00
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 16:20:58 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id q7so25217516lfu.5
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=mUYPXlQOQOnvqcx8ioEudx6RfnF80tz1ErnV2NXlaQM=;
        b=Hg1XpZK239x8hTzWIxSxRexEy3SARIHEM0X1EnWNHe8vyhowi+jFqQUJszg4JXQrgl
         FNtpnzTTs5IOT2IT2JmZ6IzOnPo2IewDc3OmJH8Sr0TQzMsMXRstlnG5ItgMQrK5IqWf
         xKRWU1iX09h4iCZW9MXnYXF/M4hCa8G0R+EEWBJcEdPWedGHEJor9KgceTMRg6YiS8cp
         qj8Cn5Hn9iwPPgCidk/xM7i5XBde+4wjzoCzD6WqFlDTTZUr5tj/KSzKRnzPt92OryoK
         K3uMUFsjl+fcmHngYgFvBuygJBaoNddUuFMOoECennDnmt7WtnJZH75X3iJ3Eer6UhJ5
         ZO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=mUYPXlQOQOnvqcx8ioEudx6RfnF80tz1ErnV2NXlaQM=;
        b=cubbZCRpX4brVuep8LMOKlRlGmfF4fke8dZ716IjhZTIbmaDEJN7FXT4MI+fvHM6AC
         iafMghpYtWcz/wRs/uuReKmOJPLZQ4MBVoy3j4qmXlJ+6T7FnjaoZ96wBGS0YUKwCb/E
         IdkZ+hmKspA0vtkcWdvr5kz+TrqTDKI9AlbK0pRCI+giSMZisqUTtGLgipePGNYik++s
         56q0hloc4elMLtTatVHduzDP/6GGi7Zcvg0Juf1dO6isIwIKWjacp2h8VX/NWg89K3OE
         lvt09Moo49YNEp6yhL+EDhtBLpbc81EDcVmKxO60ARCR7yW+ikOa9XX8iJRfsu4R/Wtb
         5soA==
X-Gm-Message-State: ACgBeo17Um0PkNSj5llQ6f3gJOnlvVLE7jr63ZDrBPgUW52LXpJCVKU/
	leVh8mCsDlPPT6mww5xTK5c=
X-Google-Smtp-Source: AA6agR4mSuqcHou86H5PRd3w0x0ClNJWnY0N8wkNiwNAgVrBHrlbFCRC5nVYCmBc/1azSWmunU60hw==
X-Received: by 2002:a05:6512:3e09:b0:492:f8e5:5eb5 with SMTP id i9-20020a0565123e0900b00492f8e55eb5mr1365521lfv.498.1661444457036;
        Thu, 25 Aug 2022 09:20:57 -0700 (PDT)
Received: from numbers.lan ([2001:2002:2f8:bfc5:2dd2:9869:8c01:77b2])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b00492df838a40sm556267lfo.280.2022.08.25.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:20:56 -0700 (PDT)
From: Stefan Hansson <newbie13xd@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-oxnas@groups.io,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org
Cc: Stefan Hansson <newbie13xd@gmail.com>
Subject: [RESEND PATCH] ARM: configs: replace CONFIG_NO_HZ=y with CONFIG_NO_HZ_IDLE=y
Date: Thu, 25 Aug 2022 18:20:35 +0200
Message-Id: <20220825162034.5901-1-newbie13xd@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to https://www.kernel.org/doc/html/latest/timers/no_hz.html,
CONFIG_NO_HZ=y should be replaced by CONFIG_NO_HZ_IDLE=y for newer
kernels, so let's reflect that in the 32-bit ARM defconfigs.

Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # Samsung
---
 arch/arm/configs/bcm2835_defconfig       | 2 +-
 arch/arm/configs/cm_x300_defconfig       | 2 +-
 arch/arm/configs/davinci_all_defconfig   | 2 +-
 arch/arm/configs/dove_defconfig          | 2 +-
 arch/arm/configs/exynos_defconfig        | 2 +-
 arch/arm/configs/ezx_defconfig           | 2 +-
 arch/arm/configs/hisi_defconfig          | 2 +-
 arch/arm/configs/imx_v4_v5_defconfig     | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig     | 2 +-
 arch/arm/configs/integrator_defconfig    | 2 +-
 arch/arm/configs/lpc32xx_defconfig       | 2 +-
 arch/arm/configs/magician_defconfig      | 2 +-
 arch/arm/configs/milbeaut_m10v_defconfig | 2 +-
 arch/arm/configs/moxart_defconfig        | 2 +-
 arch/arm/configs/multi_v5_defconfig      | 2 +-
 arch/arm/configs/multi_v7_defconfig      | 2 +-
 arch/arm/configs/mv78xx0_defconfig       | 2 +-
 arch/arm/configs/mvebu_v5_defconfig      | 2 +-
 arch/arm/configs/mxs_defconfig           | 2 +-
 arch/arm/configs/omap1_defconfig         | 2 +-
 arch/arm/configs/omap2plus_defconfig     | 2 +-
 arch/arm/configs/orion5x_defconfig       | 2 +-
 arch/arm/configs/oxnas_v6_defconfig      | 2 +-
 arch/arm/configs/pcm027_defconfig        | 2 +-
 arch/arm/configs/pxa168_defconfig        | 2 +-
 arch/arm/configs/pxa910_defconfig        | 2 +-
 arch/arm/configs/pxa_defconfig           | 2 +-
 arch/arm/configs/qcom_defconfig          | 2 +-
 arch/arm/configs/s5pv210_defconfig       | 2 +-
 arch/arm/configs/shmobile_defconfig      | 2 +-
 arch/arm/configs/sunxi_defconfig         | 2 +-
 arch/arm/configs/tegra_defconfig         | 2 +-
 arch/arm/configs/vt8500_v6_v7_defconfig  | 2 +-
 arch/arm/configs/xcep_defconfig          | 2 +-
 34 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index c4d2e2334b6e..a51babd178c2 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -1,6 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BSD_PROCESS_ACCT=y
diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index 31f41159bef2..95144e380b4b 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -1,7 +1,7 @@
 CONFIG_LOCALVERSION="-cm-x300"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=18
diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index fc71a03a9c8c..821d966c95a5 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -1,6 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index 16ed5c110e8d..233da1101aa0 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ce74f46e114..17a968e5d706 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_CGROUPS=y
diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index 1a41391d7367..d6cc84048622 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -1,7 +1,7 @@
 CONFIG_LOCALVERSION="-ezx200910312315"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 1db5356b1ccd..0376a65e8bc1 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -1,4 +1,4 @@
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_BLK_DEV_INITRD=y
diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index bfa2a95638af..711a79e9be00 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -1,6 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index fb283059daa0..6407f3a588f4 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -1,6 +1,6 @@
 CONFIG_KERNEL_LZO=y
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_PREEMPT_VOLUNTARY=y
diff --git a/arch/arm/configs/integrator_defconfig b/arch/arm/configs/integrator_defconfig
index 9ca43c84b452..61711d4bbf74 100644
--- a/arch/arm/configs/integrator_defconfig
+++ b/arch/arm/configs/integrator_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 8a41fe4e62f1..fabb66a53350 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arm/configs/magician_defconfig b/arch/arm/configs/magician_defconfig
index 9cbb63c69436..5a8776f6aba3 100644
--- a/arch/arm/configs/magician_defconfig
+++ b/arch/arm/configs/magician_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index 8620061e19a8..03e7e8969fc9 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
diff --git a/arch/arm/configs/moxart_defconfig b/arch/arm/configs/moxart_defconfig
index 082a38a14c12..ea31f116d577 100644
--- a/arch/arm/configs/moxart_defconfig
+++ b/arch/arm/configs/moxart_defconfig
@@ -1,6 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index e0be0e0023f3..1d97179c1e55 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=19
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d9257854c941..4278468e5093 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index a53ccd49f8ff..877c5150a987 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index ef3a33ebc29a..0b0017ab598c 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -1,6 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_FHANDLE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=19
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 155553ee06f4..c874662c2ee9 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_TASKSTATS=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 54a9f50122af..ac6628b234be 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -1,6 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 99d015cf8919..e2cb19da033a 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -2,7 +2,7 @@ CONFIG_KERNEL_LZMA=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arm/configs/orion5x_defconfig b/arch/arm/configs/orion5x_defconfig
index 1311d9583fcc..e2da9a8e28a4 100644
--- a/arch/arm/configs/orion5x_defconfig
+++ b/arch/arm/configs/orion5x_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
index 5c163a9d1429..70a67b3fc91b 100644
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ b/arch/arm/configs/oxnas_v6_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
diff --git a/arch/arm/configs/pcm027_defconfig b/arch/arm/configs/pcm027_defconfig
index 06bc9a8fef90..a392312a13ce 100644
--- a/arch/arm/configs/pcm027_defconfig
+++ b/arch/arm/configs/pcm027_defconfig
@@ -1,6 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
diff --git a/arch/arm/configs/pxa168_defconfig b/arch/arm/configs/pxa168_defconfig
index 70d327895ccf..b4768f873b87 100644
--- a/arch/arm/configs/pxa168_defconfig
+++ b/arch/arm/configs/pxa168_defconfig
@@ -4,7 +4,7 @@ CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_MACH_ASPENITE=y
 CONFIG_MACH_ZYLONITE2=y
 CONFIG_MACH_AVENGERS_LITE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
diff --git a/arch/arm/configs/pxa910_defconfig b/arch/arm/configs/pxa910_defconfig
index 5072bde71508..d61a1e5c8e37 100644
--- a/arch/arm/configs/pxa910_defconfig
+++ b/arch/arm/configs/pxa910_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index ce3f4ed50498..efc2fe7c50b0 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -1,7 +1,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_FHANDLE=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 0eeefbe60d06..12b82c662359 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index 789e900a8a08..d5daef2a966c 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_CGROUPS=y
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index a29bebb3742e..ecf004ece838 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index 3d14827e0a31..5c0806103a6f 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -1,4 +1,4 @@
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 71400af6cef4..ea9178a38b97 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -1,5 +1,5 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arm/configs/vt8500_v6_v7_defconfig b/arch/arm/configs/vt8500_v6_v7_defconfig
index cb8d38e9562a..41607a84abc8 100644
--- a/arch/arm/configs/vt8500_v6_v7_defconfig
+++ b/arch/arm/configs/vt8500_v6_v7_defconfig
@@ -1,4 +1,4 @@
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_ARCH_MULTI_V6=y
diff --git a/arch/arm/configs/xcep_defconfig b/arch/arm/configs/xcep_defconfig
index 0453948d52ef..ea59e4b6bfc5 100644
--- a/arch/arm/configs/xcep_defconfig
+++ b/arch/arm/configs/xcep_defconfig
@@ -1,7 +1,7 @@
 CONFIG_LOCALVERSION=".xcep-itech"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_IKCONFIG=y
-- 
2.37.2

