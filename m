Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612002;
	b=SAJrdPpQDJJfnAfWWWKxq3EkVD7FpqtKs+qm1D1vfET85NbuewAw/Ia+oaeYNAQPuGMZ
	 SHz2cvwqmIIn5Sc3KvTSaSye+JpXRriEZjfVqKyx9BVlVBt1Nf17/coHWlNCkdcbuNhHA
	 Op83wfO73ZK3rZj7xravsVv1ErIO48jnw5vx0L7MbX7q2d18QVYltJYtjufHtvphsRXgo
	 aN0mCTSg5z4HfvzQLqBYt2ZV2E7hKVGiVaPA1bik48XFA4ZDJjqLMmqjpEPl6v8O4B0SD
	 /PDLdRGuHHv2kuiWmz9BCfhYD3WvhbcZMybWI55Qao/VjGlIegclO7sE7elswScgx2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612002;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kqeu82JGuADzn7hPG3PlKXptf+4XC3aShLFUHiEemow=;
	b=zxaQ/rRTcYXEWbK+W9da4JB9BnzgsVxuHgZYAsNfDWwrHAdQoJvTmJ9VhwRA78hU/vSC
	 IHJWahGZ4WsJ20R1W8Mm0h8jgnsSvCGht2NPa1NvEMwLEotVxqO/UfoA3eam/BwtPub/b
	 88iAkOic943jysgS/ToKkEB35M7SGURY5gEGQ1r6lAoq/NJe9POxh71nJVsuuYvNzGG96
	 SB78AlBZOrpwM/TYmbGNLMj9XICnKoPrlcX3W9kzF/jZq1HeEBZxkv+l3Uyu+3zoncY44
	 tU0On4Wx7CJzqDy1th8VJYA8O15kNrP/NIQg1OKeHgLTzT2v0IFdn1ESoIFxEtF/Phw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="hgLpTh/U";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84EC606A321
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 13:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=hgLpTh/U
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id CA0C04C94E;
	Thu, 26 Nov 2026 00:06:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795611992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kqeu82JGuADzn7hPG3PlKXptf+4XC3aShLFUHiEemow=;
	b=hgLpTh/UDZ/rfBqtkUu9YSEV02J1WXcCRKDGBLDOuNSPF2z3UOpKEif/O82QiibICiGm5B
	QZmlME6utSibVjJjr/iMA+r6ap9sDB89i31ADEyKcDuN4FI3cwOw4ueZcvZAhvYjDFhVFI
	kImnNIij4X/6aUvpnJvrLG3tMHdhkAN1h3d9UCTHVQgkDH77Zx73BTIEVzq9e8inPD8Fww
	0GhHZLapk1M4m3Bv9KlViPfXxWnOhWP2Nm+ddtfosQxinAZVm/hYOcCQLBvt8j3/Y1KGMz
	fyIzAGHyPeKKc0B0iHHPqGD7OCrpaubDDmZwmx73HiLyFxpyRTAWz4qW9/Pjqg==
X-GPT-Reason: This email is classified as legitimate personal/professional
	correspondence. The mailbox alastair@d-silva.org matches the sender's
	domain (alastair@d-silva.org), and the content is a technical kernel
	patch description regarding "net: stmmac" and hardware-specific
	"Glue registers," which is consistent with a developer's workflow.
	No phishing indicators, urgency tactics, or suspicious URL domains
	were found, and the message follows a standard Linux kernel mailing
	list format.
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
Subject: [PATCH 3/5] net: stmmac: dwmac-sun55i: Add Allwinner A733 GMAC210 support
Date: Thu, 26 Nov 2026 00:06:11 +1100
Message-ID: <20261125130613.4191841-4-alastair@d-silva.org>
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

The Allwinner A733 GMAC210 controller differs from A523 GMAC200 and
requires SoC-specific glue handling:
- Glue registers reside inside the AHB reset domain, and stmmac calls
  plat_dat->init() before deasserting stmmac_ahb_rst, so dwmac-sun55i
  deasserts stmmac_ahb_rst prior to devm_stmmac_pltfr_probe() (with a
  devm action to re-assert on error or unbind).
- An active-low clock gate at glue offset 0x80 (BIT(0)) must be cleared
  in init() and set in exit().
- Hardware splits the 5-bit RGMII TX delay across [17:16] and [12:10]
  in 180 ps steps, and uses external GMII TX clocking
  (SYSCON_ETCS_EXT_GMII) for RGMII rather than internal GMII.
- Enable STMMAC_FLAG_SPH_DISABLE, STMMAC_FLAG_MULTI_MSI_EN for the
  per-queue TX/RX interrupts, and STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP.

Add sun60i_a733_gmac210_data and its glue handling to dwmac-sun55i.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 98 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index e872e241a220..c7117802abb8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -19,11 +19,15 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/stmmac.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
+#define SYSCON_GMAC210_CLK_GATE		0x80
+#define SYSCON_GMAC210_CLK_GATE_DIS	BIT(0)
+
 /* RMII specific bits */
 #define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
 /* Generic system control EMAC_CLK bits */
@@ -42,9 +46,12 @@ struct sun55i_gmac_data {
 	int (*init_resources)(struct platform_device *pdev,
 			      struct sun55i_gmac *gmac);
 	unsigned int flags;
+	u32 etxdc_ext_mask;
 	u32 txdly_step_ps;
 	u32 rxdly_step_ps;
 	u32 offset;
+	u32 etcs_rgmii;
+	bool has_clk_gate;
 };
 
 struct sun55i_gmac {
@@ -65,6 +72,31 @@ static int sun55i_gmac200_init_resources(struct platform_device *pdev,
 	return 0;
 }
 
+static const struct regmap_config sun60i_a733_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int sun60i_gmac210_init_resources(struct platform_device *pdev,
+					 struct sun55i_gmac *gmac)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "Unable to get glue memory region\n");
+
+	gmac->regmap = devm_regmap_init_mmio(dev, base, &sun60i_a733_regmap_cfg);
+	if (IS_ERR(gmac->regmap))
+		return dev_err_probe(dev, PTR_ERR(gmac->regmap),
+				     "Unable to init regmap for glue region\n");
+
+	return 0;
+}
+
 static int sun55i_gmac200_validate_delay(struct device *dev, const char *dir,
 					 u32 *val, u32 step, u32 max)
 {
@@ -93,13 +125,18 @@ static int sun55i_gmac200_parse_config(struct device *dev,
 	int ret;
 
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
+		u32 low_bits = hweight32(SYSCON_ETXDC_MASK);
+		u32 max = (1U << (low_bits + hweight32(data->etxdc_ext_mask))) - 1;
+
 		ret = sun55i_gmac200_validate_delay(dev, "tx", &val,
-						    data->txdly_step_ps,
-						    FIELD_MAX(SYSCON_ETXDC_MASK));
+						    data->txdly_step_ps, max);
 		if (ret)
 			return ret;
 
-		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
+		reg |= FIELD_PREP(SYSCON_ETXDC_MASK,
+				  val & FIELD_MAX(SYSCON_ETXDC_MASK));
+		if (data->etxdc_ext_mask)
+			reg |= field_prep(data->etxdc_ext_mask, val >> low_bits);
 	}
 
 	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
@@ -117,10 +154,10 @@ static int sun55i_gmac200_parse_config(struct device *dev,
 		/* default */
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		reg |= SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
+		reg |= SYSCON_EPIT | data->etcs_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		reg |= SYSCON_RMII_EN;
@@ -145,9 +182,31 @@ static int sun55i_gmac200_init(struct device *dev, void *priv)
 		return dev_err_probe(dev, ret,
 				     "Failed to write glue configuration\n");
 
+	if (gmac->data->has_clk_gate) {
+		ret = regmap_clear_bits(gmac->regmap, SYSCON_GMAC210_CLK_GATE,
+					SYSCON_GMAC210_CLK_GATE_DIS);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable GMAC clock gate\n");
+	}
+
 	return 0;
 }
 
+static void sun55i_gmac200_exit(struct device *dev, void *priv)
+{
+	struct sun55i_gmac *gmac = priv;
+
+	if (gmac->data->has_clk_gate)
+		regmap_set_bits(gmac->regmap, SYSCON_GMAC210_CLK_GATE,
+				SYSCON_GMAC210_CLK_GATE_DIS);
+}
+
+static void sun55i_gmac_reset_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 static int sun55i_gmac200_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -184,8 +243,21 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (gmac->data->has_clk_gate && plat_dat->stmmac_ahb_rst) {
+		ret = reset_control_deassert(plat_dat->stmmac_ahb_rst);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to deassert ahb reset\n");
+
+		ret = devm_add_action_or_reset(dev, sun55i_gmac_reset_assert,
+					       plat_dat->stmmac_ahb_rst);
+		if (ret)
+			return ret;
+	}
+
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun55i_gmac200_init;
+	plat_dat->exit = sun55i_gmac200_exit;
 
 	clk = devm_clk_get_enabled(dev, "mbus");
 	if (IS_ERR(clk))
@@ -205,11 +277,27 @@ static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
 	.offset = 0x34,
 	.txdly_step_ps = 100,
 	.rxdly_step_ps = 100,
+	.etcs_rgmii = SYSCON_ETCS_INT_GMII,
+};
+
+static const struct sun55i_gmac_data sun60i_a733_gmac210_data = {
+	.init_resources = sun60i_gmac210_init_resources,
+	.flags = STMMAC_FLAG_SPH_DISABLE |
+		 STMMAC_FLAG_MULTI_MSI_EN |
+		 STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP,
+	.offset = 0x0,
+	.etxdc_ext_mask = GENMASK(17, 16),
+	.txdly_step_ps = 180,
+	.rxdly_step_ps = 180,
+	.etcs_rgmii = SYSCON_ETCS_EXT_GMII,
+	.has_clk_gate = true,
 };
 
 static const struct of_device_id sun55i_gmac200_match[] = {
 	{ .compatible = "allwinner,sun55i-a523-gmac200",
 	  .data = &sun55i_a523_gmac200_data },
+	{ .compatible = "allwinner,sun60i-a733-gmac210",
+	  .data = &sun60i_a733_gmac210_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun55i_gmac200_match);
-- 
2.53.0

