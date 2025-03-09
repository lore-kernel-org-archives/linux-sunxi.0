Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260EFDF42
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741500771; cv=none; b=j80Ovxbq0N7rp89qbD8FSDMUaqdfEuL4rwDUQavXdlnZjynko7zIKN58D6CzVI6b8sMIiC4+uBaXVP80x2jy4Sfb4rYj56Yq+1/vYqqXuYS0VjdKdtzqrekeVdqpIUZYpYnOYaAhv+ww2OFrwjaGg9DOJoSOmVpAu5UggRXLOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741500771; c=relaxed/simple;
	bh=JqDgcXXtcqHxikp7fXnsyKencW40CfSDLIigPuq3w60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l55RnymNu5CtI7XAGM1HaVMSOmdethoSghHfEa9W1UIDusZKSzWb0MJpA+b1NpMZDEeAKCCtyejUYABBKy79SW7eLzmWRpb/VG8ZcOMGKJ7yp42DziDyUESrh/ZDmpjhnzZdpvNExxJZxaJBQlQPnJjxyzE0UiVyVzFDyjqSLZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGtjOr63; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGtjOr63"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso91468a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741500767; x=1742105567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wf1okhazCUEnLuartt0a7/ZV6WRZiFKgURRJRNienlY=;
        b=MGtjOr63Wd1DSdgJRuOEDRCCyNewFxC2s55/gFZpMrYsGpcoXs6y1Wmg/3WYGdrwSM
         0Vhy7DKJzUS5XrPKS9YX4vYGX50oxOwI/zh4cx0kuk/RwH6iVDkSxbVBpJRtyHSKgK2n
         J1ii6zjZ2qxQEf7MlqIkkNyPCgB5PuQ62Suz+B3O8cn07WFwjhOs6Tnd3mbgF/42OlX6
         NKXC0TuNmO/FtNKZPLV/ebvBNIscZUOh8ag3vO9l1Tews3hi1aNXYfEGOOD2VMnbo9z7
         7nY1pUU0IiHBBHjdH5CMwr+ujQcF1jXNHNGQAI12IXMSEvOtvzJtyf/OWIprpx+gojXl
         9LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741500767; x=1742105567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wf1okhazCUEnLuartt0a7/ZV6WRZiFKgURRJRNienlY=;
        b=dm61kzj/0fRKjo3InOWJmyCSVgwTqRT2mPBlGRiV8XFAc/jtZg6Joel5nDa5nXcB/l
         Ug8qTaSAtw8Zl6H1fu2ZKlxiJn0kHg8OPICXhHzX72sy2rpnkr/tMG1m79MQ5O/aWf6w
         LOdOzV5WSS2RRW9+A6wgAzDQ+cl9VO77WdI8RkUk7N1A4QDYrsgw33peUi39rSylIo4v
         LAMZY9gwAhTw/lf3P6iOVmD3vcNCINh+LK0P+d3WfFF/cbL3KNzwBilCKbRBJnGG0ARV
         sEPKi3DwJEJZtlSLTQMsl/ywKRnD6rwONcz4HUXxB0aaFXUJO7Ak5RDBiEGauPEGAtIW
         puQA==
X-Forwarded-Encrypted: i=1; AJvYcCVqN4+qmJGgP+WTGta+IFDmbv06F4ufUpStkfdVWYugQnxd07rBDXoK+lab4rMBh1FBZ1PvyIIjj4B4Yg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQoHiR3L00/7YlZHzoEjjhkYPY8Vq/tp40YUFCJqv2Y2udEXBd
	EozxZW4XqnNqK2hGLq2Lw8uBmYB4HumiK6d2qFoOYyNA7WHY6+Od
X-Gm-Gg: ASbGncvxEW1f0SHOvvIri1Xxea2vLumlcfwBdleajP0fMJw8m8dMusMNxQQnP0EK/Sm
	2qCPZm9wOQk0V3Bk2Xv1Erb9xVvOEzDF2PEpF7ZQaK0a50TzlrlvKqH1Ya0EJE/l6IhNbRElT4V
	KSwpu6GrLuyryZzgoLzW6N9a6v/M/qSDhvDTdGkhmrQHlNzdx9i41y+4LKPf89vZZ5v+BFzC9Bl
	96jAC1PZ4NvUy6x47ZICkz32M662ruB2+nb7UAc5Amv3hdQPjqwTqHNCDj1F/ytlUIvVdtvKSh4
	GmOx2rTiLuzAhMSx3Cntl4EIuI+KxdzYnj0eQN3PYb2j2e9yTDNMwn4PDFuG4vPn
X-Google-Smtp-Source: AGHT+IFWRoRGXzo3k8TrAN8828qg6xExYhW0d6iKTv3ibuuEVSdFae7DO32G2sP4YujrCkEqJgW4MQ==
X-Received: by 2002:a17:906:180d:b0:ac2:5d24:1fcf with SMTP id a640c23a62f3a-ac25d2423fdmr632176466b.26.1741500767192;
        Sat, 08 Mar 2025 22:12:47 -0800 (PST)
Received: from localhost.localdomain ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27a071479sm189558566b.113.2025.03.08.22.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:12:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: eng.fan@nxp.com,
	jh80.chung@samsung.com,
	trini@konsulko.com
Cc: andre.przywara@arm.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] sunxi: mmc: Improve reset procedure
Date: Sun,  9 Mar 2025 07:12:41 +0100
Message-ID: <20250309061241.62170-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cards should always be reset and threshold set. This fixes eMMC on H616.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/sunxi_mmc.c | 28 ++++++++++++++++++++++------
 drivers/mmc/sunxi_mmc.h | 15 +++++++++++++--
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 0b56d1405bee..335def4b9738 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -442,6 +442,26 @@ out:
 	return error;
 }
 
+static void sunxi_mmc_reset(struct sunxi_mmc *regs)
+{
+	/* Reset controller */
+	writel(SUNXI_MMC_GCTRL_RESET, &regs->gctrl);
+	udelay(1000);
+
+	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
+		/* Reset card */
+		writel(SUNXI_MMC_HWRST_ASSERT, &regs->hwrst);
+		udelay(10);
+		writel(SUNXI_MMC_HWRST_DEASSERT, &regs->hwrst);
+		udelay(300);
+
+		/* Setup FIFO R/W threshold. Needed on H616. */
+		writel(SUNXI_MMC_THLDC_READ_THLD(512) |
+		       SUNXI_MMC_THLDC_WRITE_EN |
+		       SUNXI_MMC_THLDC_READ_EN, &regs->thldc);
+	}
+}
+
 /* non-DM code here is used by the (ARM) SPL only */
 
 #if !CONFIG_IS_ENABLED(DM_MMC)
@@ -489,9 +509,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)
 {
 	struct sunxi_mmc_priv *priv = mmc->priv;
 
-	/* Reset controller */
-	writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
-	udelay(1000);
+	sunxi_mmc_reset(priv->reg);
 
 	return 0;
 }
@@ -684,9 +702,7 @@ static int sunxi_mmc_probe(struct udevice *dev)
 
 	upriv->mmc = &plat->mmc;
 
-	/* Reset controller */
-	writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
-	udelay(1000);
+	sunxi_mmc_reset(priv->reg);
 
 	return 0;
 }
diff --git a/drivers/mmc/sunxi_mmc.h b/drivers/mmc/sunxi_mmc.h
index f4ae5a790c87..9d55904c213c 100644
--- a/drivers/mmc/sunxi_mmc.h
+++ b/drivers/mmc/sunxi_mmc.h
@@ -37,7 +37,9 @@ struct sunxi_mmc {
 	u32 res0;		/* 0x54 reserved */
 	u32 a12a;		/* 0x58 Auto command 12 argument */
 	u32 ntsr;		/* 0x5c	New timing set register */
-	u32 res1[8];
+	u32 res1[6];
+	u32 hwrst;		/* 0x78 Hardware Reset */
+	u32 res5;
 	u32 dmac;		/* 0x80 internal DMA control */
 	u32 dlba;		/* 0x84 internal DMA descr list base address */
 	u32 idst;		/* 0x88 internal DMA status */
@@ -46,7 +48,8 @@ struct sunxi_mmc {
 	u32 cbda;		/* 0x94 */
 	u32 res2[26];
 #if defined(CONFIG_SUNXI_GEN_SUN6I) || defined(CONFIG_SUN50I_GEN_H6) || defined(CONFIG_SUNXI_GEN_NCAT2)
-	u32 res3[17];
+	u32 thldc;		/* 0x100 Threshold control */
+	u32 res3[16];
 	u32 samp_dl;
 	u32 res4[46];
 #endif
@@ -123,6 +126,9 @@ struct sunxi_mmc {
 
 #define SUNXI_MMC_NTSR_MODE_SEL_NEW		(0x1 << 31)
 
+#define SUNXI_MMC_HWRST_ASSERT		(0x0 << 0)
+#define SUNXI_MMC_HWRST_DEASSERT	(0x1 << 0)
+
 #define SUNXI_MMC_IDMAC_RESET		(0x1 << 0)
 #define SUNXI_MMC_IDMAC_FIXBURST	(0x1 << 1)
 #define SUNXI_MMC_IDMAC_ENABLE		(0x1 << 7)
@@ -133,6 +139,11 @@ struct sunxi_mmc {
 #define SUNXI_MMC_COMMON_CLK_GATE		(1 << 16)
 #define SUNXI_MMC_COMMON_RESET			(1 << 18)
 
+#define SUNXI_MMC_THLDC_READ_EN		(0x1 << 0)
+#define SUNXI_MMC_THLDC_BSY_CLR_INT_EN	(0x1 << 1)
+#define SUNXI_MMC_THLDC_WRITE_EN	(0x1 << 2)
+#define SUNXI_MMC_THLDC_READ_THLD(x)	(((x) & 0xfff) << 16)
+
 #define SUNXI_MMC_CAL_DL_SW_EN		(0x1 << 7)
 
 #endif /* _SUNXI_MMC_H */
-- 
2.48.1

