Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420A57C706
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196470; cv=none; b=csB6o7HsfbNftpRHwJ+Hwv9uGwX8COI5t3XGWBA5hAhnJ1Ex7mmFkKD7bZfHpfm9tL3WvH8EO1IwSSWwt5iWFGuTBez1/SyRwXi2EVcjPErCLx1C8ZglBTgHwr8SjGptxp0ixqCtRJ559mMbt15VP0MqZPV2gcHe2+DAlrCjVxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196470; c=relaxed/simple;
	bh=DYM49ne6atEAPBbwp7MW6XIu2N107jKi+6HoBXrWSjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zt8xtyISnWxAtslS7wF40aBPgaYnjqvvjXTh3dmva0OBu8VRQAH8n40z2z3fnEFJ3DLolbt9LesTEKqv38wznclLsMxs9G9Kq0BLAT5GcDOzCIcX6nuf/sAfYIcnInWbfaRLRm6qnRXD7ESfoNf1lvxu65TTzEgNBVhvovj0lAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BCn1UzL+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BCn1UzL+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so9976805e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196466; x=1790801266; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q38gPulPuKur3IEZF2LFNkQp+BQq6YW8/OlTIlhL7Jo=;
        b=BCn1UzL+coTnpzSTi8AbDApnuNcP2UKBmMOuWpnwZSFnOQN+2W8zkqTlRINxVddMFz
         mPklnW2mOQWG8ilqjakPkkBEVc6cej+cg12P1D3cE9hdUuIkEhpvzx6tXEH7pWhpXYZ6
         lxcaycEQITcPrxpyBuEZnOxF6rQSas4VKTVeF3mH3vCtHo31tEEK4C35JdEDERt9VTOs
         5WV+7Td46MEIZr9Z7HCW7IXOQ7FGxc81k8c/7A3SOktreHMdDOH8nBT8iEteP+mlfPrq
         opRpeaPKKL7NkG7XBzyrpd5wr3pEbtdvHkdizHefEhyR76zQKEilAWRNljC6oj39v7Tf
         hdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196466; x=1790801266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q38gPulPuKur3IEZF2LFNkQp+BQq6YW8/OlTIlhL7Jo=;
        b=IfdFDR+8r05qD6Rh3yGg1il5u2DhztCrVjxFHCdl0QeKGQpTA7DM7ZXZT3f4wSvoSj
         MxGWLK4awVZ6NzdSJB/FcO00nN5PsH/qHDzHgNrZytHIbKri/6Yx2vRvbSjl6sycUbvU
         YxykX/FHn/EasDf0HyQOZIWWvMsWrcRy7u5y6qAfB11obcHhDzDOhidlZN9DxmGZR9+A
         NBc+zozhecZpPR/8bMElmXwK4HSDB+2MKUkcukWmKetfHL6SmHc56nCkSiI2Wk1wENHm
         1M1tf2dmK8xeJcZ/ZFmOf6umNmLx2GMWpe50sa4yTiJK6k6CIXi+t5VJaF7khommlCFF
         2aDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSMi8HATmIvo9R5TzEOiV2ceoILKBFvHqCqfcUuA41V+OOZp+uE9oEpo2gG8PIPXw/fL9qZ7goJfEiyQ==@lists.linux.dev
X-Gm-Message-State: AFuF++k4kqgb1Wky0m9Uu5d0x5Ilyq6fJMBf6YtpJyfZAjaTv/PWIQYS
	gYXtRFk+RylHFXdXqFB0sR3XIsbJJwbusWBaoBmNdHbtsWbXWp9fdSDsF6OKqiGSgGc=
X-Gm-Gg: AYBFou1YU6hvaEGrkeaXILrZPUrOmAGDnJnR0tnHpTiCz0edMltZlZJXyMk85gtRUYb
	Vxf3pFFRk5LrOD1Af//RWQV78galul1isuGkmOZ5UsJNmdRVNo20jQBYfgSrNrsS0zITTYRSxm1
	Udozky+XpDRTWOEg5jvC/kspLOll0hhKjpuA41Oh/E/NGdBHE1rhtnc9yJTegGmH/Bf0WalmD4U
	Ngb59rjUjMdhP5uXbGmQSGkALSVa0CS2/fh46M22sYZ6nKXt4SM/vNDhzRrpO4C7KKYQN+OOVO9
	YD8p86rZVrvTAclpjRBbOu73OqNTs7kV3SddVbm/lj9X/Ssg7IfFdwiQH2/bvZjd8VrzmmfVgcA
	SUp45EBbsANXe87yC5VV6alrIT5h3AaGKI+mSBRWFasYt8xhpmjyHVD6ftoyLHCZ5+IOxqlx75L
	nuJ112GHB0iOlrwvKyKXWtQf55Tm8y9tbduizV82wHg4mj6nj52Fj4ToG82u3TRGO8irXJn6cpA
	NtWzzbr/VeNWBJM7g==
X-Received: by 2002:a05:600c:1c0b:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49fe66dfe1amr7799915e9.24.1790196465888;
        Wed, 23 Sep 2026 13:47:45 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5df44f9sm11367675e9.11.2026.09.23.13.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:32 +0200
Subject: [PATCH net-next v3 2/5] net: stmmac: sun55i: Add per-compatible
 match data
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-2-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=DYM49ne6atEAPBbwp7MW6XIu2N107jKi+6HoBXrWSjs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN66bpWrmPz5JntSyopU3pdTNryr12g0buPx2RphV
 zNNfNP2jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyEM5eRYf7qmbuZ5Q3skvb5
 ZNtkmHIU7X2ubZlgtU9wQ6y2xfYHVxn+J69n1tIWZfwm0hWTqKwxVf0Y28P2zvazHA1199pWmxl
 wAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 glue registers are in a dedicated MMIO region of the
controller rather than in a syscon, at a different offset.

Add per-compatible match data holding the glue resource init callback, the
stmmac flags and the glue register offset to prepare the support for the
A733.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 68 +++++++++++++++++-----
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index 862df173d963..c4df53285007 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/stmmac.h>
@@ -23,8 +24,6 @@
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-#define SYSCON_REG		0x34
-
 /* RMII specific bits */
 #define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
 /* Generic system control EMAC_CLK bits */
@@ -37,18 +36,40 @@
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
-static int sun55i_gmac200_set_syscon(struct device *dev,
-				     struct plat_stmmacenet_data *plat)
+struct sun55i_gmac;
+
+struct sun55i_gmac_data {
+	int (*init_resources)(struct platform_device *pdev,
+			      struct sun55i_gmac *gmac);
+	unsigned int flags;
+	u32 offset;
+};
+
+struct sun55i_gmac {
+	const struct sun55i_gmac_data *data;
+	struct regmap *regmap;
+};
+
+static int sun55i_gmac200_init_resources(struct platform_device *pdev,
+					 struct sun55i_gmac *gmac)
+{
+	gmac->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						       "syscon");
+	if (IS_ERR(gmac->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(gmac->regmap),
+				     "Unable to map syscon\n");
+
+	return 0;
+}
+
+static int sun55i_gmac200_setup(struct device *dev,
+				struct plat_stmmacenet_data *plat,
+				const struct sun55i_gmac *gmac)
 {
 	struct device_node *node = dev->of_node;
-	struct regmap *regmap;
 	u32 val, reg = 0;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
-
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
 		if (val % 100)
 			return dev_err_probe(dev, -EINVAL,
@@ -95,7 +116,7 @@ static int sun55i_gmac200_set_syscon(struct device *dev,
 				     phy_modes(plat->phy_interface));
 	}
 
-	ret = regmap_write(regmap, SYSCON_REG, reg);
+	ret = regmap_write(gmac->regmap, gmac->data->offset, reg);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
 
@@ -107,22 +128,34 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
+	struct sun55i_gmac *gmac;
 	struct clk *clk;
 	int ret;
 
+	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
+	if (!gmac)
+		return -ENOMEM;
+
+	gmac->data = device_get_match_data(dev);
+	if (!gmac->data)
+		return -EINVAL;
+
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
 		return ret;
 
+	ret = gmac->data->init_resources(pdev, gmac);
+	if (ret)
+		return ret;
+
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
-	/* BSP disables it */
-	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->flags |= gmac->data->flags;
 	plat_dat->host_dma_width = 32;
 
-	ret = sun55i_gmac200_set_syscon(dev, plat_dat);
+	ret = sun55i_gmac200_setup(dev, plat_dat, gmac);
 	if (ret)
 		return ret;
 
@@ -138,8 +171,15 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
+	.init_resources = sun55i_gmac200_init_resources,
+	.flags = STMMAC_FLAG_SPH_DISABLE,
+	.offset = 0x34,
+};
+
 static const struct of_device_id sun55i_gmac200_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-gmac200" },
+	{ .compatible = "allwinner,sun55i-a523-gmac200",
+	  .data = &sun55i_a523_gmac200_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun55i_gmac200_match);

-- 
2.53.0

