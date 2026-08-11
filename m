Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F942C4FF
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490928; cv=none; b=ca80Z4XNeLyxye2lTYqBW3rKhVyVtQh0ACLpTD0F1XTydnw/hcy+Xz33UM3YIGKg84u+HU6BfLXeKY/M8hHzejOzRo+G5bylN0CaseLXZpUI5Ot3u1MBGo9oR658+Dew+sJBVQFrOxMiuut4RonujXXyWvMjljUMB6CRLp1PyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490928; c=relaxed/simple;
	bh=GK/B8pOwlGpt6eA1invozWkbmKYokLi7estcfj50KjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSMmNNOd4yegb1dbB98y4n0kftSt8CySjSYHIRaHLwO/p3bCieG7lf2LD+LKP/Jz0IJZYKR6BzLVcY3TE/rL2dTeOsKzfiUe7qcZom3LCreEUN14bATHzF1RvGVjrEZlEKQTbV14y3ZKHIHDgPq3HbXN7P7+2aXSXQ8kpC+lnEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuZugEZe; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuZugEZe"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-49fa951b2c6so249307b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786490926; x=1787095726; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63zdf5RPhbrqfdDiAyDgjJa82jjDKftBr7Y+b2RfV+E=;
        b=KuZugEZei3kwSHzxlZ5rhNyGzCV0K35Igm5EHDpsvfkVT5AjFb1NhS5xyBpGbFQ6e+
         idj73ozvvFYF4Zlv4xMjI2rYKn/GbxMsoKjF19Ly56MCpzNdzCM5oXk7Fw6b8XefIMVh
         786Hbx+6iq335bbEAZs2dtm6cHc4AxAZcpSYysswC704XemEEKADuoCgZ8Ifcgm3c3FD
         +EHc6W7nqwtFxASFEK9hNeMfKGdBr40ixyPSBKmwE4aBPy93YPjTdKBjdIRU6v8xI4jR
         ElvnwhmZYLOQlG9ffD1IR+XRgWzECwwX5s6IZcZwxcx8Zw4GTJyLm7HIfESTK1cnk7vw
         dfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786490926; x=1787095726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63zdf5RPhbrqfdDiAyDgjJa82jjDKftBr7Y+b2RfV+E=;
        b=hgE2coi0JygnYuceHJRZOp6GfNqIR0EPYE2nKYmrIWp3Kb/oz2lFyyIOOIm+IPYRxc
         oCyjvOY+aoB5V9nxTIhQP3i9NFpPUxzneaCgKRKrPs2W0181wM6qPAW6cN+lAhdys/jw
         aSuK4q717HRxR50mApcr+phwWMvPZZl9j1+eF93IhOwj8TcliNcqKiiR0wXcFtMxERI6
         pkvMxWACnWTVNE6cFi7XtPie482MGUTSObUmPexcj+lOj+Tfa+7NsLkdFjliHeDiALT1
         JBTqacCOkGLeR69PlbNbvBo97Bo6rFcfQWHZQXdjoOudnr4xdRkTUbRW6DbPFwCCGNCg
         tNIQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi7gJlU5fcdV0TMdeWJQ9ihduiDAchOooEcCTpHHZlTfOOStyf7U/CEWIhCia1xUNVEFkvjuxpDS3NMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4Uhwlu6p1lHcp2sMXfLKMO432n1HfBO3RuSvN9zFumID3mEVe
	0G6Z2/Mn9BUMIyMkX1w2W9o+K/It02UOqrYhwbm5peQpIzQFwSTMsteF
X-Gm-Gg: AR+sD11x1U4FsJxp+2H98hVBd0YsdGe5pNpPQKaahOGPI9LCM2OLOtSiTN0UDkwjkbm
	2ncwim2JzY7KCIW4h8F08qFG/UIJggLTVGqv9P4nC9kxIK/AdxcJiMOM/uCHjdn0HL84otOZYcb
	WLDptUh+QLRxParM72fSNGRLKYt5Sj9DXmoONvtPs4Zf3kB+7kxsp/kDaI3PA6v7PsvLfK5jDE5
	qw0oUwBgPvXjSvBmx4Z2gyyANI9amTqL1IFj1T2G1Tw1LWmQZ+2ENHFAwe7iBh54nCH3XxErORO
	UCScv1uW+BZBVnQpRWDRHC51drNuakbSUIsok+5Io1u2XXtXScg8dJvXc4ymHt1e9eViNnGYh39
	Bm0cNjy9q0STLvIUTW9C9orcU0Kfs7jhOmT9gKd5aleJgNyQ9ib0SpbOsawZMCZKpneZYxwEavK
	3U9hEtOQ464c7U1vrvjkdhJQd0z/SucIxMomPR3heeGqXm8jXJru/ea2vUer6VrZSmU1Z6X8x1Z
	lvIfbVCucCOeobT0bBa8yXFnglifL5KM0CxKOCP4Gr4OFtTNi9XpegIN2iJj97wTW7D05YWksKu
	qL5pk+MGV48xqb1oHuy+fDmRS2Ozrx7nagy4uB49pzxdUoWQoPxJqEVQ/fZl45MXZ48RP63/5ga
	Si40mFejbd71Bz3hi
X-Received: by 2002:a05:6808:1795:b0:4a0:cf55:3cf0 with SMTP id 5614622812f47-4b210a0b1d7mr754020b6e.9.1786490926121;
        Tue, 11 Aug 2026 16:28:46 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b20019e83csm1888484b6e.16.2026.08.11.16.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:28:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 17:28:32 -0600
Subject: [PATCH net-next v7 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-acx00-of-dynamic-v1-v7-1-03f5b91775d5@gmail.com>
References: <20260811-submit-acx00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com>
In-Reply-To: <20260811-submit-acx00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. Their package control paths differ: AC200 control registers are
accessed through the I2C register interface of the companion IC, while
the AC300 control range is at a second Clause 22 address fixed at 16 plus
the link address.

Describe both variants as Ethernet PHY packages. The package reg value is
the link PHY base address and the child supplies the documented PHY ID,
because the identification registers cannot be read until package setup
has completed. The AC300 driver reaches its control range with the PHY
package offset helpers. The AC200 package instead references the
companion IC whose I2C interface provides access to the package controls.

Give fixed hardware variant-specific compatibles. Also provide an ACx00
compatible for systems which can contain either package, with one packed
NVMEM field containing calibration in bits 3 through 0, the AC300 selector
in bit 8 and its low-calibration selector in bit 9. Such a description
contains the potential resources for both backends; the driver consumes
only those selected by the configuration field.

Describe the package clock, supply and optional xMII receive-clock
inversion needed by some integrations. A fixed AC200 package may omit the
NVMEM field and use its internal calibration copy. Limit AC300-capable link
addresses to 0 through 7 so the control address remains in the documented
range 16 through 23.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..afe57bd163dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY packages
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 contain compatible Fast Ethernet PHY blocks which report
+  the same Clause 22 PHY ID and use the same link-side register layout. The
+  package control paths differ. AC200 package control registers are accessed
+  through the companion IC's I2C register interface, while AC300 control
+  registers occupy a second Clause 22 address fixed at 16 plus the link PHY
+  address.
+
+  Systems with a known package use the corresponding AC200 or AC300 compatible.
+  Systems which can contain either package use the ACx00 compatible and a
+  packed NVMEM configuration field to select the backend at runtime.
+
+  The link PHY cannot report its ID until the package control sequence has
+  completed, so its child node supplies the documented PHY ID. The package and
+  child use the same base address. The AC200 driver programs that address into
+  the package, while the AC300 driver derives its control address from it.
+
+properties:
+  compatible:
+    enum:
+      - x-powers,ac200-ephy-package
+      - x-powers,ac300-ephy-package
+      - x-powers,acx00-ephy-package
+
+  reg:
+    maximum: 31
+
+  clocks:
+    maxItems: 1
+    description: AC300 input clock, running at 24, 25, or 27 MHz
+
+  vcc-supply:
+    description:
+      3.3 V package supply. This is connected to EPHY_VCC on AC200 and VCC1
+      on AC300.
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Packed EPHY configuration field. Bits 3 through 0 contain the analog
+      calibration code, bits 7 through 4 are reserved, bit 8 selects AC300
+      when set and AC200 when clear, and bit 9 requests the AC300
+      low-calibration tuning sequence. A fixed AC200 package may provide only
+      the low calibration bits or omit the cell and use its internal eFuse
+      copy instead.
+
+  nvmem-cell-names:
+    const: configuration
+
+  x-powers,ac200:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the AC200 companion IC providing I2C access to the package
+      control registers used to power and configure the Ethernet PHY.
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+patternProperties:
+  ^ethernet-phy@[a-f0-9]+$:
+    $ref: ethernet-phy.yaml#
+    properties:
+      compatible:
+        const: ethernet-phy-id0044.1400
+    required:
+      - compatible
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - vcc-supply
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+allOf:
+  - $ref: ethernet-phy-package.yaml#
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac200-ephy-package
+    then:
+      properties:
+        clocks: false
+      required:
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac300-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+        x-powers,ac200: false
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+  - if:
+      properties:
+        compatible:
+          const: x-powers,acx00-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+        - x-powers,ac200
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            compatible = "x-powers,acx00-ephy-package";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clocks = <&pwm 5>;
+            vcc-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac200 = <&ac200>;
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id0044.1400";
+                reg = <0>;
+            };
+        };
+    };
+
+...

-- 
2.53.0

