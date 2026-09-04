Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD3647A863
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519876; cv=none; b=dbJb64OrQC+gDfPkalIaBJjrVYqDIrvC0nS39XBw5iMfQ0NdCzeEdRpdemw4d+tyjU8wY8/G8Ehx5bg4BYVjux8XIKBY67TsqnBWwzFB6GThwW+2nTcGgkXfVjWy4czxsvthX89pTB+0ZQIvFik6JkOwWndzOjZ/b+2ZK9kpkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519876; c=relaxed/simple;
	bh=dJkuxRnLtXHX0hYD2tPNeJpdMPMlGF6LLVMZdpV+Dlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GILG19kyUdcli8I2utrpypM53cO7S1fZMSjKr/3iqM2z/r0ahUGlIXI1SSwbsleQB41Ki4tbnmtvv+I74qJZapVS8/UjeHqv+ahayU/IaC0XH1549hIlfdCgzanMoBomEwjQyVMzIastwlAOFc8JA7xztJ+38tO2sxgKjnk+HRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nU+wQibT; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nU+wQibT"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6acc74fef22so390664eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519873; x=1789124673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14NhbWVwArhRPWoqbEkyydWg2Xn0PWXC+Lz7VEuzIKQ=;
        b=nU+wQibTh+vcC4PovD3u5N7HluByF+dJXbCfD/yNqPqzuxlJTKvE7b+quiLSDa+ce1
         HJAB5IDP+vEFAcjn3r684fJ24zKc+3tLg4T9B5jUZ/Vof8UJLLD6IEmDtExXwaYUZAVv
         HuvgVTaX3d8AKkg7RJxm3QX/RbQwd4o25Cxele/Dx1jeyHlx7ZFVdp2TKavvKT3ql3QL
         PckCvJfrlfHGjVESDFBof9p9LIxFbZKuSEhx2WKZ5bCwU+y81TyDjCgeSkc7/pgnvgui
         y3dq4xojAZF8xn1gCJYoSXNdchcTFgVdq7WrIs/QFAXu4NPHA0Su1EKMELKu8u1Il0WH
         b7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519873; x=1789124673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14NhbWVwArhRPWoqbEkyydWg2Xn0PWXC+Lz7VEuzIKQ=;
        b=YzmnV+xQ6hfyH/W7TZnlf6l+Rpb6nQVtnwLSigc3LL8Xu6SbDE6BtVOTd7RpiNJOM6
         cNXxNDXfjWJrkrBJ5wXdMTFRX4zdy0kACKCZbleRY8kdiuQIZmuGjiV+Z1t8jTMFhMk5
         Bv1KO2NDpIDRBvqWCjZGJgCbi1e7L9VZVHukdeMmmYizyDZTur4Mt0hijmNaA7H5y+hw
         vdbeYrXRnogw9jM4YlI2T7yy7cJV7p7N7bfl5Yts5Ze4jH5k3Q/8Be0TfPujTg5elrQu
         NiMuFLauhozVcL7eDXM9aR5jVAnkg+GpKI9ydcF7ig0snJfA2Trsl/GjJ7Ajm5ApCYkU
         ARfg==
X-Forwarded-Encrypted: i=1; AKwUvBwglGOOj/fEX5cbIvT0CFFGGegrbVMYerGcKmyNBB2r9atQHNpEO3eQVjTlKzs66e+HWFsk1WUYwJBUcg==@lists.linux.dev
X-Gm-Message-State: AFuF++mR2VCtjLRJXEd5iLjPNUk+/tuV5LIDt2/TGSGzkEXnE+4KcKRn
	VhzGDi5/ptq6vgE82nIGseeWF0N6Lj7I5/shrAJ60kSzi08q7AcwqOfl
X-Gm-Gg: AYBFou0ZJKTtTJNi+2UrcQ3fMsiGthyeyIlzmuPIFIws89vU3HTsZOUemNWof77y3ru
	hpqe0ONQPf9w/amPgK5JkYNdZD9SQsEMjKshpa0NcA6gC9jVMuUNFdAnhavm49m19LOO6n+b83I
	5C5oRBXyqWuN0BQDv1FFOXYHsTRX6i4ZbP342b8a/ch6F9eVx0GMOxHIGLS8cqc2+LwVL5RWwMc
	CNRtmOtV/deueSMXXPsu9gyp0T4Jbiogxl6T8VjklHE4xYy68i5HM6RZMTMfdJqTPTSQdQTqkZH
	kVtgSKpUfHTTX+hYDdkYoLFvIGLf8/8IuSwluMxZbTvP815j9wZbE38JzyEePvO3mO+EwCCfRNP
	QmBgSdPHpXFpP6wQwbUrVf2WUUKfrWWIh9LApjl01Z//UVQ1YUhluP8dH8fC7e1Sve4e6nxXIWi
	m0pszG8IX7NxEpOWi5PVPGtpwIYogPdLwbdw0W1PWLpsmmp3sr8OnLX+ak+pYd5Tiy1nxn/g4Xf
	YWHaYee8Zumfck=
X-Received: by 2002:a05:6820:81e:b0:6b1:afca:5c78 with SMTP id 006d021491bc7-6b6fddba8bbmr3334490eaf.32.1788519871772;
        Fri, 04 Sep 2026 04:04:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm6640159eec.2.2026.09.04.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:04:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] spi: fix typos in comments
Date: Fri,  4 Sep 2026 16:34:16 +0530
Message-ID: <20260904110420.13707-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/spi/spi-bcm63xx.c     | 2 +-
 drivers/spi/spi-imx.c         | 2 +-
 drivers/spi/spi-omap2-mcspi.c | 2 +-
 drivers/spi/spi-pic32.c       | 2 +-
 drivers/spi/spi-s3c64xx.c     | 2 +-
 drivers/spi/spi-stm32.c       | 2 +-
 drivers/spi/spi-sun6i.c       | 2 +-
 drivers/spi/spi-xilinx.c      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
index 1d8e257bad30..3f349c1db581 100644
--- a/drivers/spi/spi-bcm63xx.c
+++ b/drivers/spi/spi-bcm63xx.c
@@ -413,7 +413,7 @@ static irqreturn_t bcm63xx_spi_interrupt(int irq, void *dev_id)
 	struct bcm63xx_spi *bs = spi_controller_get_devdata(host);
 	u8 intr;
 
-	/* Read interupts and clear them immediately */
+	/* Read interrupts and clear them immediately */
 	intr = bcm_spi_readb(bs, SPI_INT_STATUS);
 	bcm_spi_writeb(bs, SPI_INTR_CLEAR_ALL, SPI_INT_STATUS);
 	bcm_spi_writeb(bs, 0, SPI_INT_MASK);
diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 79a6c1a60b0a..6f9686df0486 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -673,7 +673,7 @@ static int mx51_ecspi_prepare_message(struct spi_imx_data *spi_imx,
 	 * propagate into the hardware. It takes exactly one tick of the
 	 * SCLK clock, but we will wait two SCLK clock just to be sure. The
 	 * effect of the delay it takes for the hardware to apply changes
-	 * is noticable if the SCLK clock run very slow. In such a case, if
+	 * is noticeable if the SCLK clock run very slow. In such a case, if
 	 * the polarity of SCLK should be inverted, the GPIO ChipSelect might
 	 * be asserted before the SCLK polarity changes, which would disrupt
 	 * the SPI communication as the device on the other end would consider
diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
index a3355147f5de..90f3990e0060 100644
--- a/drivers/spi/spi-omap2-mcspi.c
+++ b/drivers/spi/spi-omap2-mcspi.c
@@ -1244,7 +1244,7 @@ static int omap2_mcspi_transfer_one(struct spi_controller *ctlr,
 		omap2_mcspi_set_fifo(spi, t, 0);
 
 out:
-	/* Restore defaults if they were overriden */
+	/* Restore defaults if they were overridden */
 	if (par_override) {
 		par_override = 0;
 		status = omap2_mcspi_setup_transfer(spi, NULL);
diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 972128271e4b..8363bc873b03 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -53,7 +53,7 @@ struct pic32_spi_regs {
 #define  TX_FIFO_ALL_EMPTY	0 /* completely empty */
 #define  TX_FIFO_EMPTY		1 /* empty */
 #define  TX_FIFO_HALF_EMPTY	2 /* empty by half or more */
-#define  TX_FIFO_NOT_FULL	3 /* atleast one empty */
+#define  TX_FIFO_NOT_FULL	3 /* at least one empty */
 
 #define CTRL_MSTEN	BIT(5) /* enable master mode */
 #define CTRL_CKP	BIT(6) /* active low */
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8d4120cf9df1..3546414dfc70 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -661,7 +661,7 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
 	 * loops = length / max fifo size (calculated by using the
 	 * fifo mask).
 	 * For any size less than the fifo size the below code is
-	 * executed atleast once.
+	 * executed at least once.
 	 */
 	loops = xfer->len / sdd->fifo_depth;
 	buf = xfer->rx_buf;
diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index be88e62075af..5f5c43ae5096 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -515,7 +515,7 @@ static int stm32h7_spi_get_bpw_mask(struct stm32_spi *spi)
 
 	/*
 	 * The most significant bit at DSIZE bit field is reserved when the
-	 * maximum data size of periperal instances is limited to 16-bit
+	 * maximum data size of peripheral instances is limited to 16-bit
 	 */
 	stm32_spi_set_bits(spi, STM32H7_SPI_CFG1, STM32H7_SPI_CFG1_DSIZE);
 
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 4631e9c7ca1d..6b7a05dd0de8 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -386,7 +386,7 @@ static int sun6i_spi_transfer_one(struct spi_controller *host,
 		 * SPI_CLK = MOD_CLK / (2 ^ cdr)
 		 * Or we can use CDR2, which is calculated with the formula:
 		 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
-		 * Wether we use the former or the latter is set through the
+		 * Whether we use the former or the latter is set through the
 		 * DRS bit.
 		 *
 		 * First try CDR2, and if we can't reach the expected
diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index dc1e968659e1..df4ea99a5427 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -460,7 +460,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	host->num_chipselect = num_cs;
 
 	/*
-	 * Detect endianess on the IP via loop bit in CR. Detection
+	 * Detect endianness on the IP via loop bit in CR. Detection
 	 * must be done before reset is sent because incorrect reset
 	 * value generates error interrupt.
 	 * Setup little endian helper functions first and try to use them
-- 
2.48.1

