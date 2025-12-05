Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908BB2FDC57
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Dec 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928985; cv=none; b=iehOU8M4AvMu+o4MazrFpERABG2LAAuxSgc1b96RSf/9tT9igcwOLk9IThrUwdGJ3lXWD20CmmF1dHZIePsDRh73MIg1F550Us6WSgtVGLd25unmj4dUsxf+Y3fL+/uACH+Cp4m6dQxkVtHn2chglIcchQx7JtICQJ7OHHERZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928985; c=relaxed/simple;
	bh=mIDfjKPlHz/NQcD9tm1RYysddVvBVpxf1qYJgEICkSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q660etX8jSEIzJ4qNnJ8Q7gViCyaUk3rQr17EDBDjRw9vLrEdkrqoz51KG2v94SEsT9nCTZsomDPo8zvKInurNyuY0JBs9q7FKKmF1VUFc2q56+mg6UQsUKUkbmR1HsqAhhRySOA1+wTpeNXMbr954atZIDC7Mf791Gc9Be4GxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MvphRKhB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MvphRKhB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED1CF4E41A63;
	Fri,  5 Dec 2025 10:02:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BABA960731;
	Fri,  5 Dec 2025 10:02:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5407D10B60759;
	Fri,  5 Dec 2025 11:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764928971; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+V2u7nRmCpg9spwzBQm4im+Tl+FWo1t6BknZ3of2c2c=;
	b=MvphRKhBbogxsicQHo0F+2kjeNZiuu+0DYx2OzMy1RcjINF7QPUr9AhWjtcVdui4tDOKS4
	MTm1XVMikaXUlvW5O/kQ5qjCBr0CG3oabDy6wJP+M3WfxWRi+JHEgFMCn6G5+dVhG1cbGn
	5ROFZuEr9P1bCIqfftDggpirDIoClHAGuK0HunsvjCQc8kcOoWFvzGmkNorhTVIBZ73ATv
	AkFBr+jFBlk2NsJYvgJbtNHxwkpUMfplvgE59eFgZhI4x5LZF62vlcK68aGX3r/5GAPFS9
	lPQ5hH8scLLP/wxpkCs1SOobnmZkCoTXaenOZkS9vHyYeQlM6aI7f4akQOm22g==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: pwm: sunxi: add PWM controller for Allwinner H616
Date: Fri,  5 Dec 2025 11:02:36 +0100
Message-ID: <20251205100239.1563353-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205100239.1563353-1-richard.genoud@bootlin.com>
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Allwinner H616 SoC contains a PWM controller quite different from the A10.
It has 6 channels than can generate PWM waveforms or clocks if bypass is
enabled.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../pwm/allwinner,sun50i-h616-pwm.yaml        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
new file mode 100644
index 000000000000..b89735ad3a43
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun50i-h616-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 PWM
+
+maintainers:
+  - Richard Genoud <richard.genoud@bootlin.com>
+
+description: |
+  Allwinner H616 PWM can generate standard PWM signals with variable pulse width
+  and period.
+  Also, instead of a PWM signal, a channel can be used to provide a clock.
+
+properties:
+  compatible:
+    const: allwinner,sun50i-h616-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+allOf:
+  - $ref: pwm.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun50i-h616-ccu.h>
+    #include <dt-bindings/reset/sun50i-h616-ccu.h>
+
+    pwm@300a000 {
+      compatible = "allwinner,sun50i-h616-pwm";
+      reg = <0x0300a000 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>;
+      clock-names = "bus";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <3>;
+      #clock-cells = <1>;
+    };
+...
-- 
2.47.3

