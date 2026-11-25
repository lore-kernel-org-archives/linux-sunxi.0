Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611995;
	b=5cMn1Pt1zzBa9h79vt7iQCV0FIeJ0IzLP56ns1qqAYagsHZUWWg61U3dsyj5j6m60tpF
	 a4AdCfCyg5Nk7PVhP51ze7HRal5GJOVFlKZIdK080rZcsHk3tDKPhHiavioy5qbRAugSB
	 Of03xzgz+4taMVdV3mZx95oYUlCRc9vDVI0BiUEjaorF8bglvUD/ljxmkIsyijhkvbWp0
	 LtifOacD4RpzeN5YpGvbjwUPaj5fu49cZuglHXpHZt+C5U6tS58jgFny4C+N0FRYzYpHr
	 /8oOBLSVIvMayyQeDolkm9EYDRpMp8Uz/q99z6bjX3JKXhZ+NRSVSg8YJd89SKrQOLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611995;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uTktEettK5eGENESmmHnlrYHfFrP7BhhYLppTL7WtPo=;
	b=EzNhh1k+M3IA0IRjtzzWCsVhMbG7drmPZ9xH2oJkfEnhpKiQBa9bFtGfCBJJVum5wvoX
	 TZLYDfwxr2XJN/Vu6wkmnBEMCJff3Otn/MEwyC1MM99hlYWuqiQKk2HoHZNzPNwknuXQF
	 EKcgaN23aCIwFwZDkKOfzHbkjeT1OF/9ssZZ2EU5WrQoDpAVyN5RgiLUknzktZc4Fbfw/
	 LHmWkTAdrRLMXI7PDqEb5NpVF/JUjhYsj9hU6sZ/PZrXQ3w4/uJsmPJHjPtbKG1zFN2bW
	 97E46KEe+wOqZec2t5HZi32IOcKTpmWxLQoKlB+LrdUG8UZk1BlWGlY7zHdfPhgN01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="s/7Amoia";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976B606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 13:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7976B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=s/7Amoia
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 5F8224C953;
	Thu, 26 Nov 2026 00:06:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795611985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTktEettK5eGENESmmHnlrYHfFrP7BhhYLppTL7WtPo=;
	b=s/7AmoiaKqF0MLOzRQIz4kIehqrY/oXIeORDRxQgGrKwdTlvE5XVQlGKEJfb8aeIdxSR+D
	UrpLq/LD7oWxd2Kd18OxAKPjp9SI1T5sR1ZVJuDnaTnQY+u8w/+OTplOkxqW0E/D2z4VwN
	5VMcCPj2mw0c3dPBpiR2+ugcWLZEGHGdMyWGqn3VedWN3cTwG3bbR9bKihl2cJ+O7JzyCq
	XPlrWR3dTNyy3ARtVv4got/icXLfQgWPAqbmGEOEed8rwN87lywpCkmrpzcLRc6XOaoD/j
	KW73EZET2UDdQf8yfoxQW7GbdOm/uofdQlMSoy6JKvLeVm2tcOAh1GSvqai1Pw==
X-GPT-Reason: This email is classified as legitimate personal/professional
	correspondence. The content is a technical Linux kernel patch
	submission ("net: stmmac: dwmac-sun55i") that perfectly matches
	the sender's identity (Alastair D'Silva) and the intended mailbox
	(alastair@d-silva.org), which is a known personal/professional
	address in this environment. There are no phishing indicators,
	no suspicious URLs, and the technical nature of the "Signed-off-by" and
	"Assisted-by" fields confirms it is a standard developer communication
	rather than unsolicited marketing or a scam.
From: Alastair D'Silva <alastair@d-silva.org>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 2/5] net: stmmac: dwmac-sun55i: Add per-compatible match data
Date: Thu, 26 Nov 2026 00:06:10 +1100
Message-ID: <20261125130613.4191841-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125130613.4191841-1-alastair@d-silva.org>
References: <20261125130613.4191841-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwmac-sun55i currently hardcodes A523 syscon lookups, glue register
offsets, 100 ps delay steps, and stmmac flags, and writes the glue
register only once during probe.

Introduce struct sun55i_gmac_data and struct sun55i_gmac, and move the
glue write into plat_dat->init so settings are restored on resume and
A733 GMAC210 support can be added without duplicating probe logic.
A523 behavior remains unchanged via sun55i_a523_gmac200_data.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 136 +++++++++++++-----
 1 file changed, 103 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index 862df173d963..e872e241a220 100644
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
@@ -37,42 +36,78 @@
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
+	u32 txdly_step_ps;
+	u32 rxdly_step_ps;
+	u32 offset;
+};
+
+struct sun55i_gmac {
+	const struct sun55i_gmac_data *data;
+	struct regmap *regmap;
+	u32 syscon_val;
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
+static int sun55i_gmac200_validate_delay(struct device *dev, const char *dir,
+					 u32 *val, u32 step, u32 max)
+{
+	if (*val % step)
+		return dev_err_probe(dev, -EINVAL,
+				     "%s-delay must be a multiple of %ups\n",
+				     dir, step);
+	max *= step;
+	if (*val > max)
+		return dev_err_probe(dev, -EINVAL,
+				     "%s clock delay exceeds maximum (%ups > %ups)\n",
+				     dir, *val, max);
+	*val /= step;
+	dev_dbg(dev, "set %s-delay to %x\n", dir, *val);
+
+	return 0;
+}
+
+static int sun55i_gmac200_parse_config(struct device *dev,
+				       struct plat_stmmacenet_data *plat,
+				       struct sun55i_gmac *gmac)
 {
+	const struct sun55i_gmac_data *data = gmac->data;
 	struct device_node *node = dev->of_node;
-	struct regmap *regmap;
 	u32 val, reg = 0;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
-
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
-		if (val % 100)
-			return dev_err_probe(dev, -EINVAL,
-					     "tx-delay must be a multiple of 100ps\n");
-		val /= 100;
-		dev_dbg(dev, "set tx-delay to %x\n", val);
-		if (!FIELD_FIT(SYSCON_ETXDC_MASK, val))
-			return dev_err_probe(dev, -EINVAL,
-					     "TX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
-					     val, FIELD_MAX(SYSCON_ETXDC_MASK));
+		ret = sun55i_gmac200_validate_delay(dev, "tx", &val,
+						    data->txdly_step_ps,
+						    FIELD_MAX(SYSCON_ETXDC_MASK));
+		if (ret)
+			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
 	}
 
 	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
-		if (val % 100)
-			return dev_err_probe(dev, -EINVAL,
-					     "rx-delay must be a multiple of 100ps\n");
-		val /= 100;
-		dev_dbg(dev, "set rx-delay to %x\n", val);
-		if (!FIELD_FIT(SYSCON_ERXDC_MASK, val))
-			return dev_err_probe(dev, -EINVAL,
-					     "RX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
-					     val, FIELD_MAX(SYSCON_ERXDC_MASK));
+		ret = sun55i_gmac200_validate_delay(dev, "rx", &val,
+						    data->rxdly_step_ps,
+						    FIELD_MAX(SYSCON_ERXDC_MASK));
+		if (ret)
+			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
 	}
@@ -95,9 +130,20 @@ static int sun55i_gmac200_set_syscon(struct device *dev,
 				     phy_modes(plat->phy_interface));
 	}
 
-	ret = regmap_write(regmap, SYSCON_REG, reg);
+	gmac->syscon_val = reg;
+
+	return 0;
+}
+
+static int sun55i_gmac200_init(struct device *dev, void *priv)
+{
+	struct sun55i_gmac *gmac = priv;
+	int ret;
+
+	ret = regmap_write(gmac->regmap, gmac->data->offset, gmac->syscon_val);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
+		return dev_err_probe(dev, ret,
+				     "Failed to write glue configuration\n");
 
 	return 0;
 }
@@ -107,25 +153,40 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
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
+	ret = sun55i_gmac200_parse_config(dev, plat_dat, gmac);
 	if (ret)
 		return ret;
 
+	plat_dat->bsp_priv = gmac;
+	plat_dat->init = sun55i_gmac200_init;
+
 	clk = devm_clk_get_enabled(dev, "mbus");
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk),
@@ -138,8 +199,17 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
+	.init_resources = sun55i_gmac200_init_resources,
+	.flags = STMMAC_FLAG_SPH_DISABLE,
+	.offset = 0x34,
+	.txdly_step_ps = 100,
+	.rxdly_step_ps = 100,
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

