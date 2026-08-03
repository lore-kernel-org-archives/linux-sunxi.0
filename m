Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED439792B
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734141; cv=none; b=ofC1bpk3bHW9y1E7rG850QHtBXruooBoVoqBuzghBPxI7EBuqmgMG9OzUIlbu7nkhak1gibJ5KtqlzzsyWyL/VrWrRsLMbd+G7FtND6WvKb3cav0MXGRn02MySX3WnNRY4bry7OyNyjh6ehg+Jq+LflF2aSDMX0we3llndUpIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734141; c=relaxed/simple;
	bh=2SOkuuUqffJAqXcEW7ZDhEaFHvF0SZKllJC1Nh5E8zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCuBFz81O8rq70+PNDz166aR5hHJxFH+4lvPy5Vw3zfftFw7R/s7zyLKRSSYczzuv+4+oOLvQrICXJw5ZLaFUf0mwYda3b0foPgoVYF08tbailHCB6Hn49SQUoTSHlOfEWLueEwixsa1zo5KmZ6lzNo7V336f0Hi2YWMjpubZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTkhOC5R; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTkhOC5R"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ee37dc91f5so1801398a34.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734138; x=1786338938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=;
        b=iTkhOC5RzevZ2n3mto9+6mPC8FDrCc9ucrWkW0FRCOWf62RY4+lOXHVvWkKtFGcIIC
         /9YpLXdkLAZajpwjPFxNbhZBngTnMNQzTB5/ndgQjxRPpAQGi/VnQ+N/7Dh9d+jlZca6
         OwiuH1HHpOOzA3zivFI6p+PXd+PqowndRiY2KVO6aNrfqWcU0aFtAlfpj15ff6//yLHC
         TMDnQm9fZxvBshXFCVB1sDSDUFHbmkYAhrsU969pthJhxx1h3jAvXWZlQ+vQwYoD4w57
         kWypzlp54TJLKTlfMGbmsaixlwZVnOIjen/4vqt/Vr6fKtJUh1fI2RhWrrDsMNj5LKzw
         RWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734138; x=1786338938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=;
        b=HEbFLsQSusl/p3yrU1+N+qPO6E8ll6rDDYBb42ds0DT+OMuMXgNrwOe/rhOAbV/Eoh
         YTUV9gsC1LUIlCHi0N7qxz2COxoOpeeyMt81J/cFOo7WiS6N6kDN9Y1we9skLUv1j1Qa
         05bDQGu5+lB7kce2U1SxWh/bBB5u1F17swnR/j5b7Z62sM1WdGB0lICJuFZeUoFN0HJd
         RrnzFn0EBjE6IEa8UxiCy48NFFlb7ZlxEu2sTadKCuSQqMVBz54+BMYNGVaSxvDv1dEA
         EJT3EMEC/Rc+LJVUEnMX58E3ZUTYbibH8XmmWS0XuXuLeyOnJj+5KxK0bQHE/NHjcnKq
         qpvw==
X-Forwarded-Encrypted: i=1; AHgh+RrUT0CKgNdqYzgXgRHEVaYlFvvH39Xx/07SkB7ZTVE7RjezlmFggX7zqfWCRYAPnB+od7BcdJBUN9GZwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmdDCN3eiZHa7JuPAITYJGcacdw5hJdCp9KrOpC9O9+ETaLvEc
	qVpkKIx/QG8WdnEA6h1eUp4fgTjqvefPa8wXDUi3mg4naWSsH1ouJoPD
X-Gm-Gg: AR+sD10IfzRTW6jfL/zMBjSrw8pB1aqnRMFIEJvMvN4zzPmGcMXkUAos/WG0vKljP6v
	ue9VeKIt33hQsn04Z6bP1yw6xjSj5OQudQagPmCQ8JEAnKYClkOUYNw5J9T986I41gRY8mca7zM
	EOPqXYpUUhp7mFQ1VQw/AOyp8mQg91izCo8i/4Y4IlZpqNg4Gq6xsUdOtWEsQSTRNgbhW7d7M+T
	Z0uV1Mr2J0ia1aB3F4bWCFoaNLgq7QfGdsRdhqY+MHyvrStX+PPuIyngIXKK+d2tEmrYQPczSbv
	vijflMhwluXkvaidpyUrXMOSVqg3ocibQXMHE3FR+S+ljANj9V4QiVsoPVicdmj7xE2nDHBSC59
	QdkqlKt/1bfQatsgNw/kgucWHzBkmHrXH9sYJ5bBPf6u7zmCBYSUKjp3pnM06BSu1F3+IK16y87
	14yuC9Xqu8wlLRE9XTmQIvq/PGXszIe/3t5q0yK7ynHJS6jAgq8cCscl7K0QVrxqMXLmvc8Cp7w
	W/Iff0zs8alOqXHJpo0XkKe2UkBPeX1LMrDY8T9ugfaozLxlT+vhPRZgvynPRNNdqvxzzF6x2+P
	njxsE/6BDD2O5z4pT+xnGxMio6jS13Gp8kDAocP8nP1tvCyGHAMb5Y0yTMxffhGnpiDaUw0yZA1
	lNE8S1c0jkFWMVG6/
X-Received: by 2002:a05:6830:4489:b0:7e9:cddb:142a with SMTP id 46e09a7af769-7f196bd63a9mr15354948a34.7.1785734137863;
        Sun, 02 Aug 2026 22:15:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:21 -0600
Subject: [PATCH 11/21] dt-bindings: net: x-powers: add AC300 EPHY control
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-11-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC300 companion IC exposes the Fast Ethernet PHY control registers
through a separate non-PHY Clause 22 address. The manual defines the
control address as the link-PHY address plus 16, giving address ranges
of 16-23 and 0-7 respectively.

Describe the control endpoint, its required VCC1 supply, its 24, 25 or
27 MHz input clock, interface mode and calibration cell.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
new file mode 100644
index 000000000000..a6634fcfafd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC300 Ethernet PHY control interface
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
+  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
+
+properties:
+  compatible:
+    const: x-powers,ac300-ephy-ctl
+
+  reg:
+    minimum: 16
+    maximum: 23
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
+      determines the corresponding EPHY_CLK_SEL value.
+
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      SoC SID cell containing the Ethernet PHY calibration value written to
+      the AC300 BGS_EFFUSE field after adding 3 modulo 16, as prescribed by
+      the vendor initialization sequence.
+
+  nvmem-cell-names:
+    const: calibration
+
+  phy-mode:
+    enum:
+      - mii
+      - rmii
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcc1-supply
+  - nvmem-cells
+  - nvmem-cell-names
+  - phy-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-control@10 {
+            compatible = "x-powers,ac300-ephy-ctl";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            vcc1-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+            phy-mode = "rmii";
+        };
+    };
+...

-- 
2.53.0

