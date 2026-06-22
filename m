Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF28239E60
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jun 2026 01:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092327; cv=none; b=qLCJPyVfRSH+CD2V3H1aqq2XROxPFq9quKbiT82mZw6IOhUQcOYxtNzXFwHgDxFme7bf2bT1cXRAXp6jOFlkfzL9YqTkG8bRCHhsv6dfk8VFxaF5xMnMzuFASh96KD3KUWU9ViYQl6aBjtgY/+nVIFGAcUsrkm+1+0BElOfHJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092327; c=relaxed/simple;
	bh=ie+sMnD6uAa0Y5KDamC6d/Sl2iQiNR5jEQH6gwdWpFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUHA12hfuYZhaaRENXLsY0K98x31ViAPGlaP6cM0h5lbVDTIAnjJIYYyMNUW9IRhL5JkbgYEA30cAlekk6ZwtbBWjcduZmLTsNxVwVx9NFo8Ur/s2yMhCjYhByKmM/EOGCosQL7rZ3ZvghjL9GahD4NESjjmlXuz9BZO2ErQfzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sohCJ7MH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sohCJ7MH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-516d0db9372so31960251cf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092322; x=1782697122; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=;
        b=sohCJ7MHjpsdoIYA3nTUnDnkNvHJSGYFC5UqyZg/x0pFhzz1vBvTUQoJUz9UTNJ6w3
         RJ8QlVoWbf76zGmMQuyc1hzXVaplpTCgWrBrEj+4cN2eS23v2YvDpwArFG4F3mQhiTnC
         ASg1VXP8hqSUJ6gUTqCbvJdHhOnQxwSkoCY2n6xeAdv1V2aX5RhNNkjyVqeGEgCVBxxL
         y+R3a6ZAj31UxPxkNtPBuAgNQbyfcgyOwQOYXPMWRvZAxZbOyvIL8xl4aBMiK9oZxty6
         yHEMyNwEbvy7mOTV2n5h/rxT+JB4FAzm8j3bkGFQKMazmBefAr208o/2Ucun9WeHArug
         eVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092322; x=1782697122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=;
        b=LGd0q2zxjKvh1OO9cPIUTWvRhylryaQ8Jq/ElMq1K4rpfiCqsldrlooXxahcqdhQCb
         7MsL1/k1vLygVAum2dye5t7YLXJiXnC1v2r+KKHBQ2jdywlm2k4tr29Gvbg8ncEdmtrq
         UpeRPGn4bMk8memNRDGWjhegT02JKPYOu1p4eSzIyAKQfkgYA7+O597dJiJy8uhhFEFs
         E5KNgrC7m0SHFiLXpCiOsIU4pX5YSxC7Cdf/PagPbkrcdrNGR0B3HyDmGiihzhmxLmMA
         wUS8c6TjCq4bRvUsWnYc3P7AUwK0a72o/0ixzuP2MpiE1MOL7+1w9fhJt8Umm0RkCC0t
         xZVA==
X-Forwarded-Encrypted: i=1; AFNElJ/D4ibCn+peGa6LHMCa8KDG++/04bZtko9WG1IW1o0SgELPYc/pFWdtCkAVs/dOSIJJUWqsn7l1pLLu6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEO/Gb3CsmPK3ci/iPIs4ENSigPESui41IwSH6yIYLvUg2Kt9f
	wegfIbLXCf/FGnu3tsuH5OZjbszUNOJ+SPvOgBbwWygU/NakxttfgGHa
X-Gm-Gg: AfdE7ckSh9X9dS3+HcyAl1C83t9GshZgVXVnTgxZlRuO23Tct9FVnOHERulo6S5DyEQ
	+lCfM/ZrZxr9eUX7NiXwu08H4o7vhOq3tNQYVmiBxVDcuiQjhPOi1LaFm3vBuj0UnaaTtV4A3A2
	+n9E3wEyOT2QY8Crhltagd0pkC6LHytFfIWCYFOi1s9uEsOntdMR2DwhSZAG/EaQ5Wfl/HyHyhU
	IZIPmcagk9qk13IQfpb4OGdj3imSZtC15Nf1YxbuAa2OIpslJ0CXzCa+NzVOq09OsOfxzioxG2r
	SD8kGQlJKc242TnsLQzPGLl/TK6ugQpg4gbMp5dxI6DjKVcqkxy0emjRCLIsR6+H1h0Jmt17zMq
	q+jnypkf4tjsoIQz15wc4OZZ9l2/BGKVQxlbArW1ZDn1H/bJIdq5Xs4Bf4IslGM5pkyXuWoq/Uh
	0j9wEYkuSW7a0hrw==
X-Received: by 2002:a05:622a:1f1b:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-519e4a54ab1mr164968221cf.16.1782092322553;
        Sun, 21 Jun 2026 18:38:42 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:42 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:26 +0000
Subject: [PATCH v3 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

