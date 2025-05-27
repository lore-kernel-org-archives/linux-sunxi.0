Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8828850F
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368595; cv=none; b=uiKKZOWGs+AO0kFSeX0F9By2FIUDSPJ5Qkz5M6yZinNrloiyMgqnQ1KhBw55IyaZO5xULclm3XliNdA7nh3EbQzrJoWH4wnXM9v+jPG82scnS+HhM6G0156/kkLTmI9BclH4MJ+cj0QncwBVsi4irXr/mVivospzmMXUD2GTdFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368595; c=relaxed/simple;
	bh=tex/uD0w2dWBw2SvdbOmRsdYC71bPLdJZ97hYpxcaSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HYX8khI1V0oDjrs3jpno5khRTVLGucNOO37WAHtqnTiP9H84tvjR4nCwsnRudpIt6VNGKur1v/adqG39RjUm1sfIBvbzZio/IUscQrL+4vcY4BbPsQy9n/CgBjyWrNtT2GuC2hj8WygEVoLjN30zCte5A7TugYIChvFBhO+PU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6f5fBCe; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6f5fBCe"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso32413226d6.3
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748368593; x=1748973393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=;
        b=Z6f5fBCen7h0QdCd5foArCLlE/0/p76UaShXuqcsFfwpWRp67fLUSshMZSlUar4ynG
         c5hDWPpcU7KNLyKoTYlSH/v8YXkhdhdto85816Cf96rHBaBorItu+KTx9WVyygbJDH3f
         k4YKs13cTZPvZVI8/hFSI0tY9HJqABBVtavOvY9VqotPwkVTan7MQMBPy5MaVjLOg/YX
         BMabjIusIkYC3pDFnX18bBm8V1Iy6HC2KGRxjlHf/lD/sWurVua+O7fqQPIFifkGnfWx
         ZSdSSh0sS6JEdZWJeJhqE9bWg7CAx3DbzzYTzJ0QpCQrfr5A0qEYk4wP/tIB1iecKXiw
         Ql2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368593; x=1748973393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=;
        b=CL6xrrdZfwNiPtZK/wRJxzlqEWm13mJ1+73SV1r4rRRoqSQ0iAExb0B+Vr6WLyTAIP
         3H6AwIPz6PmOU5QJiXf19ruz1hH6yyFjwz5Mpvhfd6z2m3rixXrx5sn5S5+oS7TQ+MLS
         +vyCxIfuxygSdRzKWYRlH7ZrFul/mhBpzXKtPAoFO5fx+pAepj9/O6ddbt6Fx8yJeXv2
         I4xi2MzazXlP4uS1z8ixF7bIt5YElsohbGRr1jizyThNrk7llfI3LBWI+xGyYufbQDqF
         1nr+v+lTy/gzwB0qk6mA8v6FWzsSSqPs3Ev/bc3nvbj5KzTvHm5kohjUuGT4Kw93SMEU
         qAEA==
X-Gm-Message-State: AOJu0YymB2PSXa9Sj2l9amSXs5piBkl769uqfC1yLRVisme6KLT+ux+x
	2UZFJJ/ulNQW/aT3FL0+FFWjXWsNBDVMeb72TggsfvMIB6SPdWhMo22Cstx27vOsBGM=
X-Gm-Gg: ASbGncv93x8idMOHz4NlXQraWqtotF832Q0lcve9BTle9+fpuh1CqDYEzSr7DpxLssQ
	69l7UvE+x76DUubqOfb7t0L2kmtl8XNKDXAOnFVwfrAv78MKZAIfAN16DYDvA+rek0U7fNlPEmj
	i0PnvFafbFiavw8stidhfi61IF78eldzofOiCNBJUk3sweliUVYaTAbIpVkLKhV3/8GnTYsVh/z
	rTvWi7S1BSOsWZmlWjzlw3vKHAl4tMrzzmx8napkLka2Fpo20FJ8nRuM1NuC4awjx13NdfKCNAk
	3DC7uipml0W5fbk2315+NITz3ClsEqUu/fUHNMMNTP3Mw/pIKM+72IQOmBHOHK9zuxS8R0F96Jm
	LibNJp2Gkq6Qd+W6Jl1RHSGx2sBx12g==
X-Google-Smtp-Source: AGHT+IGb7ZAkz0DXl6pr3hb3Rtl1mnfnjPXpzgihCk3W+jtxghNllqAVA4MuKf6P/Nz/db42HhLmew==
X-Received: by 2002:a05:6e02:1b05:b0:3dc:7563:c3d7 with SMTP id e9e14a558f8ab-3dc9b6a1250mr157952185ab.12.1748368582436;
        Tue, 27 May 2025 10:56:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:56:22 -0700 (PDT)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] net: stmmac: dwmac-sun8i: Allow runtime AC200/AC300 phy selection
Date: Tue, 27 May 2025 11:55:55 -0600
Message-Id: <20250527175558.2738342-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527175558.2738342-1-james.hilliard1@gmail.com>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 ships with two different copackaged phy variants,
in order to determine the phy being used we need to read an efuse and
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

