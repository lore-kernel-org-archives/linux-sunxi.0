Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68610FA
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jun 2023 22:32:13 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30af20f5f67so1395554f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Jun 2023 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685658731; x=1688250731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDQovBoms3FLau58BysfqmyJWkZDGP+mDWm5zuqZL/Y=;
        b=nJ5nrB/K65xBQKeS4GK49exb8oASXvkB07wZO02wNCVCzxUG+fXPDtEcDX1berfUJd
         +Dnim0ocLAx6/xp4BqZHLDSdO5QS9me/pYMaRIrhky0TGnpJbxDqO7aDu8BcOELRIMIV
         T1FMGnigqZwePfryfBXqE8S6Um91z4H7ji7M6+YlBlSeaJxylPSlgpsSFbnmXAeNQ/H+
         WzpMtM1IbWpS4PUsNYMkWRN6+G7FtIdvkbA4F1Fd2UWBP8woALbMjNjERKg2hovSBsH3
         0y0YkI4wO8qI2MI3pKH5oA+nA+L6qGqsRXDsSiH58FHQshYUIdHAxwdUS2TU9nh2dsMa
         exYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685658731; x=1688250731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDQovBoms3FLau58BysfqmyJWkZDGP+mDWm5zuqZL/Y=;
        b=YIDhoy17Em1HfPdf1GQ/AjSXGJAv4Nj8dQUEzaQ9Ox0iidBd1PPARftV+eDskXZCjW
         3dTB6ZSwpaWXQewYsHeFH75iWLcY1Qq9y2g44T3f5OMauUS1xk0sPGj5gj55SKbgIp2U
         n6u4mp7qzl+aSm4DD5tseVuSrq0UtE+WFpcosFmNzGaPfM1iB+kI1kbuMwM1JcYeXsfY
         tz6iWDie0aGOiCU2/be70BhGscUjO5nUhgiOvLYbnD3whzjrNyfDnr3LrDT/hlS6URA7
         pTDgDHyugYKg+G5Ahw6kjXnXPG0WuL+2fiGI9+kcHzuugCMCEze0AH8MD/NsTDw2vgSt
         5vrg==
X-Gm-Message-State: AC+VfDxqH4FrbHtjr0YpxkFcSo38ETXc3DkFeOI42LM1kIxt1XwFjqp5
	66n4xuu6sYTkNLmPDgJx6iQ=
X-Google-Smtp-Source: ACHHUZ4UrAst4qPVDvoXKTVPsJrseXBlcZmYfr9vB25sGSdLTIpkgvX8Re139ignQ4DE5Du+R0qDmw==
X-Received: by 2002:a05:6000:1191:b0:300:cb8c:fd8f with SMTP id g17-20020a056000119100b00300cb8cfd8fmr2588538wrx.54.1685658731484;
        Thu, 01 Jun 2023 15:32:11 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b0030af8da022dsm8619149wru.44.2023.06.01.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 15:32:11 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	William Breathitt Gray <william.gray@linaro.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Fri,  2 Jun 2023 01:30:40 +0300
Message-Id: <20230601223104.1243871-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601223104.1243871-1-bigunclemax@gmail.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
This ADC is the same for all of this SoCs. The only difference is
the number of available channels.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..94f15bb48231
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 General Purpose ADC
+
+properties:
+  "#io-channel-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  compatible:
+    enum:
+      - allwinner,sun20i-d1-gpadc
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#io-channel-cells"
+  - clocks
+  - compatible
+  - interrupts
+  - reg
+  - resets
+
+patternProperties:
+  "^channel@([0-15])$":
+    $ref: adc.yaml
+    type: object
+    description: |
+      Represents the internal channels of the ADC.
+
+    properties:
+      reg:
+        description: |
+          The channel number.
+          Up to 16 channels, numbered from 0 to 15.
+        items:
+          minimum: 0
+          maximum: 15
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    gpadc: adc@2009000 {
+        compatible = "allwinner,sun20i-d1-gpadc";
+        reg = <0x2009000 0x1000>;
+        clocks = <&ccu 80>;
+        resets = <&ccu 32>;
+        interrupts = <0 57 4>;
+        #io-channel-cells = <1>;
+
+        channel@0 {
+          reg = <0>;
+        };
+
+        channel@1 {
+          reg = <1>;
+        };
+    };
+
+...
-- 
2.39.2

