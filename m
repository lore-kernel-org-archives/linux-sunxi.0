Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0353FE644;
	Tue, 24 Mar 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370643; cv=none; b=tZmINWm0/ZBndNMjLtv4YxodcCBFiMCOguAc82ur/uCyUrzq8sEVKMqlea0Tr+9paapanP2GrFt6hVNNkRxCuaMSV1rUpPJMbM7bxKBIH0KgNvewt0+Hy8Bo4/Zeyf51r0ucUr0f7TEy+K0i5zmVbpR0qp5Y16bZ+Y9SQB3fnBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370643; c=relaxed/simple;
	bh=uNk+5l4j5lYbYuM0VQJOR8shYhm489bqZiHsaW/YJrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaW2XBGp/7vQSWWQ4yl/wJIFrQ67Suddo5JYK6JFcz5DeJu/0qLccsXP1GxQkiCj7JTwx/hSI2Nxtn1TObj5d2QbCiLZX4g0u4EB2+5PFUmmLgCR8uamx8HKk5imYyfZce493zCt06CDpQRJv/PAmB+yGJUYIj60Wd6GxYpEIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnmMkuLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnmMkuLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC357C2BCC7;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370643;
	bh=uNk+5l4j5lYbYuM0VQJOR8shYhm489bqZiHsaW/YJrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gnmMkuLIPy/3dOerLZTV5S9nifmLUuXUBt129KvZCUgiuvT5AR7PRnkgLwOzsl9YE
	 vNFMk3Xuhhv+zaJz2gK15DayDFcFTwNg/O/s6Ubtd6fgBxW8u5I5JmSqp5w2zGnEEE
	 AyfdhQgdTQbymfSYQk8ZXYx/IowOksUxdzuXhqo7C9265L3pI/GRQ9hiNk7P8AGPce
	 2o9b6JPJ0ljamfWCpMCrq5/s8qiDZugyhabkOuKahenbdVMgG1wPOdzVluAkib0Oqc
	 lwwM78NZ1IQVf9Bc3oUJOmig9LtB1US3PxTIKN63JgV0LD3n9gpC4WFLkxGnp2YMs4
	 OH0BAewXE9rVw==
Received: by wens.tw (Postfix, from userid 1000)
	id C06785FEC0; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] soc: sunxi: sram: Allow SRAM to be claimed multiple times
Date: Wed, 25 Mar 2026 00:43:52 +0800
Message-ID: <20260324164357.1607247-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the H616, the SRAM C region is an alias mapping to part of the VE
SRAM (accessible in whole at a different address) and part of the DE
SRAM (otherwise unaccessible). As such both the VE and DE need to claim
this SRAM region to prevent access from the CPU.

The SRAM claim API is designed so that a "claim" routes the SRAM to the
peripheral device, disabling access from the CPU. So long as the written
register value is the same for all the claimants involved, allowing
multiple or repeated claims is trivial. This is indeed the case for all
supported SRAM regions. The only known SRAM region to have multiple
different settings is the SRAM C2 region; this can be claimed by the AE,
CE, or ACE (assumed to be AE + CE). This region is not supported, and
likely will never be needed nor supported, as there is no documentation
for the peripherals involved.

Change the SRAM region "claimed" field from a boolean to a reference
count. A claim will increment the count, while a release decreases it.
The first claim will trigger the register value write. The driver
otherwise behaves as before.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 5e8c80ae3509..aba155379ccc 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -12,6 +12,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -38,7 +39,7 @@ struct sunxi_sram_data {
 
 struct sunxi_sram_desc {
 	struct sunxi_sram_data	data;
-	bool			claimed;
+	u8			claim_cnt;
 };
 
 #define SUNXI_SRAM_MAP(_reg_val, _val, _func)			\
@@ -244,9 +245,11 @@ int sunxi_sram_claim(struct device *dev)
 
 	spin_lock(&sram_lock);
 
-	if (sram_desc->claimed) {
+	if (sram_desc->claim_cnt) {
+		if (!WARN_ON(sram_desc->claim_cnt == U8_MAX))
+			sram_desc->claim_cnt++;
 		spin_unlock(&sram_lock);
-		return -EBUSY;
+		return 0;
 	}
 
 	mask = GENMASK(sram_data->offset + sram_data->width - 1,
@@ -256,7 +259,7 @@ int sunxi_sram_claim(struct device *dev)
 	writel(val | ((device << sram_data->offset) & mask),
 	       base + sram_data->reg);
 
-	sram_desc->claimed = true;
+	sram_desc->claim_cnt++;
 	spin_unlock(&sram_lock);
 
 	return 0;
@@ -278,7 +281,8 @@ void sunxi_sram_release(struct device *dev)
 	sram_desc = to_sram_desc(sram_data);
 
 	spin_lock(&sram_lock);
-	sram_desc->claimed = false;
+	if (!WARN_ON(sram_desc->claim_cnt == 0))
+		sram_desc->claim_cnt--;
 	spin_unlock(&sram_lock);
 }
 EXPORT_SYMBOL(sunxi_sram_release);
-- 
2.47.3

