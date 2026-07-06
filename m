Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966D42A162
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330359; cv=none; b=AFbYRorjSKu/67jauvsY+XCutruKYqvntQGNEk+fohVbWpOZqX0wPaI/+N4RpW0pXcZObzY4Q/ZoiC0seVzkbJKSO963NAWjOJfsJ3QQ91E07qe2B/ik3n2U/CkVXG/xSEjk6l31PpIqx5PJDgZS1MunfbkztKLz4jvrMORT9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330359; c=relaxed/simple;
	bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlF2adnV9Yhre+YXksiq1fI9xOJDNZ5olOy8myLNtyqViXKHEBo/yX9jXQObYdPMfEfottt7CyuzNteV6YlwJE4m79mRtc7hrEGfZgQvOYPEUV+wPxZqgIumItsCwLx/Izdc31n11+lawpX/aGrSeE8BwdMn7NMz24aqUJEv7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cH4sEbXb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cH4sEbXb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso10915625e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330353; x=1783935153; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=cH4sEbXblICZ1AxDTh73u/wgFSb4w9o9UiilzWHJiEOPbn0FrvoHYy3AGEWZLHYz20
         Rpa5as0lUOpYuKNbxhKz9dqafZrjzaR6Cys/8fMiHxj0BvU2O4tqlivYXgBS7poPt6jU
         i8pI2UTwKd6jIt3kaYpt6elVkuo3nUGravUimPHT6oMdpyydr6ASOzba6G6BfK3Nm31g
         t1pOLPlM1+sHhSf38uyqSAO5CAQhQ1UQaUY/G8u2En/us9x5PkqkcFfrLbqGe3bO4V7O
         ppMKJu+ayyemqfifQH4yELPNTu0ce+BIphbLbmfIkhv19DdAYrOz7Pzt9PqlyzP6JPa8
         +YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330353; x=1783935153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=FbyIugI9dndQu6GqES4QRBkz+2n1TXyjz+/RG1wUKv6COQBNg2RAbfFd/TsVqg9fZV
         p355b0HvOAU152YH1YGX6mpT3RAT2jXMKe2uN1T+6MP08bxSXU5UmQfQDpW4FmQzqYCY
         tYiVdcIPs5MZESfDTe9DKqg4ggoTr5JqQJk/BBNOm1zwGlisMTMXR3sFipcUKkPeFknJ
         fxH1E9ImiwYmo6BnWSal0Bip7qBEBKCg1icFzgJ+cKbyF60hu82rPHk9nL0OHPflhnK6
         u+JsKumCZpY/A+w6MhbK9mSy7ygTHCvUE/Rgqxh5/jspZZKbg7NXNFyNo09D+8xKBg74
         7TAw==
X-Forwarded-Encrypted: i=1; AHgh+RpZS/eLszt2SFrOybDFCuH/Lnd1j2b0GAU2h3ZsxtzDvBLA28s+2qg9cB9rSIA20UuSTckWlCxWHkdr1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWCAqA0s46YlS6n397HHLeo1x+XXUz6KlLr3VVrQH8UiCF6OAC
	PwNDtc4rYpX9LzKt/EjwwcnF3+KxB8gwamfDfUEUxIdCoPScHrxj0yc4gvMGDaxxPDk=
X-Gm-Gg: AfdE7cnc/k0I5Y12568+ClX3fhFBYh8zYWzsM+2PwHWUhogvAl/p+FTxtMULmEUzvCc
	ITO2E9pe2F6MGiZWcx9RmzF7yaik87FGzm8VDByzB4zUDepoBECyb65C0uKfJlfGiZfVfGI3Mvo
	wEp7ljZonByo4RI8EUfB2ih3iOOo6JsOL8YMjQh/7qK0OJjENHSENCvryFHIvL//59J8GOrQVcH
	cfPgk6dCIjQeF7rKQ/sTO6eJm76ti3JkUNNy+dwuwS0AblRcqYt8NVPnQtZL/OVFOnDVN3kIDbc
	TQCZDe+V0etN7Ycxs24yZkOu8cH/C51tOZyhawDuUK5QRIWTjYpTfiaVFWkXl3V0V7rDG9v3gdH
	UfTfPiz9saABBTIEXEJ+72OWXqXC4mRxsxqvjFVWFGxmIpkAaMU5QZ0EoPVq2cCeEa2DqO2u90f
	uKW5JNvPGB9rc=
X-Received: by 2002:a05:600c:34c2:b0:493:d9f7:a3cf with SMTP id 5b1f17b1804b1-493d9f7a46emr40792585e9.17.1783330352689;
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f21328sm23563937f8f.32.2026.07.06.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:11 +0200
Subject: [PATCH v4 3/9] clk: sunxi-ng: fix ccu probe clock unregister on
 error
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-3-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yi2lp9VUHi+gso0+D9KwXzeep3V0RfyNlFD
 8oFLIsmOIuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IgAKCRDm/A8cN/La
 hRUhD/43mj/jSnmTPc6rmiE4hnV86LDOF0szU0PUXIpytazGHAtIxmIDIlDKZTKCzeCtFb+X2yN
 O/s/rHXB1C+BZ9MaOlMCYM0niirJAu00pMeBFGETxKG3I8YRHs+rNdJmC6VoqYC4z0Xz6ouUuB6
 F7H4bIvuRdl/OyxsKmlj68XDBC6sEmE45CWMw3K495dkJO2MVRzo44+PdOeS2CBMGaqyMm6rlLQ
 HfcyybFMnwendBHYvURq3Tj5X7jtU2Z7OU874xC513CD24FpoPPB9XlZEV7WC9VtuJATL+FDQKU
 quYzgL6d0ZupraF4eBWGwMhmS6c6K7XL6utTkJcVwkriLHpqpG7EYAIFYLhv3f2qeXg6Dhp0FTQ
 MT8mWJzoeWF0osIDidUxMJXyVokwTSLbcz9hl+erkiIcpeBCVAK8lDg6jGlI3n7cJmfobT24H0y
 Oav4Vbj5g5N4MVMWj+xPc2USxc/fHEVfFUb51Ah8xbogDUhoqXVN9TAluM65k0ZT466yFRMs7XP
 6584kIeGiCARD+aRYt7m+Hbu79oTxky41yMn7qDhoh9x8jkZLXaO6E2yTxjwaKrOJTf/1xRNgex
 wCMFX/3ZZOlE8ra7Ib9VghVqUgvZe8/5yH3ZQweTa5lMCEdY5u4Sj8XWdBV6IcUprwnLKdIf/fB
 FYqd09N7mJzneZw==
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
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
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

