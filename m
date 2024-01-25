Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5A125BB
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jan 2024 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706167292; cv=none; b=PsEaLkhh0fZmokR0yoXQORfH8gVqRMInngrBcpSjJvRxzu62cKNVPNsdSxXJy0drgURYNLeTBjrCcQ2I0o8WexXDlZTmDArgtz1HjRtIqw+aFnCzn2Qu63WszCWs/WrtRqr8Y5qoQ2F+Lzty2ru/rLAmzvdEHS2m2/Mo6x5fxvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706167292; c=relaxed/simple;
	bh=aLyVaR3VlTqu1yreTEdjOgowwX3EMmNbGcznpWFuzsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cpmlOnGBPsDL9HifkEDj0b+Nkei+s/H4WGUpbkNQGuDmR9galedMAwMYSWi7jZuvXu9fCn1+1/1aKfrmjFACI3wUALkFdY8C/wcI73EzrZro8e2qI1lsUnIXfdgoqzy5PZk1vADx0/B1vER9yXk6G1w8nMabkl4r5VlzyEoJrKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwLtLZaq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwLtLZaq"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so7133051e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jan 2024 23:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706167289; x=1706772089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=AwLtLZaqtBmgKOkDffF7fug27ZLSR5VHM4Lea4u5dXQkM7FG5i3aR8jFqy3QexqUk0
         rXoLgYwy7Aa1gifGekVEVyGfRfWT8EN40m1qhSxvszeRzK0qZj9CD6YWu0gE3RGPRPnE
         Ed1HesXlRr0mz4nOHRdZYt61HiaHN92fRZhGdsTRg10i7N4XoedXrH01w4GjasUvMNyu
         5mexjhk37Eczkesv/RARIQX8SGy55AonsM9v0J780kkpEG+9sKri/vuv/3Gtc6ApL6ih
         tCEKd2zwl7QapEzERviKPlY7VYL8/mbWHSYrT3nXeqhxhktNdSfhOBDO4WW1TsOKiXPj
         ZA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706167289; x=1706772089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=mSc3ErU9X0vEuwsEz5aM3flFDN9Px4hYOGKilh2aMuf1rYT6QcRIlde+tWuxHtykjp
         99koRaKm/snaml+eGuEcMU5cLl5yrqPE24Mx5qajKuLVCyKTrXgoWU23ScP7jApnveuA
         f8xQ+chhlcIco9TYaiwVYC3+I7G0hJcGv+nnTwd1nC+SngnAYqTxr78J/zp9KN1sO+No
         5Q5+mLIgAthQ3ZU5qN0yUkmg+xydOSN2GzD3YQW8KjDBOEm+8yVVQJetgveNJppXxghL
         FnPLcR6j1tL9KqgtgG4DpRheuL/5zSD6sZH6cDVrHwptjKNOVlGJRohfbisDL87hHvhG
         HiXQ==
X-Gm-Message-State: AOJu0YxoKx2i7XGd7s5cfx2Y++W4cIFDtri2eoTpBOYPF5aCrK4CKTXY
	HSpWQnCtST9cuSMMo7rNwxSxnx54DqEBISm7lFm9eZ2EnYL3/cA=
X-Google-Smtp-Source: AGHT+IGEBYUmxHJtch22BJcHUV9zaSCJgnW591EyE6opmjzI2vj54jynZNtiCKHzPon2ds0YHSyrkQ==
X-Received: by 2002:a05:6512:b8f:b0:510:1620:939b with SMTP id b15-20020a0565120b8f00b005101620939bmr339126lfv.0.1706167288935;
        Wed, 24 Jan 2024 23:21:28 -0800 (PST)
Received: from localhost.localdomain ([188.162.200.139])
        by smtp.gmail.com with ESMTPSA id x37-20020a056512132500b0050e75f9e8c8sm2780070lfu.98.2024.01.24.23.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 23:21:28 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	John Watts <contact@jookia.org>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 25 Jan 2024 10:19:41 +0300
Message-Id: <20240125072032.1151383-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125072032.1151383-1-privatesub2@gmail.com>
References: <20240125072032.1151383-1-privatesub2@gmail.com>
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
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..716f75776006
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,88 @@
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
+          - const: allwinner,sun20i-r329-pwm
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
+      - description: APB0 clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb0
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
+            const: allwinner,sun20i-r329-pwm
+
+    then:
+      required:
+        - allwinner,pwm-channels
+
+    else:
+      properties:
+        allwinner,pwm-channels: false
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
+      clock-names = "bus", "hosc", "apb0";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1

