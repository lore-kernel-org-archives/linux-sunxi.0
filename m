Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A6A13848D
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716230582; cv=none; b=eefrjRqRcgIJDXaPRV5ux9SES0lXqLqtdrafFMl+NbVcC77FO70ER5zBxD3+TTouPgY6CzpwK4c+3gxsWJZEi328YqgeKUGYfePjyZ1UnIHf4G83ht7Lq+1sYFaNgsb2ny5QmGSkGoDNbyfn2sfIFoq73QEmwwSg400p0oQWIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716230582; c=relaxed/simple;
	bh=N+Zbm7Fm7DDc2Ynl23djjTgsVJ0SADNhJ3fgDS+rKOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eV2tih7BxuP18wL6cAcPPfkaAPBMwiOugBE/AG4RPtFTbuOjgrufnxzt5B3pPmdFPQNxfCmZ+4v6qUc+tAcU1ojOpUu3oam5cE0mtbgBZbSqNCYLaDhX8ECcmwYgdSO82Ik2uL6I9PVH7RF5BNRNgEftzGpEqLRbon0ztS6pA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5/HoTij; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5/HoTij"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52327368e59so5158271e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230578; x=1716835378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=a5/HoTijEiSnnrpif1czv+29zxFm3nw//VmIKmSn4TWXEMt4M7HSo+Hp7Zf2/VhWqo
         p9VTvHwBLgrIg5RFnOE3f+hHxgMw5nWHC9KV2Az0bvyKR0mA2YNXeAguTAR8h92fO3XX
         Gf/oS/XLIEq6f77NomQi8stzxjS5waBZQ6qugYxzCowV8EK7NXNi/Oeo/UkdKEbA3+Ku
         s9oy6lNbHbc39PkOjIP3evfmvoOXnw6GSihS8CuC8KJ5yrToAI5qD/jKNxpkc98kPG1d
         gi8zy5DkZX7F4tWil6+nGT1hK8x011OcM4vRrY8c9LG6s3v8PuKMe+Qr6dO8vawmOwQJ
         s5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230578; x=1716835378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=YkZycd2R0o52mqdI+Jd8NAqfnj65KIa/YEDICQ/zdcO45clfZAxzguLEiFdoPH/Cqx
         dRZ9ho29YEjsFEx5KpB+WfceJCYOncbcuzrkayNiOUu+fJZuyxf3oZSmirvGGzQeHWv3
         /SR6x6QB5b43iSzr/z3J7cepR5LoWjYvDEf0DS1fT7ZCK7A9qKj+XPYxb3ym65dtn4A7
         3Rej6brGYbQUKZnodsh9RV0MHKYBPcKqf/T25oQUvL/+FIADkO91atC8feuKWjgGayKf
         2ZZAWeA8gwq1hjjv4QsRoqmNE3XcvmnnSCOc8MFMXJMwkiJJVS+Mdx9Vw+WCLhpI3ERG
         u9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKj2HUM0tyncSGBcmCq30SQLLJasMToY7deco1i4LYIseA+n7wV4WN/pjuxscTpDaE7CyjJCyZUfwtnu9Fi921y39oiPRmT0pJWVA=
X-Gm-Message-State: AOJu0Yy7BaSlq8T1WkN9KtEYoz42Mbc4+cErUN82+q0pGE1BtD2ZZ62H
	RiJcR3xARni0M1BxgP4g72V57YQR+vTGgrCx28tnI2ULTNr4oWg=
X-Google-Smtp-Source: AGHT+IEO4aSromU9C6oSddIXHc8xFrGRwBPnUP7EaMD4z8Yk2DobxFv1itZdDUx/ckVORlYAZQXfMg==
X-Received: by 2002:ac2:5046:0:b0:522:80d:5dc6 with SMTP id 2adb3069b0e04-5220fd79fd6mr18401299e87.41.1716230578359;
        Mon, 20 May 2024 11:42:58 -0700 (PDT)
Received: from localhost.localdomain ([188.162.49.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d335csm4368967e87.125.2024.05.20.11.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 11:42:58 -0700 (PDT)
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
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Mon, 20 May 2024 21:42:19 +0300
Message-Id: <20240520184227.120956-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520184227.120956-1-privatesub2@gmail.com>
References: <20240520184227.120956-1-privatesub2@gmail.com>
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
index 000000000000..89cebf7841a6
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
+  allwinner,pwm-channels:
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
+        - allwinner,pwm-channels
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

