Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D536BCDE
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821484; cv=none; b=hatlZHreYue61XNbhPCjvEVpniGVh27F4I44soJvpeCj80t4zADEQl4uLJvdCZNOAS35H9Gj8QChAs1eGuLaPuHU6a597AqE5u9+SM/n9+MQtgXRyuXcVMBZGS8n9rz7+yIx4Q+vid5uxh07C/pTZGxk0z1Ol/SdIHmUyb9XdUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821484; c=relaxed/simple;
	bh=qnoog98K51vnfZCiv1es1iBsnXh8XTJszGX/9tFR+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDhzFdkbBXZ1aoLz5nvuPzGCvOMpBSVWHNpLXKV3FjWhyh/UeqhJS18DeWZqIu5Ob7jkGW6OtkHuHIHrFhRXu9ErXZphNpkLae7tNAzo5DIEDql7IvOcM4qq5/vST5gO7EI+QykQM4QjJRP1+0jzLzdX9Sls1MfoefHvJyz/r10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFgKc7qO; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFgKc7qO"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so2093201a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821482; x=1791426282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=iFgKc7qOufe2+KJgJbIdac8QX0GD5N++gNkfyDb9rGgdMa9g+MRCnuhrGcN3445LAk
         SpR7i3rpmBFWByXdBZNpqLmiZq9xAsjCOPnW4beCOj63rWHXA4eTHZcqDtUcsI5oY64u
         Wj0bPf6T+k0zJtW7j/sdU3LQBMJEoln+XV9AUGf+o4dVXjAJDVmiyR+tyws0fUjJI0so
         eoYD/8gEjNE0KJ9stQbLxiqv4csVuMoXvIHWm5P3cLp4nFYeMIQJ+HJAs4vfPaYYpSyo
         g9pJa4sEqwhiScbMFJPMtwFklTJEEsU/7yHlmcwr6eDmC3MP4BA8fOYwEyafUUAOCWRN
         18yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821482; x=1791426282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=uaIDSQHLFPV5IMKTdGar6J52t5FiPAiWCwEEo1bSsUW601tgLK7HhpwZNb99maErlU
         NMSKvEjSJ/rr/pSasVo5GDOO+ZJY+zmMQwCuOPIUFHrDglJYsehi2Tc+I+T6y0Og8/X7
         qpP+mwfTyFB3b5qzwKIS19lRcGnMCGB82mGe7ohIPU6v3hoc8MA4P6pJgB9Q7Yj+MH0r
         2xCgs6matWD3kmuNjC64W8k0iYwK3FhNGBCf3u1M2JpvCayv9IT77pKq0M9TiN7ZeFia
         iJtMrUs4lT2Gon9bYyN5ZIJwyp4Kz9eIGmPk6yLG75WIgAny/J79AHuYZnYWoaV17hYB
         ePbw==
X-Forwarded-Encrypted: i=1; AKwUvByT1QvWhGuVAveEhTVvZxqjJRFVQmPRbK7og/sqvRQI0w9rhXPdyV5dbqvtSQqm88F/aCICYga6gQs9cw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIlxrvPtYfrTzuJ2CZYZS7KCHirYhFfeZcy+kYEYzJTpj5S75Mk
	cGruiuCIIAphLG9tXXl/WHNK7Vb8etakfWCMQMBpNxedSWaE0lmIiEsQ
X-Gm-Gg: AYBFou2gcancbOpw+Yl3ItRICtcR3I79RfWXXimSbhW7x/uXIbz0HkhwJtlGnsW52DU
	7Qz7CH99BUv7WGOLMhk4Ex0FpEM628K2AZbbya/s0jkm7XSM2BxpFfCGQxL6GkyOTID+eLwjCVU
	v1lNqOX0AffHTggfZu7zPcQMe70//pKEIqNdg9CxXdRBuWa1NihzUt6qhvWBxTbTOqOXY2wDTQZ
	F81v3ytODPKqsRMqw/3+EArk96Q8n5uQDJEHNnZXy3qv80gzaGBC0qXipvzdEAZYxuLbp4RcQ20
	d2/Z7M5rcQEaOIIkY50NywrGm8CIsn0JpgsJvyz61IaBYuyEfrYxhEjoLFw+1c5toG04+96twGa
	5dnahFVlwneXLuPcjgnekHCOtioHEMJIcZw1t2FTtTccMjnU1EqCFYDfHShslZ7tExBAjlSIydo
	2OBRdv1eJRVrgtbSs/P2nXgIWx0yUTs4eScFel3pTzmspgje9tk2jzXIxnOPQ7OQ==
X-Received: by 2002:a17:90a:ec8f:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a4d0f03a1amr1882204a91.2.1790821482200;
        Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:41 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Thu,  1 Oct 2026 10:24:13 +0800
Message-ID: <20261001022415.913959-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0

