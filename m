Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E5F179
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Apr 2023 00:19:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA98611FB;
	Fri, 31 Mar 2023 17:19:45 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D88323F6C4;
	Fri, 31 Mar 2023 17:18:58 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Martin Botka <martin.botka@somainline.org>,
	martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v10 1/3] dt-bindings: mfd: x-powers,axp152: Document the AXP313a variant
Date: Sat,  1 Apr 2023 01:18:48 +0100
Message-Id: <20230401001850.4988-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230401001850.4988-1-andre.przywara@arm.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Botka <martin.botka@somainline.org>

The X-Powers AXP313a is a PMIC used on some devices with the Allwinner
H616 or H313 SoC.
According to the datasheet, the DC/DC converter PWM frequency is fixed
(to 3 MHz), so disallow the property that lets us set this frequency
for the other PMICs.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/mfd/x-powers,axp152.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 2691ac08f5362..ed76b1c58cdf4 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -73,6 +73,16 @@ allOf:
       required:
         - interrupts
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: x-powers,axp313a
+
+    then:
+      properties:
+        x-powers,dcdc-freq: false
+
 properties:
   compatible:
     oneOf:
@@ -82,6 +92,7 @@ properties:
           - x-powers,axp209
           - x-powers,axp221
           - x-powers,axp223
+          - x-powers,axp313a
           - x-powers,axp803
           - x-powers,axp806
           - x-powers,axp809
-- 
2.35.7

