Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9533C9898
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048860; cv=none; b=WiRFW46gpLr6txaAka3/Z4xwgfp7VNxypYC9Zs3mtaqZ9lmhyCFtLg/f/KW1fwfj5xfOs01DqQ+oA/KVldxeggVmCuu33BaK08rtYJmLvb5PZbDbXEOc8h+2dAnaQ6UGdd5fnEfPN9ChvWqjc7LDyhCm9EPoYGEJ0dFCSc1Vl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048860; c=relaxed/simple;
	bh=bgbOau0A/tgP+tSmz6HeSpp4+sp/5nJ+lGbAkKaC0PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BK4EqeurUejY0GVPtAGXN6mdjJUlFsaW2uoGViJSYmxEi7YMsJUDYzBry2fQBEYIX8BQaFg5CuuOs5oV42gaR6ogIAZdOMczQNQ6hchLhurXON3fYawBqlJ9xZi7fJiVa21qFEeEz+KX+9HceXqzZQeIdez0xFsII0oCBFnCkbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+003Mdr; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+003Mdr"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43daa8f4so26222847b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048858; x=1790653658; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=;
        b=U+003MdrouYdrZvYj1G4ZWgwhhoAf7NT3aU9WlPdZdyYPXk3BUTMGo+hCOBl+GxUw3
         mtc8nyWbCPxpuHiAQu/0TGVLv/Wa5SVORcYbFCarG2KJfM4bAZgFlt/5ZN4fximIEzem
         7xFYRLczwLpjJrCOFVjw9K+3Qsk+fxJU/0eZ4gpsxlA7qczWrn2GzXyiZo00DcJixmQh
         f8JCQEVExhk30LhNwNfjImgdkDIk/dGvyWz0Rb2n4kta9iNnF03WJnfFJlDbxcm8FUUY
         8cHhSzl5zwVkhA2bRsECnW4547O2qTSmDN2hl3vmJnB4jDvrkdqaz3Dqnt4waeSlrMCr
         g1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048858; x=1790653658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=;
        b=sOsoiBghjlyPNbEPWZqAF43qhFrhn6Ei2jpTs3rF7yzzhYT7xpAUxvhGhX0otkhwAe
         Zl0OcOCSYLoxaT/dNne1W0ft7naqvrwe9ccknD74hXES61ekGYjd0w8fNw/D4rix+d69
         toSzYcpjUkIzqg8VJDfm/XrQWeenpHVub10+IyHZXs/Iri5dtnKg+LIIQRDZRuLG8kMz
         kTTpKK54cf3wk4sryKn7FG1JKj3rJJL9/MK+RojQ5TkAc+Q3NnjpizJn16y0EIKlh2a4
         OipBaN/Ul2RmgOS8aLpBreLW+HeduOTYNiQO93WogA0LmRrX9ueQOBLwUSSKhboOn7+K
         pavA==
X-Gm-Message-State: AFuF++llQYJkP1DYNtcPcdqiohQIczB5H0gZX/xmw6M8of7rARtQcR+H
	HK/imeqFZN1jTsBrU7ZRr8dDZ3iIoubUPREeN051JoJSmuh7SY3brtHKG1Had0Ho
X-Gm-Gg: AYBFou0kCidy2H4Pyvq/f1KOnv7PYJZGC0UqjVS53+kChNuLPqD7FqzXkc5x8kRWuZY
	GI47PKBkpqdkJZRmz0OuxOXia07Dburhn6ks4NNWhJ70TtrpblyruZ02sl9q5CosEMrf3Um+oXk
	p6boPDP0ZqsZOsYdvu6iLzVlSjiEDGizlkXUYOp3+6J/nAza+3/9hVlUdpC55xq1LjLP5D8QXRK
	sB3WvPljmifDBjDsrXxZAi15gTOt3btu3YYCa3pAZeAXFkpNMcCwZ+SRHkHqJ2cmK0133Mto+MI
	cLccZUH5DofimGrVr1aMEn5VQy5ULNsp30nHvGqoPPUxzLthdWqZ2o3ZRvrm12MYdJza4ef7aA3
	52C0FeiodTfe++wuHCpGeHZDUYP7BmV/F6zOJp6pYSliwmR4nX5P7apmXyrGiLN2mhKFnQa/UXw
	J0ODwFwIkoXg3y2aRxbZGZIH66Yx4UmCtlmHPcQUy62hr59q/gAb6GPDcJD9rodHAe0Q==
X-Received: by 2002:a05:690c:ec7:b0:89c:41f9:b8a5 with SMTP id 00721157ae682-89c41f9beabmr22270597b3.3.1790048857960;
        Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: remoteproc: add allwinner sun55i rproc binding
Date: Mon, 21 Sep 2026 22:47:08 -0500
Message-ID: <20260922034711.190253-5-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Allwinner XuanTie E906/E907
RISC-V remote processor found on A523, A527, and T527 SoCs.

The remoteproc node manages the co-processor lifecycle (clocks, resets,
boot vector) and IPC (hardware mailbox). Memory regions are expressed
via reg entries named "cfg", "r_sram", "r_sram1", and "remap".

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
new file mode 100644
index 000000000000..5d8b929f60b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner XuanTie E906/E907 RISC-V Remoteproc
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+  - Tim Michals <tcmichals@gmail.com>
+
+description: |
+  The Allwinner T527, A527, and A523 (sun55i) SoCs integrate a T-Head
+  (XuanTie) E906 or E907 RISC-V co-processor alongside the ARM Cortex-A55
+  cluster. The co-processor runs bare-metal firmware loaded and lifecycle-
+  managed by the Linux remoteproc framework.
+
+  The driver controls CCU-integrated clocks (bus, core) and resets
+  (cfg, core), programs the hardware boot-vector register, maps
+  internal SRAM (SRAM_A3) windows, and connects to the Allwinner
+  hardware mailbox (CPUX_MSGBOX) for VirtIO RPMsg IPC.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-rproc
+      - allwinner,sun55i-a527-rproc
+      - allwinner,sun55i-t527-rproc
+
+  reg:
+    minItems: 1
+    maxItems: 4
+    description: |
+      Memory-mapped register regions. The following named regions are
+      supported (all optional except at least one of r_sram or r_sram1):
+        "cfg"    - RISC-V core control and boot-vector registers (0x07130000)
+        "r_sram" - Dedicated MCU SRAM Space 0 (0x07280000 / 0x07200000; 256-512 KB)
+        "r_sram1"- Switchable MCU SRAM Space 1 / SRAMA3_2 (0x072c0000 / 0x07280000; 256-512 KB)
+        "remap"  - Hardware Remap Control Register (offset 0x364)
+
+  reg-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [cfg, r_sram, r_sram1, remap]
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+    description: |
+      CCU clocks required for co-processor operation. Typical clocks are
+      "parent" (PLL source), "bus" (interconnect gate), "core" (CPU gate),
+      "sram" (SRAM interconnect gate), and "msgbox" (mailbox interconnect gate).
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      enum: [parent, bus, core, sram, msgbox]
+
+  resets:
+    minItems: 1
+    maxItems: 4
+    description: |
+      CCU reset lines. Typical resets are "cfg" (configuration block),
+      "core" (CPU core), "sram" (SRAM interconnect), and "msgbox" (mailbox interconnect).
+
+  reset-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [cfg, core, sram, msgbox]
+
+  mboxes:
+    minItems: 2
+    maxItems: 2
+    description:
+      Exactly two mailbox channels from the Allwinner CPUX_MSGBOX controller —
+      one receive channel (RISC-V-to-ARM) and one transmit channel
+      (ARM-to-RISC-V) — used for VirtIO RPMsg kick notifications.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the ELF firmware image to load from /lib/firmware/.
+      Defaults to "riscv-firmware.elf" if not specified.
+
+  memory-region:
+    description:
+      Optional phandle list of reserved memory regions for VirtIO vring
+      buffers or DDR carveouts. Region names "vram" and "dram" are
+      recognized; "trace" selects the RemoteProc trace buffer carveout.
+
+  memory-region-names:
+    description:
+      Names corresponding to the memory-region phandle list entries.
+      Recognized values are "vram", "dram", and "trace".
+
+  interrupts:
+    maxItems: 1
+    description:
+      Optional hardware crash-notification interrupt. When present the
+      driver calls rproc_report_crash() on assertion.
+
+  interrupt-names:
+    items:
+      - const: crash
+
+  status: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "r_sram", "r_sram1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>;
+        clock-names = "bus", "core";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>;
+        reset-names = "cfg", "core";
+        mboxes = <&msgbox 0>, <&msgbox 1>;
+        mbox-names = "rx", "tx";
+        firmware-name = "testBasic.elf";
-- 
2.53.0

