Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559471;
	b=OpfE9uzhtpuOk+890RKFqHTezU+7XKdLBDhn+kXNgV6u7rf07K6YOajLwl9jRNdBsFZt
	 lFrwJCnUtT1kXglqB+wXBQYKD5cr5PneYLDhXeuU0uFEvndJSk45cptzlfUWtxWLrfbpA
	 cSoQ9mF9dWTPccgkLNlNUvRNGSTLXQpvH0xNbyWb0rRhlC9r/wSu1135P06Yx3WJMhd/B
	 m1aI2HHGGq2BSp5dUgDPzcnPtgbvZXuV8E4s/wsAPkaZf6cKLkaZEYPC4rUiftoGg8yc8
	 7wls/MZh6OTTP0nFkRc/N9SWjTHioGLuoXqctA6GHa7M415vou4oLTGG1B5xEHeBCXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
	b=qdR1TxF4gLUHpn28XAjb5ktA+yhg6sswz4NJhMa1dwHyqx08Ic1rfJalRsQVPg7Z9Z3U
	 Eb2a8D3Q1Z7GPOGGDxg8TQ1Pj0dE8awGPvFbfdxBHJW+zpU7JCP1XHLvV9yLJ3Wlk+sDZ
	 /E07cdFawvugAhJsj92xACefD8moJlIi4HrQK7yqC+U+QxbiNQWbvDpLHWNJvgHzSOoQ5
	 cwTPh5vjiM2N9MKyfyVxzSnXAJlEb7bnHa1+sVhHtgHx0CGa7B/xNcgghBgMn1As1exXO
	 PGz+k3yMXfiAi+jTFAzWTh/kugUrMYL/D/ZZOtpIw1+o2xm9ejQ5UcxKZkFS7NGVTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slPiMbs8;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1257606A330
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Nov 2026 18:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1257606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slPiMbs8
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6774639a8a4so1647237d50.0
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Nov 2026 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559470; x=1794164270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=slPiMbs83NOn+iwtggjI31yt3IAQL4leZI7FhvwZlj8b2ZgOOztyCK8Tm/Mbh3P5ec
         aJLN6mhK1Fvb7vk5nCcKe1LdDE9iyT+1HWic6ScAcEFpuSCSFGKmaEJA2TKnJEVFGrbC
         apMYf2yyXcQbQyVWB7xAJsLP9NhraHPJnXj+SDgUgs+XbjghOqSJKqQy1lgKig8xxR3Q
         hu7DM0KGKrFZxNCBgEQJf8cV9FSYvd81kJnXnoNd0XCozb7cV2og+uQDZqeXmLzFn//p
         Js/hXBHMPZGRPLzgTV6WSjx+4R8mm+HQ/xdtJ6hkzYPU3Dw6qJje6BgryQi6zZRcO08t
         JZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559470; x=1794164270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=WpyhI5IydrTYA7nNo2ymQi1nNu+uBUoVcaHUEUf+khe8Ojwly0WxG2rbTqUasE1gE8
         wwisOyeQTxCtpJaJ3ze+8vp6bIvHEOXyPs2CM4NWYgU0Io/Iz3klRN06ZvSaskB07SEw
         /HKGscCquQjiLDoAoM3m8PkUcqdeh1BVIyipn8l8ja3mmIRBPBg+Ls9C+oOZwPxfrZoS
         fkjdMJBALgH25otgULcPMiCSnzH6NM/3Dl+6Gggrv43U0DCeOVjY5HTjcQvuArdHMfDP
         y0SDViAFUPTQFcDfUKW9VD4RCpJrxybpznbz7/AS1X7FmX1VbOH23NbpV4UxrorKcmLT
         X4EQ==
X-Gm-Message-State: APuU4Z8IcsXev5spl6TTtRI23j5wA0wMoz3j3YuotdSspC2eL8Lghoqh
	zSBm443FxfP2Kc3j/MchnI4moQGRPL2rQh554IPkLPi5zHPa6arXs7Be
X-Gm-Gg: AYBFou348kHHI8JIQYk5rtvXvMiK7X5SONmeIBtnymk7q4JqNGX8GHWgchfvtgWMVyG
	fiL1QH7g3lC6KyXOu/kFMOkfBF4zWcgH2GyhCt8d3FqNcT82/Wo2/JTcapy4Zbs3jd+/NF7d/ko
	862H+TOtae9NulCxTCqcAaGzihEJA3FmHJL+00JIbbT7x9Rw9Vk2MAdGBDvUoJVIPByxaR0np3H
	YgEeIlzWghKiEKcQ7eagHnaenqZ/ZnxcQm0EiqYwS16UMrVLSFjry8cMsnDeRjhqJbWuy2EiVHJ
	K00HD4v64HG/w2frBpxgAUy7yWqN6OAn6Zbr270aRkDcQRtxLqcHC1IZuGOpwGKJTe7+Ppev3hh
	0fMy8fzOpCgdCSfaiNKmQWesZ84BmO8GE0fS5FSQbRreI3TxR/diuQ1G7s7AfNrOrJm9GU6uYHa
	ojR5WFvtfjXOfqF9iFrZT3CF13gNU1To0+LqtChPjnm/CqGJHfAmcKIdP0lSZ4fIXif3ThmstMb
	fdEuBqRwX2lknE8jYTdx724pAmFbejj/LlWE9YE7YwBGCdORunI/Wb3TXDQ7MUA2guwGVYf7sA/
	aZfbgAeBdxAJVoTVDlhfWLDdnNuXLX6PxAgkSEOEYZ/9LjfJ7akRqc/OUg62S1+bJJc=
X-Received: by 2002:a05:690c:dd3:b0:8b1:b916:69f7 with SMTP id 00721157ae682-8b2b671f289mr46540577b3.55.1793559468878;
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
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
Subject: [PATCH v3 1/7] dt-bindings: mailbox: Add Allwinner A523 message box
Date: Sun,  1 Nov 2026 12:57:29 -0600
Message-ID: <20261101185735.762559-2-tcmichals@gmail.com>
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

The Allwinner A523, A527 and T527 (sun55i) message box connects the
Cortex-A55 host with the HiFi4 DSP, the CPUS power management core and
the XuanTie E906 RISC-V core. Each processor has its own register bank.
A sender writes a message into the receiving processor's bank, and a
channel has an 8-entry FIFO in each direction.

The host bank has 12 channels, four for each remote processor. The
binding lists all four banks, since the host writes to and reads the
FIFO status of the remote banks, and lists the bank interrupts in the
same order: the host bank read interrupt and the write interrupts of
the three remote banks, which every A523 has. Each bank has its own bus
clock and reset, and an unclocked bank drops writes, so all four are
described. The optional allwinner,tx-done-irq property selects TX
completion by the receiver bank's write interrupt instead of polling.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- One compatible, allwinner,sun55i-a523-msgbox: the A523, A527 and T527
  are the same die; the A733 entry is dropped
- reg, clocks and resets list all four banks in a fixed order, with
  clock-names and reset-names: every bank has its own bus clock and reset
- interrupts and interrupt-names are a fixed list (arm, dsp, cpus, rv),
  all four required: every A523 has the four lines, and
  allwinner,tx-done-irq only selects how TX done is detected. This
  answers the v1 question of how an interrupt can be optional; no
  free-form text (Krzysztof)
- Remote bank interrupts in the example corrected to SPI 181/174/205
  (T527 manual, Table 2-15; checked on the board)
- reg: the DSP and CPUS bank addresses were swapped in v2
  (0x07120000 is the DSP bank, 0x07094000 the CPUS bank)
- Add allwinner,tx-done-irq
- Description rewritten to describe the hardware; "schema" dropped from
  the subject (Krzysztof)
- Samuel Holland dropped from the maintainers
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..47b6fe304dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The message box on the Allwinner A523, A527 and T527 (sun55i) SoCs links
+  four processors - the Cortex-A55 cluster, the HiFi4 DSP, the CPUS power
+  management core and the XuanTie E906 RISC-V core. Each processor has its
+  own register bank holding 8-entry receive FIFOs for messages from the
+  other three, and a sender writes into the receiver's bank. The host side
+  therefore uses all four banks and exposes 12 channels, 4 per remote
+  processor. Each bank has its own bus clock and reset, and an unclocked
+  bank drops writes, so the host needs all four. A bank's read interrupt
+  goes to the processor that owns it; its write interrupt, raised while the
+  FIFO has room, goes to the sender on a separate line.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-msgbox
+
+  reg:
+    items:
+      - description: Cortex-A55 host bank
+      - description: HiFi4 DSP bank
+      - description: CPUS bank
+      - description: XuanTie RISC-V bank
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    items:
+      - description: Cortex-A55 host bank bus clock
+      - description: HiFi4 DSP bank bus clock
+      - description: CPUS bank bus clock
+      - description: XuanTie RISC-V bank bus clock
+
+  clock-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  resets:
+    items:
+      - description: Cortex-A55 host bank reset
+      - description: HiFi4 DSP bank reset
+      - description: CPUS bank reset
+      - description: XuanTie RISC-V bank reset
+
+  reset-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  interrupts:
+    items:
+      - description: Cortex-A55 bank read interrupt, messages for the host
+      - description: HiFi4 DSP bank write interrupt for the host
+      - description: CPUS bank write interrupt for the host
+      - description: XuanTie RISC-V bank write interrupt for the host
+
+  interrupt-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  allwinner,tx-done-irq:
+    type: boolean
+    description:
+      Signal TX done with the write interrupt of the receiver's bank instead
+      of polling. A message is done once the receiver's FIFO has room for the
+      next one either way; the write interrupt is raised while the FIFO has
+      room. Without this property a full FIFO is polled. Received messages
+      use the host bank read interrupt either way.
+
+  '#mbox-cells':
+    const: 1
+    description:
+      Host channel number. Channels 0-3 reach the CPUS, 4-7 the DSP and
+      8-11 the RISC-V core.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu CLK_BUS_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu CLK_BUS_R_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+        clock-names = "arm", "dsp", "cpus", "rv";
+        resets = <&ccu RST_BUS_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu RST_BUS_R_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+        reset-names = "arm", "dsp", "cpus", "rv";
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.53.0

