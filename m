Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B571850
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 11:25:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38D54143D;
	Fri,  1 Jul 2022 04:25:08 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5F063F66F;
	Fri,  1 Jul 2022 04:25:05 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 2/7] dt-bindings: pinctrl: sunxi: Make interrupts optional
Date: Fri,  1 Jul 2022 12:24:48 +0100
Message-Id: <20220701112453.2310722-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701112453.2310722-1-andre.przywara@arm.com>
References: <20220701112453.2310722-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R_PIO pinctrl device on the Allwinner H616 SoC does not have an
interrupt (it features only two pins).
However the binding requires at least naming one upstream interrupt,
plus the #interrupt-cells and interrupt-controller properties.

Drop the unconditional requirement for the interrupt properties, and
make them dependent on being not this particular pinctrl device.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml      | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index bfce850c20351..0bd903954195b 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -133,14 +133,11 @@ patternProperties:
 
 required:
   - "#gpio-cells"
-  - "#interrupt-cells"
   - compatible
   - reg
-  - interrupts
   - clocks
   - clock-names
   - gpio-controller
-  - interrupt-controller
 
 allOf:
   # FIXME: We should have the pin bank supplies here, but not a lot of
@@ -148,6 +145,18 @@ allOf:
   # warnings.
 
   - $ref: "pinctrl.yaml#"
+  - if:
+      not:
+        properties:
+          compatible:
+            enum:
+              - allwinner,sun50i-h616-r-pinctrl
+    then:
+      required:
+        - "#interrupt-cells"
+        - interrupts
+        - interrupt-controller
+
   - if:
       properties:
         compatible:
-- 
2.25.1

