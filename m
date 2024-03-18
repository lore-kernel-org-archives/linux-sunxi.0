Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4139E12E61
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Mar 2024 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710724386; cv=none; b=WoaDLUPwBmGxZQygd8c4tSrI9vqX3UVZ2WKQvllEU8beXk6LLv3YyWleM0O5z83IV8qNKuL17Dzaha3L18nh8RLyYNferw04YmFsBATj5F/uI1E2zE0OE6xNoeyb5FKLGRJ+u74H81w5O8oa3oqCef54Y3hN/kS4hglA0dPQz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710724386; c=relaxed/simple;
	bh=c6Kwkq3WL0INbuU41EI7TMtL8/QiidFBT4o8X/LHrrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tXejS2STQC0+qfRZYpNnoZAx8mVk96kcZUrTqlRLqOJkS1Zb0OVSl6+toY2qL6HtofFLABdqb93YTY42viyCUY68qL5pna9eswBxXG8GtT1YzDBtqkjIcAe6iKGWp79Q3/z74PAmYNR1KyfBcmvSN0ApVzmJ4Xj14v4AFOEcfps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44E421480;
	Sun, 17 Mar 2024 18:13:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6CF3F23F;
	Sun, 17 Mar 2024 18:13:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Martin Botka <martin.botka1@gmail.com>
Subject: [PATCH v2 3/8] dt-bindings: opp: Describe H616 OPPs and opp-supported-hw
Date: Mon, 18 Mar 2024 01:12:23 +0000
Message-Id: <20240318011228.2626-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240318011228.2626-1-andre.przywara@arm.com>
References: <20240318011228.2626-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Botka <martin.botka@somainline.org>

The Allwinner H616 uses a similar NVMEM based mechanism to determine the
silicon revision, which is required to select the right frequency /
voltage pair for the OPPs.
However it limits the maximum frequency for some speedbins, which
requires to introduce the opp-supported-hw property.

Add this property to the list of allowed properties, also drop the
requirement for the revision specific opp-microvolt properties, since
they won't be needed if using opp-supported-hw. When using this
property, we also might have multiple OPP nodes per frequency, so relax
the OPP node naming to allow a single letter suffix.

Also use to opportunity to adjust some wording, and drop a sentence
referring to the Linux driver and the OPP subsystem.

Shorten the existing example and add another example, showcasing the
opp-supported-hw property.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../allwinner,sun50i-h6-operating-points.yaml | 89 ++++++++++---------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index 51f62c3ae1947..d5439a3f696bc 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -13,25 +13,25 @@ maintainers:
 description: |
   For some SoCs, the CPU frequency subset and voltage value of each
   OPP varies based on the silicon variant in use. Allwinner Process
-  Voltage Scaling Tables defines the voltage and frequency value based
-  on the speedbin blown in the efuse combination. The
-  sun50i-cpufreq-nvmem driver reads the efuse value from the SoC to
-  provide the OPP framework with required information.
+  Voltage Scaling Tables define the voltage and frequency values based
+  on the speedbin blown in the efuse combination.
 
 allOf:
   - $ref: opp-v2-base.yaml#
 
 properties:
   compatible:
-    const: allwinner,sun50i-h6-operating-points
+    enum:
+      - allwinner,sun50i-h6-operating-points
+      - allwinner,sun50i-h616-operating-points
 
   nvmem-cells:
     description: |
       A phandle pointing to a nvmem-cells node representing the efuse
-      registers that has information about the speedbin that is used
+      register that has information about the speedbin that is used
       to select the right frequency/voltage value pair. Please refer
-      the for nvmem-cells bindings
-      Documentation/devicetree/bindings/nvmem/nvmem.txt and also
+      to the nvmem-cells bindings in
+      Documentation/devicetree/bindings/nvmem/nvmem.yaml and also the
       examples below.
 
   opp-shared: true
@@ -41,21 +41,23 @@ required:
   - nvmem-cells
 
 patternProperties:
-  "^opp-[0-9]+$":
+  "^opp-[0-9]+(-[a-z])?$":
     type: object
 
     properties:
       opp-hz: true
       clock-latency-ns: true
+      opp-microvolt: true
+      opp-supported-hw:
+        description: |
+          A single 32 bit bitmap value, representing compatible HW, one
+          bit per speed bin index.
 
     patternProperties:
       "^opp-microvolt-speed[0-9]$": true
 
     required:
       - opp-hz
-      - opp-microvolt-speed0
-      - opp-microvolt-speed1
-      - opp-microvolt-speed2
 
     unevaluatedProperties: false
 
@@ -77,58 +79,61 @@ examples:
             opp-microvolt-speed2 = <800000>;
         };
 
-        opp-720000000 {
+        opp-1080000000 {
             clock-latency-ns = <244144>; /* 8 32k periods */
-            opp-hz = /bits/ 64 <720000000>;
+            opp-hz = /bits/ 64 <1080000000>;
 
-            opp-microvolt-speed0 = <880000>;
-            opp-microvolt-speed1 = <820000>;
-            opp-microvolt-speed2 = <800000>;
+            opp-microvolt-speed0 = <1060000>;
+            opp-microvolt-speed1 = <880000>;
+            opp-microvolt-speed2 = <840000>;
         };
 
-        opp-816000000 {
+        opp-1488000000 {
             clock-latency-ns = <244144>; /* 8 32k periods */
-            opp-hz = /bits/ 64 <816000000>;
+            opp-hz = /bits/ 64 <1488000000>;
 
-            opp-microvolt-speed0 = <880000>;
-            opp-microvolt-speed1 = <820000>;
-            opp-microvolt-speed2 = <800000>;
+            opp-microvolt-speed0 = <1160000>;
+            opp-microvolt-speed1 = <1000000>;
+            opp-microvolt-speed2 = <960000>;
         };
+    };
+
+  - |
+    opp-table {
+        compatible = "allwinner,sun50i-h616-operating-points";
+        nvmem-cells = <&speedbin_efuse>;
+        opp-shared;
 
-        opp-888000000 {
+        opp-480000000 {
             clock-latency-ns = <244144>; /* 8 32k periods */
-            opp-hz = /bits/ 64 <888000000>;
+            opp-hz = /bits/ 64 <480000000>;
 
-            opp-microvolt-speed0 = <940000>;
-            opp-microvolt-speed1 = <820000>;
-            opp-microvolt-speed2 = <800000>;
+            opp-microvolt = <900000>;
+            opp-supported-hw = <0x1f>;
         };
 
-        opp-1080000000 {
+        opp-792000000-l {
             clock-latency-ns = <244144>; /* 8 32k periods */
-            opp-hz = /bits/ 64 <1080000000>;
+            opp-hz = /bits/ 64 <792000000>;
 
-            opp-microvolt-speed0 = <1060000>;
-            opp-microvolt-speed1 = <880000>;
-            opp-microvolt-speed2 = <840000>;
+            opp-microvolt = <900000>;
+            opp-supported-hw = <0x02>;
         };
 
-        opp-1320000000 {
+        opp-792000000-h {
             clock-latency-ns = <244144>; /* 8 32k periods */
-            opp-hz = /bits/ 64 <1320000000>;
+            opp-hz = /bits/ 64 <792000000>;
 
-            opp-microvolt-speed0 = <1160000>;
-            opp-microvolt-speed1 = <940000>;
-            opp-microvolt-speed2 = <900000>;
+            opp-microvolt = <940000>;
+            opp-supported-hw = <0x10>;
         };
 
-        opp-1488000000 {
+        opp-1512000000 {
             clock-latency-ns = <244144>; /* 8 32k periods */
-            opp-hz = /bits/ 64 <1488000000>;
+            opp-hz = /bits/ 64 <1512000000>;
 
-            opp-microvolt-speed0 = <1160000>;
-            opp-microvolt-speed1 = <1000000>;
-            opp-microvolt-speed2 = <960000>;
+            opp-microvolt = <1100000>;
+            opp-supported-hw = <0x0a>;
         };
     };
 
-- 
2.35.8

