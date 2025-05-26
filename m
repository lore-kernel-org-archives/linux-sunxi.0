Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8AA4AEE0
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 00:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748219431; cv=none; b=uxxpwIoNDmqMlgQ2FdqKZ++1X/WEFRjhX6GUHZMc4OWZJxifuUaHzRfX6zcd1rD47D3N4FCqR5fj3Y/AaTsAz2M0WNT4N7WCSW7KExLfEJ07wLR8kzh1QRgIjLepe/NKiJnVGUiALOWuF1REEt9vFrP+/SORKewMKsbP6f7Osb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748219431; c=relaxed/simple;
	bh=j/AgqK6sTn7GZhod0s1Zdw40IxV6Jv0f8Ah9CoFUBmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uwKPJyLmwuBRyXGPR8PSMk4F2/Cb6q887zWWnc4lZC8kkUL+TbOQGk7S/cPXT0Lxy41y6UG5SrkVsPP4+dVN13R9Tvmy8K7ehwCfE+CWlmm5AagjcpfE4MEpkVPT7Ey1y+kPleGxChrBYSFJObF61bH0zfXy4xwifkDlGXmAZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGweSoLp; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGweSoLp"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dd24c86779so8123635ab.1
        for <linux-sunxi@lists.linux.dev>; Sun, 25 May 2025 17:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748219429; x=1748824229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=;
        b=CGweSoLpl17Rii5t5LeDnH7cMj1tGQlEzRWLD+HlYWhjY/o9ZWr/0VpOQdqghuqcyU
         khYdJzPnaA3FZbTvNxPjuRszY60FRJtQ06a5/C8yt4vIYvjV/muSs7xQ+fait6mTTYr+
         fH4HAu3TPBhoU7T5bFldhD7Tj2V6tjLMGDWPwCi4fXhZxGkIY2HQu/MWmCCYww7Wo67j
         AIkayAPJals+m4wPf3E6CyZ8LFdvLdfT9iovyKtUYD5vvGSXAMKe3PWO7EytFRHRl5EY
         xDB45lcfs1x73ZJN9RF62Wzye0iTalefQgu/0NooQtpW2Pb07XgQTfYDCq4d0+XGZvl9
         v+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748219429; x=1748824229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=;
        b=ty/VRzuAvxaHAWjyM9V23BcJn0amG39D6ivkyy4PkRBxZrsF+MOugbcivSjPe90IbU
         +HD2kYexMIg9zVvQIj+yF6XneQPGy4cDbxrccP2xO1QUyJTsaFj3ran6FIC/Te5T4S/a
         Nrbt9Ge7nIFN0SWiWsQnP2f0h1GBjlD4nEB1RMs8JzyBmANw+W7PrsoXwURVOpV36JB3
         J77jadPJ8NS2UFHKMIH6k8AKvD3xFuJBZDnNPIuQ3pMufRLsNBm/StM3naNDvqGITCuf
         DcGLipyokuraAXdx1l+JTopyONJt77vUPLyxW7MqzTTOygSfEDMMr1JI1rlbmRl1PvHQ
         42KA==
X-Gm-Message-State: AOJu0YwN2xb/GZvM3RMgyentq8Wf1FktycUOJkfyjZlL+n7QBu0Fc/xB
	kQwPmGV0nLlko5/VF2hlBQqJZhgJPhLVGDOg4DY2SPSXUxqPNVW/51Bm
X-Gm-Gg: ASbGncvIbs/6lhxsW/REeYSki+vXGax7fULXwTu2U3/fzi5WyoNt8u4miHK7qvZW9GP
	Fv3EOKnzgfnuPMi7+rCU2UFIcpUPMUfTkVED8ybTKq68bucG63EPqTzzpsF6mW9ABVEHy4uCY75
	XzBO5EaITr091vFIEOuTPcUevecizqQ1vCvN54FVrRNqQSGLlVfal1/AmvMY+DfbJUrp9Csj/hd
	PDVgOvN6Rk/Oy+PYWmUERapd3flh1kXpLhuaqVNzWcfkZ8cMEaQWhA2TAEY5jzx8IC7TlvLGceg
	zabfkOGM/2nxYdzqgvrOe2XS7rG8Mc/E3CLkAd2CJQ9pIr4nG9ySgtzdlRjO0lNY7KOumkH5Ljb
	kbXLIPNP6A5e/TOxurxZ9xZw0zHDZIQ==
X-Google-Smtp-Source: AGHT+IHeprWN0OT6Xq1C608Ko9smpP11pwLwlFe3T1+FZlCl5LSrUPerfPVKNYI6owNKSrybdMvlyA==
X-Received: by 2002:a05:6e02:2193:b0:3dc:8b57:b759 with SMTP id e9e14a558f8ab-3dc9b7517a5mr74670715ab.21.1748219428699;
        Sun, 25 May 2025 17:30:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc85ef07dcsm25532785ab.36.2025.05.25.17.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 17:30:28 -0700 (PDT)
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
	Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime AC200/AC300 phy selection
Date: Sun, 25 May 2025 18:29:22 -0600
Message-Id: <20250526002924.2567843-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526002924.2567843-1-james.hilliard1@gmail.com>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
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
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6c7e8655a7eb..e275f4caa684 100644
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
 
+#define AC300_KEY		BIT(8)
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
@@ -1159,6 +1162,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	struct regmap *regmap;
 	int ret;
+	u16 val;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -1222,6 +1226,21 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
+		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
+		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
+		if (index < 0) {
+			dev_err(dev, "PHY name not found in device tree\n");
+			return -EINVAL;
+		}
+
+		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
+		if (!plat_dat->phy_node) {
+			dev_err(dev, "Failed to get PHY node from phys property\n");
+			return -EINVAL;
+		}
+	}
+
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-- 
2.34.1

