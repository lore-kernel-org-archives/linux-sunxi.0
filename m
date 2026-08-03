Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA919EED3
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734124; cv=none; b=V+jDITplVo5L/X72mthifZ3mUb75pYe9FTU3u6Ae6Rt7o0g3/zlhfLjjGoKGhBqAAV5LpSXqC9nQgUQzSBRg4RfX5q9xZRIEQ9PJV5a3Kn8QAyG2ASbjgzNwSqzrK5Vwk03mjbA7piyf8O+0KVxNvOfXH79GSOgTfpyY1Aa7j8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734124; c=relaxed/simple;
	bh=n3evcqugoeKkN8mct7F9d78wCyor72fP/A5f+80l5jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdiiLGUf5vUxFW3IQq12+h6wOK9uBneyiM9PQ8ZyqR4aDGxLnx/6t5QzZgTqmyuBJHxelvOlT03O7Cn7QAeoO7/A/UMoQafNS2xQT3bAmwYAXdtAEf+lYL7z/F5QkQd8Z5f8nTv4d5kxhy/OvXXpuqUhfzz6oUKd++Hqa48NZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhXwd61k; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhXwd61k"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7ec49608332so1441041a34.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734122; x=1786338922; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=MhXwd61kjF8aYhGmyl+OEY5DxKM1pvzPBzM63EbYmoJWroMQ3EjOf/VzdheVlgZJKk
         0yG/crDUMQF3snTOXkaYhYzOeR88t/EX5TPilCS5Jb0M+t8ScMJcM15UMvQxzSVlBu7W
         adWrd+DQV9QMl8pLh+Tk5k9a2GlsgM+hgW787eQQMYXt89Xd1ZwCR++KQoOocqB/6C+s
         dNuU2OmTDWAU425DMYvr6bv1gAXj2COflUJ76m0ngUCC/tyESmE2DrLay4tbDENs3gpq
         4kvhYUjbfHkcFRkObRK7Desw9LXbnLF2J2Y+m3GoPPyScOIiHnmlmePjgaWaeEB0PPNb
         iz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734122; x=1786338922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=oPTJwp6k0AEvQ3Sb8Vu6EHP7MtlFTyI+Bo+h9WLD+Al5qER7mFEtZ6XaBUIFcIECuO
         SqllC30vpwRRBvx0l+L8hY2zc9ncJ2H1wcLN8j/YceYZJP7kaOcEI0vM8aWmnLxuNaYN
         e7IgqDdPM9v1vmaSiaw4laEo2Q3kLeWaUIllQcT3ersoTSksU4q4s07QAoP8BDhQcFaM
         nh0d2cWH3AYgpIw+9iKh2uuqF0SlAIo1U92ONV7Mcg+jxP5+AzCaKVl9Mqq3WzUxyBWI
         ks3EVQpTie/t2ybo21wONt7gRG5I+YKYBeW+vSPlFjOTxZjD/ax1uWiYn1WNptvJuiG+
         Lhcg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh4sJLBtOW0F4ARCR+hRMCSpCBafbHAz8QLoF/0nBdUDR00lvhEbdQS1HfJIRL7Q3IXdu0P1yNEWlBXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxef+FQ0uV4PMIQJYSd/VUMZR9hoEDb4sJgrAuaDLZpUFqvtvQi
	APqGHec8ejFv3+gj1wSKKsPyClzlRWCq+PfaHqjt2ngRwt/Okq5S1Pgo
X-Gm-Gg: AR+sD117N8sVlHFVhJtMmK8wGZQOmq/TzsWrGTWpqB4cJ6sjyeEf9Ma+LSA7fUkskX3
	yz3qx4jrAG4tYgATZGbCYEFYNRz6rkr9jFlc3ofYrdjK0lXQYzsVbmkXuY1jH8uh+ctcFR9tCI4
	XBrDB5BGCq29mgad6epuaXgHPW5g/UOUNC+FyaBNoX/KjW1qsGOtZw9zAj8Cy7OASICizLZBmLR
	CYA44+OcVxpB1IATrx9AIz1T4mOv8NZCfn4qp5nf1SyrlMQwdz2YC2wGyZXOOzUmHr8xLcd4NBC
	lWTV6Sl+M1oxnDpIFOeevvvSShxJDvXg1a/A8ooQ6rQj3cxL0R3gPnhyUgrCEVXNJgjp1EmfLEc
	lyoMxV8t5SZvJPW2TtkBllVgM5zfBW0qwWFhfrIHhvtEBuMAIdE2ckDelwRgEbDFF0uP5VGoex5
	yQAEgzFNIWLCe7hNm80+uzqAPPIWXHs124WMhNTA2eu5Y8pQRJpoDYT4IQON2gC1G7Le1s0vray
	fg9SGy6AvP/QSoDegw/jpiRJmUggyJibAYqvnOFmO8UgAl2UquixPAFWHAU1M1v+OX+cnzhRTru
	jN3Cpd0VcaZJyhVNw8pAjgFLYtuccLuf6q+o7hVEsXiyHXzyRZG4D6KtOjkhQhS2qLUuf3+jMix
	Ebf6jsN0wql0IVUBuVZeEmafmwK7TTvY63ZbW
X-Received: by 2002:a05:6830:83b8:b0:7e9:d277:6e2e with SMTP id 46e09a7af769-7f196cae28amr13872954a34.7.1785734121347;
        Sun, 02 Aug 2026 22:15:21 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:11 -0600
Subject: [PATCH 01/21] dt-bindings: net: allwinner: add H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-1-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

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
index 2449311c6d28..102ec98ac2a0 100644
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
@@ -622,6 +623,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

