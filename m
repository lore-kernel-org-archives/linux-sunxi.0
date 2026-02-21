Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922D279DA6
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771699004; cv=none; b=ZN1gIOH45ZvXny99TS16FH+vR5wLVi9yuX6ZJ+xOnx5nMGHAElfys9qQdHKm0+61NCQ1wlQXO4THNUdKxehEMcXsLg6LCHiCKiP88p4mIiycOgKL+RGPmRSYEd+NZCqWRzkYTl1ilIFKeUFoUwhXG7sl7SHKHWPE+uVdoO0J9+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771699004; c=relaxed/simple;
	bh=/FvXEaGUoGpzEkjnRI9XUIndReaBxEi1jDlYZjxu8lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qP8cAzAeQETi/mKVzpV9CcigwXFS/em+rn4s+CBpjsQ9e9zUIpplIWVSU15iHyG5wI3LPMYmulDp7tU2ib+kVff0x4UMpmAIsxCOiYvQSzz3f6kwESOHN+oxCEPSvuOYwL7ukmTqPc0jQglUFsvPVu9EEeehf4wu7l5OuiaPCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1iErlbE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1iErlbE"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so39189511fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699001; x=1772303801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=;
        b=T1iErlbEZwS9/FwSvNhCnADxIBHEVv+U0T5X3k6GBaZFkduCRaLRzNxHmloyCir5uZ
         tkArw5VozdEt4FFYc7MM8n1keSiilzysu7Wddkef2MPhCZKr2eDD5VtMvJxrtz3MWSq8
         h2KUEF/wj6lXJJu/1gL+PdKwBXchH+KhXqkQrI+T6F1TMuGX6aaUh0lTh4wGvtITAhQh
         lHyE9pKT5LYAjlTlsPJA45q3haHbFWrhw/gOc5LiLkJbpx8oFJjn6nAuGN+PELMGm8sX
         YZFABgHRnm5Nkg8JZL96WEqGfylgQOHyXOhyLAaUlOmn1EdBYVHCd8YV+5QPqDSlDHCI
         KJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699001; x=1772303801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=;
        b=iNWr57QfJ1fwMbD7cy/p6v1ho4Wb6cz/2adH79MJhzUmEhFJ6T0S9mbxN9n5afjzsA
         B3KsGCvPljggVqES3DQFsYfah8jUafUoWVjMJ7DcGUmk55aQ7eZ+miQsFtYYsINb57FQ
         kJmyVitaNP8yxZocnsWMHKqNtFB6FNPn4Y623UBefbGC5QblU7oy55UpcLNrWHavgOiZ
         tpLdJ4mn09P5Y6r+Jv3T9+WlvHuG+JSYcDYnGL43BROayWdVvkb6WeEVQkOu1U5x4BDJ
         Cud/t0eblR1btY6+jnWSdEX1aUj5KXeSyE+6KUX9cKLmxyYAd0jSZdmbALhKesBLKAs0
         zncg==
X-Forwarded-Encrypted: i=1; AJvYcCVi0+1xikh+74vRU5IjuYNZVXGF1CEDluYP2tx6wWS/im1jDT+N1dIfgx+0jpRCzqh9osDQk+zIFIXt9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtVnlQYFLAggRUszGN0gfybh3VQWHA25J/nZ9AWNfx3HFuxYzW
	K1WEVSqRM0nu5fe1QRpm8yac6orDsScG3zknp354K+NQeogTNHY1Ciw=
X-Gm-Gg: AZuq6aKMGiKt1HFj6ZyqVdp699Th1w9VxUnJVQil982Wv8WEQ1/IPhSvy5S3okYJY0V
	UQtcV/x6o2mhDsYvhZltQI2Hivvay8ivF12U9OaqOKxzisoDPI8Ep9HV0UltWX9mljCrAoYLclC
	iCs8fS0QcpcXs+f3iU4sA/GSe+q+LXIT6a3/9tH0fYpPEEsHRkPc++aCXoaJ+oQVQSA0tb9Y9Lh
	4vMXbM+rjWDMXTxbDDPQadC3l2QDUKJoJsbkpK3+MvxYB6KvlclKOQZsOT8ES8RysXmCJqfh4tD
	4Nb+GnvifNA9G7XkbxFUJpoTU1uiYwG2ykjtdF0caycn2TlWsBQuxAXQPMtsnpMyIluHrbuK+v6
	RMHyJUDoPx9jFyb9jvjmOJonkH3SlWGDdgXeO7nPSoTcLk+ZhN+xyEAXqlBfCF7YpuO3K2QyI1V
	Rkyjt+8L3H0HNDWExW7aUXu4C5yRa5352vZvdl
X-Received: by 2002:a2e:be94:0:b0:386:eadd:9ddf with SMTP id 38308e7fff4ca-389a5cdd595mr8800811fa.12.1771699000922;
        Sat, 21 Feb 2026 10:36:40 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:40 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Sat, 21 Feb 2026 21:35:51 +0300
Message-Id: <20260221183609.95403-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260221183609.95403-1-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller which is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
new file mode 100644
index 000000000000..306e14a9c4d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  allwinner,npwms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    minimum: 1
+    maximum: 16
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+  - allwinner,npwms
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+      allwinner,npwms = <8>;
+    };
+
+...
-- 
2.25.1

