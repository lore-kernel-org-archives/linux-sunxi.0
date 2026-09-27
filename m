Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327723B14C3
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535161; cv=none; b=XbvesQrxazDBqBVPPZrLaRI7Fywk/MrSTr4u2JlvIjxFZC16GT/zvy7zhBKW8wQUG2pJGoFIBkpBlOnBgLksfpuuF1IqWheXvZONYRdWw2sFMXO7lgmqHbALlt34FG7PgYrBUy3vUOgjOjeFjV/XmK3ZIP1jX/0uct36FoTYMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535161; c=relaxed/simple;
	bh=HeUIDZzk449KX7gatFI/4s8CJnL+sVcLapPU5ie+Nfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O28DG17l3dy7aWP80VDb1mibtr2KbLTFL9C8nkeJSgau8n9IO76JGTb6du0g2UKsi6qKPoeiTjJHlOTTVKc41NOBmYaJtmMlifWP53Q7exhAKcn9YcUceTicbYwwA0olCRwauMPvnc7T/rgwwE+Szkpk0N6FBPOK98jUeiunRpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9m9V5Bc; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9m9V5Bc"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-466ccde2ad9so1693393fac.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535159; x=1791139959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=;
        b=d9m9V5Bc+AQ2i716iBMGAJjUB3hNBKgIeC1jAYkRDqRSh/WGNO+4HjXW89BFm/lwv4
         7naYRhp7lC16TNCWkEOj7F+RTaie5Ud40JIAaV6iHEpUoBH6fSP4biMJ0YWC+mwdCGX0
         UEUxD2V8U3ZDWEign1QOAuUiMcnddX2wh2rHV4gTyV5w4anh94VuCcFYmgq8MIBmOrt0
         TTG726Lutl+Yrk2uPRAESQi1vnJFA+AALmADgNkWC5QxGulXmHQ3iRsgPyJsX+5JATfM
         vnKm/P7fKWc+/kwlb/TfPOG8FmQg6VsFIdusQ1uCG6xxDL2gK2CBqARrDODyfwIFeG6v
         Tfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535159; x=1791139959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=;
        b=lWjwVkoYb5vaHMMHu4Rg6Cmcxi6Ldwh01ZSSos8btk8s5dM5jgWOVFsgP4Aa6kuuET
         pNtpm7SwO7bysEI8xah+g7UN3NnaRDqylv0sVhtysL8PicSaxFt72+HFVC1Los135tKR
         AzLDoeC1yKB1WSnh6kOmzozeOunSqtZM+ZZcJJrxjeZkf2HxlOpXkIopiSqjh0xLf6FU
         iHtgnxMP/6DkhUKmyYC+uWMLcSsHwXFU9w9K04Mnbne5TqFDBcRf0npJsgYyS1g1vUBF
         5a/gvAOvZMjZQFIBJHIQaxPc0jNq8F00a7J+fo+6TEX2ZfLPtxgsshk9kygjKe8+3PTp
         M5xg==
X-Forwarded-Encrypted: i=1; AKwUvBxgYVWePyHf4FRFxMBGWO9o2dIIYGfhi/1fLheyS/QB5eOSQXDcNCbDaZgLfYu4fqhQNq655SWGXU2mXA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKH82z4gxAcUA4Og3HB+qaLEDf+yCXUlTvmAG1RQ0G41OEpYv/k
	oD+yToK5OW1ZI3BNefskjt/TP17mfdKKlDkrI2kWIqsn+lrbLe+EBVWD
X-Gm-Gg: AYBFou2vB+LHeb41hDr0kG8lTAFHir8qN8fKa1dliCHSppOFia/N35nOgSuPrL1aCPh
	DHkX97bqwJHclpI+ru0gghMUaOQbG7+mD/MIFfql8FC2YiahCLHBrf4mVAV3Id/npSXWY36Pm5k
	mwJ2g8ziL5sA2yAdOq79PxGTU0SIOx2OrOpTKjzIH0Q3MEqzzNvgucjsLK5iDWNNLEaxRz3JuXo
	Y3HlgxWGh97tRqPtmPMdNo/mzzrbYEiv+SswqSY8Pat1d2ylYFc//qRzsJmkYDzoP1G12EPDLDA
	1KUp5CExIMuGMitrwVq8WbreiVBrwLHCYwH3F2X9Fy+dwQb9btwpvCUY1HwJ09sQgLYpcOesNh6
	Uq++xA5M0EgzONDiGdum6tHhT4HsuhA47JkBSyVJVRES4llR8RlSgSBJZ8iS6muIBhZPATJ6CBC
	2lbDHQve2MVXKvtynosm2sm5xVW/NTrUgl47bV9wB82Mo0MllpwDkhobrI3tUrI+m74q3i3ZD1S
	+X5zagCOrFzPmAwOvC/T5QRQqqO4QaNE23uukD1J7Y410gDn9K/bMUIXSeSmir64AwPPmBNXyFO
	V9p7sgC03LK3bGO3hfNOAQxPmiOGSzquv54SnDKkP/WrN/rqYqqG8EP01yB/HEr8YB9HYdDbNWj
	El+l44dc7mVBFjsbT6NYAJp/dvF8pCx8=
X-Received: by 2002:a05:6870:9a14:b0:485:d31b:775d with SMTP id 586e51a60fabf-491e55b11c7mr11348983fac.27.1790535154236;
        Sun, 27 Sep 2026 11:52:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:20 -0600
Subject: [PATCH net-next v6 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-2-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index d3e591157faf..2218a492817f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -573,6 +574,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

