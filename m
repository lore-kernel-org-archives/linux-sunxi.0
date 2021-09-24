Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D42FAF
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 07:16:21 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B15455C01A9;
	Fri, 24 Sep 2021 03:16:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 24 Sep 2021 03:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm3; bh=bZYJVZBQc2jy3
	F9RDO1HCTJWTI6lh/txQO6kiXsLUXg=; b=nz9rhnpmkN7ewx9+UCGWK37DRMBKc
	rxgid/J3Pqv52ygRxyDoSck5k9FUFMAQ4rV5um4ZNRXObLnH4z9M1JVCWE2bpCsW
	yU5lQEE0FAT7UD/paZoxdxLDeD8Dha5ghVj0I1z/9itrLfYSjZqqiTgFGrpB40at
	wUayOvOJotR6l1B2ml0RBRDJ1tSMxCgAtaTENnepwVs6LTpKr/ydyki0mOA93yIO
	c6O25DpHA9Z9O281q5A14V0XAT7gJE4Zb+p2BUQVQeJtEdEVty570yUnn3kAxnbH
	dj0q4AW0M3iORCqAj5TMTET8T2w/SNfk6lHI6F6XBc7aEG1/LjezvWzQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=bZYJVZBQc2jy3F9RDO1HCTJWTI6lh/txQO6kiXsLUXg=; b=vdAeatd6
	0Q5gNpGmBNOuec7KxddNDXijuiHB2fSk0KtiFASMSv73SuYramQnVDyyQYTIamLe
	sl65el8VBLZgsT1hTb/aj0Reb1z4ZtqAdoxQgma9TEMMvBjPu7bPz41YUCfqK1I2
	HFR5w8ocdZ2RYTBYXz9IUUWrHq01BUjRxdixYDoV31SSQ3mZUnbJHtEaMYv74LLT
	X7B2gjDqdNF4riNRAQvPjFtBzju5toWQGwO+huvr451DUxIBFjZU49ils2UKSajL
	9orxXDtsL4n1heQTBffTcGqcLmnzT+tsdjYwJHMplq1bQ0jvpHopKUQxHIYxUM0I
	jOysttDFoAohbA==
X-ME-Sender: <xms:RHtNYda_x2PJqJI08Py1BQdV9OnBU7nD5wpcLKnHK_MruEp2tL5WAQ>
    <xme:RHtNYUYOpacoynNr2EvvyuCxCtSQ5q40ko03MMXNJ0VxG2G7VQOIre-dbdwJAWQsy
    1RYaxACHLvCJYcmDvo>
X-ME-Received: <xmr:RHtNYf9PAoCgHfuCesDNj22Un1PZDz3MPo4iRFKOwTrGuMrkNUjRP4gqIcF6_kOtxI-VGHPRdhxPBuYTcOSZwcIqeRF4biAwaJW_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    jghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomh
    grgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdev
    gfffgfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpe
    guvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RHtNYbqV0rqzysF_tbplwhYforWQs7wUgEq-9hEphfFk5uj8XIMe2A>
    <xmx:RHtNYYqg6k04qN6mdzdPfwUL85Qhw_JSukt0Ob3xybkJ7Kqtxasuig>
    <xmx:RHtNYRTzQCUkm_9MST6dl07CHCezo49uLF41deaMWjHFWGoXCK4qXQ>
    <xmx:RHtNYQK2JoUocLnqzr0ghXrf-D2PN080MuBDmJbfc6Ss6M9X0fLQlw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:16:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [RESEND v2 2/3] dt-bindings: mfd: Convert X-Powers AXP binding to a schema
Date: Fri, 24 Sep 2021 09:16:13 +0200
Message-Id: <20210924071614.868307-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924071614.868307-1-maxime@cerno.tech>
References: <20210924071614.868307-1-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP PMICs are supported by Linux thanks to its device tree
binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Add GPIO example
  - Remove the limitation on regulator-ramp-delay
---
 .../i2c/allwinner,sun6i-a31-p2wi.yaml         |   2 +-
 .../devicetree/bindings/mfd/axp20x.txt        | 273 ------------
 .../bindings/mfd/x-powers,axp152.yaml         | 400 ++++++++++++++++++
 3 files changed, 401 insertions(+), 274 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/axp20x.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml

diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
index 6097e8ac46c1..1b03810d4b4d 100644
--- a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
+++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
@@ -55,7 +55,7 @@ examples:
         #size-cells = <0>;
 
         axp221: pmic@68 {
-            compatible = "x-powers,axp221";
+            /* compatible = "x-powers,axp221"; */
             reg = <0x68>;
         };
     };
diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
deleted file mode 100644
index 2b53dcc0ea61..000000000000
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ /dev/null
@@ -1,273 +0,0 @@
-AXP family PMIC device tree bindings
-
-The axp20x family current members :
-axp152 (X-Powers)
-axp202 (X-Powers)
-axp209 (X-Powers)
-axp221 (X-Powers)
-axp223 (X-Powers)
-axp803 (X-Powers)
-axp806 (X-Powers)
-axp809 (X-Powers)
-axp813 (X-Powers)
-
-The AXP813 is 2 chips packaged into 1. The 2 chips do not share anything
-other than the packaging. Pins are routed separately. As such they should
-be treated as separate entities. The other half is an AC100 RTC/codec
-combo chip. Please see ./ac100.txt for its bindings.
-
-Required properties:
-- compatible: should be one of:
-    * "x-powers,axp152"
-    * "x-powers,axp202"
-    * "x-powers,axp209"
-    * "x-powers,axp221"
-    * "x-powers,axp223"
-    * "x-powers,axp803"
-    * "x-powers,axp806"
-    * "x-powers,axp805", "x-powers,axp806"
-    * "x-powers,axp305", "x-powers,axp805", "x-powers,axp806"
-    * "x-powers,axp809"
-    * "x-powers,axp813"
-- reg: The I2C slave address or RSB hardware address for the AXP chip
-- interrupt-controller: The PMIC has its own internal IRQs
-- #interrupt-cells: Should be set to 1
-
-Supported common regulator properties, see ../regulator/regulator.txt for
-more information:
-- regulator-ramp-delay: sets the ramp up delay in uV/us
-			AXP20x/DCDC2: 1600, 800
-			AXP20x/LDO3:  1600, 800
-- regulator-soft-start:	enable the output at the lowest possible voltage and
-			only then set the desired voltage
-			AXP20x/LDO3: software-based implementation
-
-Optional properties:
-- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
-- x-powers,dcdc-freq: defines the work frequency of DC-DC in KHz
-		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
-		      AXP22X/8XX: range: 1800-4050, Default: 3   MHz
-
-- x-powers,drive-vbus-en: boolean, set this when the N_VBUSEN pin is
-			  used as an output pin to control an external
-			  regulator to drive the OTG VBus, rather then
-			  as an input pin which signals whether the
-			  board is driving OTG VBus or not.
-			  (axp221 / axp223 / axp803/ axp813 only)
-
-- x-powers,self-working-mode and
-  x-powers,master-mode: Boolean (axp806 only). Set either of these when the
-			PMIC is wired for self-working mode or master mode.
-			If neither is set then slave mode is assumed.
-			This corresponds to how the MODESET pin is wired.
-
-- <input>-supply: a phandle to the regulator supply node. May be omitted if
-		  inputs are unregulated, such as using the IPSOUT output
-		  from the PMIC.
-
-- regulators: A node that houses a sub-node for each regulator. Regulators
-	      not used but preferred to be managed by the OS should be
-	      listed as well.
-	      See Documentation/devicetree/bindings/regulator/regulator.txt
-	      for more information on standard regulator bindings.
-
-Optional properties for DCDC regulators:
-- x-powers,dcdc-workmode: 1 for PWM mode, 0 for AUTO (PWM/PFM) mode
-			  Default: Current hardware setting
-			  The DCDC regulators work in a mixed PWM/PFM mode,
-			  using PFM under light loads and switching to PWM
-			  for heavier loads. Forcing PWM mode trades efficiency
-			  under light loads for lower output noise. This
-			  probably makes sense for HiFi audio related
-			  applications that aren't battery constrained.
-
-AXP202/AXP209 regulators, type, and corresponding input supply names:
-
-Regulator	  Type		  Supply Name		  Notes
----------	  ----		  -----------		  -----
-DCDC2		: DC-DC buck	: vin2-supply
-DCDC3		: DC-DC	buck	: vin3-supply
-LDO1		: LDO		: acin-supply		: always on
-LDO2		: LDO		: ldo24in-supply	: shared supply
-LDO3		: LDO		: ldo3in-supply
-LDO4		: LDO		: ldo24in-supply	: shared supply
-LDO5		: LDO		: ldo5in-supply
-
-AXP221/AXP223 regulators, type, and corresponding input supply names:
-
-Regulator	  Type		  Supply Name		  Notes
----------	  ----		  -----------		  -----
-DCDC1		: DC-DC buck	: vin1-supply
-DCDC2		: DC-DC buck	: vin2-supply
-DCDC3		: DC-DC	buck	: vin3-supply
-DCDC4		: DC-DC	buck	: vin4-supply
-DCDC5		: DC-DC	buck	: vin5-supply
-DC1SW		: On/Off Switch	:			: DCDC1 secondary output
-DC5LDO		: LDO		:			: input from DCDC5
-ALDO1		: LDO		: aldoin-supply		: shared supply
-ALDO2		: LDO		: aldoin-supply		: shared supply
-ALDO3		: LDO		: aldoin-supply		: shared supply
-DLDO1		: LDO		: dldoin-supply		: shared supply
-DLDO2		: LDO		: dldoin-supply		: shared supply
-DLDO3		: LDO		: dldoin-supply		: shared supply
-DLDO4		: LDO		: dldoin-supply		: shared supply
-ELDO1		: LDO		: eldoin-supply		: shared supply
-ELDO2		: LDO		: eldoin-supply		: shared supply
-ELDO3		: LDO		: eldoin-supply		: shared supply
-LDO_IO0		: LDO		: ips-supply		: GPIO 0
-LDO_IO1		: LDO		: ips-supply		: GPIO 1
-RTC_LDO		: LDO		: ips-supply		: always on
-DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
-
-AXP803 regulators, type, and corresponding input supply names:
-
-Regulator	  Type		  Supply Name		  Notes
----------	  ----		  -----------		  -----
-DCDC1		: DC-DC buck	: vin1-supply
-DCDC2		: DC-DC buck	: vin2-supply		: poly-phase capable
-DCDC3		: DC-DC	buck	: vin3-supply		: poly-phase capable
-DCDC4		: DC-DC	buck	: vin4-supply
-DCDC5		: DC-DC	buck	: vin5-supply		: poly-phase capable
-DCDC6		: DC-DC	buck	: vin6-supply		: poly-phase capable
-DC1SW		: On/Off Switch	:			: DCDC1 secondary output
-ALDO1		: LDO		: aldoin-supply		: shared supply
-ALDO2		: LDO		: aldoin-supply		: shared supply
-ALDO3		: LDO		: aldoin-supply		: shared supply
-DLDO1		: LDO		: dldoin-supply		: shared supply
-DLDO2		: LDO		: dldoin-supply		: shared supply
-DLDO3		: LDO		: dldoin-supply		: shared supply
-DLDO4		: LDO		: dldoin-supply		: shared supply
-ELDO1		: LDO		: eldoin-supply		: shared supply
-ELDO2		: LDO		: eldoin-supply		: shared supply
-ELDO3		: LDO		: eldoin-supply		: shared supply
-FLDO1		: LDO		: fldoin-supply		: shared supply
-FLDO2		: LDO		: fldoin-supply		: shared supply
-LDO_IO0		: LDO		: ips-supply		: GPIO 0
-LDO_IO1		: LDO		: ips-supply		: GPIO 1
-RTC_LDO		: LDO		: ips-supply		: always on
-DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
-
-AXP806 regulators, type, and corresponding input supply names:
-
-Regulator	  Type		  Supply Name		  Notes
----------	  ----		  -----------		  -----
-DCDCA		: DC-DC buck	: vina-supply		: poly-phase capable
-DCDCB		: DC-DC buck	: vinb-supply		: poly-phase capable
-DCDCC		: DC-DC	buck	: vinc-supply		: poly-phase capable
-DCDCD		: DC-DC	buck	: vind-supply		: poly-phase capable
-DCDCE		: DC-DC	buck	: vine-supply		: poly-phase capable
-ALDO1		: LDO		: aldoin-supply		: shared supply
-ALDO2		: LDO		: aldoin-supply		: shared supply
-ALDO3		: LDO		: aldoin-supply		: shared supply
-BLDO1		: LDO		: bldoin-supply		: shared supply
-BLDO2		: LDO		: bldoin-supply		: shared supply
-BLDO3		: LDO		: bldoin-supply		: shared supply
-BLDO4		: LDO		: bldoin-supply		: shared supply
-CLDO1		: LDO		: cldoin-supply		: shared supply
-CLDO2		: LDO		: cldoin-supply		: shared supply
-CLDO3		: LDO		: cldoin-supply		: shared supply
-SW		: On/Off Switch : swin-supply
-
-Additionally, the AXP806 DC-DC regulators support poly-phase arrangements
-for higher output current. The possible groupings are: A+B, A+B+C, D+E.
-
-AXP809 regulators, type, and corresponding input supply names:
-
-Regulator	  Type		  Supply Name		  Notes
----------	  ----		  -----------		  -----
-DCDC1		: DC-DC buck	: vin1-supply
-DCDC2		: DC-DC buck	: vin2-supply
-DCDC3		: DC-DC	buck	: vin3-supply
-DCDC4		: DC-DC	buck	: vin4-supply
-DCDC5		: DC-DC	buck	: vin5-supply
-DC1SW		: On/Off Switch	:			: DCDC1 secondary output
-DC5LDO		: LDO		:			: input from DCDC5
-ALDO1		: LDO		: aldoin-supply		: shared supply
-ALDO2		: LDO		: aldoin-supply		: shared supply
-ALDO3		: LDO		: aldoin-supply		: shared supply
-DLDO1		: LDO		: dldoin-supply		: shared supply
-DLDO2		: LDO		: dldoin-supply		: shared supply
-ELDO1		: LDO		: eldoin-supply		: shared supply
-ELDO2		: LDO		: eldoin-supply		: shared supply
-ELDO3		: LDO		: eldoin-supply		: shared supply
-LDO_IO0		: LDO		: ips-supply		: GPIO 0
-LDO_IO1		: LDO		: ips-supply		: GPIO 1
-RTC_LDO		: LDO		: ips-supply		: always on
-SW		: On/Off Switch : swin-supply
-
-AXP813 regulators, type, and corresponding input supply names:
-
-Regulator	  Type		  Supply Name		  Notes
----------	  ----		  -----------		  -----
-DCDC1		: DC-DC buck	: vin1-supply
-DCDC2		: DC-DC buck	: vin2-supply		: poly-phase capable
-DCDC3		: DC-DC	buck	: vin3-supply		: poly-phase capable
-DCDC4		: DC-DC	buck	: vin4-supply
-DCDC5		: DC-DC	buck	: vin5-supply		: poly-phase capable
-DCDC6		: DC-DC	buck	: vin6-supply		: poly-phase capable
-DCDC7		: DC-DC	buck	: vin7-supply
-ALDO1		: LDO		: aldoin-supply		: shared supply
-ALDO2		: LDO		: aldoin-supply		: shared supply
-ALDO3		: LDO		: aldoin-supply		: shared supply
-DLDO1		: LDO		: dldoin-supply		: shared supply
-DLDO2		: LDO		: dldoin-supply		: shared supply
-DLDO3		: LDO		: dldoin-supply		: shared supply
-DLDO4		: LDO		: dldoin-supply		: shared supply
-ELDO1		: LDO		: eldoin-supply		: shared supply
-ELDO2		: LDO		: eldoin-supply		: shared supply
-ELDO3		: LDO		: eldoin-supply		: shared supply
-FLDO1		: LDO		: fldoin-supply		: shared supply
-FLDO2		: LDO		: fldoin-supply		: shared supply
-FLDO3		: LDO		: fldoin-supply		: shared supply
-LDO_IO0		: LDO		: ips-supply		: GPIO 0
-LDO_IO1		: LDO		: ips-supply		: GPIO 1
-RTC_LDO		: LDO		: ips-supply		: always on
-SW		: On/Off Switch : swin-supply
-DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
-
-Example:
-
-axp209: pmic@34 {
-	compatible = "x-powers,axp209";
-	reg = <0x34>;
-	interrupt-parent = <&nmi_intc>;
-	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-	regulators {
-		x-powers,dcdc-freq = <1500>;
-
-		vdd_cpu: dcdc2 {
-			regulator-always-on;
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1450000>;
-			regulator-name = "vdd-cpu";
-		};
-
-		vdd_int_dll: dcdc3 {
-			regulator-always-on;
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1400000>;
-			regulator-name = "vdd-int-dll";
-		};
-
-		vdd_rtc: ldo1 {
-			regulator-always-on;
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1400000>;
-			regulator-name = "vdd-rtc";
-		};
-
-		avcc: ldo2 {
-			regulator-always-on;
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-name = "avcc";
-		};
-
-		ldo3 {
-			/* unused but preferred to be managed by OS */
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
new file mode 100644
index 000000000000..3a53bae611bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -0,0 +1,400 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AXP PMIC Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp152
+              - x-powers,axp202
+              - x-powers,axp209
+
+    then:
+      properties:
+        regulators:
+          properties:
+            x-powers,dcdc-freq:
+              minimum: 750
+              maximum: 1875
+              default: 1500
+
+    else:
+      properties:
+        regulators:
+          properties:
+            x-powers,dcdc-freq:
+              minimum: 1800
+              maximum: 4050
+              default: 3000
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp152
+              - x-powers,axp202
+              - x-powers,axp209
+
+    then:
+      not:
+        required:
+          - x-powers,drive-vbus-en
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: x-powers,axp806
+
+    then:
+      allOf:
+        - not:
+            required:
+              - x-powers,self-working-mode
+
+        - not:
+            required:
+              - x-powers,master-mode
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: x-powers,axp305
+
+    then:
+      required:
+        - interrupts
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - x-powers,axp152
+          - x-powers,axp202
+          - x-powers,axp209
+          - x-powers,axp221
+          - x-powers,axp223
+          - x-powers,axp803
+          - x-powers,axp806
+          - x-powers,axp809
+          - x-powers,axp813
+      - items:
+          - const: x-powers,axp805
+          - const: x-powers,axp806
+      - items:
+          - const: x-powers,axp305
+          - const: x-powers,axp805
+          - const: x-powers,axp806
+      - items:
+          - const: x-powers,axp818
+          - const: x-powers,axp813
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  x-powers,drive-vbus-en:
+    type: boolean
+    description: >
+      Set this when the N_VBUSEN pin is used as an output pin to control an
+      external regulator to drive the OTG VBus, rather then as an input pin
+      which signals whether the board is driving OTG VBus or not.
+
+  x-powers,self-working-mode:
+    type: boolean
+    description: >
+      Set this when the PMIC is wired for self-working mode through the MODESET
+      pin.
+
+  x-powers,master-mode:
+    type: boolean
+    description: >
+      Set this when the PMIC is wired for master mode through the MODESET pin.
+
+  vin1-supply:
+    description: >
+      DCDC1 power supply node, if present.
+
+  vin2-supply:
+    description: >
+      DCDC2 power supply node, if present.
+
+  vin3-supply:
+    description: >
+      DCDC3 power supply node, if present.
+
+  vin4-supply:
+    description: >
+      DCDC4 power supply node, if present.
+
+  vin5-supply:
+    description: >
+      DCDC5 power supply node, if present.
+
+  vin6-supply:
+    description: >
+      DCDC6 power supply node, if present.
+
+  vin7-supply:
+    description: >
+      DCDC7 power supply node, if present.
+
+  vina-supply:
+    description: >
+      DCDCA power supply node, if present.
+
+  vinb-supply:
+    description: >
+      DCDCB power supply node, if present.
+
+  vinc-supply:
+    description: >
+      DCDCC power supply node, if present.
+
+  vind-supply:
+    description: >
+      DCDCD power supply node, if present.
+
+  vine-supply:
+    description: >
+      DCDCE power supply node, if present.
+
+  acin-supply:
+    description: >
+      LDO1 power supply node, if present.
+
+  ldo24in-supply:
+    description: >
+      LDO2 and LDO4 power supply node, if present.
+
+  ldo3in-supply:
+    description: >
+      LDO3 power supply node, if present.
+
+  ldo5in-supply:
+    description: >
+      LDO5 power supply node, if present.
+
+  aldoin-supply:
+    description: >
+      ALDO* power supply node, if present.
+
+  bldoin-supply:
+    description: >
+      BLDO* power supply node, if present.
+
+  cldoin-supply:
+    description: >
+      CLDO* power supply node, if present.
+
+  dldoin-supply:
+    description: >
+      DLDO* power supply node, if present.
+
+  eldoin-supply:
+    description: >
+      ELDO* power supply node, if present.
+
+  fldoin-supply:
+    description: >
+      FLDO* power supply node, if present.
+
+  ips-supply:
+    description: >
+      LDO_IO0, LDO_IO1 and RTC_LDO power supply node, if present.
+
+  drivevbus-supply:
+    description: >
+      DRIVEVBUS power supply node, if present.
+
+  swin-supply:
+    description: >
+      SW power supply node, if present.
+
+  adc:
+    $ref: /schemas/iio/adc/x-powers,axp209-adc.yaml#
+
+  gpio:
+    $ref: /schemas/gpio/x-powers,axp209-gpio.yaml#
+
+  ac-power:
+    $ref: /schemas/power/supply/x-powers,axp20x-ac-power-supply.yaml#
+
+  battery-power:
+    $ref: /schemas/power/supply/x-powers,axp20x-battery-power-supply.yaml#
+
+  usb-power:
+    $ref: /schemas/power/supply/x-powers,axp20x-usb-power-supply.yaml#
+
+  regulators:
+    type: object
+
+    properties:
+      x-powers,dcdc-freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          Defines the work frequency of DC-DC in kHz.
+
+    patternProperties:
+      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|drivevbus|dc5ldo)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        properties:
+          regulator-ramp-delay:
+            description: >
+              Only 800 and 1600 are valid for the DCDC2 and LDO3 regulators on
+              the AXP209.
+
+          regulator-soft-start:
+            description: >
+              Only valid for the LDO3 regulator.
+
+          x-powers,dcdc-workmode:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+            description: >
+              Only valid for DCDC regulators. Setup 1 for PWM mode, 0
+              for AUTO (PWM/PFM) mode. The DCDC regulators work in a
+              mixed PWM/PFM mode, using PFM under light loads and
+              switching to PWM for heavier loads. Forcing PWM mode
+              trades efficiency under light loads for lower output
+              noise. This probably makes sense for HiFi audio related
+              applications that aren't battery constrained.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+      i2c0 {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          pmic@30 {
+              compatible = "x-powers,axp152";
+              reg = <0x30>;
+              interrupts = <0>;
+              interrupt-controller;
+              #interrupt-cells = <1>;
+          };
+      };
+
+  - |
+      #include <dt-bindings/interrupt-controller/irq.h>
+
+      i2c0 {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          pmic@34 {
+              compatible = "x-powers,axp209";
+              reg = <0x34>;
+              interrupt-parent = <&nmi_intc>;
+              interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+              interrupt-controller;
+              #interrupt-cells = <1>;
+
+              ac_power_supply: ac-power {
+                  compatible = "x-powers,axp202-ac-power-supply";
+              };
+
+              axp_adc: adc {
+                  compatible = "x-powers,axp209-adc";
+                  #io-channel-cells = <1>;
+              };
+
+              axp_gpio: gpio {
+                  compatible = "x-powers,axp209-gpio";
+                  gpio-controller;
+                  #gpio-cells = <2>;
+
+                  gpio0-adc-pin {
+                      pins = "GPIO0";
+                      function = "adc";
+                  };
+              };
+
+              battery_power_supply: battery-power {
+                  compatible = "x-powers,axp209-battery-power-supply";
+              };
+
+              regulators {
+                  /* Default work frequency for buck regulators */
+                  x-powers,dcdc-freq = <1500>;
+
+                  reg_dcdc2: dcdc2 {
+                      regulator-always-on;
+                      regulator-min-microvolt = <1000000>;
+                      regulator-max-microvolt = <1450000>;
+                      regulator-name = "vdd-cpu";
+                  };
+
+                  reg_dcdc3: dcdc3 {
+                      regulator-always-on;
+                      regulator-min-microvolt = <1000000>;
+                      regulator-max-microvolt = <1400000>;
+                      regulator-name = "vdd-int-dll";
+                  };
+
+                  reg_ldo1: ldo1 {
+                      /* LDO1 is a fixed output regulator */
+                      regulator-always-on;
+                      regulator-min-microvolt = <1300000>;
+                      regulator-max-microvolt = <1300000>;
+                      regulator-name = "vdd-rtc";
+                  };
+
+                  reg_ldo2: ldo2 {
+                      regulator-always-on;
+                      regulator-min-microvolt = <3000000>;
+                      regulator-max-microvolt = <3000000>;
+                      regulator-name = "avcc";
+                  };
+
+                  reg_ldo3: ldo3 {
+                      regulator-name = "ldo3";
+                  };
+
+                  reg_ldo4: ldo4 {
+                      regulator-name = "ldo4";
+                  };
+
+                  reg_ldo5: ldo5 {
+                      regulator-name = "ldo5";
+                  };
+              };
+
+              usb_power_supply: usb-power {
+                  compatible = "x-powers,axp202-usb-power-supply";
+              };
+          };
+      };
-- 
2.31.1

