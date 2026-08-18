Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0E2931DB
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787034152; cv=none; b=YG8HNhfTqcPW91QrqHy2CIN14TK6Dm68GbEzZfGgDfqdf7QlZzsCxg6vLnN1zRpOW7i7YnMa2nbLsoMrajaGthDFnd0KuQgIU5BY/kNqxrMSasgXQogGBB25AwbDpgmYCWwD7QlFykrXJxTrwlI0+Or2rg2+JlrHG+2WXhKBqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787034152; c=relaxed/simple;
	bh=cc+qS80i91e3iF+LZeQguwZtW8X1bfrYw7jNSRlkhpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBQrxhnwYoh9OtiOrl3JCdojOnBGYkTI2poHbD0Y0OesYVkzGvjlFM2Ru7DKWkimQp3GI2nB/njRR3bXN/eMeHKyxzhfrCyGZTOuEOfOffnGP+tPKU3DYkIkhaB90AbFb19WRNf1RLTveiPR/2SrFhRr7ja+mPBsHi/EhKTkLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrDa8zLR; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrDa8zLR"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ec1e9d3359so2978221a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034149; x=1787638949; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K28+i2/PlfR+JETeUlifhNXKb2RdSy48tKswPz635Jk=;
        b=mrDa8zLRlB0I9CD7uT03FOVZDtcG4RJItTu2Eup9a+TCxw+yxqQ08uM7xya890eGiD
         rRNpSEhuGptYrcrG6Gp4kbmMl52wW6KjnUL6IgZzmqX35pg4HPWHDwBwsLYoHRtTHh8/
         2VGg+uRDUuZ+V/+9uPnO3Iy6AsbG+G2AMTMdlqcC0gNBo+b5ynVaCgLhSL7MBYHlny+Y
         KGtDq7GksaNXqoeRhVaLDAusQ2nuClUeKYQXoXOs7w7cpMY4kL4tENzTlpJ7uItUEZKt
         Rs+aOW4LOS1kpK77YRZfLRoZXlpgHS18IfPcocGzbsUYaB32yoTZpxBRbE75Uk5So4xy
         WIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034149; x=1787638949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K28+i2/PlfR+JETeUlifhNXKb2RdSy48tKswPz635Jk=;
        b=N47rubO81sexaDl5f4BmSfOkim2g2avcm96j8W/KeTwP+obsa2tPZZIKPUw4WwoLSk
         6LBTOLsC4nqlKStm2simKvIeZxERjYUVY+o8ls71WlsEigsakPgI5I4BKnDdxmkWQes3
         5yNNeifZuwh2CBJrPd7Flh4SDUpbOf5JNKs6+LJ6sHpNn8G4qw48fp27glUjLopvyYJF
         sGZyIvIRK1dzSiWpsOmCSqsCCFWPgcTl+G4UYvCM07JW71iVHGUMFRXPSg7BWRscpvCy
         yl4T+YMUb0sLD8Bn8m22s0ikgZaj+MsAehGZ8azXPB6Ag5uIrWcXPAnULGghoRWOygyR
         oaCA==
X-Forwarded-Encrypted: i=1; AHgh+RpaEAbYDzCtx9ph+CrgXWYQKRbRf9dY/8DBGZxxZCiaD77MjvN4zSKthgWtpWdcsCdYK+h0EkomgoSglA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzegOoMrCx5hlDkdcA4uD5OTaMv+WTrXGm7SvekH4y3mIq9RFPD
	N73zOLJpKOe7UKWsd/yco0pxbYgQyW0e6PhYpNBlEVy5pKR9IlvBK2Hf
X-Gm-Gg: AR+sD12EG7CtOrDCB4XE/IigsM9UeM9PK8yJKCCzgAZcsgSYpE5dHuOJZOBwHJBV+pv
	/7chpdvyH1TDXvtmDkZH506FU+oPsTqfDSxEjL3qJkU1K0mkx1L/uN7CelLX9Tmyq+yygV6V/sz
	DvwdKpEE+PgbiZo/OAp/Y++656WVD3Ps+DK1IK7BsWCOX7MsDvQtmrENkVYzyqgmB6GJrGOpHS/
	ogT0XalpE0azkZtIq/sGtTDV6WxbI6F56tfZmNQcmt0aWeSgvX5NiRaAD/Q//ahDp9tN6PIL+3g
	xh/jFPGjm54doLHEIMUrZn37jm6bMaIEEuXrPMduJ18pMMGBU80yUMTV9iVMScOR4KQYkXk+ikb
	DT5ktz6ybQThYVkWYzM71sDigFMwKyOdcWOMsdyldyPkktbKjumwNaqlCPoHuqoEu08A6g17m8Q
	8172yStdsR0uP6SHMcI2t2u+lrofJ/2XvEUKFJL2U17OIRQQ9hSue7clfqetkbhAO5CbgPyOf5e
	A5lmRfRA6/fMJvBS7RceOZ5VovULZ2SGSTLn9sRzKTEpUQU3HOG57fIJSxh8RY0EoxbaCcRYcgy
	SPDB5bioUPG+Cwjz0ZA1/W/NKrqExFa3B5j2twTcdkoncRjydDzeX78ZYO9NXc8xIjhxKN6z308
	pajEFX1PmtU++4/oD
X-Received: by 2002:a05:6830:8284:b0:7e6:ef2e:28a5 with SMTP id 46e09a7af769-7f423f8edb8mr6119032a34.15.1787034148992;
        Mon, 17 Aug 2026 23:22:28 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43189775fsm298085a34.16.2026.08.17.23.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:22:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 00:21:16 -0600
Subject: [PATCH net-next v9 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-submit-acx00-of-dynamic-v1-v9-1-b8c8d9ad0d83@gmail.com>
References: <20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com>
In-Reply-To: <20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com>
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
package offset helpers. The AC200 package instead references the companion
IC described by the separately submitted x-powers,ac200 MFD binding. Its
I2C interface provides access to the package controls.

Give fixed hardware variant-specific compatibles. Also provide an ACx00
compatible for systems which can contain either package, with one packed
NVMEM field containing calibration in bits 3 through 0, the AC300 selector
in bit 8 and its low-calibration selector in bit 9. Such a description
contains the potential resources for both backends; the driver consumes
only those selected by the configuration field.

Describe the package clock, supply and optional xMII receive-clock
inversion needed by some integrations. A fixed AC200 package may omit the
NVMEM field and use its internal calibration copy. Limit both the package
and child link-PHY addresses in AC300-capable descriptions to 0 through 7
so the control address remains in the documented range 16 through 23.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..ee90c4ffecce
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,165 @@
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
+      Phandle to the AC200 companion IC described by the x-powers,ac200 MFD
+      binding. Its I2C interface provides access to the package control
+      registers used to power and configure the Ethernet PHY.
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
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          enum:
+            - x-powers,ac300-ephy-package
+            - x-powers,acx00-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+      patternProperties:
+        ^ethernet-phy@[a-f0-9]+$:
+          properties:
+            reg:
+              maximum: 7
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

