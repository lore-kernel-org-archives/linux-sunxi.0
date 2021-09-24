Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A683FCB
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 07:16:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 45E9F5C005B;
	Fri, 24 Sep 2021 03:16:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 Sep 2021 03:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm3; bh=LPyqthChmkyMy
	d7JoALnrWdEJSBhEO6T2Ab/WX2nmSU=; b=Fa9WxQV/dP74R5bDHbJvkV7KLk3SE
	8nYmJr+/VV0+18JDl0o35hoXlIvH7ViwowE4rsemXJhnJfYp9L1drAMyadwdtJZ2
	dq2OUQHfaZLES3niSCdhoZQ/KOzrqa7Tqi1TS7Qx59wuBEQgXIL9bxSXEPOP95q2
	VbzvYKKsfgYOHNGbvLJW0MmAfNXdCMA0k/9GiZQImGRLu9lYsSMVi0gPNiXrpORj
	Nq9toDx+ehVtmewQr2GiSQjrLkvnE5SiJYq1NL+wEnf+Sx7R0Iq5q5kwHhREHJfZ
	hg1BSfYyw8G4hDCNqP7Mc9GusrYokCQhit95PTUMYptJM8H32VzczrCjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=LPyqthChmkyMyd7JoALnrWdEJSBhEO6T2Ab/WX2nmSU=; b=ewD+vO3Y
	ytzDf6NOgVVuQQxdQwzHv1SZCbBXLKnsdWId9TNFt0R0MvBnO6teebNXgiDmm9ng
	bH1ycWgwlcvx/PZb+18Fv5wTFh5VIAuF9Js0BTk80UhkhIQR+X3Cd6OUwgS37vmF
	hLWrTFfW9YlQ2dcPAWRSi/BTsSyxw1ztIfOW4utZbzqo2dlIiQITew15DZ2HAIBv
	nTHAXcnOAoHFrNyHNdWVJK/tfaGK7eNaEoUagMu15pM4Z+vGg7AT8qKpSw6jbvwh
	Si0KmvtMMv8WLXXximdBXRe8PMQXdibgeQ8EvHLoqP4lFW1iVd0sDLFeClofNBmq
	BfOWYySNk8tAqQ==
X-ME-Sender: <xms:RntNYW6RNRXSPhwhqoqal7SrDxc3J-yrMjhnKWv83YAgEBgTG7zQrA>
    <xme:RntNYf7b1eXItC4DGpxWxiZl7sCN83RKfaJZKw0eBhszyUVN6pmti6vDVw1jpG943
    EbCR_IvlctiWEd-gi0>
X-ME-Received: <xmr:RntNYVc3PQkR3ZxbDckOe3t3oKA4Hit5_e9yQa4yGyCqYnMCmdVBM7nUZXn09ULesuX6sfkoix_5zSNTs8pfu8q49_KWNFpqGUJT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    jghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomh
    grgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdev
    gfffgfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpe
    guvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RntNYTIm4Kl7w5Y_E_yzGrtsaBa3d2i8Y3nRo0DBxQmP1XvBgQqZHg>
    <xmx:RntNYaLzHIXdIJGiwjl0v_BSW0Q15tEqU0xNbB4SaS4ZBX4Ctcy-EQ>
    <xmx:RntNYUzkdUYKb5dWt1HH5NuqDZFG7Iv9cxxDr7vApa6Mu26Vy27Jpw>
    <xmx:RntNYZ-jFL40ZaEHOrUWYGQn4GBAqRg0b-0iqS1yxueh6qNO6LefzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:16:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: [RESEND v2 3/3] dt-bindings: mfd: Convert X-Powers AC100 binding to a schema
Date: Fri, 24 Sep 2021 09:16:14 +0200
Message-Id: <20210924071614.868307-3-maxime@cerno.tech>
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

The X-Powers AC100 hybrid devices are supported by Linux thanks to its
device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Lee Jones <lee.jones@linaro.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Added maximum number of clocks properties
---
 .../devicetree/bindings/mfd/ac100.txt         |  50 --------
 .../bindings/mfd/x-powers,ac100.yaml          | 116 ++++++++++++++++++
 2 files changed, 116 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ac100.txt b/Documentation/devicetree/bindings/mfd/ac100.txt
deleted file mode 100644
index dff219f07493..000000000000
--- a/Documentation/devicetree/bindings/mfd/ac100.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-X-Powers AC100 Codec/RTC IC Device Tree bindings
-
-AC100 is a audio codec and RTC subsystem combo IC. The 2 parts are
-separated, including power supplies and interrupt lines, but share
-a common register address space and host interface.
-
-Required properties:
-- compatible: "x-powers,ac100"
-- reg: The I2C slave address or RSB hardware address for the chip
-- sub-nodes:
-  - codec
-    - compatible:		"x-powers,ac100-codec"
-    - interrupts:		SoC NMI / GPIO interrupt connected to the
-    				IRQ_AUDIO pin
-    - #clock-cells:		Shall be 0
-    - clock-output-names:	"4M_adda"
-
-    - see clock/clock-bindings.txt for common clock bindings
-
-  - rtc
-    - compatible:		"x-powers,ac100-rtc"
-    - clocks:			A phandle to the codec's "4M_adda" clock
-    - #clock-cells:		Shall be 1
-    - clock-output-names:	"cko1_rtc", "cko2_rtc", "cko3_rtc"
-
-    - see clock/clock-bindings.txt for common clock bindings
-
-Example:
-
-ac100: codec@e89 {
-	compatible = "x-powers,ac100";
-	reg = <0xe89>;
-
-	ac100_codec: codec {
-		compatible = "x-powers,ac100-codec";
-		interrupt-parent = <&r_pio>;
-		interrupts = <0 9 IRQ_TYPE_LEVEL_LOW>; /* PL9 */
-		#clock-cells = <0>;
-		clock-output-names = "4M_adda";
-	};
-
-	ac100_rtc: rtc {
-		compatible = "x-powers,ac100-rtc";
-		interrupt-parent = <&nmi_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&ac100_codec>;
-		#clock-cells = <1>;
-		clock-output-names = "cko1_rtc", "cko2_rtc", "cko3_rtc";
-	};
-};
diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml
new file mode 100644
index 000000000000..de330c9869ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/x-powers,ac100.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: X-Powers AC100 Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+
+properties:
+  compatible:
+    const: x-powers,ac100
+
+  reg:
+    maxItems: 1
+
+  codec:
+    type: object
+
+    properties:
+      "#clock-cells":
+        const: 0
+
+      compatible:
+        const: x-powers,ac100-codec
+
+      interrupts:
+        maxItems: 1
+
+      clock-output-names:
+        maxItems: 1
+        description: >
+          Name of the 4M_adda clock exposed by the codec
+
+    required:
+      - "#clock-cells"
+      - compatible
+      - interrupts
+      - clock-output-names
+
+    additionalProperties: false
+
+  rtc:
+    type: object
+
+    properties:
+      "#clock-cells":
+        const: 1
+
+      compatible:
+        const: x-powers,ac100-rtc
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+        description: >
+           A phandle to the codec's "4M_adda" clock
+
+      clock-output-names:
+        maxItems: 3
+        description: >
+          Name of the cko1, cko2 and cko3 clocks exposed by the codec
+
+    required:
+      - "#clock-cells"
+      - compatible
+      - interrupts
+      - clocks
+      - clock-output-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - codec
+  - rtc
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rsb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@e89 {
+            compatible = "x-powers,ac100";
+            reg = <0xe89>;
+
+            ac100_codec: codec {
+                compatible = "x-powers,ac100-codec";
+                interrupt-parent = <&r_pio>;
+                interrupts = <0 9 IRQ_TYPE_LEVEL_LOW>; /* PL9 */
+                #clock-cells = <0>;
+                clock-output-names = "4M_adda";
+            };
+
+            ac100_rtc: rtc {
+                compatible = "x-powers,ac100-rtc";
+                interrupt-parent = <&nmi_intc>;
+                interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+                clocks = <&ac100_codec>;
+                #clock-cells = <1>;
+                clock-output-names = "cko1_rtc", "cko2_rtc", "cko3_rtc";
+            };
+        };
+    };
+
+...
-- 
2.31.1

