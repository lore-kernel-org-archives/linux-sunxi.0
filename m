Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AE44E4306
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232112; cv=none; b=H2m2J9mbMob6YGs06VjFlkl76Tl9BaTmm7VOj8N+eRv8dQ4XbH+JrprqMXu7cqj7KH6GHg6LTI8G8e5zapqqFLMoMnt8FxMxQzOFxPisQ/tdCEmw3Ji8s6bmsXBu0Vi/rGyC7cvzy1D3Q868MgsM8k9w9bZwO12hX53io3OnMVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232112; c=relaxed/simple;
	bh=3h/9Irsh6hLdvhKk61bUEKtRVcfu/x6aEEt8IH3OiO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNieZFcEW7kEQXbMj+TDsNo7Y0YrMSLr+w+fwi4HfQl/M73HFRmaLcyTRac635eqdTTtmVTUiBfJ1b5uNJ8TsX7CwxZQXEs/xACJg7KnRp9UkKS6pP2rzC1/f8MUeB9U2ICNIdSxgbPs9sXqcvcXMppqMD4GuR2kV9sAAYZA0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJhXnMda; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJhXnMda"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso3452615a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232105; x=1791836905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=UJhXnMdazXRtjQeVdI4GXUeTy+d8Kn8UIl14nc30C8o8BxdmAg/8hhYjJ3834c8Q7Z
         +227+/OQBOAR+lTwpzmbY6Zsqrg+reJQ4ADhwVtwkJhCGk27wHVwei4GVzLmXd/bVtSJ
         Uool/p1D/kqLwAi1FxWxTbn5N4p5bmmSmyT9kCvPQFWtNp+iNKOQ51Jr6w3EL8VBFrye
         lwa3BlUCCwRmEICoI9L6RRFdE0g5XiHi1++mxSWOEriw6KN4wpeT/+RR20gIBIpg5AYr
         /s8CzU+5Qs+UP+J5bBTy0GFjSaJF3IfVqo8LecGVdHyCpy0ckYPupzXax5OgKcdd2ecK
         bOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232105; x=1791836905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=WHa1nHBRwxKqYc1C6VXxpuWP5QcOyWCtyG/6x/jgnngXY2LlYjsR3eXPg9AUelse1z
         PKJnKBAOa15uCldziDAw2/pTaOI+7coZWC1+iP04pqiS/bB0+Bpyjs+OE82F/g7D3PXp
         D5YcZe1zUmjuon1G2yp3baHziCD5jW7uYyyjKbjmJRKltu/kBLRV6+GVZVNG6fc+N7lw
         XqlpiDIwbhDnErEYAr2AjFhWMfUDJbH65HKOgRI04oQwkcFgz82nF2EQ7uCJ5VEydIzR
         sRDfPgfROThVfhuqEbmJeCRm/2RsIm8V7ltg2yH5sp/+kx4SThHyOMY41hQ9UGOVCA/2
         Hljg==
X-Forwarded-Encrypted: i=1; AKwUvBxVaemHX5OeUHKVHsrOQgFPJLfT2MofYg5+QGEF3w4/S7xAvqKUhVaLuO2ay4LZbcwiW8iSvSeopihKkg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLyZhMtM47VNVxg2vsMSV668GiZf/hds61/o/k8ClnYhPzGL/Wb
	j6j0OwR1yLoV+pBtF4sDlwKqekvqBPBgoevpl8Q2V5ocye9WntbI6Ziu
X-Gm-Gg: AYBFou059Q5xkt8pk1/5IvJ4vd6GQfgEtYnXiV+tl7G+Z3WQyiFX1YHAcOmY/v8WErQ
	gJOdxkLriqiH7+NID6cXSMsKuGRw6YRwWMNg5ou9ngHYqe1J4gnU/bqsgjxNEW7zOibq9TZ/Xmw
	lIFvmFZPKopqoG6VEiHcJaKMsyRo3Cg46MgIl3Yrg57Au5p9L1cahqZyngJXC4Wh5gHS+M1S+sB
	JJAe0PwFhmbAZgphDG8hhRQ6SB9ZczYPcRpUOcUyEgEOWbpiMuosdHR2bQyeUkgq4Ea8Q3VZIKS
	okxzreRCTsEqhCZ1M+YUdgeykGD3EI8gI/l2RqWbmyRAfdPm6Kd0BLMHbcFkF4fIjFtDFIYosTC
	b5O6Ve7UdxRuZrvzw/7ICkQClSPakDGb0abkEm+BA38oxHmtprcZVR2pwf56V3Osw018H4xydfm
	itX5PHDZ8nmlTDhW89+iiyTIiLMifQDARunAPDvydSXTwARkxD1lgC/YrStVRda6I/s4aH+Z4Ll
	bqKAvYXGWMIHl4v7PsmDdVQZ6fIgrTa
X-Received: by 2002:a05:6402:4021:b0:6ac:aec6:a3b9 with SMTP id 4fb4d7f45d1cf-6afad90627bmr7128320a12.24.1791232105212;
        Mon, 05 Oct 2026 13:28:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon,  5 Oct 2026 21:27:28 +0100
Message-ID: <20261005202731.153971-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.52.0

