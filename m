Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE53420E93
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979853; cv=none; b=ABNuytGqSID7CHOjmayKwtUQ1+rfDxiL+aj6sJmXYHahv4OLTZnAGL/AE6q0wXYEnTVkVGCFp3JHLZNeRZ5Vp7EA8boPc7xvwiW5D006YDh8pvz9M45Y9rwtWSA4w6TfbyBBWtYkMeq8D/Q7eInlZ29GRCK4xIn4XEYBQcppGjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979853; c=relaxed/simple;
	bh=xEow9YFv9tWxKuTGRmYBanqZYgnlQCz+XPTruWbAxlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZz4qh7bV4/bDeNravyVx4n2d2TfJn9HN1/++DzyI8KpKzKGl2flcNyqwjbCAkTblgZIfNOPiST22p70Uh8KE8jd8xlh/2fQY1x5pFJRVST/sp4LpS3KPRXf96R+eV1cVLBW7Icob0gANJ7aj1iDPT0npf3dpS/WJrNIR2trX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=exv5dv3j; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="exv5dv3j"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso8991815e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979850; x=1783584650; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=;
        b=exv5dv3jYNcpALyZS750XR6WAdBdy7+X9Ihzl6QjNJB3ub9je78fA2emuQuw0lJd1g
         hqjiYVYgVqoAhjYBzm2lnm1oygcA5MZh4BtMBwRhn2AVhCr7s7ML7deSm8PPNG6EGrJf
         tw3NRRGUYmXOKUOMLKDig53SpcFUWMH0BorXSlMphriRxrjH3/owmy/FPCj9vei1ORyK
         N3vqHZKBLCHy8nvTFtVpu6VS7MpIopnyRkQYqAhyywDvBJKMlGu4/Fe5P7QVdFAL+HIQ
         sJ2vwGjm9mL/5bLFX9x3krPe1gmku7Tu5/d3mqEvNSqfI4lQQ3Jw5jGqYGCr5Sbl8cxI
         cirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979850; x=1783584650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=;
        b=l1sdqQj4Pp+RNYh2mEIscXkVC2mULF6/MwLiuIcLV1BNURGqsytYCQOmBfJcvGul8e
         tx5BfmcEvFbIl0kqZ+dml2fl5B8wpmDz6esg1wMaWIwiAh8Ergb4vP43DRts74wAzTmX
         Iy3n4N47dEP8KIfUtcRuloVkNE6kGXI3l77D6Kafg9A6T5CfzHfd6RwZ/WlWQ88otSyA
         jNy948+9IQVu5NkRVZJuNEZH7rDYg+n32c84MQsMljgGtvbZ/gXR6Wa346mpGjDccWEC
         83RCaQtm08O9ibLODrpC2SehvjXWXB0v5XRdu5JEFvHd7xNNsObiBbS9CgodQ2B6cGAr
         B5Tw==
X-Forwarded-Encrypted: i=1; AFNElJ/p7NeA3rSuFpwDBSPdHmzn4usq96cw9gjEFSO9pbcaoO66yojq7S8zdwVrbcX4AmL9WLQ+eIlEgzTsLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3CvNzAiJKV7GirHYDujNfnJdoglH9PA9FKOhrFn0zTO3WTy9n
	pnsR+ZV+mAlhbyFOP7r3SWDKPIlZ7Fap15kmYn/Acy0mJ9kFRoIBUPXE47U3xrAb4UY=
X-Gm-Gg: AfdE7clQyHjoGxMjKNI3GdbKsKErdr6qwCbMxW2jfzytlVoFwweYgTxnOislai3eIfC
	wrah/T0u2MgisaDPhuKVjEJ1Q/PPEAfb4fyRwtv+nBbG7WHwyTIQtJof1iCd5Z/EpyNUzFrc/hL
	Lfy0jMWSyXMOVKgtSev04QJ1D5IjDqIm/eRE68b3qQNNwxkjFLYc40AMBLeni2CLsOuLUDMlqe+
	XyyEfIG/nTz/1cviIgvPV6WOOu0max0u7tGgfOEJYhGOw/ZMghXbdmEw9XpxLnJ9hYQMRKTsW2I
	3rG0fSgq+/fYZLZkEqpi+R9qjepN8cPwBqNfwGek9CC+PLxsK0MBpjoVA/VFqY36bDkvExK/Lxb
	cYC8/oD4AEOtniL4zjyzuww/VhZ8sOze7fNXhydtm3oZ/RSAz8zvh9E3Cnhb/PudRA8QhSyXeDZ
	tSeb8Pp8SYgY0=
X-Received: by 2002:a05:600c:4ba1:b0:493:af56:8e64 with SMTP id 5b1f17b1804b1-493c2b9e74fmr46177105e9.32.1782979849885;
        Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c636ea60sm26008745e9.3.2026.07.02.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:02 +0200
Subject: [PATCH v3 3/8] clk: sunxi-ng: fix ccu probe clock unregister on
 error
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xEow9YFv9tWxKuTGRmYBanqZYgnlQCz+XPTruWbAxlY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz4y0UzWpG2vq9pNsBeXNaVPQAXpCwoH/CqF
 5UKSr9tabGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+AAKCRDm/A8cN/La
 heBcEACG7fRdAKaggYdYW+Kmy5AukfFGo0WDxvZitKeqqERRluPiowtv+fiW72Eh+xmI6rB88xT
 A9NgJkcYyLsMKEa30ZOg6paZS/e1Wyfg3apNWs04HXG/SCHZ1TO5FUrXxjDAynwHEvOprtof54n
 ZLep4U6cVL48VOhgvX+nqF5WLDhVSQbK1jnIVR2kaMNj7a/240tzf/mAmrrUKOJMVH5qzNP1+qZ
 /PR38HOQLqe+7u8mM3QBRDraZ2jCio4OxQy1IgVN5hXCEXCiCf2FmN+bmfZ/jcJNZlBJ9GPgz4W
 G8PAZ3AvDVIcT8KAtgqJ2tCqZ3yeKPrXB28FAJc+40ocBqjJBa+LUWI+KqyRQe014Xyl/FMvbSf
 gQ3jd+LBj+Rzu0p6SMgkS1qdOhtsYBT3FX4LMuKFGeU66/pWtS8JorozPyetUsdhu1jVEafMysx
 EAdBUqHexlFlrIaiRITCK2q72pAO87AEBno0EjyJp50T3JM+X3TuZ3Q5DxPQeiLA6go+cc8p3yn
 w5SNHC+GNWQK3GXnqjK5KaUQkw0IJu/QZIk+UadfkrPS8A6qY8+MmDPytdCqXoXBn5SzIHQ6uGI
 lr7rCwIHXbb0Zb9O2YfDG2T/vooP48C9zFfsO9fx6pXw5qjqEWU64yAokgm1wxnnYPZJjKY4a5s
 LgBFgUmnX/HASMQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
and the number of hw clocks might be different, eventhough they usually are
the same.

If they are different, it could lead to out-of-bound access or registered
clock left behind on error.

Use a different variable when iterating on hw clocks so every registered
clock, and only those, gets unregistered on error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel.org
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 1c083b4d0b7e..43d8eca6abee 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -114,7 +114,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			   const struct sunxi_ccu_desc *desc)
 {
 	struct ccu_reset *reset;
-	int i, ret;
+	int i, j, ret;
 
 	ccu->desc = desc;
 
@@ -130,8 +130,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		cclk->lock = &ccu->lock;
 	}
 
-	for (i = 0; i < desc->hw_clks->num ; i++) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	for (j = 0; j < desc->hw_clks->num ; j++) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 		const char *name;
 
 		if (!hw)
@@ -143,7 +143,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		else
 			ret = of_clk_hw_register(node, hw);
 		if (ret) {
-			pr_err("Couldn't register clock %d - %s\n", i, name);
+			pr_err("Couldn't register clock %d - %s\n", j, name);
 			goto err_clk_unreg;
 		}
 	}
@@ -186,8 +186,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 err_del_provider:
 	of_clk_del_provider(node);
 err_clk_unreg:
-	while (--i >= 0) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	while (--j >= 0) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 
 		if (!hw)
 			continue;

-- 
2.47.3

