Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB53793A8
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048856; cv=none; b=R0gw5vfGk4tsyQHqc7A4+l2IrbR560dKXXMzM8SJYkDcFE5DiMaw5iCNOp151EG8dNTQsQKapp1/mkFL83qon1svNGpUbdYzIRlNt7eNVLm4BwSCgzDoVxN5V86jGPjM23DsFY7T4j60/LyrJD8OvFQ02ozzmnNI+DlS+VRrBcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048856; c=relaxed/simple;
	bh=HtavXwOO0OEHuiGVXTW8F+NzHuFXrh7lU+hDGXaFDgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1BySB3K58L6aSaPsCSSbr3WTbmniiEV0Pgf3LcKfTda7s+sjavToBFM62KyYl6gUQAEmM5+bU65MvVOtfmxf6oIQ0aaFM5Z0ynRzrD6n+IT6iQePzs2fPldycXD/uAIz5BOeriK7jRhSazIvM/toU33QUTZNUn3kWbfwC172zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT8wBmQe; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT8wBmQe"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43db0c17so37636077b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048854; x=1790653654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=;
        b=lT8wBmQexIaadzf7Zr8K08r+ADScYJxnl2AGZzTYJfp5p0B/GlXrlG+WzQRl7ZxURV
         DpvmKawltFEXFNYqsUxmz3JPB8HpgKzWKkblBLgH9CRUqGQise+f6KerC1wk6UtQ+gYK
         IxuuJjwxxl22v/rrEi9ao5kuNGxKLiwpXvmKM+bG8kZ1Y4SugCjxS67iM9VR73BmsJ/T
         m6dio8w4OxAkvlGI/ku3VvxiGgo5KuoI1EDS2g2QdtzRGN5NQLkRPTi75G7m6XauOm62
         Wjyl0a0NzyQEfq8tI9EBehcShsaBDsXJkCwgP0zXtgULlmtBJjuQgi+xjPSRmH0TFqk8
         oTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048854; x=1790653654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=;
        b=RdvScb8Hfccc9AevU3FsM+1JPNmgT7T6Xj0aItQikL0Dy4OsSTSnKWqnacdQ8tHAdE
         Yhvts+sKSzWph39jSghNB6jZhjKJjAzzj4+lqEWop5SsomdpMtyJHzubzMl3bZpoauV7
         1rFqiXWDI5SwDuzf+B1ImBvZiqC5Z1KTHvQhz9pxk592QiiqHCIpuNPet4/6857Veorx
         hSdIAiRU48XMR7Inr3mAdyDfVqrmdW2nKn1A1MbnBSGDSBid81NA5ndg1aMDnSlGOQii
         atT/9KyOKX9kL8zFPkGE1B6elTwkyWYk6tA/dIxr0KQDrHwGxaoZwSQluyJLFnDJgmXN
         Hc7g==
X-Gm-Message-State: AFuF++kajOzsD1iOxab9Odv5Hlt4c1uEr0wu/XA7sKsRmcgFLZs7BFTP
	Qgz+RahvvsakL7FZ4mMtKTV+/F5wH/bHbKm6dqQDhT1XcUhHyLMLz/dyDOEMUTGl
X-Gm-Gg: AYBFou1xHJ635jsqWsEtX5IF9/z3vng9tRR3naGSHJPKoevyyBxqE3tgq+XZlan08VN
	ZnjwsqAZpnww9NDiXa10bjICybA8SOOUxGHMyV5hbqLXAQ0qtDPDHElSuEfuDICHmt8Tz7OdEfF
	CKnruxjWveyS69cFT00aKD3qMUM7scRWuj6EVcHRavYjwIWfaompu3LtlryuQc6wLbz5f8/k/7b
	7hUEMnzQwBH0/MO+6KevuaVY5rZaY/SgmeO5d2J8dqejAr+kZ7BaJvHDaudoaXRSxa/ZMHmMtRT
	gKUuFuw8cd7tFM3oeYObEDEiGltlBBuqx+fN+q2QLcx6u18vupIxAy5zihR1dDMEomE90KRT6bZ
	p/uG49y8T0gOCkh69ZOtN0tsJAtRA6fS212mo/vI7+hQs0lc0tzW69N/ZnYtLMkTBuHpjAYQldo
	ydo8RGr7QIy714jpJuZX1SETm9Dsif/75Qmuk2ezUZHa2myM0yALssMLKJ1V8oSqYDiA==
X-Received: by 2002:a05:690e:4148:b0:672:99e0:ebdd with SMTP id 956f58d0204a3-67299e0ef69mr2889187d50.117.1790048853652;
        Mon, 21 Sep 2026 20:47:33 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:33 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox schema
Date: Mon, 21 Sep 2026 22:47:05 -0500
Message-ID: <20260922034711.190253-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Allwinner 4-port hardware
Message Box controller found on sun55i (A523, A527, T527) and
sun60i (A733) SoCs.

The message box connects the ARM Cortex-A55 host cluster to the
HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
co-processor across 12 logical channels with 8-entry hardware FIFOs.

Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..4b73543c7902
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner sun55i 4-Port Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+
+description: |
+  The hardware message box on sun55i (A523, A527, T527) and sun60i (A733)
+  SoCs is a 4-port multi-processor mailbox controller connecting the ARM
+  Cortex-A55 host cluster, HiFi4 Audio DSP, Power Management Unit (CPUS),
+  and XuanTie RISC-V co-processor.
+
+  It features independent 256-byte register banks for each processor port,
+  12 logical channels on the host (4 per remote processor), and 8-entry
+  hardware FIFOs with level interrupts.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-msgbox
+      - allwinner,sun55i-t527-msgbox
+      - allwinner,sun60i-a733-msgbox
+
+  reg:
+    minItems: 4
+    maxItems: 4
+    description: |
+      Register banks for each of the four processor ports. Each port has
+      an independent 256-byte register bank.
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    maxItems: 1
+    description: bus clock
+
+  resets:
+    maxItems: 1
+    description: bus reset
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description: |
+      One interrupt per processor port. The host port interrupt is required;
+      remote port interrupts are optional.
+
+  '#mbox-cells':
+    const: 1
+    description: "channel number (0-11: 0-3 CPUS, 4-7 DSP, 8-11 RISC-V)"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu 120>;
+        resets = <&ccu 45>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
+
-- 
2.53.0

