Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E850B41F
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667727; cv=none; b=bIWtxwDgD0kPUOWf5rgx8EClLpTeBaK8uU5UlKembGnzf6qXnA95Xh96G9IzjAxlXn7RXTEyRZDypPJ2sqH35s0ws3yo0vP07s4A4y8lVd9lcB56/r16or2epRvHtABKYFMImhzvgG40/qOr99sFj5yqVL/tiBFMuL5N60lhQsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667727; c=relaxed/simple;
	bh=PRVkggVtJ5MI/earZSiaP3lIhXMmPnjDvErncSUEbaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWd/SSnDbvtLeEWLmoDGcWtqZskzALvOErToNHHeRqBeWB0NYOc+Xgt02+oXqS03jCqxS+bT3Za6BXKQCW7qcKDCcORWc03vvroDu1DhQNxv8ONZj4yh9JG7sSI5jgm236QZ21SdOLSqjs9La8yACDQIz9tmHSOqZegHEcwpxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhxJ0xpg; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhxJ0xpg"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b1ae6a9aeaso700056eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667723; x=1790272523; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=;
        b=RhxJ0xpgNBYswuh5TvEC4EqhYo8h4XM97gD6qiojtSNi4F3zFPMGVrcgyTGHDxc8f1
         /iCazmIhDqEWqIEzk1S6FLUvUnerWC2dTbiFGaLnXiXHBtNU6a98YaToW3vNgvmCulK2
         BSuOvLGoFb1RuruMX71VWgYwMywB8nL1OLeb4o3Yk1BADO6+Nh5M5fkzac9hGSKCm1oq
         ofpFC4hhDGdeFrbNUzVMzJMT3wCHRveD6qBScN8qZMMmmSx3H5Id+VaBT77ZBSZaxBtc
         nBAcw0KgfjRpWHSh8HyI0Tqu/YJi5zUuH5XidhGWuV79Ui5VrkK+n1QE3olb+vKQmPW0
         VVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667723; x=1790272523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=;
        b=aeesUrQ2WBjH9uE0DzegmeVyVibJzTHvWakbY+ntuFQKiZ73POxHqeazN+BgPb1i42
         ER2qdT9bjjbDqwqskUb7fFzGTC4E+ohzZxwIUNnB3qReXx2jZYKjCG/MAkt4u+S/qLPy
         ZaTtdPUiGSQ+n4MoWbznI98bZdiUhWvE/Rjl+xKJ0FTbQiaCF6S4PrRNmCC8598v5ahk
         ocKg8jUwRXP6ZesxG12HgG5uo1JpgHXzFZLd2CAuEURxftRNSYFSFvTVRRKLD+AJAB73
         rMkigFmztuyHlE5O0jfdlQUzq/hQA8qspXbe7TJJ1vWzK60z2e1Mh+MWT6m+G1WUompU
         dCdA==
X-Forwarded-Encrypted: i=1; AKwUvBz2ZQa4LREvuJNZHBt4SOzo+tfqKzNGdXqzwen28+ur5xiFTlMf3BMr4wXPf8BN9gaeBvEoKZu1hC4QZg==@lists.linux.dev
X-Gm-Message-State: AFuF++ng4cRsD9HTIhPhKWqEegO0rW9rETeUKnqWvQrtFAwL5vAighH8
	FiXyYtEmuO4V9/silqm1h5nWHgD5LpdYmTBrgahA/v54Ce17ulMAl0gZ
X-Gm-Gg: AYBFou30TQrDf46ydSYWu9jgNvIuVnBAoT6X+TVMIhz4/zSo9noGGqP2iVpTLBqx/PN
	wEHXVeBClTXzFO/RuC34z5xSpkOVnuPdLXM4AQQZxJusSQVO9235uGEsV4HXNPxsu2S9CQWWzc3
	bTDgXwtGwiulLeEqnxqf4LtR6SxoIh10GpleiznHODAOBvfLdhICUosRTUIhcJ52aULZVuC3jtQ
	SBpGpY38nTzp9BK7duCanmQ1jQYw6bZGtU8paHLLJyRI9CIyewG0rxWzggqptLms+jLy/w7mfLS
	xANAsiRUM/Vpb+bs2ITqqs+BEs5fDneD7OoqYDGFd/Ps0+pU+5JpLZ4lcLNxE//K2n/zovweUXl
	pJ5Dy5hQGqMJA6P8o6wUFOUbFm63QPopqZ4b14V3LkpYbAA46WUXJ4HyQFVPIgihXK2OW0ADdej
	4EPskhpViiEmLZp+e1t80HnLJOWS2FTZbTvIWxkeqfTKTVz/6pVyG6OjhIkbmzH/5AfoKuR7oya
	ukItETnYFQSRQuqwIM6+P7P2/IzB/uXWFj0Vgdm6Zy0GTmM4ziABqaqHwWlQbE3f/l5sQhu/dxN
	4VyayGe785N+ew4gC3TBU/6IpxU2KJjtHp2a7TJulu5VU5EaohfUIM3ysO+mSkNk8fBu3QsO8/T
	P8zvVzTfFBQCff0TsNGTW
X-Received: by 2002:a05:6820:83c5:10b0:6ca:b5f:e6cb with SMTP id 006d021491bc7-6ca0b5fe74amr1221351eaf.42.1789667723400;
        Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:13 -0600
Subject: [PATCH net-next v3 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-2-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

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

