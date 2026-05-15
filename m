Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C29405C5B
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888809; cv=none; b=KmXAXv8zB63v79MhsrkG99sliQqxGvSCM3lgPuBC2fgLdgcYJVZ1N9XBA81S0CqAaHjPyCbKhQsNCov/V9OG4w5QdVBpPZmvGmQAj0n7/yRSz03wx6RSQvd0iEr/7nuYRGirZD3R6UnEKfTuQojQkyXdhFlrrU/tWkG36UCFFEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888809; c=relaxed/simple;
	bh=vGaY96z3+CdzTHUsRA640EFQXAQoGZMYdPR5gqmMj74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzF0HRntxCyT7ix44BouQN64muMqGpS/SVqqZnCuA2nIihXhysRv71pQgp31KWQAJcvv+khV6iCfpvkCa+34XKALVc3oAhKxR/0xs985NwBaofSLUDHum0AJYBlCm6bn6p9F74mR8fp2cYibMruOiYCT9CJNrI5CdbrZqZRFGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F8y0dypX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F8y0dypX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF3C35ED;
	Fri, 15 May 2026 16:46:42 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FE0B3F85F;
	Fri, 15 May 2026 16:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778888807; bh=vGaY96z3+CdzTHUsRA640EFQXAQoGZMYdPR5gqmMj74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8y0dypXACVOsN1hwrekfmA51RYuoQlmdkj0KfQZczvVH9TMzSKKcbPJ7Qtr97aBA
	 XJfEEB/8KUU9Q4tkiKERnJP/y72nwlgy68HeT6yRBo/agrCSlTa15qyf4DibTpxtRm
	 B27tOviU4gF1j5+6B8MPXWxVn6pdIyYva0+rFM50=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/5] spi: sunxi: add support for A523 SPI controller
Date: Sat, 16 May 2026 01:45:57 +0200
Message-ID: <20260515234601.15431-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260515234601.15431-1-andre.przywara@arm.com>
References: <20260515234601.15431-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI controllers in the Allwinner A523/A527/T527 SoCs is very close
to the one used in the R329 and D1 generation, definitely as far as our
driver is concerned.

Add the new compatible string, but use the existing config section from
the previous SoC generation.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/spi/spi-sunxi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
index 08b603f04a2..4e91cf6b7fd 100644
--- a/drivers/spi/spi-sunxi.c
+++ b/drivers/spi/spi-sunxi.c
@@ -587,6 +587,10 @@ static const struct udevice_id sun4i_spi_ids[] = {
 	  .compatible = "allwinner,sun50i-r329-spi",
 	  .data = (ulong)&sun50i_r329_spi_variant,
 	},
+	{
+	  .compatible = "allwinner,sun55i-a523-spi",
+	  .data = (ulong)&sun50i_r329_spi_variant,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.46.4

