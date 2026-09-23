Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA8557D235
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196471; cv=none; b=imFO1V/DT49sDIDTx/dIrsfNmbnC8mXj1ht+rNz0lrvp0WWN2p58YmTnGXaeEFm+v5FSdBo7/3RvWDs3neZjG1mCj6iz44Z+ioCbQQYiDoxfy72CADR7sNxbRkVE6g7KKFBsDujmp4dTMnRtOfTDVh4Zq+qf7tJwwickrd/Mxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196471; c=relaxed/simple;
	bh=u9upVCC3m/gwC2XGPIk9ZtnVEycENGqh8TgoKKLgrfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXGNMhJY/NktAJajIP51ha65i4HHFidQYaYRpHfMUXsS4eQP+JHqpUOgkPlAKG8QzvTGpDYeJ5pqfRdQk7PVaFfdola752yRFLM3gKxzrFAr6mfY7A3AAyhtIBzWndNtLVlEhta3rqeIo+/fcS5fxGvQtvYet6gpHd+VAa+y2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j5tGXJA5; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j5tGXJA5"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so803037f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196467; x=1790801267; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NLzzVKxNDn2ENtNLz5RF0HuOFGSUxWDx/tiLwjYhuM=;
        b=j5tGXJA5osei7fOUIqVLKLxkmniwgbFbMrK8Z2+Ydzt0XgZaHfezlpqkcM58sOV8r0
         jFge4Nv/CF9M5WguoPsYiRy0kAbK0VB4T5uG2+8EHFOLUFXOPpZYaaK+CT4gn9bOEsaJ
         wqX+nd/jCk9/ZglY4Eux4A0tDm6tnwE8FECVuzwPljjmzVp7n4bTTWvRy0U1PIrNc60G
         kPhZ7a9XRicR5C74PkkNxGFEjXtEK2vGbgv6zwNFQ/4yg8N/BkywXQIqxMnsdnF6L2eg
         natI19c/wPOM4thUPD2anBfxnsuohPHBupdtEIMMjaXi65PRG+oeoNBKFtnWRtMrUzty
         qibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196467; x=1790801267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NLzzVKxNDn2ENtNLz5RF0HuOFGSUxWDx/tiLwjYhuM=;
        b=d6YWyvqlyrocb/1DdOk/0z6cerrLTiip0jouRivzbApcJWpTDJJEnP/K/F/7RZrOhL
         VIDxv2+ddm7jSot7q+KWgTK5wtaC9XmdH5aLeGq0blcUJLQ3Th0p+AbjERx2J6PuOa+W
         +QKi1nTwIgUVmkjNxLuK2T/M4AA0/TAc8HsrbejBSbBF91bR2SdeT+04+Op5WsnuHQ3z
         hvJrXxYdChC21HqhNxZKF0T+gOR/adMfLGC5XcpK94NDAyeOogvrkZOjbDQ9pzuI3eGx
         aYbCZV8E/sWHBpMYLJO+cuNek+i9F5rbQE7rn6gX4Kutj9k2RNOhQA3OI8wvUcdP09l3
         0eeA==
X-Forwarded-Encrypted: i=1; AKwUvByx/Q9tqvM53xnVL6LDDOcK3X7GoY8bB4FN1OOubTXILd6IWtEX9zUqLXCI2oYYaT+WKTTqoS35pm2/Gg==@lists.linux.dev
X-Gm-Message-State: AFuF++nENu9MSQtacC00hJiQ+7wWFcdZFLzltGJxSPq5ixYarmIGZEI2
	CZriXhvc57HEskmDQgcs6YkGpF/Yguk8LyWXvaTOK4YLHMiuG8G+/akY2Z57z8Ulf0k=
X-Gm-Gg: AYBFou1xpuQMPMmoOArXHZ4Zhwu7rQnKwBYBNpb7rcCjfuOKcZjzjVJMtxqaKFoR7j5
	oO7TLctk1+tHfGIWz1wXKQL8P3t/rB+t+p4rdDIKD/H4jv/HztAIJ2hJ81L0IlBqsMfq2znLBu5
	j66ZnkANl9RDOIYX5vVhN0o4mK0gIjWuTg13FLK5/xrkWHrzdHVFHbtw1LPAMCxJMPd9+8JCx2j
	0a5ZFwdR1YYaYl+4Do+t6VOMGoFNtKSyAtx9bUXRq+qJdh86OAZcipy+E/Oxr8wO6sXdIsc/Fp2
	w6VZgnU2r1wkf0WyldKjNCLYgboBzrQwS0mqFMHWg5rjG80EDYvmcQz3XxfvXIfzIQITpsOTrI5
	YZ+UQQndS6OROrDOlo7Ok1ruvTVHzc6Bj3JkmGXJIuFai7z7H0MDweMext6+haBfahnTZJIPxyj
	0/kdsIfsNhOFfPPeq32CbBrmhKjmSyP3xyxh9FymaZRKOM/nT71ABHjRXhKFjixk8xyycluPtsM
	kdC3wJbcunr+KDfvg==
X-Received: by 2002:a05:6000:71a:b0:487:40d:af29 with SMTP id ffacd0b85a97d-488716f76edmr444910f8f.36.1790196467054;
        Wed, 23 Sep 2026 13:47:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889337sm9555748f8f.34.2026.09.23.13.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:33 +0200
Subject: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay step
 configurable
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=u9upVCC3m/gwC2XGPIk9ZtnVEycENGqh8TgoKKLgrfg=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN5++fKN4ddvzswl7GeD9uxYOzue282oeJfBhyx2d
 Xbd7V47OkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRaD1GhmnNNr1V5r77khQ4
 HbX25/9bvu3Dzwuyn7OsgrnebXjtspyRYdbv72zn5HrC7edE8K44+fH1tYCm98+630TxzXNqrpr
 /ghEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The driver assumes a 100ps step for both TX and RX clock delays, which
does not match the A733 GMAC210.

Move the TX and RX delay steps to the match data and factor the delay
validation into a helper. The A523 keeps the 100ps step to preserve the DT
ABI, although the vendor reports actual steps of 180ps for TX and 530ps
for RX.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 58 +++++++++++++++-------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index c4df53285007..e759311f40fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -42,6 +42,8 @@ struct sun55i_gmac_data {
 	int (*init_resources)(struct platform_device *pdev,
 			      struct sun55i_gmac *gmac);
 	unsigned int flags;
+	u32 txdly_step_ps;
+	u32 rxdly_step_ps;
 	u32 offset;
 };
 
@@ -62,38 +64,47 @@ static int sun55i_gmac200_init_resources(struct platform_device *pdev,
 	return 0;
 }
 
+static int sun55i_gmac200_validate_delay(struct device *dev, const char *dir,
+					 u32 *val, u32 step, u32 max)
+{
+	if (*val % step)
+		return dev_err_probe(dev, -EINVAL,
+				     "%s-delay must be a multiple of %ups\n", dir, step);
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
 static int sun55i_gmac200_setup(struct device *dev,
 				struct plat_stmmacenet_data *plat,
 				const struct sun55i_gmac *gmac)
 {
 	struct device_node *node = dev->of_node;
-	u32 val, reg = 0;
+	u32 val, step, max, reg = 0;
 	int ret;
 
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
+		step = gmac->data->txdly_step_ps;
+		max = FIELD_MAX(SYSCON_ETXDC_MASK);
+		ret = sun55i_gmac200_validate_delay(dev, "tx", &val, step, max);
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
+		step = gmac->data->rxdly_step_ps;
+		max = FIELD_MAX(SYSCON_ERXDC_MASK);
+		ret = sun55i_gmac200_validate_delay(dev, "rx", &val, step, max);
+		if (ret)
+			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
 	}
@@ -175,6 +186,15 @@ static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
 	.init_resources = sun55i_gmac200_init_resources,
 	.flags = STMMAC_FLAG_SPH_DISABLE,
 	.offset = 0x34,
+	/*
+	 * The actual delay steps reported by the manufacturer are:
+	 * - Tx: 180ps
+	 * - Rx: 530ps
+	 *
+	 * Correcting them would break the DT ABI of the published DTs.
+	 */
+	.txdly_step_ps = 100,
+	.rxdly_step_ps = 100,
 };
 
 static const struct of_device_id sun55i_gmac200_match[] = {

-- 
2.53.0

