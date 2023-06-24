Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2FF1384
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jun 2023 13:17:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fa71db41b6so16499845e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jun 2023 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687612621; x=1690204621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4HOHpTuxkhDI1uIn7GRBULu0rY5eOvyg0W/1k8C9T4=;
        b=rUrqWapO4pYhvePnS7Vq1czHnSJ9zPSgqsffqLURJUNHIlAZ8ys2Si7q8pQzxZ74tt
         FBZszCa8TucARVI8q8sZ9Avu+4Lj6Ctpu46rODvpVqB85qOYaTwYqiX6LQlZb+GFLdXi
         nW9isyDNnVfiAdioaHD73UdoRS6Hzlo3qFVh2wPjkV/LjRolMt26XqzDM9xRpUkXeV0P
         a1D+kktEkyFfedDfIJFTLbpXVq1Sv/peqNNlFZGEGDc1PsG8gDz5zzBWi5Q2u+8RNkf7
         /m2w4STUaHct/MJ2jp2F/Xb8cf5To/tikiCVX745Mml/Wtkd+V3xnDjwHz4NJZWDiild
         GNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687612621; x=1690204621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4HOHpTuxkhDI1uIn7GRBULu0rY5eOvyg0W/1k8C9T4=;
        b=EEBVYx7DDCBsyVR/oC7M0/ZosRe96UZdxkt+ZLmn6iqdzYtoiNLNG0xKMpQOUIwD5M
         U3LH330sLnvyJXJhGctYmTRZqbT82pEeblQI9NLSWBOXRLaC66eVEZVzH1m3Sb6OCwfS
         ZoY4DJBHNoyZCygAy3W1VPY0RB6plINc5VWhSzFCddRp52vQmCFBz7feUdV7IeClXCdX
         DxYp0hMnHxvpEDUDhlU89QVHjm7eqDEd7Ai/FfPc9D27d7gSXA5q/1SZCj56bbviwoY1
         k7lSn4QoAqyRNueoctB7AFIlDGpthF19RYDU9unH6e/CmGIg2ngjlr3LyGKW08KGvJJj
         9rHA==
X-Gm-Message-State: AC+VfDzQwZHMT35u6zFgb0tdNvV4pWJw+HgcwyN/xEN4ZXVIcjyPfKLJ
	QqEourBwv8bNiA2t3kQtE0c=
X-Google-Smtp-Source: ACHHUZ7xACTfdartW6THNtoCrYALyLgEq0fwWG5cJD775ZZVWt6/8PJrOTn9k1ZPAJRW/uUOUStIWQ==
X-Received: by 2002:a1c:f70a:0:b0:3f7:34dc:ed0d with SMTP id v10-20020a1cf70a000000b003f734dced0dmr16795214wmh.25.1687612620714;
        Sat, 24 Jun 2023 06:17:00 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm5107428wmh.41.2023.06.24.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 06:17:00 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Brown <broonie@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] spi: sun6i: add quirk for dual and quad SPI modes support
Date: Sat, 24 Jun 2023 16:16:22 +0300
Message-Id: <20230624131632.2972546-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624131632.2972546-1-bigunclemax@gmail.com>
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New Allwinner's SPI controllers can support dual and quad SPI modes.
To enable one of these modes, we should set the corresponding bit in
the SUN6I_BURST_CTL_CNT_REG register. DRM (28 bits) for dual mode and
Quad_EN (29 bits) for quad transmission.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/spi/spi-sun6i.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 30d541612253..cec2747235ab 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -83,6 +83,9 @@
 #define SUN6I_XMIT_CNT_REG		0x34
 
 #define SUN6I_BURST_CTL_CNT_REG		0x38
+#define SUN6I_BURST_CTL_CNT_STC_MASK		GENMASK(23, 0)
+#define SUN6I_BURST_CTL_CNT_DRM			BIT(28)
+#define SUN6I_BURST_CTL_CNT_QUAD_EN		BIT(29)
 
 #define SUN6I_TXDATA_REG		0x200
 #define SUN6I_RXDATA_REG		0x300
@@ -90,6 +93,7 @@
 struct sun6i_spi_cfg {
 	unsigned long		fifo_depth;
 	bool			has_clk_ctl;
+	u32			mode_bits;
 };
 
 struct sun6i_spi {
@@ -266,7 +270,7 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 	unsigned int div, div_cdr1, div_cdr2, timeout;
 	unsigned int start, end, tx_time;
 	unsigned int trig_level;
-	unsigned int tx_len = 0, rx_len = 0;
+	unsigned int tx_len = 0, rx_len = 0, nbits = 0;
 	bool use_dma;
 	int ret = 0;
 	u32 reg;
@@ -418,13 +422,29 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 	sun6i_spi_write(sspi, SUN6I_GBL_CTL_REG, reg);
 
 	/* Setup the transfer now... */
-	if (sspi->tx_buf)
+	if (sspi->tx_buf) {
 		tx_len = tfr->len;
+		nbits = tfr->tx_nbits;
+	} else if (tfr->rx_buf) {
+		nbits = tfr->rx_nbits;
+	}
+
+	switch (nbits) {
+	case SPI_NBITS_DUAL:
+		reg = SUN6I_BURST_CTL_CNT_DRM;
+		break;
+	case SPI_NBITS_QUAD:
+		reg = SUN6I_BURST_CTL_CNT_QUAD_EN;
+		break;
+	case SPI_NBITS_SINGLE:
+	default:
+		reg = FIELD_PREP(SUN6I_BURST_CTL_CNT_STC_MASK, tx_len);
+	}
 
 	/* Setup the counters */
+	sun6i_spi_write(sspi, SUN6I_BURST_CTL_CNT_REG, reg);
 	sun6i_spi_write(sspi, SUN6I_BURST_CNT_REG, tfr->len);
 	sun6i_spi_write(sspi, SUN6I_XMIT_CNT_REG, tx_len);
-	sun6i_spi_write(sspi, SUN6I_BURST_CTL_CNT_REG, tx_len);
 
 	if (!use_dma) {
 		/* Fill the TX FIFO */
@@ -623,7 +643,8 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 	master->set_cs = sun6i_spi_set_cs;
 	master->transfer_one = sun6i_spi_transfer_one;
 	master->num_chipselect = 4;
-	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
+	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST |
+			    sspi->cfg->mode_bits;
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
 	master->dev.of_node = pdev->dev.of_node;
 	master->auto_runtime_pm = true;
-- 
2.39.2

