Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413611;
	b=l61SY3BQ0vaiin5U+BUVj38SGuFtooUaWvByLtwrQWkxXnO8KWJ6nOYZhUyGs+d6nYqG
	 1F72WX4gWIGpAUOKr/rghHB0lGkCWXpo2Xm75AeAXjpurgo2dmY+sUY4A7qqb2CqdN8SJ
	 VCXErVgsmwf7TpvMX6AeL+2wTArsDB29wQq5x6cNkb2kR0VOpVGmoyU8dMFc3287HBZDn
	 I65SiONZKIAoRElX6PUzeWo2UMu0JF161WdRzK4kT9Lim4X/lS/gDy22FhixowAhsgrzN
	 gsuL+11fDVvr7udJLOo7D1odMAEK3M4mJLspeV2X9kYf8p5jJtZgi0mAdQlq6ZKycBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
	b=X9APqM15uPZSV44IkejmSy4Ee2QXeV09WpriXWtV6crjkropt+QmcgWbcnOHEF0o8D2R
	 f2jy5ujjzWd2H9CgOosFVBLslXVX4u/3u6G7ntPJulIDeReQOYIQD7p2FU93kNzcphXXH
	 23AGbui6p3gl6rS9zstaGSnfkIZXnFYAXXCEta1ORSS266TuByomz2Mjkv93NWTjJvPAc
	 hzgexjajdOAvinnP3fzX5mKjnfCAL4pylRz+gxGTodvBpvP1fjzQ4DSOXRGszuqdGj8Lf
	 NLEkpFyBmuntyZ74LI/WHYhTW831VYcUOoN8uLNxGR5ueGrshMQWh/aVF+W4Tt0Ozow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+lM6hCI;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8C606A323
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE8C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+lM6hCI
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-705cb6ceebaso905368eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413610; x=1794018410; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
        b=c+lM6hCIHKSzBU97cdDFCOJ12dgDFPIyp7Ubhdj5dvEB4OlcsGpR35rm3WAMyV96Ay
         rQveMWTd2xI3qv7YiEdwHgv9U7UAdFnsnCG+UFhdLX0NZnn5MYxqH2d2TEKW6b5Y2Dl6
         94/4juLysBJc+52RQnsawRWTXn1J91EGCd4hj3G9drX0nU3zFS8PBnBy37gXsBts+7Af
         3c8PaORzIAP8zO7PgnkKCqxJyt9s3UXZ6TVlZxdYp41Kuf8oUe0pwEIlGAM0qhRdgqW5
         9a9l001iHMD+qN+IFC8OE9lA++hLXpGvDfp1KEcAzW8gb8M3QZxh/HtwGjoBBN35lLbc
         4vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413610; x=1794018410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
        b=Iwi99dIcsNK9iYMo30CwXSO1PZK7C32zP4gbRMXcQnDwirLRlClDuttRrJrRiDs6O6
         5iWVPFHVOEbQs0q427vOj4yismfPog1VlKfGaewr+xPKQnbXp/+aY5vBVUOOJD6CqRyu
         kZWW22fBqjzZ2xdFfROwVG67Fx76f0aqsFMRSp330M0uU5vbuhriucjTxUEFgy5zDEw/
         PLyWyVEcOKgBtJb+tTS6FXwspKDiuhOcW8pAtBgX96TMivIOBluPhnKOn2FtQtWjJkO8
         eTWkxPc6FM0gTDrcr0WO8HViOXbgraSkvUFae+CQI/fy8VcuIosnnz/Mo9s5b4X3FDwA
         RUYA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Ml4El2ATp1CGAtJ83CuCby10wG4btYEPArlwaoXI5yAUYJE3MG7s04g8WPw1NByedaYJV0Jda8SdLQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJNzI4NrnFkxHB+59uktBhSEQKnGQta3n9WAY9ivBtxeOSmhRiX
	M+65pS9dEBXO38gfBC3EZsTLFZ3tPDLaa/Z5URNRQb3e8PewgsgZYVeF
X-Gm-Gg: AYBFou0s9mCYdVU8SkCdeVcz9YYChRVMztasPd/ySwEaT8fapqozkbWfWKCADmHiyDh
	hllf0EQEIDoPnxw+L8zYEwpnaYxoqiVKImQ6y8AYY4miG+f61jvPMArEYJLccmTu7EYX9rU9O2p
	eg9vq1tIAJ05u3vkPPEFXeQiXHAa13r+zX6bDZi7eZRRu9kusbd10v6R/oacESfIl1bKVB7V4TV
	Vik82yiIC7SKOfx1X65jRubMTpLEIuBZOcc5F39bs5/d4bLo0gtgo4yl+OKrd3rZqdsaaQA5FKY
	l23LEYwoRhGvhAmQlYGdw7694t1p0MjcJT7QocBDglpGp/z8Dd7S1rYQZJiV2Acip4QvfJpIsm8
	gZoEOExl5b5/Ik+9jqTbEr53KhU1F9eDIXnuIPjOKy6QZatfv1dlmF5CZuvxq12gtsWR4hqkSzO
	TKlqZcEMs4TXKIxN35HyDazcwh1kjdMI4t3S+WkaPNiX/58f/t7nlc9tCUP2OW7H4i8RGanGQrF
	VWN6TnNpaIOGR+XFdr0/4u97h2kkJ7D6qNytGLRtIx7+XyJqHA40hvO/hyByB9luP12aVVfkenm
	BZiUWhZBVbUuG/SDs9u/lZuce4xplO17owZkmUcU9id4LThHtp5Q9VShQ46eBGDDM5AlS1zRkBW
	v96ggYw==
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1676288eaf.90.1793413609920;
        Fri, 30 Oct 2026 19:26:49 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2e500d0sm3126067eaf.10.2026.10.30.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:49 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Fri, 30 Oct 2026 22:26:47 -0400
Message-ID: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

SMHC3 uses a different DMA descriptor format from SMHC0/2: the length
field is 12 bits and the ownership/control word carries different
control and high-address fields. An older A100/D1 fallback would claim
unsupported programming compatibility with the existing sunxi-mmc
descriptor builder.

Give SMHC3 a distinct compatible and describe its register range,
interrupt, bus/module/storage-MBUS/MSI-Lite1 clocks and bus reset. This
binding permits an accurate disabled hardware description; no
operational driver match or eMMC functionality is claimed here.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This binding is a separate prerequisite for the disabled MMC3 node in
the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
operational eMMC path.

The original A733 manual and public vendor implementation distinguish
SMHC3's descriptor control/high-address fields and 12-bit buffer
length from SMHC0-2. Its resources are the 0x04023000/0x1000 register
window, SPI 164, AHB/module/storage-MBUS/MSI-Lite1 clocks and AHB reset.
The generic A733/D1 MMC0-2 compatible already in the base is unchanged.

The example uses the public A733 CCU header IDs. The tested standalone
base is official commit d89e1d186ec9271bf78e62771779e9fc03bf0fc3 plus
the clock helpers and CCU v6:
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

The binding example passes dt_binding_check, and its disabled DTS
user passes W=2 CHECK_DTBS=y. MMC0 runtime tests exercise the existing
controller driver; they are not MMC3 hardware validation.

 .../mmc/allwinner,sun60i-a733-emmc.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..07dc6759b937c8998c4ca72cae027f9444a0793c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/allwinner,sun60i-a733-emmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 eMMC controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description:
+  The SMHC3 controller has a different DMA descriptor format from SMHC0-2,
+  with 12-bit buffer lengths and high address bits in the descriptor control
+  word. It is not compatible with the earlier Allwinner MMC controllers.
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-emmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB interface clock
+      - description: Module clock
+      - description: Storage MBUS clock
+      - description: MSI-Lite1 interface clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mmc
+      - const: mbus
+      - const: msi
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: ahb
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    mmc@4023000 {
+        compatible = "allwinner,sun60i-a733-emmc";
+        reg = <0x04023000 0x1000>;
+        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_MMC3>, <&ccu CLK_MMC3>,
+                 <&ccu CLK_MBUS_STORE>, <&ccu CLK_BUS_MSI_LITE1>;
+        clock-names = "ahb", "mmc", "mbus", "msi";
+        resets = <&ccu RST_BUS_MMC3>;
+        reset-names = "ahb";
+    };

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
-- 
2.53.0

