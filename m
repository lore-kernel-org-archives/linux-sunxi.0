Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A906407101;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370645; cv=none; b=isHaq0I+rRuEZT8c6v+l6y+9FZ0u6WLVqkU5PB7JLhvQGL80/wJG2Rqz4SlQCR/zKgajStfHxyC/wTdYNGb8S5bPjGjIDG7g2rItWayQNYcobSuy+DDNwQBFEUStDsidCrQIHr3amn24f+BPmzstMZhat0Xcjn2yweW4ltzh5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370645; c=relaxed/simple;
	bh=b0m0FnMqUK3YcK+u1bAXX+KhD9qbCEgekt0QI4jDH9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZQ1UhvEELnRP2DuKPr53BONlhFU22hnJxwb7P91CtrL6tsfN+/c06D0kG2T561DwS8jlZlmNKNzhfEEsrxBI5bdCFmkX8ShnT9hgQTLtGD+922GW9dtegIp9me9/8G/aAE6+wofMdNt1xU7p4f7tOoAH1ZxA9OXgEepNF3to4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3o8s0Ol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3o8s0Ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C6AC2BCB6;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370645;
	bh=b0m0FnMqUK3YcK+u1bAXX+KhD9qbCEgekt0QI4jDH9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3o8s0Ol4By0oYHYu2S85is0Yw89BKW8tT0wJQwH6GAicXAoVwsw9NyoEqTrGrmT3
	 d6lQ7pzdiVGr4OPazoq7jhAC68KzgOBKtXlJLFcpOUNdxvSRLPCaEE235HqCUJAnN6
	 mlKtv/132wg0q6Qmq3bqCNaRG7m3nc877Q8S+K9xYumBzTdG5JFcPY8mPGhaBU9FNb
	 4wBkwNfDU6rwcdBSIt/2L3XWjsn0bXGtrDCQDNHEWS14VlTXRuDLeWD0C9HrDnzGtQ
	 gG7xfCX3rSGROT0LfF8/uISCwAWzK711a7YLVhfWP82qZ9tkTmbRdBKcMmBsZDX39M
	 48wsqiXWrwuFg==
Received: by wens.tw (Postfix, from userid 1000)
	id D76AD5FFBF; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
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
Subject: [PATCH 5/7] soc: sunxi: sram: Support claiming multiple regions per device
Date: Wed, 25 Mar 2026 00:43:53 +0800
Message-ID: <20260324164357.1607247-6-wens@kernel.org>
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

On the H616, the video engine needs to claim two SRAM regions.

Support claiming multiple regions per device.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 164 +++++++++++++++++++--------------
 1 file changed, 96 insertions(+), 68 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index aba155379ccc..4d81897179e7 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -165,79 +165,48 @@ static inline struct sunxi_sram_desc *to_sram_desc(const struct sunxi_sram_data
 	return container_of(data, struct sunxi_sram_desc, data);
 }
 
-static const struct sunxi_sram_data *sunxi_sram_of_parse(struct device_node *node,
-							 unsigned int *reg_value)
+static const struct sunxi_sram_data *sunxi_sram_get_match(struct device_node *np, u8 val,
+							  unsigned int *reg_value)
 {
 	const struct of_device_id *match;
 	const struct sunxi_sram_data *data;
 	const struct sunxi_sram_func *func;
-	struct of_phandle_args args;
-	u8 val;
-	int ret;
-
-	ret = of_parse_phandle_with_fixed_args(node, "allwinner,sram", 1, 0,
-					       &args);
-	if (ret)
-		return ERR_PTR(ret);
 
-	if (!of_device_is_available(args.np)) {
-		ret = -EBUSY;
-		goto err;
-	}
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
 
-	val = args.args[0];
-
-	match = of_match_node(sunxi_sram_dt_ids, args.np);
-	if (!match) {
-		ret = -EINVAL;
-		goto err;
-	}
+	match = of_match_node(sunxi_sram_dt_ids, np);
+	if (!match)
+		return ERR_PTR(-ENODEV);
 
 	data = match->data;
-	if (!data) {
-		ret = -EINVAL;
-		goto err;
-	}
-
-	for (func = data->func; func->func; func++) {
-		if (val == func->val) {
-			if (reg_value)
-				*reg_value = func->reg_val;
+	if (!data)
+		return ERR_PTR(-EINVAL);
 
+	for (func = data->func; func->func; func++)
+		if (val == func->val)
 			break;
-		}
-	}
 
-	if (!func->func) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (!func->func)
+		return ERR_PTR(-EINVAL);
 
-	of_node_put(args.np);
-	return match->data;
+	if (reg_value)
+		*reg_value = func->reg_val;
 
-err:
-	of_node_put(args.np);
-	return ERR_PTR(ret);
+	return data;
 }
 
-int sunxi_sram_claim(struct device *dev)
+#define SUNXI_SRAM_PROP "allwinner,sram"
+#define SUNXI_SRAM_CELLS 1
+
+static int sunxi_sram_claim_one(struct device_node *np, u8 arg)
 {
 	const struct sunxi_sram_data *sram_data;
 	struct sunxi_sram_desc *sram_desc;
 	unsigned int device;
 	u32 val, mask;
 
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	if (!base)
-		return -EPROBE_DEFER;
-
-	if (!dev || !dev->of_node)
-		return -EINVAL;
-
-	sram_data = sunxi_sram_of_parse(dev->of_node, &device);
+	sram_data = sunxi_sram_get_match(np, arg, &device);
 	if (IS_ERR(sram_data))
 		return PTR_ERR(sram_data);
 
@@ -248,33 +217,28 @@ int sunxi_sram_claim(struct device *dev)
 	if (sram_desc->claim_cnt) {
 		if (!WARN_ON(sram_desc->claim_cnt == U8_MAX))
 			sram_desc->claim_cnt++;
-		spin_unlock(&sram_lock);
-		return 0;
+	} else {
+		mask = GENMASK(sram_data->offset + sram_data->width - 1,
+			       sram_data->offset);
+		val = readl(base + sram_data->reg);
+		val &= ~mask;
+		writel(val | ((device << sram_data->offset) & mask),
+		       base + sram_data->reg);
+
+		sram_desc->claim_cnt++;
 	}
 
-	mask = GENMASK(sram_data->offset + sram_data->width - 1,
-		       sram_data->offset);
-	val = readl(base + sram_data->reg);
-	val &= ~mask;
-	writel(val | ((device << sram_data->offset) & mask),
-	       base + sram_data->reg);
-
-	sram_desc->claim_cnt++;
 	spin_unlock(&sram_lock);
 
 	return 0;
 }
-EXPORT_SYMBOL(sunxi_sram_claim);
 
-void sunxi_sram_release(struct device *dev)
+static void sunxi_sram_release_one(struct device_node *np, u8 arg)
 {
 	const struct sunxi_sram_data *sram_data;
 	struct sunxi_sram_desc *sram_desc;
 
-	if (!dev || !dev->of_node)
-		return;
-
-	sram_data = sunxi_sram_of_parse(dev->of_node, NULL);
+	sram_data = sunxi_sram_get_match(np, arg, NULL);
 	if (IS_ERR(sram_data))
 		return;
 
@@ -285,6 +249,70 @@ void sunxi_sram_release(struct device *dev)
 		sram_desc->claim_cnt--;
 	spin_unlock(&sram_lock);
 }
+
+int sunxi_sram_claim(struct device *dev)
+{
+	struct of_phandle_iterator it;
+	int err;
+	int count = 0;
+
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (!base)
+		return -EPROBE_DEFER;
+
+	if (!dev || !dev->of_node)
+		return -EINVAL;
+
+	of_for_each_phandle(&it, err, dev->of_node, SUNXI_SRAM_PROP,
+			    NULL, SUNXI_SRAM_CELLS) {
+		u32 args[SUNXI_SRAM_CELLS];
+
+		of_phandle_iterator_args(&it, args, SUNXI_SRAM_CELLS);
+
+		err = sunxi_sram_claim_one(it.node, args[0]);
+		if (err)
+			goto err;
+
+		count++;
+	}
+
+	if (count == 0)
+		return -ENOENT;
+
+	return 0;
+
+err:
+	while (count--) {
+		struct of_phandle_args args;
+
+		of_parse_phandle_with_fixed_args(dev->of_node, SUNXI_SRAM_PROP,
+						 SUNXI_SRAM_CELLS, count, &args);
+		sunxi_sram_release_one(args.np, args.args[0]);
+	}
+
+	return err;
+}
+EXPORT_SYMBOL(sunxi_sram_claim);
+
+void sunxi_sram_release(struct device *dev)
+{
+	struct of_phandle_iterator it;
+	int err;
+
+	if (!dev || !dev->of_node)
+		return;
+
+	of_for_each_phandle(&it, err, dev->of_node, SUNXI_SRAM_PROP,
+			    NULL, SUNXI_SRAM_CELLS) {
+		u32 args[SUNXI_SRAM_CELLS];
+
+		of_phandle_iterator_args(&it, args, SUNXI_SRAM_CELLS);
+
+		sunxi_sram_release_one(it.node, args[0]);
+	}
+}
 EXPORT_SYMBOL(sunxi_sram_release);
 
 struct sunxi_sramc_variant {
-- 
2.47.3

