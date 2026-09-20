Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4764848A1
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933550; cv=none; b=Vxxoakgj6KbDiHeZTu2USIdzPlxPXDbLft8DTAd0V4JA7M35qCj21qvP/Z3e5P8Amlgb9nYuVN4lS9tt7g3dh9QUDdyw2wZLFJxMIMJb5q2tGC65FdQoVN6xguuOeMiU6oPHbQDrbHUaPrtFlMsYtCvWnSD55wAJl5EhQc9wugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933550; c=relaxed/simple;
	bh=Gj+LzOejuhn4QUWRd2BeQZ06xMLgJHxeiRX4lCDRZzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJv7F8BGXLNI7AZumACvW2uNz61yBPnpOAEi4aXqFZKogEeWNPRu/JfrXuRaVhnZzx6w0iymOrr5HeqK4w91B2GywFhblyMSOKwqa5su2pGKJUDHms3FRcJbX630ZbkhI/Wfc8YHvcXgsLcuH5rPKqpOmwhY/NROz/P0KDUzvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8uqM1dR; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8uqM1dR"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47be948a50fso1590038fac.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933548; x=1790538348; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=d8uqM1dRXRwX4Midl235NgilzRkgL3UAf3UjcyzTm47/coVWPC0U1nZ5TO6r8fNa9G
         hrPsHT832x8/m3efNgEK0eB0Jt8qMAs9eN3In+AhDHE0vAe7iRHlhAqrTX8WXkT6v5YA
         m2C0yNTy5I2oPG0eDKR2Kt8Z6m4Yisy4mdnHicYkuv4sLB9bcdIF3WlUeLuaxYg+2vdW
         kb9RCafY+LLf+3PyKym9D/8qmOwgbrz2bzV03IQbUtv3oAKM81U5bfNldfePTwmAzreW
         R3zSIJHzsy52EabRWxBNdtaEPImeV691KkPm9Wk275mBsMiShiBErwhNCjEkjmbLYkmF
         c8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933548; x=1790538348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=KrY2dsnushVAp58wvjgqlk+Il/Sta37SKArt+l2l/JlnEyg+1lbBY5bxIu5pX95Dfo
         vpk0ePREVlAsWYYTOsYJ1+S23JUfs9FXd9XVEn9TQZ/5dhwEm90Ubh1ffVJm9+DaKdh+
         JgpVmyVtFm/4Lyk8/7HL8BTpHXXxLmLvzBGrCjRZOA8UHAzZ9bKnid4/Oif3k4GaFYxz
         sDU8ZAo/GKnCrGArKbmrFLUzogEqC3lg4dTlOo4d48jXwSXar1Bn7YbJFxZwSCq42Ww0
         1DNPy//BSPYDG6KaaAXz49vLwmB0bgy+CW6VA1dLaEFcjbwCy9Z8UWG2/mMo8sniMzMl
         uL9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzU6YDsjM0X9SGOfba8ZszSwyOu7ORME8SVIrgu7YevObzJa3F0gaAQFenG/xUGn+JoY3L4aHAg+cP6rA==@lists.linux.dev
X-Gm-Message-State: AFuF++kydWq2oIu2VXrw4a10QBiR+zEHqlray6BGQL0RoK1Jnx4Rh9WF
	RaluzVOVpBLyUPvpmDv3GfO0Hd98E3A3pVnDQis+6PMIvPiGxHPANDBB
X-Gm-Gg: AYBFou0Ot72mEggrHbMt8lfrqKYDXNq2V+kHuyh4miC7ketL9YL646xhvecNAYTst4a
	lTR7M5eHIJj2+BRxLbbBk8w37qniDJg6ADtGgB/eUIA9eZH7FxNYF33GT/GajOYRoq81WvYk/Gx
	9cAJAIQJgKdyNv1VOfzNoKWdIeJdyNsMDFTwBAuu2ql8fNpyo6IJLrXo11rh8MOiH4WwsqvvLXk
	EQHBxYF9r+ttObA7CeOSsSEvm0IohN1DRUagCD1pE66Ovm6lBAf+j8drVawc10Btri90DS11Ut7
	70EpwCKwbPRAKDjNThI8CHiCwaasNq7TrJbXvLRYuKzSSU0nlar5gpDCc4ZLmf95gziwwRJquyI
	XQXP1QeiZYIycHPZwMOV/pmNOQDeeZUToLeCGAnzxeOnF0gcnKOzpyxVKnCuJhli3Z93qWdeN4X
	TTryPL4tX3scOLzRUi5ISr6nHrnzQDrV0ayVtTzWpgmbh87NMh/XNrcS101Q946laVorUaFyHmj
	huxNhgPHcC5T4u77i1S8A6E7d5D+u6/h8NXTclRBBcNjj7SkNr47tsz2+l/16DNAC0XCZmkVVUg
	qufHDlhJC3cOIvyAmdWSFeScOZga9agJjkgo8++qLhcMYfhSgFwwJMUwj73x6iF4YAJPKsZPaiS
	oNVs5bjO9Y7x2oy/aOMvB
X-Received: by 2002:a05:6870:140b:b0:448:cf96:25c7 with SMTP id 586e51a60fabf-486e5a6680cmr8538751fac.17.1789933548079;
        Sun, 20 Sep 2026 12:45:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:31 -0600
Subject: [PATCH net-next v4 5/6] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-5-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
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

