Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D23909B9
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109369; cv=none; b=R2/NUANqzcIy6MDujEVYU0vmLeW8K4uNHszojnTEnKK4PE741ktLwyxYk4ooofLCnxK+UOWO/ZOQdcTWiJw468Fxac3RKbOqP0rDL9fHb38v6jFEoAJIsKzMndPzAbf7QOUHCESG8YjYGo44eDdTOmnWgt70Vu5VSB7wh2hyPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109369; c=relaxed/simple;
	bh=vXMUV2NHdzO2bVhOLxgO//r4EwHkTLLI06VBSO1JtTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQ2K1Y8BsAhdDwOn8vRf197kav3a2R0OEcPDh+LsJR69L4Q66AyoKLA4Fw27tM054DulL3wmO5TSYh9gbW9l/wL+Bg5KmWHd18tPw0oBQ6kFBIWtbcuO44ILKxAS0PvEJKzl+HUXOy3ZTvd7wgSb7XNmHZemJEqp2EdHHHB33zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3DzyV/Q; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3DzyV/Q"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca88130e09aso3505118a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109366; x=1784714166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=;
        b=I3DzyV/QeTpQ0sus1VW/CkqHhDAb73GJlZBtFShpDTZ28tHvZtQ8euFYZOu3qxQL8p
         6RNuzU4wHUZNNeTkPeIMN6BIdC0+tUJ6YDB4RLvRoWS5WCNajlnhARINJR/2t6T4/feC
         wWOrm1zt5KqWlqTdcUtZiUYUEBeXu2KFOauAQEImMSKvNWWBxkSelrZMPic6VhmCe0cb
         sUQ82doulJQE4dXKxJMTrfllokNk/pvb+kICn90Bm4zZxkP3wVq0t/H4FmcnfXqB4Y5r
         V/GHEaayTFfpPvZ29/Z/3VQgdiO6cxJqBIVn4cVdzSs5eeDMHKOo+oRJHzZ4xOLRPDXn
         b30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109366; x=1784714166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=;
        b=CYrBg/CaaSdEg5eYMvJx1lD3UDNA4yipNN+l1545BjMTV5C4gTlS9vmNZY+c4QUU/q
         Oo7PqcZOoHDVr2VFZZ2mlZkfse2ejyMKZJ8tL6w03w4kzUHBr7FyDzR6BvW15Z4t46ug
         okeH8D9FuR14jjkpQcpnUAHltPdXYfKwd9JTF35xCe2s2BYWyxuGz2iDya1wjSOBwJX+
         G17pNGXIQ4R4ehdfiXvYzui8SkeJ/CcmM4/Gg0PSuzH2oyO/x6s31chV8TdHHtGmLeQ9
         +CKZhMUYB4/yyxS34EYBfj/RLJ2OiAC4NgGLRCN1jqZBcAGUaeu3xVKL0aU4vMEYC0VU
         f77w==
X-Forwarded-Encrypted: i=1; AHgh+RoQPny/8FPmpEcw6mZ/TGFvjZyKNVdImM5ayLvsl1ks/LaYy0iNtw00XoSqGhemKIahJ9uWbIq7QcQYCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5V+ufQN3wm/XhA/HkFl9117aJ2GDDH+x/5IXfObm8YHsu7OBU
	cZ683uwTMIBN648YoiqSUuWaw5vHSjso43+00dNOtB4nHnheNN686paV
X-Gm-Gg: AfdE7cnAyA6u4IIjTLMJYKpLztP75z/GRXdp/67rVQ/AhtKFD0NQnt2SCJGJjVKWriB
	KCAEcQg0ZyT90TiH/Rv94McmWWkYXN8mhK5VKpFtVPYJ/CHVR7MOrIwgxOI3O7hhwbCamYUxOe8
	Q2SaI4pxxAQSKGbV9L9QBwLGRNsiHktz7F4g1XHu7H0C2EkdxvnVEYL5vzgCLgbzmD0tka1TaS5
	M+/7jsPtsOA99Kx/IQ9Dyxu/8wi72agn/IMaDCO0GAlie1BwNepwUW12xG+hRREAXoo/Zm6EdTG
	lWj4cGjWl2QhPkCtTksBzkxS9QpKs48j7JwI3tx8GHFlVQXfNLo0R0Z3RnhhUR8kk0IaeNf6748
	j7cV7nFlbhgXSJjBA0AX12ShsuB1g33iF3CyGBM8F2vxVRiiZ5a7qXmeVjpWSiL19KrVE7q42zC
	OdrsOyAeS4GZssirUAnCAQy9+fMmvTjbMQ6Li4rGUjQSC90rM=
X-Received: by 2002:a05:6300:2787:20b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c370196776mr1215140637.66.1784109366301;
        Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/6] ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:22 +0700
Message-ID: <20260715095525.40668-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 40de99a34bc3..716fa4d872ff 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1550,30 +1550,26 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bus_clk = devm_clk_get(&pdev->dev, "apb");
-	if (IS_ERR(i2s->bus_clk)) {
-		dev_err(&pdev->dev, "Can't get our bus clock\n");
-		return PTR_ERR(i2s->bus_clk);
-	}
+	if (IS_ERR(i2s->bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->bus_clk),
+				     "Can't get our bus clock\n");
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    i2s->variant->sun4i_i2s_regmap);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "Regmap initialisation failed\n");
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
+				     "Regmap initialisation failed\n");
 
 	i2s->mod_clk = devm_clk_get(&pdev->dev, "mod");
-	if (IS_ERR(i2s->mod_clk)) {
-		dev_err(&pdev->dev, "Can't get our mod clock\n");
-		return PTR_ERR(i2s->mod_clk);
-	}
+	if (IS_ERR(i2s->mod_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->mod_clk),
+				     "Can't get our mod clock\n");
 
 	if (i2s->variant->has_reset) {
 		i2s->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (IS_ERR(i2s->rst)) {
-			dev_err(&pdev->dev, "Failed to get reset control\n");
-			return PTR_ERR(i2s->rst);
-		}
+		if (IS_ERR(i2s->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2s->rst),
+					     "Failed to get reset control\n");
 	}
 
 	if (!IS_ERR(i2s->rst)) {
-- 
2.43.0

