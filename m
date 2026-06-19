Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C791E4AF
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jun 2026 04:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844877; cv=none; b=hURQY3KL9EyNF+6UYSdQQyJeWLh7gC+pda4tnEu10raZksvEiSAjX1JOhuh6gur/m1HcQd8jxaa/v7T97Hdh3+J/tjEfYlhfWXdmzvfCF/mdnCMZvhsLXFCfx1RSFdvjUie45ak0C3a2EInYCYAFSVvLc9lrsWjsLYl9LO8GNAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844877; c=relaxed/simple;
	bh=1/J1QDc8wYS4aTyB2hGxeW2e18b7qy0uZ1pmyFz9DR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/L2OkwQg/I8YXnFPQ8IAq9b19afPtA8V0so/f51LsYRT36PQ+IbKoq1BW7OCHsCYvw/juUMNdID1Bw0m9eJC/mJV3fPmNud9eZzoczhKoGP4/qcV/oRmmcJ3xbHRI+W0pgvk2praOmEpNPK77kUw741mcwCCxcg3yejnxvxMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShR4sK3v; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShR4sK3v"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-915ab38ac14so236830285a.0
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 21:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844875; x=1782449675; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=des/YMvzXKFvsVSBqNlCoInqunzXPQ6/th3snijZ9DY=;
        b=ShR4sK3vXQcHqi2B5FFu9jk3zf99a2+Mx8mkX6lTOvrp5Jz6KCJaHAMxinn+++wjCn
         TLhrmLGrsWveMiKA9zQ2wPlEZKeqdQC1bAVaAGwhfBPOitISX2WS35RKnHd2yaih3YpP
         ooMk9PbpxgUC3f87Pfq/TX0hCEQdvVUFawOY8ZPQgjNSDeKOasw8M+xrVmrNL/hAwctb
         8JTO+elJ8JA7Ch6RhUN+Cawdw2TD6DxrJNFE/yuZiKkI4OOcthtBvwFExqr+ThxH/w91
         65OlA10AohHVgXrUCj+Dfb9ASMaLv4D8Q2JeMGriN7j9YBi+p7sjf2g+wi73hBy8TUuC
         YC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844875; x=1782449675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=des/YMvzXKFvsVSBqNlCoInqunzXPQ6/th3snijZ9DY=;
        b=ItnlkXMiz3y+qur/bsB9B5+d3J61gz/LtPg9M7EoBT+KzmIwErW/mQzq+S37cMewdw
         loVtsC+NOXlzaD+iw3Ih4n7+26+11HqQZMa2scZnSRoVguKuWuGx4aKHGyptQKh9cIeW
         dINX/Pq+R1imlrRY3fjazRcEQDSB7k3ekawCH5zjljAckU/AOAnZD6CIrU2J1sGen9cB
         6QhUCnRmZUMdWGbLN6O0ZFagRumjMTU0T5stqk4v3nylWxB1B8OhB6ix5B7THJh3+7NT
         XwwZDFreiq88IP0GzkpnZ3a9EQ3HZUsgq3QZdRyZGsR5A9WIu7lUIi6F6Pt8EfKlVKXf
         m7iw==
X-Forwarded-Encrypted: i=1; AFNElJ+U7sSZr4WmV5BWlfV9jYU5qCbEr3gx8BW1gqvK2DOYYu/LDd9hNYSwUBG2pRl/gvXx+JN7Q4aLay06Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsH0pi8b2p4nn2/DUy/o9MGQEGOyN6v4UOt6Z3doKFXdF1j8FO
	dEJ81PHh/z7ClTh4lMT+BEiMGycjI5pjPhyTA8BWgXKh18nGZmpenhSH
X-Gm-Gg: AfdE7cmpMbxtx3JuxRUZa5LY5tBDU/ZeBIMLOQbSv1YYfmcIJMBcXk8irpERxfgMBLD
	qDpxL7tZ4HXITjcq0x+YEpAX/h3WiXZAtsWx5+diJUe5Tc9bOgiLj5D1RYhlOjC9CXSJbFR50kr
	hsuqccnjqC5FIXfOxdkdQTJppXQIMqE6c1XtGA8xxdI0yFCQpAGR2r/s9Ds+G9GzJ4ONus4kA6t
	mEQduGzhPDaUQSvvyJK5AtPVgNGVAvoU0wjVrW1Yuqfu/HvZpPJlw559qsXj07Gw0EtDxQkdOMN
	aPArlMLBmSs77BNs9sndkdm0aonWkwooBHyGSGChBgF/SIzACRF1ivvWcB21a+WZD/Cdu5USM+X
	0owwPcOCeB+oZzbePu3Ho6X/GP3Ez9O+1gtElTPsa08o1pqHuqUJYdY+EcjvCUiZeXM5mxwgZrQ
	uPtsVZBvh3sMS77g==
X-Received: by 2002:a05:620a:284c:b0:915:422b:fb49 with SMTP id af79cd13be357-92091397994mr303581385a.28.1781844875147;
        Thu, 18 Jun 2026 21:54:35 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:34 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:34 +0000
Subject: [PATCH 5/5] dt-bindings: dma: sun50i-a64-dma: Update device tree
 bindings documentation for A733
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-5-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2

To complete the support for the A733 DMA controller, added
`allwinner,sun60i-a733-dma` to the list of compatible strings for
`allwinner,sun50i-a64-dma` dt-binding documentations..

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

