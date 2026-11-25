Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588205;
	b=pcYHDEqmjbbaUaoCNhTYtVcPq+N31MlwKdZYykYdmwQIBG2x9cTG4ZrlwmTkSzK+ns2i
	 ntrzFJI3A/tDYJYV7GTY0B71g2t7XuUCDow+vw12xQnK88Zx6aHAye681palS2a+4gzUv
	 YLXJqSWN9J25Csl40r7aDmYPD3kx5NRwiov6+vbb2lzE0RwXsFNTewu4/YwZa6ouX/Em3
	 dHh0HktbNzMRbMnzmepjglt6M2TnuEbx76Q+N44vjJ6JfqpKJh5gANKPrCUv5hBRK64BX
	 CDHT6EUIJQi4+L8rxT/nCf6iHTpmKASEmqYlafk031wk1wJ0cHR6hLCd5WZwFvklZSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588205;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0R4ASB7SjKyeA0M33Yk9VA1tZHdpbIHAE/YA5+B9MfA=;
	b=EvSbyI6T2c0RghLVCcU5BL+9Ers/20N5aAyuwEv8QrERsMuhjaNyGg1rpXw5+C8C7UAd
	 7RSl7QGdfm+9W4MqknV3nSgSAuHRYniWQ4MrwKP8gvNHHBjZdQ5SUYvCdIe/8zsIUkWjG
	 zorSKoVWH3NX9jIRr2jwrC+XElEgFW8Lb+FUXUTIf8QSjhyXorN7sgynjXwdbuHSq5Iw3
	 7M1IddjxHUmPHPcFrVLvo5JfQVa43JoBiyJwAkCurWJcxnIHK31Zwa2luYVbKwN1uR+cF
	 vlA5vRcj1xZPu71o0Z5lF345i9xfRCLGq82vNdtkjA4U6JuMFAmXnAjianvtLPGaKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="XzGArB9/";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A25C606A327;
	Wed, 25 Nov 2026 06:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A25C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=XzGArB9/
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 6C61B4C940;
	Wed, 25 Nov 2026 17:29:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795588196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0R4ASB7SjKyeA0M33Yk9VA1tZHdpbIHAE/YA5+B9MfA=;
	b=XzGArB9/Y1KL5VmP4qd+YqweVeWV6JohoamDplXmk7uFU+uasBCMtbG0JsInuTXxIPAhBD
	UQA5G+VKt8m2YzyEGCdxh7UI7cadLdNMX1zyGtdA6go5p2ug6c0W86nNc8XwbcczTNPbXw
	2/XEA4VH1T/YlCmWYu6rDVS4l6e6mVlAqOU3aZ+uzMKYfUbunsAH9P1LSz7q5QUYmZF98/
	XaDp1vC04xHw0zmr9t+zjfTe66WZtUcI2y1THKBZCyCie3P8uvJ1MKBZdw0ezn0QE9idma
	yKWDS7d9sM95B3haG5LfT62+nZFwKdH8CI8+WFsJO2gkU9Fn/qA73O+1FASufg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel-related project (devicetree.org) which aligns
	perfectly with the personal mailbox of alastair@d-silva.org; the
	From domain (d-silva.org) matches the sender identity and the
	personal mailbox context; there are no marketing signals, scare
	tactics, or suspicious links, and the content is a standard, professional
	technical contribution.
From: Alastair D'Silva <alastair@d-silva.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 1/5] dt-bindings: phy: allwinner,sun60i-a733-combophy: Add binding
Date: Wed, 25 Nov 2026 17:29:44 +1100
Message-ID: <20261125062948.1234677-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125062948.1234677-1-alastair@d-silva.org>
References: <20261125062948.1234677-1-alastair@d-silva.org>
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

Add Devicetree binding for the Allwinner A733 (sun60i) Cadence Combo PHY
and register the SerDes subsystem syscon compatible in syscon.yaml.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../devicetree/bindings/mfd/syscon.yaml       |  1 +
 .../phy/allwinner,sun60i-a733-combophy.yaml   | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 945a168b613db..e58f5004c8cda 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -30,6 +30,7 @@ properties:
               - allwinner,sun8i-h3-system-controller
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
+              - allwinner,sun60i-a733-serdes-syscon
               - altr,l3regs
               - altr,sdr-ctl
               - amd,pensando-elba-syscon
diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
new file mode 100644
index 0000000000000..5e6727acb832a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/allwinner,sun60i-a733-combophy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 (sun60i) Cadence Combo PHY
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+  - Chen-Yu Tsai <wens@kernel.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description: |
+  The Allwinner A733 (sun60i) SoC integrates a Cadence Combo PHY within its
+  SerDes subsystem, supporting PCIe Gen3 (up to 8.0 GT/s).
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-combophy1
+
+  reg:
+    maxItems: 1
+    description: Cadence Combo PHY PMA/PCS analog registers
+
+  allwinner,serdes-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Allwinner A733 SerDes subsystem syscon
+
+  clocks:
+    items:
+      - description: SerDes PHY clock (100 MHz)
+      - description: SerDes AHB bus clock
+      - description: SerDes MBUS clock
+      - description: Reference oscillator / DCXO clock
+
+  clock-names:
+    items:
+      - const: serdes
+      - const: ahb
+      - const: mbus
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  phy-supply:
+    description: 1.8V SerDes PHY power supply
+
+  "#phy-cells":
+    const: 1
+    description: PHY type (e.g. PHY_TYPE_PCIE from dt-bindings/phy/phy.h)
+
+required:
+  - compatible
+  - reg
+  - allwinner,serdes-syscon
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun6i-rtc.h>
+    #include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
+
+    phy@6ca0000 {
+        compatible = "allwinner,sun60i-a733-combophy1";
+        reg = <0x06ca0000 0x20000>;
+        clocks = <&ccu 226>, <&ccu 68>, <&ccu 81>, <&rtc CLK_HOSC_SERDES1>;
+        clock-names = "serdes", "ahb", "mbus", "ref";
+        resets = <&ccu 92>;
+        power-domains = <&pck600 PD_PCIE>;
+        phy-supply = <&reg_serdes1v8>;
+        allwinner,serdes-syscon = <&serdes>;
+        #phy-cells = <1>;
+    };
-- 
2.53.0

