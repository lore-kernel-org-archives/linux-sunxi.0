Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B74CE67C
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499019; cv=none; b=P/KtXoJHFBnD2UGG+05g/pJZzk7u/ZUisPW2NMhjXg8MYnyL2rUfKnBN6SuFdBZJPvYzTMUgUeFMtLBG7ozLBkri+H3+kKLVGKuzWmZpWz4tkmCGhs3FrGB3Bw8buMGGrwI3fz81j+xv3OQKGf3sHx/SsgXbPnyxtSYZWTqQdyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499019; c=relaxed/simple;
	bh=2JIyZIHznyDtQqCAOgu4r0hfKVY221r4s//QaqUnxzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rz92AunlnPG81G3aboXRDa4qQxAWvn8idch+5Afh1TP7WIAWkbd9p6Oo/YydnBn60sSF7XXBJSM4tXL8ssQVx3WhsG7w5K+Ebr279JNbLEsgkNuwJIkF69nS71l2yLz/IT4UNMwhvnVw5n9+iJWtODpRnjUAjaN7NTbzJFM6JY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doxV3x2S; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doxV3x2S"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd77e3so100609fac.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499017; x=1790103817; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=;
        b=doxV3x2SkfKce5FQThS7sCAUo2hVnaefDfQICu+KF/jEMCJGIdgk5sMG+wKm0kYenL
         j7BM7GtcXREap1FIrjxMoX++92b94bx1Y0cApbceb+slvkWNL+t+HrA75RTvueQeUQte
         DGvokyI7LI/TmpitIVQ3aEdjaavduAWqXxPAJ4wB9C1pxEY9ycet+9qzthawHQ6uvQg/
         UmNKqR3XVdiXz3mw9gpdThovN3VnOba4x+wrXWyA9VGu8qj9/dOg1nirMcWIAaxZFjIp
         97fmcv41HAkyySX7CIjclfxbCTNR5xbj4JVhNN4rsPsJqpofpeOKkTvDEVFFhqaNaPMG
         O4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499017; x=1790103817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=;
        b=ZMwuShFRvzfAf/yXLxM2L+6emOzNqWyhF1dCPbVN1CHY5Wtz980CGissE+yUhwEuwg
         /7Q82UT335w7VtHbMu959phzcmEkOSxlD8PDgoLJMI9dqEJy7p9fJRqugd5d7ukzW/ZT
         u1NFIl5DiQpvWL7o/O1M0K30RKvs9VjgMeLQMR86VspaR20URGfOPyMLF9bihwvx3CVo
         9J7mu0HA0+9IGgc0OdTzKCUXAPX5dB4K4nXFZrZOfld29J3Vat3g1xRK6JfWNPkbnWo+
         PSUZqC+o4QHzzHsB9OBQKdqe4u9LW+GXbzVrrRyWKvGnWteZVRcPN/ll9BSOeDy6rnzl
         AKHw==
X-Forwarded-Encrypted: i=1; AKwUvBzZUGWvFkDN6zo43iyBroF/NQ8La9a/DmcfHhbmqXBOpWkkHYcqeFEPGV1lBobB1SDQaX+aZwGxxq15BA==@lists.linux.dev
X-Gm-Message-State: AFuF++nVmDKROYhYLpJwxuMLFkiCY804dfAicn9WTU2veEl8B/kg4mUk
	RytMkU84vF5SpHUoyFXiSQ5I5obwAvooQtPC3eNJ3J2krL3XmVt5XhVI
X-Gm-Gg: AYBFou0wO+UQfGBZViLCvi9vD8KkNs7dnYvGEFquMebxLF2BI7gdoWruHs6wDOXE3ye
	7KKBRoTTwu3e6lJiHMDIR8ajYhaPM/1qnSrRzBwaei9U8x2bl3K/qYOfwiDnmdY966ZUe2V4fTl
	nIoncZEmHRUWlH0PJWX0GJJhg91axJ65h/+ucga3hLiU64LVq+JBP6M/uBrmlgkdLMfFvCVLhSH
	jL0po8BAdqnFIrZbY/37nmralk11V0RL91irQvNufyNeCkflyd3UVDu/zQn52Z5/03mCmzAK9Ks
	sY/+DL+GOZ+1Kp3SS8c8AXSifa3DjtiF2ltIoJhR9kk+VhMl6sFkIryy8KzSf2yIMrxi2UjlshO
	ZbyhuSBJpOWceiKE1+nRi+FV7NNNogBJPMbGXRPps76HEOOK1Hd7oXfdedo/W1LfXVqIQ+xQQAt
	CCxulFO1kyFSJBCumg3XMQltkqh+vMWzyoxm66hS5A7Tg6gdPfq0/yySACLE1wQJ7U+fVbMkT8K
	+XvFn82i9FuDsuNW/9aBfM1s+7GjuY5UkPEN8nwQd/LQGy2DlZPFF9KlgHS0z2YmTIXlDA4jMrP
	ECeVi/WkxdIqYZdWY5T8VVVb/6Fxe1fYCCw02NagQZanRVj4DTP4OUlCfr2rCQhmx5ZLiM9nkbu
	VgrIDNAObbkAtJrG3jrPAcNI=
X-Received: by 2002:a05:6870:e305:b0:475:a112:1279 with SMTP id 586e51a60fabf-481fa3a2804mr6618423fac.38.1789499016683;
        Tue, 15 Sep 2026 12:03:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:18 -0600
Subject: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware. The
EMAC1 clock register also retains the three-bit TX and five-bit RX delay
chains, so allow the existing Allwinner delay properties for this
compatible.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml        | 18 ++++++++++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..34def84e6c21 100644
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
@@ -100,6 +113,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -109,7 +123,7 @@ allOf:
           maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface TX clock delay chain value in ps.
 
         allwinner,rx-delay-ps:
           default: 0
@@ -117,7 +131,7 @@ allOf:
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface RX clock delay chain value in ps.
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2ed4564ae99d..b20149c3e850 100644
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
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

