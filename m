Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086412F80
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 17:42:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id a20so18632436wrc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=994vaJpQHimaGxlBJIrPm8kOAKq1o2Sripwh6YBDVhI=;
        b=dWFPHBbABztA3qao404cgvtntDt+zk22az3EcIJFWMosyaBHFkqNv/xNJuBkRmKgrn
         Ly6YkhXOnnCoS9jV0+oCwnRRxPecos5zQFjjbj4v32H6FGEF+ujsKfgjFAhlar/O9g9o
         wyBY25nOOIGT6QMxBi/SOsoTAJ0udjDV94DoUmgk6Q4w4ITvcuCw5ipvTDzUgFmGsDLB
         61xnCZS0K5WpGD/VWyYJqI46Q5OhRUz2JpgIeBCd3tT4eqWS9pMEmdwCEKVINZrCCPDW
         XXQmZ4776QxO8eYalOVDOuVRMoGgdYzV89uN/Yx/GpgcVL0TPr6ZUo20VXZWCN4ROJyv
         efzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=994vaJpQHimaGxlBJIrPm8kOAKq1o2Sripwh6YBDVhI=;
        b=Iolf9SnET4aIeBWYVoHtfox40391+cKtFzj7TIz28DGwK5Zks6B2JIY1PgQdsUb/c6
         BEBndRx7pIXSRz/n7vcOIqj42suQDjFCSRRVGY/ll9gMwHz5Nx/EYdz68w9k5E5pwDJt
         ZdeeEb/FRLExEkMwqlaYbOeLRJwEZ4U6NavFjS3QX1iwfdyVlaGVKSU9XV201aynraax
         2kiKyuCaHAWpsio38u7qoDma4iUBNgsv5onbqwVO0UnKZZvEnGol6rHm1D7xNDXbNNB6
         /l5NSoOhpi0h2x62TSenkf+MhvvIV5kU5lNdoxX0PIntOWjaW6CXROFjlDnIPtA0OZvz
         03+w==
X-Gm-Message-State: AOAM532ZNeCto2PcJ0uig+0E34KVv161vaS1MUSvU4GDivTZPR0xcawr
	+ajcEJe1XQILk26LIyJhALQ=
X-Google-Smtp-Source: ABdhPJy1tQe618DIah2ZXs41PedXdynsjhEdOoz1QYxGIlq4eSaShdeorsBseWTHl65XtMcv8xoslw==
X-Received: by 2002:adf:bc07:: with SMTP id s7mr18429224wrg.301.1623087777631;
        Mon, 07 Jun 2021 10:42:57 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id 89sm18259609wrq.14.2021.06.07.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 10:42:57 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] configs: OrangePi PC2: Update defaults
Date: Mon,  7 Jun 2021 19:42:45 +0200
Message-Id: <20210607174245.480188-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OrangePi PC2 board has DRAM with ODT, so enable it. ZQ value is also
slightly different in vendor images, so update it as well. H5 SoC is
also connected to voltage regulator. It's default value is pretty low,
so in order to avoid instability, enable driver for it and set it to
appropriate voltage.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 configs/orangepi_pc2_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index f72ffe27b26c..5e4cca793f53 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -3,13 +3,15 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_CLK=672
-CONFIG_DRAM_ZQ=3881977
-# CONFIG_DRAM_ODT_EN is not set
+CONFIG_DRAM_ZQ=4145117
 CONFIG_MACPWR="PD6"
 CONFIG_SPL_SPI_SUNXI=y
+CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-orangepi-pc2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
+CONFIG_SY8106A_POWER=y
+CONFIG_SY8106A_VOUT1_VOLT=1100
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_GADGET=y
-- 
2.31.1

