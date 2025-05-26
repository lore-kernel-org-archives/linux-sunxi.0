Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD82405ED
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284217; cv=none; b=fSnTGXR81NjrYcz1w59wkzEUE/7Xt3UDpQxyJwtzITSFEmcRri8va85Xg/9lED0+59JZ8xVFBQJtiF/7CGZj/BowBHmC3AIH4CXHrAUMf2WO2ypRQOSg0CIXzCtLLMe0S7TgYBHjmJ42aZJ/wGvADrHdvbBa9wu8mj/qXqV/MEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284217; c=relaxed/simple;
	bh=n9lLa9aOW+o9DIrjLgE71KlJZvLdzhrLz9GSBZNuZrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p7m+3vWztxstQYbFK9oZm+glzYfFxNpihyYLG6byNlD3sZ88sugKhScXOZ7hgwUQKcq+C5q4CkF977tR6wOUOyWsbGuhzd4OhSZnv3ZYPHIIdfoPATUZvXKOFbX+EH3mNyZU5fJAT1gWMeV4RuzdSgMlWIb4N+FNOSz4nQ0qH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwyN5UES; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwyN5UES"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso68974639f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748284214; x=1748889014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=;
        b=cwyN5UESiL3P/hX2KzocxQdSMgypCSfPTtsKe4EpuEkE/Y6T9y8WvfvpOvT5gkgmsH
         Zqj4foDG28Fka+6CJtzzQh4rTNeJvvkEPPLrWnBb0BfQQYqkOaa3ITccHP5vS2k0CJjQ
         paMZggJbb2L6NYOog3W+9vIro36zx5tDdspd2QPvmvUhSFyUFbPZdpcLBzXswXpmVtmX
         k7cQkzLigDr7Ch0lHhNk+pjfqkun4/FZqJ5NyFElhmSpy6NvMMXc1T+ti5bN1Mqbi7L1
         KVXrK1VtOdasJEkHVopgkntIFB3ARoi2tu4zkFDlKbrCQkXR/xoa+VsRZeqCYu2fHrg2
         MWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284214; x=1748889014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=;
        b=pc16zz9pZK2wMyczOELwHEADW9UBpfhyA7CWM63TFme+F9btCT9PCcJ/NQpvbT9XeI
         utjhS7xtRcjJ9YvhJfcFpKLLVdbVFdrZZAZfbj36E8Gp0nsFhTq9iunchy0ZmYkWgNvr
         VxP85vlxHTmbbCS9VLgw+3q/SelMTw3yUm+xioChhiYaw960vVj/fnYns8UTVt6XiSFG
         AB2x6ckb1JfXS80QXdtbgqN5jc8tYk/ALCk5U9Zc+qtWZcUr1NAKkXJMzeua3f2PHgrq
         QSaKDQDyzHqr4+HnmEfx4jY38S6KcTfpJ4GxXAqxAQLxNPOTFMpNJgeY4pag8PFGh+O1
         gZ7w==
X-Gm-Message-State: AOJu0YzwCS1IBWf9jNFl0Vr3ohjt4731pMuAOZBFy+jP+b7zbw8eWzl/
	kxD/REEQghGvaPJK7aZRAOY4ZjadRxvfB0LOpBkZxmksLP17HsLubK8Q
X-Gm-Gg: ASbGnctTFo8LM3+srXEB1DioLWRhWnH4HPOwuGL8zreHCX9UCc+PiPzEHUOSNk0Q9zh
	ut0xwIlsKdLwkWUg54e1ngpHO7l5BZUa+GSmjScBltbdvS4DSBeO7kQ46mU2ZB8pqfpSR10uFta
	uC8VD8v84iDgt9vD100FYvQnVNnIHF9uN/RBa/amlAYUIQEZZRKH0FbZK7e1DilOhRNvi6DKvFI
	B0sQSFfZgJUmPbsDhtxJHLwBnWoTQlQ5ElFfjSVmZ4a8j1e8A494tzZdz2Kr3k6KE4uTBjT0ZKR
	vkunDNX0ywzDTeu+9MnJHZterlWUH6j7yvZMhSWUP3z04629O9OvNWKANCnM1X9O31I62SMLg+9
	WfD8H7X0cyJxVjKjsuGB1Z3hnl5Ds2w==
X-Google-Smtp-Source: AGHT+IFDdvdL5g5ovSs/1gRBNnLk8GUjN90DAUSZdCdx+omEcVNlJWEAmQHeKYZ7rWqPkDPPkFePrg==
X-Received: by 2002:a05:6602:750c:b0:867:6680:cfd with SMTP id ca18e2360f4ac-86cbb7b82a4mr997010839f.1.1748284214365;
        Mon, 26 May 2025 11:30:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:30:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime AC200/AC300 phy selection
Date: Mon, 26 May 2025 12:29:35 -0600
Message-Id: <20250526182939.2593553-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526182939.2593553-1-james.hilliard1@gmail.com>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 ships with two different on-die phy variants, in
order to determine the phy being used we need to read an efuse and
then select the appropriate PHY based on the AC300 bit.

By defining an emac node without a phy-handle we can override the
default PHY selection logic in stmmac by passing a specific phy_node
selected based on the ac200 and ac300 names in a phys list.

This allows us to have a device tree that defines both PHY variants
even though only one will actually end up being used at runtime
based on the ac300 nvmem efuse bit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6c7e8655a7eb..50d37876fabf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -11,6 +11,7 @@
 #include <linux/mdio-mux.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
@@ -280,6 +281,8 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+#define AC300_KEY		BIT(8) /* 1: AC300 PHY, 0: AC200 PHY */
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
@@ -1149,6 +1152,35 @@ static struct regmap *sun8i_dwmac_get_syscon_from_dev(struct device_node *node)
 	return regmap;
 }
 
+/* H616 SoCs can contain either an AC200 PHY (needs i2c init) or an AC300
+ * PHY (no i2c). The silicon variant is flagged by the AC300_KEY efuse.
+ */
+static int sun8i_dwmac_get_ac300_phy(struct device *dev,
+				     struct plat_stmmacenet_data *plat_dat)
+{
+	u16 val;
+
+	/* If the nvmem cell is absent, use normal phy selection. */
+	if (nvmem_cell_read_u16(dev, "ac300", &val))
+		return 0;
+
+	const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
+	int index = of_property_match_string(dev->of_node, "phy-names",
+					     phy_name);
+	if (index < 0) {
+		dev_err(dev, "PHY name not found in device tree\n");
+		return -EINVAL;
+	}
+
+	plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
+	if (!plat_dat->phy_node) {
+		dev_err(dev, "Failed to get PHY node from phys property\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int sun8i_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1222,6 +1254,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	ret = sun8i_dwmac_get_ac300_phy(dev, plat_dat);
+	if (ret)
+		return ret;
+
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-- 
2.34.1

