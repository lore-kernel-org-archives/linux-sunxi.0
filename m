Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC838F659
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377336; cv=none; b=f8J1QYNUF1BWaQf4RGkDtQSyuwvWwEPkfUEH8PJXvh9y5pkvw8cX4sta2n5/g9FgOvxM3XmafspUoyScNg65JlPv6LWDSqKHdVqllgK2YsW/uqg+5f22iJ+84Vseh2vGK3sJ+78p2onl/vivTsf9OkmzhYecXHZ00bB01PUlHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377336; c=relaxed/simple;
	bh=FM5tgF1f4gTluCeeCOhkUzBtb1GjjHUL6PkplRSqmH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufk/rcYBiGWN8HB2BDhl4SQq5QORyijEsAchiTdkClBRmVnJkzoa/+tPWq/KlQ+iYdj6HeErJq8924JUxAfDQCcsin8S5YHkfDWLbDYtU2Y3ofAqWy571ptOb4S6zRfcE+4bUyT4pSINUVAdFS1MuOUcIOCygJuoyDBlUKW+700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at5+gohF; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at5+gohF"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43bf9548df4so1250030fac.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377319; x=1788982119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=at5+gohF2T9p/kgEdq3G1aCghavQgjS35aYtLKWMozQZFGV77IDUMq1FiwxSVJ9RWs
         4SFrWfTVmEnPp5w12/xVfsdiBy8KGa5hOsWq1i/PXCpWSo7uPQp+M9a6puow1eWhFlom
         ZieSTD/cmbo0SEEMZ6iz53dpcRjslGDYBw+wDwgYxIRG3h81w3S7gVvbZEm6cKF4fJQQ
         llJASDWHvqJaWOccCs/AvQlc672B6/OL2h2XJZlbARHTeSKTSJI1YQS1OgQyCXdcQUkY
         z6Dp3BmBjk1v9OEJqhEi4B5lLnsS4VnrBauUhViu8nj/iCmnykxDOW1iVu4TjrcHvJct
         YFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377319; x=1788982119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=JY+WX0AzJ4Wj6Uc3g8OhilPCOJRFq5VP7/pNZPmg3BzuHbPY3TAiR9pXskYEmDxFd6
         /baf+OIUTmE5G5mD6849SCLFXsjCPjljURFZ1mhRvHGvwTQc52smDfOOzviAVEeFNUVR
         9MXS1jDy4PsOKqjcKJJQK1w2pLZNxST772SrXPRx7u5DIiV7FPWD2dOd9Ix2W6xiUFQw
         oVkKbRD67AKNYoNwkFcZ70x78GvY6USHRYPksXoYPQF+Duhesga0wH4dOYbun8Fpvv+7
         g08E7QInjxxZPGewuBwmgwgCnszDqHCOjHp/mF5ZYbaNuMycTVyUL0gKpW/7OZ4R3aqQ
         Abqw==
X-Forwarded-Encrypted: i=1; AHgh+RoZeRDgY1UwYD+ctFVKt9TqiEWwtrjr/iv3ZFJCrhYTTOnIhsLByKhL7Lb2ajni2P+4UDcL/g4PkfVxNg==@lists.linux.dev
X-Gm-Message-State: AFuF++n/P2zaC8VTzrmRPE99PvP0m0lZldPQUFYkrClfyR79Oh8VrcG4
	K7hhYyw2vt20eNRsl9gruXxO7znwIDxbaUeBG9OC7IXQvjBGWmRyoSVp
X-Gm-Gg: AYBFou3kR4LaZUL0AcDdWzsGsyN0FxDn41B/cs8AA3uFsVUaV/4JG8bO9nRc55vNrYo
	oCZLfzXEMuo83U8VVCM/Y4zH0kbY4yAw1nDmrjg5jtmbwJ2AdtWB5TIIwDh0PdesnL1SqKJsgHj
	cjgfFe232z4mFUaMk97NjBlfbZ3o70/0mYrKGuVOKrY/HYfHIr8Mr+s3kv0uG7x/BgSpaP2kqpU
	pBEaRGZa8jO4EyDON2qJ18WkPf2PUaeK0Vr4UdeU9+FQTPh7cMqCKhJuPdl+moNAKra5p+wGbgZ
	2qoCXGce5nGpJ+HwLEJIor6/Z7HASS2Ltkk6mTYDAPGaa7qvQpUSAvP8wrRAxo6fWKeblrLKM9g
	ReJ7wHK8XG59SyQZswzbs1kKcSw//Udcml1WU6P1/yelztbVOo0WzHdokdLjo5aVP6ZwNW0r1mA
	TFV60XmOdr/+M9i7Q0zRiQnqLhQ98WM2/uAxHl4lp5YpnuUdg2IFaUB9Z/Tf7sdWd9krw8E/Nl4
	Kgxpwuq1uF+kb0wE5t3b4UOXW2gCME6nu+tN893t7+vEPkv3UpUZ2mMUwWE1+x3uc4dpyJ6nem1
	61nxvu0L8pZv9H4HUIBAwejopXI9FP8BgYrYBTAk13M3ccWUfFgqObzIdmnTT4YZAtFlrMYNk/X
	mFygbb7/3OMw9BArx0Es=
X-Received: by 2002:a05:6870:1426:b0:46a:dfdc:c77a with SMTP id 586e51a60fabf-46f86ce6964mr6864969fac.10.1788377318780;
        Wed, 02 Sep 2026 12:28:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 02 Sep 2026 13:28:24 -0600
Subject: [PATCH v8 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-submit-ac200-mfd-v8-1-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
In-Reply-To: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0

