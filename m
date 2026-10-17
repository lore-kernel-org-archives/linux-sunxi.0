Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F1429037
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266377; cv=none; b=UzF0E0MwWK/uSWcvWtyl93yFQ/I04pvzprBX0JfyG/JcG+KHYEOpygu7j7JuwtT83oD5blYj8X0lZbsxFZrufmQC6crXT8kY6zlfiz3f56RYe5Ja4WGrgatXOC8RDF9SUi9v6df0NG3EyrPsX1qNQNYySWFgpHFrMBKSztbrC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266377; c=relaxed/simple;
	bh=mN53hNOFiAzhWVgJjfpGtTS1jmZz/HpF/K3uG0lAfxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtbZsrmBQcKFJEF2gj2Vq2NSRGFZeUw59AeNVWdtRMVLmIqDpQ+HovJKTKrRTGGqZJ8hDk8ZKoDXuduqDcnZdjqCRSa+egvJjY/6CnSMw1fbwCRkLMi9GpqWmgiv6Q6VlNeL8dQT7FJ2Xlk+CBJQKaXubz97vwXM7okx7ELs/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwbDWKkJ; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwbDWKkJ"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4c9859ea2ceso582854b6e.2
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266374; x=1792871174; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=GwbDWKkJeKoNJxiZgBGhCN/xXt32p0Frlbrfb9kaJh8Mx4/3vXcQzSxhk+kymDFlA9
         ++bc/ihlbW4uLDn0e8jAmSfIvkhPzg6KigTMK0SX5Z1td2y/mHb9O1erq8t+Nqq3kjKq
         RRnSuFeNbw81UBkEIuX2fgw3Do35vA/7H9+X4O0NRlVdJTFc1bWbUFq2nhyFtYnwRbDV
         fkg3e8G+xIComwPz4P8B9BlqV9uIIXIM6yqL9oO0eFDhZM6RzgmBl5IhmBxifZk8YDU5
         F0HfwJ1pqumflmKRhBhbEI5Sxa+jtG69LyPg0oQCVzPiZG+xxPsVQPVtgyo1fgzKOlcT
         QxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266374; x=1792871174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=H1P45lECiThjtJECynUuSrvvO8IR/NnE8t3QikV+32jInpexnoGtjXSByZehcM9+4e
         C0GrOR0Zk/wVMe5CoKnt8vDjaygIg3njkSRMMnwWy4/Qu7r9lIHYUwCznq1Tu0GJznqX
         0KVKymLIsp7LvIktJXn1RmD0XYI+SdoqhsOs1QH+ehGJ2RcwteD80Gjy6SB85PVhWaoO
         kFFkrTljLeRugs1kHCHmT+Z7iH8Mjfoai/wCYCvozkfLQtxYEWdJXARsSjf3AgBW3u37
         CgqmQKHjs9g4eVgDrcFQqdUxt8hZpcJklEjI1n02YL9JhFjwyqjia2+qO7OOgQ8RsNgE
         KL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGAFLJldvgsEq0kMx76bfMT+Tbrih6itUHP6DU0sM264Ua2rXBBswxlxcGs7m2fCFLlzewWMkcVpsx9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLy3U/ZzuJZ3ht7IbFE2fJLT7FD8letmBuAkUAr5tSWwFK+lRF2
	ztgg5dNqLy3n2FuxLbqJfFSppwJpBsdclbSlcSAGV3hWfB2FZZbeOkb2
X-Gm-Gg: AYBFou2qzYTSOyD+ZWKbgPmgrJPNU/iR9uYE2s2/6KkPicMAhiUhbxPv8JK1DkMVfv+
	QUWug85YkCL1SrsWGorYv1/TTWhTmHv48NSNassrGRYl7ICUuvERAQaZmb+EiNLracSrmPKbMed
	I89lf6CxVb/fJpCPXxB/HUwzm28sgLU2k5tOinGvrMdXYGrfGAN22z1eBziorqTu4+bDkpnPiQj
	rZiQa9rXx5s3XXOsaCz34TfabfCfkjWGXgn+Se5INviUneit9wlBKaTdrRr25pGoW/sKew00BhM
	ylmXdefEsHhold4VrmMJLt/szPkP5TFxHo2JYmtyMoBd1ZlqnczDx4E6e/7vyAiXcBVDF7GEnFd
	yenrmCIj3kqGogfg2kPMLLIhgZFo+8bovR592c+Y1c/j+YgToJA016G4hg/ulPbKkcQ8twBlXt5
	vijtLVSHuzBOt5h4txKKYNi7vUV7YtYi0oRGSNYC/vrIiCh+eF0KQkmYlW5iKvHw1JbRXtEGPuw
	zQ+MlPFDCIJIHs98urRo6If7tPlCPaq0hZ0t+e47Sl41e2h817yzSPuGpzKx+V26Lx5/G5n1fmr
	jaMmkNBi0TK8L4klphB3HjT5N7VffoBwOLaU1WtcjJkbIkxJeqPVBp4CBf9MkxUrJhkxnijXwXP
	UkuIvHkt5bnu/6Fsy/rZz
X-Received: by 2002:a05:6808:30a1:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-53ccaf1dc47mr3423128b6e.18.1792266373854;
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:57 -0600
Subject: [PATCH v9 02/18] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-2-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..bd2193d7259d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2230,6 +2230,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0

