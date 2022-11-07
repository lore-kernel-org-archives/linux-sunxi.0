Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1682B15C83
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 21:02:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id t25so33464395ejb.8
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 13:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7zn+Srb2QubHA223IZ7ZOfOFfRooqz/wCN6m6PiwoE=;
        b=B7MIzOBu+2v2PxgE8yc+UaAbaHjQxwHb6QX29E0D3GAjA6pn/vPVGHB8CAKp6aQrav
         u8m5FlQ5/f3BBqRGTkqxeAZIiBkQnBzNF5f8HTFNQLpC/PXxcVDzx/HE51jxmyPppvu3
         HIlopOcwOJ18pHaYuKT7SFDInFI5z1OIKoRUOWXGDOJmQ/uSjidbKgdiXMV47CBte/R1
         G0LgNRoRzJmdEYw835qs4ajPTvjwoAWkoEjdSNZ72rr7ZGy/S+TS2f4FtcxQ2RPhtG/i
         i4VbBUzX+HXjK9Oes+M8wG1s6T8Uj5seEmhBJ5px3TqCqm7geDZpRRZRTe455slzeAJz
         QGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7zn+Srb2QubHA223IZ7ZOfOFfRooqz/wCN6m6PiwoE=;
        b=BUXdw94nL63kwgkSpl932Hn/mINddacd3GapFm7EZ93dZj4BY4EsjkFjZP7fUnpEhC
         cheAR4dAtMhjBdRrdmFgShkJL1KVyTPggYhqgBs5A5v/J2cjLj7TG8Gxi23XRlQKtqu2
         vzxQlJ9CBZYJW/0PYSEauzrHQbFq/JFoFR1TelzECKWhBtERhBzfHkr9ooZR0p4hxbpi
         QLblMVHTjQKlWu9ctpC+fs1/x1j/YOIXJM0lYTgGg+JdNc0/HX/NteOcfMG/s/4ZfKEy
         iXzyTAMYOfTEJq9l1Mu2jkYEHtl43ndlRec92yqA4HCMOH6EQx32a4rZCsiHfeefwHH/
         jWWw==
X-Gm-Message-State: ANoB5plsRcPw3jQGfRl97mUgaCiFB6flSpnWU678IIMHr1SiQ3CqWfDa
	hIsyGXBJV7ED8p71e9GBzhQ=
X-Google-Smtp-Source: AA0mqf7FHI+JL6d79Kz4pxCiByfrpO9kwRHNkZWuvyFgjK8c0Wpteg0xGge3cCSbQTtVeN2oevDkzA==
X-Received: by 2002:a17:907:9555:b0:7ae:5471:379c with SMTP id ex21-20020a170907955500b007ae5471379cmr12201744ejc.123.1667854939386;
        Mon, 07 Nov 2022 13:02:19 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id k18-20020a05640212d200b0044ef2ac2650sm4638472edx.90.2022.11.07.13.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:02:19 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] media: dt-bindings: media: Add Allwinner H6 Deinterlace binding
Date: Mon,  7 Nov 2022 22:02:06 +0100
Message-Id: <20221107210208.284261-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107210208.284261-1-jernej.skrabec@gmail.com>
References: <20221107210208.284261-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H6 Deinterlace core is used for deinterlacing interlaced video
content.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h6-deinterlace.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml
new file mode 100644
index 000000000000..521f58559444
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-deinterlace.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 Deinterlace
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+  - Chen-Yu Tsai <wens@csie.org>
+  - Samuel Holland <samuel@sholland.org>
+
+description: |-
+  The Allwinner H6 has a deinterlace core used for deinterlacing
+  interlaced video content.
+
+properties:
+  compatible:
+    const: allwinner,sun50i-h6-deinterlace
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Deinterlace interface clock
+      - description: Deinterlace module clock
+      - description: Deinterlace DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun50i-h6-ccu.h>
+    #include <dt-bindings/reset/sun50i-h6-ccu.h>
+
+    deinterlace@1420000 {
+        compatible = "allwinner,sun50i-h6-deinterlace";
+        reg = <0x01420000 0x2000>;
+        clocks = <&ccu CLK_BUS_DEINTERLACE>,
+                 <&ccu CLK_DEINTERLACE>,
+                 <&ccu CLK_MBUS_DEINTERLACE>;
+        clock-names = "bus", "mod", "ram";
+        resets = <&ccu RST_BUS_DEINTERLACE>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&iommu 2>;
+    };
+
+...
-- 
2.38.1

