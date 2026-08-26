Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22AD27A916
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 01:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707833; cv=none; b=S5aHIC9XkGuH2EDySOpgI5Wkv09SKNoBDYWOmYgpCm5B71B7TQHSMeV/ytz5M6cblQg5E6imnrHtX15fqB33OO6OV5HLhaLWuxaB99LKBA8MdGC/MwsVKFjj8yZSGBmf/BQ6nRk95uT5LL1wWq8vEvZMmNWw7L77wCwqSY+CGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707833; c=relaxed/simple;
	bh=xXHRUhCMZY1UP0UimNCUgmYKZUE5pAtrJ+aeGai+WZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ar+8Ia44pBr3zx9L9VqwinJyjIpiiFmzqdUrkxChAvq79ArguoN79Gh/SlXQ/efztAV1TmAGnfQIV3+IzpLV1LRyJzl5p4WbeHKNSIqNkWOx2OWXvfPBUhJJXLUgcQqpU6/Puo07bc4SB81IzMy8pq2CUB9HWPHwZCqutnUNkwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=shABMNfZ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shABMNfZ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93703cc9e2dso19238185a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707829; x=1788312629; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=shABMNfZzTeFK44bJffV1+JmjQ6Ld2KpXnx9adnjFdHNEgyGg4hKaaJwZMfIcu5vkD
         5TKWPvDGGgzJYCoWN3CYvyoiy3WPczAn+6apj1x3JnUCeIlrtN/Tp52ts68bJZ/5DHWf
         NnwsnDJCssy8+AQq3cKKo/5aoLCZIlX9iF5fsDkqQO+g+t4JGmcBZLOeCoc052+uUlum
         tPnWZupPXc4+RHdjVySp2WNzEFYy6r4QejDaEjFF4lz4OPiNhaBBEZQx0rP44RtpuXgw
         V1d8v3xWU/zlTUnLXSXsquVgxxTBGAnHflgZsBEjNoj1rKxEFB0K6x6MWCFbxuOgZXGj
         BqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707829; x=1788312629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=nAbdQ17ZKgtz9btOUudSq6Z4WJHg302135Luubb9SQYgd9PgUW7VPOBlcqXZWSlWz3
         CmsJ3J6vR+A3sJegydABFIg6yAusN3iHOMWNSPfbhUso1VtCNVhkRFYwVVucHDCukbk7
         WmoepGkfjQBzDsOXE8AZ7npBXXJcBmzQF9RAtDhSLAeNL5Dus3XslXHKd547pDDS2Hq0
         3ipte1WWWVKatXbtSCSlJOmaKgNPiJ/hQmnnRzU72ylCznTNtzRnGKntaX2VpX88hJ9D
         zi8QmCf7V2Epm0go7TVl+bbD+63cBsXKTRmu/AFRPXWXB2z8kMehhi615jXXlWdXCK9E
         dZJg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd3SMayvJZhcTMbXjNTI995gfhJW/8yGh8Rat6d+4N6Y7AsJURfATTHNJvWoxZTP6ApcwRmYMDCe+YNw==@lists.linux.dev
X-Gm-Message-State: AFuF++m5yCMLVefv5Y6nao422B55ccM9EAe7f22tRBpY+kjVGZ5h5Uxl
	zDXsD6fiioMAoB3y4VQeEzhLZ2CwTE4iMiTRShk/kcJKzc5hnaYKpzYn
X-Gm-Gg: AR+sD13Ml/e59RP+dDMjny7tUsHNyu663rVlgjQAqMaN4wdWW2MVQrr5xkVn71uoyhR
	MwyDL28ruYNEyAg4pVEyVDM3wStPwu9MMjwtA0Mq9XteSm+ubC0brC2mQtvzNRNvtJPQ0DDpKmr
	k1vL+UCLOm8O/lDwXCTv+5dvk26m5Lt7Jbpxsx2kMeQjsudv23s9qjYA8liBtBPqSi9MxMemHKO
	LJTy1RdCyS8iQywM+134Ps2qa+ySWlEOcUmHSTPe/SR2Lcd408SmWbn7ao2OBcW48lHXy5pIKzN
	Hrp8pSsvC0h86kQ5tHG3EqINWTdQxlHcLINifQR7XbKjM2rKZjHMGJTgazoxlVZ91bwQEnF8pci
	mzqFtRFdyzLYQ1FDpKvww+Y4e2Mr4bcUuRXgCu6NkexC9l7m6LtOyWGAvwC411CL0Ea5vh1YAFp
	0FhzNULMhY+FjamkRmoOxHOK7lQpS/HWLZCeWPrg0nxbUdNRnrKKUpCaf/D3fILg==
X-Received: by 2002:a05:620a:29c2:b0:937:80ca:7c4a with SMTP id af79cd13be357-93780ca859amr248149485a.44.1787707828653;
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:06 +0000
Subject: [PATCH v4 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-4-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.55.0

