Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3650348C7B
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037934; cv=none; b=bbSw23B66JLfBltsKDujywYix5gKUnQ8/OyaFR/a5LmpKHuhbMlFlBQ4nfpo50s6yTeLhC2Ep5ahyDxR0opfEdsr3RuZs7OZFipzA8nn4wIHYaF6GLb0IV2jOdyHN9WeBy1t83UJFMwty49nj9r3kmjYrVPHfW1/ppeGBorkO1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037934; c=relaxed/simple;
	bh=Gj+LzOejuhn4QUWRd2BeQZ06xMLgJHxeiRX4lCDRZzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFHOna3HZUVbv1J8BvfY/jHqSxcZVN6jeOOO21R2SzQ0GC8IoWDjCvYPDFtuCHu4Y/TYb/0Y/X9Qr+a47In8f2vJiGYtcoz8irSFcoPdOIGxrYRhTTmo7HpRgS9zK3TM9KK5neG2u6DdjWULygYbGbVPtqLwzqDTXWEn3pNMPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdhcUDx/; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdhcUDx/"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bb359e6878so1340046b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037930; x=1790642730; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=UdhcUDx/SlU40rBuzRzX66/ubXmeQQ+aEEreBv7xZEaLL1/ASCrUXWazCWRRAhZTZ8
         T7gh75BqPl+h0mG+xEhQ5tJdkKtzr6BJaRgVVsXqR33eCkaTNR54H8xXknx6xDi0bXDB
         E1Qnaj7/bFCpmgtI3hQa2myXrPLrQ8l+vIBmld35M6g0Py8Rddohl7sLJ7jbdmbwGTe5
         CMH4RlCQWf+oRwtmYkYiU4z1FcBaz+dTZd6YoEPJam8aF3uLKwJ0SBNUnTDfnAKKFaGU
         8OOugft/dU9i9kFXvEqs/ckffs+ONoF7NxTZzoOUrfSxt2woTsukiFjsJzj2ubAJEm0o
         wt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037930; x=1790642730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=09t7jmcN0m0LVknrmIKMakHnbSfHPpaa0q/V9Byfz5RROZ0LVJjAly6z29o0FrnFr5
         Sndxcx0HaIcziwtppJ7eMHHJ3d7JaV1yDxDezVGj/9KbQ+ukY08zkUSBjxxO8iTcaYp3
         dfrLrf8Qf1jcNXVaiw+866vYzSS7g0T+eLDeTnIcfBts41lyHLiQMfu9S/w3RZEByFqM
         /j7u6KqXjWselF/QtwQk6HdgCxgIBHB2koKFLvRD0ikVPncYGitUL6lDtaTMDr66q3p/
         Lyr52+SdmWaM9OB/8kBxWdwk/lVm4+g+g4TjJxrqy553XUaLFEWyJQ/gDpOQoN9sqDzS
         yiHA==
X-Forwarded-Encrypted: i=1; AKwUvBw2xHZmgcIu9vUBU4HhMpGGWSF6qkWo+QN5/um9VRmgI136AGq537I3WzH886xSUoqbLYttAnxKKJMfdg==@lists.linux.dev
X-Gm-Message-State: AFuF++miEWTyrgg33eQ3N21/p4v/TaEIHv3ca9UkRmYXYLCoHUVChqkp
	nXbmpq2IS8DlW08/WYzVBpNlxVoOXiym6j/1Em0B5n7vdjoDt8heZHrO
X-Gm-Gg: AYBFou3F9+7XQ5TF088IrBbY2NjFz02f2fYHINGQ/Ee3GCei+S/4xMxnsWw/xKHBwTH
	SV6prEyAeoTfgQ4ys78usYhsu228strMAwhGufZXTu9fb0msF2U1WYumO4cd+dFizF2plYaPGzh
	l4J10lhyJwr44JSuL2ZasaoTvyi/4YSGY2IZhAv+GH3IrTgE8gev8JX9tOHbZiGu3/sZ0D++Trc
	geQg/1M6HNd5j6SGxOv1rF78PTs0ogNLFVJevcjgAniQmFJMpjiDMh9uJRItWpMGwPPQ7zAJk0h
	8br19l1FW3ZasheUpvt8N1QfRwlE4NqZXr6dnf1bnW0TcSeMe39PdYOcQ01Sj5CPM9jfsNN5MKY
	uW4y479XkuSxqDFQe2fHnhzHz53FlwMwfiZ5iBOP5mKdBd28nSqmkheZzEx5KC6W8d6ZF2J+ONa
	wETAu4e/PQ1QOEWIsl/8OaUSYh6stYMLbUbS5f2MCA0P7gMg+R9zQQb7Q60dxxa/+p7o4HdtRay
	9mtZXh+f5h/MfM9dHmkAh/GMpApxwfmMBxkshliJOhoowL2sqY6xCRi3/nYH0rBzwROp2X7Eud8
	z3qff0ny1Mu7rGHY5snAAfZFVlLx4If1QHGngF7GSmytIiBAhjxEJN+buF5zEEzErnS5UfsG8zI
	poZ+DzfINTWKSGL4TcUk7LA==
X-Received: by 2002:a05:6808:1526:b0:4b3:7aeb:1b73 with SMTP id 5614622812f47-4ccf59c8345mr10592065b6e.2.1790037930082;
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:25 -0600
Subject: [PATCH net-next v5 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-2-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
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
index 0ff9e3284a06..3fa6e17c3d12 100644
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

