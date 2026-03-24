Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED846396566
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376939; cv=none; b=Uud4/OasCOtvIbCpHbmefs4c7bvHwJ4/tm3zkRsB/wHxsjYzf0hUmYPpxDzcq2toPb6+i+Vm/VyE+DJVJ2lW+Dnb9Sp8t5QT05Dv4dlHjxcckzPT3IBmBnkyJ3gp6Y+HQxsHKm81+75DfXODjmtHmkYxYUu5r9DQD6XXEMxaxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376939; c=relaxed/simple;
	bh=7g/jARnkhTd3DIs23AFH73jSfHB7zbCwImSIcA8YsoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ohp3b8P+M6PxygPUx2BuQPkmewe8Maek9bds8ARAV7656EDfiyddE1Z+T6CvbPR3i8ZPLKPmq5OTIxXJQytffywvy7BDUAtgAR2KrgOA9dgWvM7dWzyvai/lxDuD8VUG2gp8yEwLefbqy7zIYBRN/NOCRH8Kgk//JLDe8LYdawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7MMC0WY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7MMC0WY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a07c4b17dso2114498a91.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376937; x=1774981737; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
        b=p7MMC0WYCPcXlw3g+8tcE0QpCVybh2N90yBzSOEtv0daPKKYjFv0KYZ74ExXIxH90s
         S5BCIIhhyXaWpZz98qAsZb6eIbq/SmNcu6Fu6fr27CFAzmwe5eFcGTm5LtoKIeZVbQTW
         +U0s11s2vOZO8Bz4WpojrTUFYLxWaUe5waBeLd/0N7KNW6MTPIjjmVdLIGu7MrIRNtLJ
         pwzCUHXB2hOrB+9kHzgA635mzD+V05hjOrUKvIFe3eKjWbMNtWJYvaFjk7ySoMGr4Bcy
         Ne8VG3MM4l+D8DFBhUa/0WH9XRLvAHJMcOSXv33rk/YxG4Gu012uh8wWl5+PdttmYvJD
         TO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376937; x=1774981737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
        b=cziW2e4aVbgyV8lIQndJ+47tb8jWjYB/GpmnQbOC84mdRUvZKnBCO9LJ9RcjvwX5Av
         jbvQCz9vbA9NjBsxRar/2TCkE4TlLvzmCmu048Ovb/r6ReClevO42K7/PXbEK/WXxm+H
         oEZz09gXy6KaS+IjQOwOTByauTtWhmeuvpRBlPiouXPa++prI4tuSOeAEyehBAlzSvBg
         bYg8VvX+xbRvHN6kpsRZk/sqg9AJOMv2WpGgr4NeEV7B1aEIQG+R8dtWbgt01+7Vaktw
         z1zYTclxzBFTso+APAVgZCS8jeuASpxwvYxtxacp1YDcdy4Wooi7mIJYyECqgOWYgE/E
         vKDw==
X-Forwarded-Encrypted: i=1; AJvYcCWaD6r4OIVbo4DF9kl4ZruCZ/MIzZzZ6U+qbGfiZAI/0t1HgoonHxuLy3mkirzresV6rqZUyrCgXawILw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgxwZgTQmfuKqPuQAkkdxurBIjiUL+MvrVyjLzysfmV1M7peKn
	8jRa1AgO9wATFssGY47XXqSC+pRbO40QNeTaWxIwmzw3SVe/Oug2u/7F
X-Gm-Gg: ATEYQzzLWd4fwyRk1HIR1yHpU635CeGoNmT9wdg+cCFbuxj3PTU00viGIgolE/Sb+fx
	jfeO2uj2pqTv7+1zei28/4uyLTQj+qMthekJYFEbZJGIbkssM17WnfPuhA6pK5tgTqUb9Fd3mbZ
	0RMeWWMQjCI7QYmD5BGadA9ewDO0RsG9+hd4DZMsOIEJn6EjAYyXuGvvt2lHrvUNK8O9zyYpN/e
	PK7Re3ks/KxRvbu0W0QiE18i6Ept+HFz4DEDWcqorih7Ud5bteNsyF3GahWnFevWP21R5ICOwu8
	wcXU7hacxwDMsrmLVYwYocw/inLiDuRPPhgVEzvB7C/86FK5a/TmRuHBnTtRGDvcK55wbFyPNIV
	o6K7zIX7GKh5VTV6sLi73DNRS1qKgySX2gpbHV8nvqHe3a9gmxGdBgtXyJUonQkIwoPktIGBB4y
	0DBhE5pDrKSFzrT12dkR7ZG6KYHQ==
X-Received: by 2002:a17:90b:3dc4:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35c0dd1000bmr297824a91.13.1774376937217;
        Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:56 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:58 +0530
Subject: [PATCH 10/10] i2c: sis630: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-10-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2804;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=nhsfDSLdFe3nGX23EexwATKRFgvnwZsN/uRkVIgsfDc=;
 b=MfTL2nua2/UaTOkuHox/mofQ9uGkaQFwD4ef2QTeyEIJWKrK1affTlrqYL2fD+dQbiqZ2kQf1
 368O9MeLyraCsNY7XiqbLSbdhihgwtkeZhLhsjgkAnvnbcpMTIg+zrj
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis630.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index a19c3d251804..3d0638c2bc51 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -431,24 +431,23 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   in acpi io space and read acpi base addr
 	*/
 	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
-		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't read bios ctl reg\n");
 		goto exit;
 	}
 	/* if ACPI already enabled , do nothing */
 	if (!(b & 0x80) &&
 	    pci_write_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, b | 0x80)) {
-		dev_err(&sis630_dev->dev, "Error: Can't enable ACPI\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't enable ACPI\n");
 		goto exit;
 	}
 
 	/* Determine the ACPI base address */
 	if (pci_read_config_word(sis630_dev,
 				 SIS630_ACPI_BASE_REG, &acpi_base)) {
-		dev_err(&sis630_dev->dev,
-			"Error: Can't determine ACPI base address\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't determine ACPI base address\n");
 		goto exit;
 	}
 
@@ -469,11 +468,10 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(smbus_base + SMB_STS, SIS630_SMB_IOREGION,
 			    sis630_driver.name)) {
-		dev_err(&sis630_dev->dev,
-			"I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
-			smbus_base + SMB_STS,
-			smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
-		retval = -EBUSY;
+		retval = dev_err_probe(&sis630_dev->dev, -EBUSY,
+				       "I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
+				       smbus_base + SMB_STS,
+				       smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
 		goto exit;
 	}
 
@@ -511,12 +509,9 @@ static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
 
-	if (sis630_setup(dev)) {
-		dev_err(&dev->dev,
-			"SIS630 compatible bus not detected, "
-			"module not inserted.\n");
-		return -ENODEV;
-	}
+	if (sis630_setup(dev))
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Compatible bus not detected, module not inserted.\n");
 
 	/* set up the sysfs linkage to our parent device */
 	sis630_adapter.dev.parent = &dev->dev;

-- 
2.43.0

