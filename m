Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559472;
	b=yJAKXzlDNThKec3H9RWvkrxRloao9nZDYaRo3ZNfdNo8Ab5aoMdoWZraMopgDiIxyFuW
	 Q0nYL+rvmZthfhlyq76mnRNr+tpDOHImVNA5cpsqU+ySAK5tjd9hVuaK3O3ulQk8b3VlM
	 MjP37NJ+Xz5HePQ1uYgR4fzZxZYHGFo3Onbm/Rouo3gusZCm7VCJZ5G3wUBVZSeU4Z2hN
	 tN/AQTEwM7Gn5PCGrjQSUQhdT+C76dRn4EAVViaRwzUn44dpDefpw9r+uQwdUpQ99hr8W
	 oaXH6kVh5ilc1FCwCX2Eomyhz23HO3rZQXRsOWAcI0spjnA4OyPvkiNSisUbTGcNACQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
	b=pzcc04rrI1acdZVjJ14NIrwjLdYH6rjjpyl6/sUDAUURAxHQRKqZBVgDJNXjR7pLBhem
	 h6gHWs4FXznPaksbB9L9AjxPekxAKcihCpskPESSc8EWcSgMUA6v5kHtuLLzxxuTa5skt
	 XTlFn4siZdZpBjtiMqL7ciQy+flUZJrNdgwcW8tn2jKQxkct8OLWC4oJHOKkUuN1mJduY
	 kbeLqh8dtQrEybwkXlpINYXxD7GaxZ8hPf3zikeuRrU1PhqVuOWDjU6lM2Ox/c05rQfGh
	 IVjGfv9C0/9owqE1okWxdfOC+F0hPzRT7rXioM8jHL921KOktj99Ni+LKHrEdAdfOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN4ZjcMB;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2860A2600
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Nov 2026 18:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C2860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN4ZjcMB
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0a921ee46so18804767b3.2
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Nov 2026 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559471; x=1794164271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=vN4ZjcMBlP6AfTFeyvGirFY8QJ2kEmzwinK2ERsgRLraqPB/iz4QpUUbvJKIkw1rQ0
         6sxlGhUg5RDGbX0dx/6+l4fIrngrubxF3nGS4nb/nNgWgZo29SoStr0Ych8PLBcPqJKO
         seMZj9RkeUrSW+7hMDJI8zX9i4/HUV8DUflDFQUfxP7QmTtOBOln46i4rOONcsGHC4V+
         sc6rdrSZa21JQK8zsHLbjOGwC5LdPifvNYIMDow0xS/o688Ea+z9Rzu64vh2FsN1Ou/v
         ueDtc/p9dB6/GXGvDl6VdyLQMJPfve0e9vBloD3yQtNzxrs+Uw5SjtYeltesYh5AxM6x
         n1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559471; x=1794164271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=p33qgMAtffqPl4chsFNJiKO9kig/mGZVCouRAH4NF4+zkEltCNwMK3vLswToGN21A8
         gMUQ44ScVAuRT5F7KVmjU0C6MPxOeur0hbKa1U83fwIfFAd1BedPNeq04Xq8AZtnywFT
         2qfL6WZCQqM097jVQhLVJX1j/dtA++vA700YLbeNFl556ip4dqqggJl1o1aHDcvUozf+
         HNyxAcY77pQIQixOBu52H8JSipWzH9mlEJImuASRd/as/+Vn7VjgRAro8xmUjPBQTD7l
         O1tMXZEn9gRiOl5uE1oGsbTqh5T+bataYWFlRbLS7RCzQH5BastLQPCLklJ6YMCaNDnP
         FpiQ==
X-Gm-Message-State: APuU4Z8mSokDOVIfkSGhfsneFn7mVH6q26DDoSFL+9JGS4PC8Ax4HxTh
	io1e3DvwxGsRmM34ZHE6SAg4ic2kRe7opUKoDhQeL/PFAh3dp8yJ0FDn
X-Gm-Gg: AYBFou3PfE03lEZ8lDCKilcNnqtDnBcZxZfIBh/36TEGdGO1Hsws2P1siYGXZI9z0J1
	X6b6vOppuWc0MVWAi464yrQP6Kz1ZwTZZ/+zwYM9HzPr/WJsY+fuJM+k7PAqcgB57xhJPm+MW7e
	ozyU555asLx88AsutuBCzgyLY2ksh/MMEEabT3NAYtn0tgBeJnjVNV6zDU/aZdZBzlRF54mEmXt
	x6muyINLTrEfMEaBaxs5Sb1X4VnlgDYD4DXr2QKOIbjW8NEoEFWXgr1Hk0hXCvCEuokiX+jJhYz
	/WO/y0OPCckyKFQnXmuO3EOKQDXOh9NixVQrkD+8+sXkJCnPeSYUokPiUKypVv851oPxxePGbq3
	ELvZ0HTrnTBzfPzwpGFucMQt8M7oakzPTAVByFJN1Z8grFJL9BgBFcpQbnT8wvFoZsCTyYVXnLU
	g73MK2hS0faX3fRzVNA2dJCSi5fQVNjOrlIEL6GeOC8dqaBnmCOr5yY5e9fIEHpchwqN4vWgo8Y
	KSOY2HRQ0O+FGLvgPkTmmPll79ZOSsrne+VvoOGhGdRLZwTfFXmThsVyvxK1E66zvqfaUBqcahi
	vNXkTNSPisWp6i7mUiLjiJkKezyESqJaXUJx/tb5LglMSUy5Mloqd9xaK6SVvlWGfGs=
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr43226817b3.30.1793559471312;
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 3/7] dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
Date: Sun,  1 Nov 2026 12:57:31 -0600
Message-ID: <20261101185735.762559-4-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523, A527 and T527 (sun55i) contain a T-Head XuanTie E906
RISC-V core. It runs from a dedicated 256 KiB SRAM and can use a second
256 KiB SRAM and DRAM; a bit in a PRCM remap register shares a further
512 KiB SRAM (SRAM A3_2) with its subsystem. Its reset vector is set in
its configuration block.

Describe the configuration block, both SRAMs and the remap register,
the bus, core and SRAM clocks, the configuration, core, SRAM and debug
resets, the RISC-V and SRAM power domains, one message box channel, the
reserved memory regions (a pool for virtio, DRAM for firmware, a trace
buffer) and an optional crash interrupt.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- File renamed to allwinner,sun55i-a523-rproc.yaml to match the
  compatible
- reg and reg-names are a fixed list of four (cfg, sram-a3-0,
  sram-a3-1, remap), all required (Krzysztof); the SRAMs are named as
  in the T527 manual (SRAMA3_0, SRAMA3_1); the description says the
  remap bit shares SRAM A3_2, not SRAM space 1
- clocks and resets are fixed lists, no minItems (Krzysztof); add the
  debug reset. The msgbox and parent clocks and the msgbox reset are
  dropped: they belong to the message box node
- Add the RISC-V and SRAM power domains
- One message box channel; mbox-names dropped. mboxes is optional: a
  user can drive the message box from userspace (UIO) instead
- The crash interrupt description says the A523 has no dedicated line
  for it; it is the only interrupt, so no interrupt-names
- memory-region[0] is a shared-dma-pool; the example has the memory
  regions
- "schema" dropped from the subject (Krzysztof)
- Jernej Skrabec and Samuel Holland dropped from the maintainers; the
  MAINTAINERS entry moves to the driver patch
---
 .../allwinner,sun55i-a523-rproc.yaml          | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
new file mode 100644
index 000000000000..b119acaa2df6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-a523-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 XuanTie E906 RISC-V Remote Processor
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The Allwinner A523, A527 and T527 (sun55i) SoCs contain a T-Head XuanTie
+  E906 RISC-V core next to the Cortex-A55 cluster. The core runs from a
+  dedicated 256 KiB SRAM, can also use a second 256 KiB SRAM and DRAM,
+  and a remap register shared with the HiFi4 DSP shares a further 512 KiB
+  SRAM (SRAM A3_2) with the core's subsystem. Its reset vector is set in a
+  register of its configuration block, and it exchanges notifications with
+  the Cortex-A55 host through the message box.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    items:
+      - description: Configuration block, including the boot address register
+      - description: SRAM A3_0, the core's dedicated SRAM space 0
+      - description: SRAM A3_1, the core's SRAM space 1
+      - description: SRAM remap control register
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram-a3-0
+      - const: sram-a3-1
+      - const: remap
+
+  clocks:
+    items:
+      - description: Configuration block bus clock
+      - description: RISC-V core clock
+      - description: MCU public SRAM bus clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+
+  resets:
+    items:
+      - description: Configuration block reset
+      - description: RISC-V core reset
+      - description: MCU public SRAM reset
+      - description: RISC-V debug module reset
+
+  reset-names:
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: debug
+
+  mboxes:
+    description:
+      Message box channel to the RISC-V core. Each channel has a FIFO in
+      each direction, so it carries notifications both ways.
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Virtio vring and buffer pool, a shared-dma-pool
+      - description: Firmware code and data in DRAM
+      - description: Trace buffer
+
+  memory-region-names:
+    minItems: 1
+    items:
+      - const: vram
+      - const: dram
+      - const: trace
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt the RISC-V core raises on a fatal error. The A523 has no
+      dedicated line for this, so it is present only where the system
+      integration provides one.
+
+  power-domains:
+    items:
+      - description: RISC-V core power domain
+      - description: SRAM power domain
+
+  power-domain-names:
+    items:
+      - const: riscv
+      - const: sram
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>,
+                 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+        clock-names = "bus", "core", "sram";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+                 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+        reset-names = "cfg", "core", "sram", "debug";
+        power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+        power-domain-names = "riscv", "sram";
+        mboxes = <&msgbox 9>;
+        memory-region = <&riscv_vram>, <&riscv_dram>;
+        memory-region-names = "vram", "dram";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.53.0

