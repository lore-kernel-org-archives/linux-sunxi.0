Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CD23F40D
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468451; cv=none; b=b/kvLImvkL3nTzqaeZbchU1oWMW38guNK9JHiZvADMfxL0tlFuKouKrI2Sx9wZCmhSf+uAX+Agj7kjRyHJ3nJwIQ3yYEGspL/FGCRo3nvEMjaBkMEEW11msiXM9mlsWUVb1vav22aeH/yuvKqHNV5rRb0ynhB7u6YbevxzlxWt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468451; c=relaxed/simple;
	bh=KUqMhiQcS4AgsYPuncz05+mw8gLtazXZDPzDeOszHBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEhj+L4MAnzTJUc5XV85+KwzT+7on522gDhfdKLv14fI4DvNHLrtbJoK0BF0MM0hwmHnIs5C4NKnz/F7ryNVUHtb8j0vJV0XrMt6PTphpFP8sTegrXE0yZf7sGUKcQnJLjUi/JsO20LdhSzoXZFZj/IkdecErOa1DC+d8Lv6cpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KB+Ok63j; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KB+Ok63j"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso1562285a34.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468448; x=1791073248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=;
        b=KB+Ok63jy7y2mGEol08MfjoMp0CKsqnur4T0MrtbNDzgNYnSYIvf8zbZjxCUWllsDH
         0bwGTPM2vI86wik4zegrXkAIRN5d5RwqDxyulb4jSi+K9nEOGWVad5plCJuaxnBG0gqP
         1VOoUO74WlWfgoaRe+JuUPUYY+lgovENsYJRanhxZ+n/Gr/LhyT+2i4PalIyx9Bweqq2
         63HYb69MElHo98mLoUGyMgPERdfPKW4YVzpfO2ESzftKYrNkyNrsQ0GNHvFaTNpgtEXe
         jcoiTNrOUhAv1YI08XTBFDjHGOqilUPuYPYjN2/t7nZRKJGkavI/VmGfWTiT9ml63ClO
         +jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468448; x=1791073248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=;
        b=oM9IBsQvKMX2fSxWKuZ6zVOqR02tEotisOALZ4HePQNA3zrcarfAvVLGPEQ+ScTJWl
         6CdV0G4AGlLFozHnKT6NbBDF25vZ8qJI4gF+LRGLIpsqGZJyGDDzeGN0l6qF8h1ajFen
         2LHxoUODz0lPOxP6BIxxiFrC9Ugp2HAMEZbfB8U04/A4tc5nrjcpyiTmsN4fWGWA5sE5
         eVanAMERu9KgXwvfWyAWrtzZPf9+UtLuQu8AaP8NbBIB2+kASVaeuwOVPUtAgGqkYcvY
         VlR95Mva/N92xqtp7f6O4OfeCF4uaOI7gjx6iyL6rx1fl5QZJIckBexDKqotXUU/jmeD
         xC3A==
X-Gm-Message-State: AFuF++mIRMhEf7NPULKac8buqynPSdST5A6oAspuFTQmjITrec5RaZou
	na0vCr5od/4pn0URZyexMxe8igaz9Dfk9TBkarkBT3XmPj3IweAHU0X3tnPL1J7s
X-Gm-Gg: AYBFou0h/zMn2A1GkAwCzljzKO3SJR5Q/x6+M7NcE4mXXWBiU57q/6agEsrPVOHI30C
	PaQEgDjy/Ae0g9mDBL7B5Mg3OYD5LbxXBuCjum6DFFYxnn9jdcgMmCkh+EbSpyLmMpI2HQmyzWA
	kk13y8jwh5nI1/6oAq5Ih+CEqC83w3UnaSCXmPWfDcIsCvd0AXsT6RTUzkJsz9SnsAfDBFYkXK5
	7FvrAxZhkmrt89aGqNtmKfVBpVjjSbb/Bx79avuLu9Amnw6L5Kw+OEDCf6DtpwNlc7XSGZsPrWe
	xAUZOsi0tfSfwyGf/0FlayUpDXN/Hv5x/Oj/eGvQLJgzsSy2tNH5GgzOJmCPtt8Hw2XxKcjKW4e
	T1qxEKvlu34/Zxc2Lfc+5eU9ueeHvXaLRcdX+eQEeCvVs0glSwoUht3yQxH3VXzNO+8MCAYFPi9
	/pXiKITsPaYW/nFNeIZ+NQmuVx8CotMbpJ7HjkQ5inqvWo4FkYMiyZgLal9ACbaTsG+2MzkZBfW
	z+aAycyoVXGjgl1ATIzuA==
X-Received: by 2002:a05:6820:290e:b0:6d8:6dcf:54c7 with SMTP id 006d021491bc7-6d86dcf582fmr353279eaf.82.1790468448578;
        Sat, 26 Sep 2026 17:20:48 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:47 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox schema
Date: Sat, 26 Sep 2026 19:20:10 -0500
Message-ID: <20260927002021.797069-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
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

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..6b0c7ff70c9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,102 @@
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
+description:
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
+    maxItems: 4
+    description:
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
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description:
+      One interrupt per processor port in port order (arm, dsp, cpus, rv).
+      The ARM host port interrupt is required; remote port interrupts are
+      optional. Use interrupt-names to identify which ports are present when
+      providing a partial list.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - arm
+        - dsp
+        - cpus
+        - rv
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
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.43.0

