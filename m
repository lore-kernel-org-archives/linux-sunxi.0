Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B142459EA
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376929; cv=none; b=MdkMrhxUIRyAkKNO5Ctp3z0+Gcmd+gXKKrU1je4aCfDlGNFDYu23ky51XupD8yLJmriYMOs7HIfxPvEMyOszELccqjsEroIHVxXidcpegtfqCXDl2ydC9hjd2VUnU/BtDqt4bZFv8yRAeaab4hGzxzdYlwGiygWqH5p6PcDZ/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376929; c=relaxed/simple;
	bh=WclG9/5UCAVmNpJ6wIy91+8u1Ud041oHxz1zl+TJNjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dijt42eQETM+0aqErgM/D9o5QgXaXuU8DMlFLQCdwq/tCZJ6qMWO29IcMYSzIMXMucTS6lElG0wggN+9WL0xTdjJXilz9kZE4KSJpBkeRSwu2KunEkHZI0HxVP4vV7kZaE0rJsl5LNM8QB8iHO3+Plsug7N9z+T8xKOZQDstYU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rA//LVMR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rA//LVMR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3159604a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376927; x=1774981727; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
        b=rA//LVMRZTtzch0iwI6h4u/FUf9irItj+DEqHPjHXQVDSJo9LpBwIG6LYXlYhnxKFM
         NwGUiVoo2qsOpfTK6O88b3xlYzLyMTn3cEyF+qgC6Zb6dWmjjpK/oEATZjwrjD+iPSi9
         CzDkJDW8mt4SxBKzhFwLdtawEr63Z9ldAipj3qP/xT9AUEJwjn65AXhE7n4hUkuYCrrM
         muTr7/W/PCGesA1DcaKMdCqnOxVNUq44QCIF7LaAmt8uP7mZjzun/kW93SKmAKj7Mz2w
         SdEeoCnx2B2OBBh7wyXiRq1OGT7Evx4pHKH2ian60yU39ELrAhAbFjKvkGvKR3IPgxaC
         hg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376927; x=1774981727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
        b=BmkcnVNvOdJP9rM1dzJf3meYxMsO2DYhru78Og6eV7vylV4Vhy65N1bz2FuMEYvJzS
         iX+htSCJy3e0gakVrHCMirHik9Wy2pjdfleRfjiCtbsyVNmqfkcNWHE23nnkIsi6WVA6
         xaUsk7eRnD1y7DyYtK1a3x0limRxkseJJsuYfVfnXPrhV6gjAXqmFmpGtiP0zWwlVGqb
         mRckYRhYOhoy65nQ7HpPDTmUJTGHENJwWR9EjzBpwL2WCnepR2y/Pd4ZhUi6U+3Z4ux6
         1BFCYX9IKmE3h/nJktqjxT2i0PwETOKSFNGMSPxy3a47LhumZJpNwNoGLr9qLDftNjci
         CZBw==
X-Forwarded-Encrypted: i=1; AJvYcCW4doq8DFQBXw8WoN9MkDbZJ3bTTPZPMXtXFT3j+DCt/OVdhG9k0qw4VLjvDtrPOeAzY046hDLsxVmaLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBAi2Ee0ByLiJqKtczgTUH+Sd1Q3VWkL52G4/20+fCbeBcF7B4
	YDHuRndpn+fiMUyJBp1YQmel3J+W0nWCJSZTqxD0tHW6KhzHXQnXZ4qB
X-Gm-Gg: ATEYQzwzWRpDKZKK01ncdPV6J/T6noQwqG7+rHp03R11+Xwf33cCpYblicc87WWIBTd
	6T2QrovjkInb0xxFcNsEadvFEI5e70+WHHJPLvfksx7gik7adEGxMQkRDqw7lmYMTr76H7uDGJJ
	expfwY47AjX3AZaawNczMipe1GZO/bmulsva1jWLIDkhx36OLqsNvBWxA6Bs6C/55RZuuS/oWKv
	T3eI1AfFuJXaWtl2YTeYUXHxGR1/chSC/Em90lWLNQnPvjNIQegbO89VvSqASkBu8Pn/wS5RN08
	4JtoY0DdbV774BYWO7ksB4z6vLdYC5YZY7rp0E36c9KxC1c+BprIdQZfLt0ZjXu//YnFf/Nxg1h
	eF1lvxlaxu4uqbRFUoW1SEPqAS5E7jNq1EBrRgJIrCMIgDiLKNU6eGffsFz5LvzvPuJYEHL/qfP
	MpZUPIFiNyGnEDamkx8EkPiJokfSHwQ6V0hDB+
X-Received: by 2002:a17:90b:1d8a:b0:35b:e5ba:c0c8 with SMTP id 98e67ed59e1d1-35c0ddd9ed9mr320446a91.28.1774376927304;
        Tue, 24 Mar 2026 11:28:47 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:46 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:57 +0530
Subject: [PATCH 09/10] i2c: sis96x: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-9-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2523;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=2gYAVvyUJk/qxHL4KJceROL4iNDzsuJ4eDXGcgjkpVk=;
 b=vB2gL2qhGY3YL/cIJqmvowLCaQEngaBk72sJRkrwCl3oRTHnnpcQvD7hzPfvDqHKUYnT4Wr6Y
 Zfn7Uu0NXm6B/rb6bM9jYBJr8GEREU1oPwc+1RRqWHn4xFjESwTrs7U
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis96x.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..eee41dc9d706 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -245,23 +245,19 @@ static int sis96x_probe(struct pci_dev *dev,
 	u16 ww = 0;
 	int retval;
 
-	if (sis96x_smbus_base) {
-		dev_err(&dev->dev, "Only one device supported.\n");
-		return -EBUSY;
-	}
+	if (sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EBUSY, "Only one device supported.\n");
 
 	pci_read_config_word(dev, PCI_CLASS_DEVICE, &ww);
-	if (PCI_CLASS_SERIAL_SMBUS != ww) {
-		dev_err(&dev->dev, "Unsupported device class 0x%04x!\n", ww);
-		return -ENODEV;
-	}
+	if (ww != PCI_CLASS_SERIAL_SMBUS)
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Unsupported device class 0x%04x!\n", ww);
 
 	sis96x_smbus_base = pci_resource_start(dev, SIS96x_BAR);
-	if (!sis96x_smbus_base) {
-		dev_err(&dev->dev, "SiS96x SMBus base address "
-			"not initialized!\n");
-		return -EINVAL;
-	}
+	if (!sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EINVAL,
+				     "SiS96x SMBus base address not initialized!\n");
+
 	dev_info(&dev->dev, "SiS96x SMBus base address: 0x%04x\n",
 			sis96x_smbus_base);
 
@@ -272,9 +268,9 @@ static int sis96x_probe(struct pci_dev *dev,
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(sis96x_smbus_base, SMB_IOSIZE,
 			    sis96x_driver.name)) {
-		dev_err(&dev->dev, "SMBus registers 0x%04x-0x%04x "
-			"already in use!\n", sis96x_smbus_base,
-			sis96x_smbus_base + SMB_IOSIZE - 1);
+		dev_err_probe(&dev->dev, -EINVAL,
+			      "SMBus registers 0x%04x-0x%04x already in use!\n",
+			      sis96x_smbus_base, sis96x_smbus_base + SMB_IOSIZE - 1);
 
 		sis96x_smbus_base = 0;
 		return -EINVAL;
@@ -287,7 +283,7 @@ static int sis96x_probe(struct pci_dev *dev,
 		"SiS96x SMBus adapter at 0x%04x", sis96x_smbus_base);
 
 	if ((retval = i2c_add_adapter(&sis96x_adapter))) {
-		dev_err(&dev->dev, "Couldn't register adapter!\n");
+		dev_err_probe(&dev->dev, retval, "Couldn't register adapter!\n");
 		release_region(sis96x_smbus_base, SMB_IOSIZE);
 		sis96x_smbus_base = 0;
 	}

-- 
2.43.0

