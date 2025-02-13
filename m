Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF4820D4EF
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439660; cv=none; b=d5QBUIPpinz3PczZVRcuJiBnugARER4cvvIKWI6fnyCbt/Hzx1ghN/znTBIjb7aCBrNl6LpC0VWvqeV/xxj/UChYKIlFyfqQUzRiwQnkz6xuAOUfsTzm8FTPvviURysnVyNS3ha1BCn+P1xRxW5d2D+7/JWg4eE4Wq5sJczEun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439660; c=relaxed/simple;
	bh=122zqtZiKS3kEtcfZ9feBjNttG8g45OLOdftdwpMMeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cpnz4Eb4uIJV4gIhRBQtqbFa6cdVTv1l4lx3YmU4S+1U4deToVCU2tL2io0JDwK2cSQN619Bw/fqfsj8yVvvXzw9ACy+RWiVtOSZwnfhZwZrOdI8cpkzx+zvlGUJgaR5Eo4H6wbxTdB8oOn/WwMPBRXG++sx2zF2o4F4m4M0ZJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WThmq2mF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WThmq2mF"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54506b54268so602054e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439656; x=1740044456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXrXivtvEQLh4adLUP4GGOdvzjuOxYfBxi9mEWJalRs=;
        b=WThmq2mFCzOrbBhni7Jhg3E31p20CIilRLvomDwFsmDvNTmqYxz/PsHpg73sw8zSKS
         ONcrLdVHzLMQqJNiAvt7oK/91Jz2gJbIjI2oLG8RInRttOWrJmsUrzox6Wm5bsY51teZ
         ErE42Qb395iLouNg8B/b1mG43+cYEzCaedGqvHWbovV9jUTYzGPIdAX8Y6HqLuB2IpRP
         F/YWN5VzvKp+Iu3CHXMIogdYWP4tNKMtDYR//CIAyKK4WIfZgsTpZLtsFjeeqMn7zBVH
         dqmQ2Xg4ZEjt+ImOZJ7uZfVy4t1a2EOgeL86zFhTvjCpZcSGllgoJWxFuOr/e2LotDzj
         hV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439656; x=1740044456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXrXivtvEQLh4adLUP4GGOdvzjuOxYfBxi9mEWJalRs=;
        b=jGDrAWVYkvzZqmM4X6zUX2MCHbOn3GZEjXq+QuZCfkrD849WuGDBGDSjBLKxCTVDXv
         2buXkWESpmq6TNDLElYfwf9vnLCiPi+TvswPo4UeBQROtVOyomCCpskrnygQ2oFSHv/2
         Qo+t1SlfsnHc3QtcMXb1DhuefLgMBi2iCbVlijKVerjRo47thl7BwMyrRWSVVobBgClh
         eJN8vKaz7UbiQlAjAnhnjA8TzWNj0sapbbrnmUFQyCyei/+/s4yu3vghr7pJZloIm/iB
         14S4t/qwIFg54OKNxvOkOSme20mqXZcC4z/BIaOYZ1sSWKNhSa9tIBSzfueUcGJ886+o
         dLUw==
X-Forwarded-Encrypted: i=1; AJvYcCW+LCYmw+QivYaQAxreJlpXqckaHfPCR2ougc7E0DbAYIiI3147v0dXo7i/m0gDLlhy1SqSYj1Mm2y4ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHgCaDa1Za3SnnHwugMmM401CWNitu+b/tNpaJIgHIMuv2da6u
	pbc1qpQ3Mc7a6a9Ac3Qpv0PqtwX9ixh4oKNYxoam1SEJlHaRyC4=
X-Gm-Gg: ASbGnctb6WY69e8mhdb2GalciIQ2L37EFzUQm2GH/pti3Z9bTGHLUm2Rn2k4HwG/M2A
	LMsz4kmtghMVnzsnHjBKYfItbCxNABXxkuH+WyNIMrgVcQ7HSDwkUZVzvUzTiP6mas49nGwQCSu
	IQ5YHYFl2CLMStOP59eqWSenC85weplFPyoAUy1fYR0+H80lkjJfwDPC6Ep4UfVKECzfQaXCUJm
	rVd+z0Vz2vE4cFy+jHxZTQQ/aIQqr42iMm49LzQU95RmR3yW6eJ0pW8mYVEiyQ6566aDYnY9K5O
	Zuf6s53yHQD0442IwVETC2qj4y+zo3w=
X-Google-Smtp-Source: AGHT+IFCCGYbVQL84jr1QCXcHIWbGfBA/gZiSDbm59JZik6/Tl6V0NyLBbgRGNNv01sE2JUH4IgWTw==
X-Received: by 2002:a05:6512:1111:b0:545:6cf:6f3e with SMTP id 2adb3069b0e04-5451dde81aemr834931e87.49.1739439656372;
        Thu, 13 Feb 2025 01:40:56 -0800 (PST)
Received: from localhost.localdomain ([178.176.176.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cae7sm119518e87.183.2025.02.13.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:40:55 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 13 Feb 2025 12:40:12 +0300
Message-Id: <20250213094018.134081-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213094018.134081-1-privatesub2@gmail.com>
References: <20250213094018.134081-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..8955e203f638
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
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
+    enum: [6, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-r329-pwm
+
+    then:
+      required:
+        - allwinner,npwms
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
+    };
+
+...
-- 
2.25.1

