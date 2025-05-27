Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E375281504
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368586; cv=none; b=k6YED95fu6l6AvSTxB1bxbnT7T8BJZUQWNqicZCbwYJLXDpJoEIGKoVlWHP0qH/AXEprWCixPsxFBpwD4An2nCV9xJXccSSqumUVoSHUeVDj6+E0ryPTf8OeGsp5pdxCQQtV3lAEjkfv1n9BTmyVSpp7phEeDkb+mlwW09hw8cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368586; c=relaxed/simple;
	bh=ysE5VQEeovJqr9bZqisHWPRj0Fb3prPMdXXWvIA1Iwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cYcA11Qhyik+DPAA/Mf+nUDghVgd4nfdCl9oH4xHsXlwR60vNwR/I6dy88H6NTSOdATZHI9Znw6loAq2jznWTqc5rykJNlXlreqi0b08i/utsPxjMcFAQdELAIhdKfYP+pwaLuQC3MVJBo4A86ppWEUZovOFh7ln7U4WKZbaUFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UC0h3Qvp; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UC0h3Qvp"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dd87535709so3358215ab.0
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748368584; x=1748973384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75t1KQGtX7DtR0KwXgxMTDEvGLkyel42aN9/Vltyf4E=;
        b=UC0h3Qvp1b7WWweqMFiD5tlukkBA6DDytSAnFu3D2EjPbGpErfG1fugGqzZRjtZjZe
         JxzFr5g8g6u9pJ2ZpmFVYF0vlLVvPu8LH/Lb+6kygVL14NXntvT1IwY5Kmhv8nvnFRbM
         500JaRe4jiZQcJnrDgG/XsYqKn3kf9Sx8L2VNQHh62F7BA3+WFyDSxxJ6vMmNWm5bFDb
         M4yvw3r9U3T438ZmOoei1CmDP8IWzs5WNrvyo95rOUsnLScW9+nNowyqGvAPJmOEePaT
         1o74U4yYqi6Tf+uvrcBUUIbUmUH9p6c6R9ypBsLVlDjamlSgnue+Fnl3jMZn2Tf1jAMm
         rBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368584; x=1748973384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75t1KQGtX7DtR0KwXgxMTDEvGLkyel42aN9/Vltyf4E=;
        b=TAqswQvLGHKoFng/oDKX3tQ0AovqUmLItvDkWNVidDB8gqFttSEAMhJ2gOxLYqlwhi
         womf5tkLvdf6PRgWrpKpJFSYoXP13EqihL3iJkAflaJHRyBR0N4JQJk+e4EkD2izxjmz
         21ZUHU1oMMC4MXluAeRqWe0Usmp1P2rk0ZCyRHyG2oz0YArmmJ9swrgaLdCNAn9VZHMj
         E1vbO5r4lSLsE6YLzKoKB8Ql49MjGj5CSV9/714KbQnQPxlwNZcOrSQH8mgSP3uOMhTE
         NokJ7/1kadZWEYHmis34q7GBNCmxaa9VRm/mQSWEV39HDDhwvbIRnGnayxubqpWCj+L8
         jzoQ==
X-Gm-Message-State: AOJu0Yx/SwMZS1hAZH4ac4uvGw3xzOhHpSam04vKteU86JQxRfCfW8SJ
	vb3iGCaUF5x6Z2webMe+1bCBmX6nOkClixtUxFyUg4u/4gFes4/+Rq+X
X-Gm-Gg: ASbGncvnTBTo1mXkhUn98GG8ziWcKmjQ1r1k3g1o38F7KaJQ9O02Eim2ChcoVoZmwEj
	KXiqpEY4YDTveFp9KJTZeY+B4mTBDUIrT3WS4n6Yqk/DzTnQNGl0xXdzdCwCquyFLr3O8oxGKoI
	Sf0oLCt+iABMJxNONq7xe9GPwcSeA88R8FGI76V/hpJoh9VkNVoVAH2/UUrt1dY8JGozBVU3jqK
	i+PeYMsQ8rGOpWxyYoSG8MYo/Tt+EJrPDCB7Bbg8bzvIZKLs/wXwL1PPHL6iWKBRDhUx6NcCG2+
	cOiCRir8axAiHz4hoaYKkxoUYMdLvL1gCARQLKGpkwdWRbnNdlf1QyofC8qcMHm1QVI2DSnjZMC
	Ob5dgTxOGvOCqKRzB/cCo2ApR1AD5gA==
X-Google-Smtp-Source: AGHT+IEG1Ty/l3Gh00PtWxsgabl40eUie4mjzIcYjsL+B8so87NPY18sPvIj6HQRx+VZNV4Xgx4J1g==
X-Received: by 2002:a05:6e02:144d:b0:3d5:8923:faa5 with SMTP id e9e14a558f8ab-3dc9b6aa36dmr108298815ab.10.1748368584073;
        Tue, 27 May 2025 10:56:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:56:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1 nvmem phy selection
Date: Tue, 27 May 2025 11:55:56 -0600
Message-Id: <20250527175558.2738342-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527175558.2738342-1-james.hilliard1@gmail.com>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 EMAC1 can be connected to an copackaged AC200
or AC300 PHY depending upon the variant.

Add a new allwinner,sun50i-h616-emac1 compatible and example, support
for the allwinner,sun50i-h616-emac1 EMAC1 MAC will be added later on.

Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
based phy selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix dt_binding_check
---
 .../net/allwinner,sun8i-a83t-emac.yaml        | 75 ++++++++++++++++++-
 .../bindings/net/ethernet-controller.yaml     | 26 +++++--
 .../devicetree/bindings/net/snps,dwmac.yaml   |  2 +
 3 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7fe0352dff0f..3a8c31dd9ae7 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -18,6 +18,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -58,7 +59,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - phy-handle
   - phy-mode
   - syscon
 
@@ -73,6 +73,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -189,6 +190,42 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - allwinner,sun50i-h616-emac1
+
+    then:
+      required:
+        - phy-handle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        nvmem-cells: true
+
+        nvmem-cell-names: true
+
+        phys:
+          maxItems: 2
+
+        phy-names:
+          items:
+            - const: ac200
+            - const: ac300
+
+        mdio:
+          $ref: mdio.yaml#
+
 unevaluatedProperties: false
 
 examples:
@@ -321,4 +358,40 @@ examples:
         };
     };
 
+  - |
+    ethernet@5030000 {
+        compatible = "allwinner,sun50i-h616-emac1";
+        syscon = <&syscon>;
+        reg = <0x05030000 0x10000>;
+        interrupts = <0 15 4>;
+        interrupt-names = "macirq";
+        resets = <&ccu 31>;
+        reset-names = "stmmaceth";
+        clocks = <&ccu 83>;
+        clock-names = "stmmaceth";
+        phys = <&ac200_rmii_phy>, <&ac300_rmii_phy>;
+        phy-names = "ac200", "ac300";
+        phy-mode = "rgmii";
+        nvmem-cells = <&ephy_acx00>;
+        nvmem-cell-names = "ac300";
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ac300_rmii_phy: ac300-ethernet-phy@0 {
+              #phy-cells = <0>;
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <0>;
+            };
+
+            ac200_rmii_phy: ac200-ethernet-phy@1 {
+              #phy-cells = <0>;
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <1>;
+            };
+        };
+    };
+
 ...
diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index a2d4c626f659..710e651851e5 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -45,14 +45,6 @@ properties:
     description:
       Specifies maximum speed in Mbit/s supported by the device.
 
-  nvmem-cells:
-    maxItems: 1
-    description:
-      Reference to an nvmem node for the MAC address
-
-  nvmem-cell-names:
-    const: mac-address
-
   phy-connection-type:
     description:
       Specifies interface type between the Ethernet device and a physical
@@ -260,6 +252,24 @@ dependencies:
   pcs-handle-names: [pcs-handle]
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+          description:
+            Reference to an nvmem node for the MAC address
+
+        nvmem-cell-names:
+          const: mac-address
+
   - if:
       properties:
         phy-mode:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..a6dfed00c48f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -56,6 +56,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -620,6 +621,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac
-- 
2.34.1

