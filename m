Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E2371CE6
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078098; cv=none; b=I2DTyZ87e/YVik1Ugxeetta27JUSNJ/GZP/UdEjx+8fEZ/g6FjEAsd6WGZD83mpKrdY/1soTUKHr6TSGKW+odF4d4eN/RNW+LDYJ76FS6lqG/xKwe5u6h/PW31Hepo5QeubmR4tMpxj0uN0oSWuSk1+RJWoFNiPn8VMA4RfuST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078098; c=relaxed/simple;
	bh=snXtiK6PEmUwjwB87Qy4uEGoHKMvUL4i+B4X0NTiCQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQn/KbRVO9S/T8MkWPEt7B4t4o6x4dC9nWy8hRa7C8mbPZm9yDxwLcrPHrCijb2KODITuPq+/LzVBOEs7eRrr0omvDd4knRF/HfEioMwO0MOFh8jhtWHwi2p384HFVRC6McuzWY7op/ln0tG79MFwLTgkPcSHwPoET+sggbhOq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYHUN9Qa; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYHUN9Qa"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8dea42b547eso39167486d6.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078094; x=1782682894; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTAQ0YVnmRPUTpM5kMc2Jmb3ZZIxno5dgQysePNdwmo=;
        b=FYHUN9QaAmv54QSOb8vX6KOaMP3UNYtYlyAZ2pgfIGU/CU6Nhtqq5qyyTt7HYovsvy
         n0Z+UlKTAAn3ftm/ohHicAaB5U7Z/PbnjkRdewGMWrnu7Cp0oqQ9dy0JT4XIxtH4RS5B
         0NoUhjwDbKEnig3J5iX6TnSz5TC9/3VzTGG2yclQ1LQDqb81dVqL8nwAIZ5qHQKeYhdq
         QT5ppVgRYyw/dS5wgptj+Vh+SIrWL9+fyZd2nS92LRvau1NzBZz5U2U7K/CMcUDBMF5q
         YQUm+yE5FUV+l2syxA/xjHcxukSxVtDsoC+2bc1vAwMSKdfushnqMrxa1GgFzo3bmJyf
         RFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078094; x=1782682894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTAQ0YVnmRPUTpM5kMc2Jmb3ZZIxno5dgQysePNdwmo=;
        b=hrUm/eheca1sS3iS49mc8YkgjAjxI7sVVZxQA2N5dmU3/XwjAgPbURvbpXyQBmfztU
         JVrSjsVMMpU7Pdr00d+7e/D9rK/eJYswlOthxBEpA9R80PKc+f3Ln1wL2CX9PK6oDS/r
         TeQeU/05GCGJaiEqIlm02Aa7vBgUFZ2OE2HqSEV2vvNN7BJec6cUH+LH/VQ3B0UWcoVH
         ml/Rk4f0105Pp0InxcNkNOSwmM99bVQvgi3fO++MgfY22TKabkQNEA7sKXn84lUm8xSW
         lSoB4D6QoMfST3brx5YY9eKiUECBjdrsSNwkPLAmRsG/iivsY0hedQiSqy+fQDDUQV7O
         3hFg==
X-Forwarded-Encrypted: i=1; AHgh+RokQ4VuUVcT1ihhbouugb8kFUlv7Lb5qaiTJpf2ZcsYms4fERtE6Kwp5SFnxVXH8xIORkDNkId9liNUrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrISgtTIcMeF5ixkQr3xCqILPbPrhwWbZzfiofSohY3p/AFMvD
	EGIpkXXJsRqrS026+4FkpZbXtWxrZhGwMxU5bxgWImBfL8f6WrJhatZp
X-Gm-Gg: AfdE7cn+5sbqMzBCzbFVZ06Ed8ZJMFgxdBb9xmsRpkpKCQwF09DNegQ90wJo1NFhit5
	q0GsA4UHMmygIZap4yMzKTqinpLNjJyXVdadwGXDV1Yr8SlRDGM3oA4aQOn9rcLEGr34x9947OQ
	OSw+ltzphQDNjKiqNLs779v3YpSgn2UKfAqcBIFg+w7U8UR6fAPX3DNunpmtHQI8PXVJXEmQR2v
	zcY0R3KGdY/pWGQyytg+orJuBx4UMXDNVFgufDsiLqaKKl9PljD0hHsvo69NL0SNj0gD7yMhd7a
	Q5bkq3o9nrgpzrHUaVS1DnulBl+8ZRFlOHL/ej931zpsHS84S2G7x++Lwtdf/rrwSKV4vNdRevW
	LRxEfFGi4kNpgKDhHtq5M8UlhREe7v2VdqIsPpsx6sAIPc+yUFIYLXiiM6S123+iaeV/Rho7NLT
	sy1e5OZFAdFz2jFw==
X-Received: by 2002:a05:6214:124a:b0:8a1:8b0a:6678 with SMTP id 6a1803df08f44-8de415cc13fmr219484556d6.31.1782078094430;
        Sun, 21 Jun 2026 14:41:34 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:34 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:57 +0000
Subject: [PATCH v2 4/5] dt-bindings: dma: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-4-340f205891cc@gmail.com>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
In-Reply-To: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.54.0

