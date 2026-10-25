Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936706;
	b=BT4kmfK13RLDHUFJ3IM8gjqkYMCi0Ca2BwilUA5kVXykly88JyW+kfD+5ACzU9BOWk0x
	 Q1sZYtMBGf4pVJ2CGtWvnXGwKwktDrme3dYK5sI2VWO5aGFMgeME9IAmQ9JutAbPClGJL
	 tGcYJkJkbPcU0YcsW669/xI2DEd8/Fa5RbD+Y32k1uZbbov5z7WNauAKp94xixBWw3ioH
	 SZ2riCZEGVp50gBSXx0AexDHG2cAczkuPGxKnnLsPk+BDNoKIKu3o0IbXYFG+A2xWClPt
	 3Ewu2vTl4mgrOLNFhTB8cszSGg0SSn/2ClO26EQYSfch1rr8daEzyiDI3O3qEOyBE/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=n2IIuCueN+3B/4NvkWVuOP/CaS9407x61Sw2YH/aVNj7eXWpfLQ4r/Be/YyzCLReDtnq
	 N/gcfheXnbhUyZuBLuE0iATodH4G1p3KiQxm7xYSNI3u7tAZ3X7viFYvrG8ZO9RROnc6T
	 KABdAjaFKRTo8TBh2wDZtXYvlL6gNaKvZNHvVFwOwRwcU2nDKSPOYAAjG7iD9y/7/IA+n
	 fh+wPEcTjaPIg71zC47dNvRhbFuzQIbEb1aM7HzzuQ/k/4N2T+Ja7yEEHgDaaDqYe3ed3
	 9JTetQ7rVe+OYTdR0+O2IIsaABW11+2KTzsWFj6hGUAejWaer251XhfMP6E6NfVlnXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ccc8S72D;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C5606A323
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ccc8S72D
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d885929so1382126f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936705; x=1793541505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=Ccc8S72D9q8at8vhXcIr+wkP85U/6P+BBkcquDHKiFWvZNb6zezg6v7F5ftgbJ0n+4
         qHLMPzzVqiQsVrqQKtavIySBEJYKWxwYRiamlSuFnLACag4lTAlDeUjAiiR4ePs9OKP0
         lr04scBf/IZ0XdOOzdGu4NBk/1Cb33bsxZFt10WBPYwl55oHO8DRiybmdob4IH8xrp6M
         ZF4fLEuXzqZO06fqfDSCzphOdpKPoT+ZV/xUgjJlTEfWf/h/SK6yzvlpmgXe3dOsULof
         Q+m4DDWoD/LAw1cb0oCsUffUx/c/ZEac6xNEcDpFdX6+pGYcjb0yk9Q0S0Xxrk05YB81
         sg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936705; x=1793541505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=rbWgj+IIaaC0bgu9y1kj4eufmONlVrSmZr0xTf3QfU/q5HeM8caJJOJR8yi2rzIM/C
         vvlz98bV5LYWWW4dMLoRWBguSzMJqEWF2GlQO+I8dxGYhwXA/rnj1eKzhSwsdMRLp+WG
         5Lgqp3WaNoZ8k6rUOWLZh68rDVfnfDQs77ivIbFBAQ0xLqb4vKK/jTFbq/MhHCBB+/Nd
         MnrHi9T4zhNzP0ZeYjHVgwfwnt7m5XugjubiRBNcN09E8zhfqXVc3a6PTl9s2iVJVPwB
         A3QdOYGZ/K0QYU6Yk+0f0WL9+I/YTsOQvLve2jGwHJXdVqe+UVMo6wr/YU7/jbzkQfFv
         yG6g==
X-Forwarded-Encrypted: i=1; AKwUvBwdIlPFYy75GSDAiXTerHGkGIrhQnbf38XJnpoAiM2R9YtTfQaWDtusxuu4OQAxEDQJxlzyZIvjqIvOkg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKEOuJkmmspiwAq2YnpBYGi4VRTDxt26TiZiV4qE14IfD9Buu2P
	fWZnD7tEVNY7KjkQexQLBACjyyApKIcmzHpopkNN+xNds+ct2a771Een
X-Gm-Gg: AYBFou2cHTnyAGEbalQRJZ9KGxPojUTPBOYt2reVcymL97y4Pp/hW4Bk1ysIlIjisXJ
	odxUbf/ZwrJRyvY6hbtGHI7spJ3ktwHAhjHahh+V1t3/b/fXHVFX1wtnIvGDnUGpFWP4OMs7EIm
	ceyn4sEw2KuWcj9E7S8DuzNcMo4eQzFTrra3URNx/MkSJ2EgZTyyFe5v4q4P+Ety/BAGh5ltdVE
	CSywe8lsbJObudXfnLyEDLPgzfe/Cpu4LSzjL4BHmYegnAddr6OSMwaKDTv3CjwQG+NyRk1mCcy
	WHFSlt0EdBLNOuf6Iqoiw0hwF3grZ5DZOnJnXKpMKqhwOIwL2r+YCjZhJUmgxidj1HFveqR7iEv
	nLnBRz4eeqQBpNqALR6Pz1ziFlg80TsWDwKjIV5jb8flYVMFYZCevXNlpeU1h/q/588SzWOu7Lo
	GypIbSE7fQVQ5+hm80Ai0p6tVRAcFilcAYCn2HLecGeuZC6C48MgqJ4Tzudj+HUo5/kM9LyBj2S
	D6HquPz0ria1t+P5TA+RfaNbkxRZg8eoII6yVxShbJIDdASsNyHLCiI2eXt9ZJ1X0L/RC17aBzq
	8SsC+HGKRB/RqA==
X-Received: by 2002:adf:e004:0:10b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e3ebb1168mr4784693f8f.41.1792936704729;
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 13:57:44 +0000
Message-ID: <20261025135745.102970-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0

