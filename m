Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A836D513
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 21:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764539197; cv=none; b=fE+5QBZ86nzY3AMja7TD3KKZOKhPzy2fd3fSHW8TyYszqfw9nQQD/PH6glSXA+oFfrIj8QV1Tg7z04fcE/0jU3XnwFcoOXHDHBmq9ajZGQjTLYDRBgXKd6qZaK+wh3OB1Xknb0pfhmE8yPKaTK7pUjZVOSkRyKgbRL0XxSqlwqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764539197; c=relaxed/simple;
	bh=CFG2W3JtISCVhPCvMYQmLmzdHb0+M97uNT8O8uYdCUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHw8E6c2dL6rLV6mIhBnUqWBKpMQQGwti3GzSo69+ihW7Y8tGamzwEHxgkAuE2BXuwVKFVWaleLIGwL2ASCtFod5+1mvOkkMppTbGh0uPAVPwBDttX775rj2hIlnEftjXeHO6PWdv6P5LRRPP1XW4VeDt0no6U5qWN7zDQYzpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 966BC340FC2;
	Sun, 30 Nov 2025 21:46:33 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 30 Nov 2025 21:45:19 +0000
Subject: [PATCH v2 10/10] sunxi: mmc: enable support for A733
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-01-a733-soc-support-v2-10-18bdd4376fad@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
In-Reply-To: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
To: u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=CFG2W3JtISCVhPCvMYQmLmzdHb0+M97uNT8O8uYdCUE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBpLLsV3e4TOAio2hkGQhGNfVTWxMKLkA+S3lxNs
 WnBLz0DYWuJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaSy7FV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TpkD/9MBrLhkmfp4lRgrK
 /cWR6/XWZvZUOQa7/l1yo29Z2dxesKysW4lFsQQFnYspNaxpdUUut2r7zT1nR+G5Tx9EuH9pag7
 NVJf2MQc06wpiYGLgd3tG8Yi2u421Jauc5rjONVuF/ETVYOPeB8JUkUkNb2w7sjbai2prrDmnv1
 OOeDpAqCHdmBXgRvPcEPWsFIFB8Ahh54n3XR5HRQVqTQwpy6fohBZqh3UEGXml7gG3dnFwVjBUt
 UUBsVg6NMVzYiTVHaMs0xjOfFnZzvlnAVfR680zHu6la2J2lmv4ibUsfjlK9EG0nzAazhrXTtfp
 3hndRHofIHf4RwSaB1w/9JKiNOLzmkySCLTOcRw0owZxQEFhzc8tF65oqwCmF6292B5rZ+y8u86
 fV//BC39tlRADQHmiyb4PVy2BbXFjc/cQv2CYsjThQYf0gMcJ1rftoAlmPU6HX+CKJeUjs3CTv5
 zPd2RC5Po9RBFP2Iq99QP0oTNuqmIEbYGLxyD0tH/tY9lf7yrhMp2aRzJuFqOMeW91j/wsCpasj
 ufq/sDqNMoJpZXIjYmyzfOZtauhFQRJgp/tqSYySxPx4TpPSLesvs1udmqcGzBNe/nnZR6bCXdD
 zZtjIErltHiJHvRvIOnyXIOdBfsYrmP6zdCUdchjM7wgd6IWK1vQHQiTzGAY4oEP93ZA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Minor clock adjustment for new A733 MMC controller, the SMHC0_CLK_REG
start at offset 0x400, and with step size of 0x10.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/mmc/sunxi_mmc.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index e28c81afffe..689bec6693c 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -112,6 +112,9 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 			if (priv->mmc_no == 2)
 				pll_hz *= 2;
 		}
+
+		if (IS_ENABLED(CONFIG_MACH_SUN60I_A733))
+			pll_hz /= 3;
 	}
 
 	div = pll_hz / hz;
@@ -167,7 +170,8 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 	}
 
 	/* The A523 has a second divider, not a shift. */
-	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
+	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523) ||
+		IS_ENABLED(CONFIG_MACH_SUN60I_A733))
 		n = (1U << n) - 1;
 
 	writel(CCM_MMC_CTRL_ENABLE| pll | CCM_MMC_CTRL_N(n) |
@@ -661,17 +665,28 @@ static const struct dm_mmc_ops sunxi_mmc_ops = {
 	.get_cd		= sunxi_mmc_getcd,
 };
 
-static unsigned get_mclk_offset(void)
+static unsigned int get_mclk_offset(void)
 {
 	if (IS_ENABLED(CONFIG_MACH_SUN9I_A80))
 		return 0x410;
 
+	if (IS_ENABLED(CONFIG_MACH_SUN60I_A733))
+		return 0xd00;
+
 	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
 		return 0x830;
 
 	return 0x88;
 };
 
+static unsigned int get_mclk_size(void)
+{
+	if (IS_ENABLED(CONFIG_MACH_SUN60I_A733))
+		return 0x10;
+
+	return 0x4;
+};
+
 static int sunxi_mmc_probe(struct udevice *dev)
 {
 	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
@@ -707,7 +722,7 @@ static int sunxi_mmc_probe(struct udevice *dev)
 	ccu_reg = (u32 *)(uintptr_t)ofnode_get_addr(args.node);
 
 	priv->mmc_no = ((uintptr_t)priv->reg - SUNXI_MMC0_BASE) / 0x1000;
-	priv->mclkreg = (void *)ccu_reg + get_mclk_offset() + priv->mmc_no * 4;
+	priv->mclkreg = (void *)ccu_reg + get_mclk_offset() + priv->mmc_no * get_mclk_size();
 
 	ret = clk_get_by_name(dev, "ahb", &gate_clk);
 	if (!ret)

-- 
2.51.2

