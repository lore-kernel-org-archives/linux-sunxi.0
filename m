Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D4D7F1
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Dec 2022 08:41:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2FD483200906;
	Thu,  8 Dec 2022 03:41:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 08 Dec 2022 03:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670488900; x=1670575300; bh=Y4
	KCKXVaENSRVN00f2GbvWBH6oOhV6DuwIHsvQ+bvOk=; b=f6jbVl8/MLRXRKn+hc
	aEYC6Isn940f5xt37/09uTYbtaVaMXFnONaNi14ZCT82jyU5SLwWMlO8ufGt7yZ6
	1XZbFHBAi8A7BZJxjIMWxldLHbGg122B0yNaymgI7i7Zp1lZ8j0T9+qamdqQkfVJ
	+mgww/AoU4l8BOrF7AurP8elG9iBIHeaDoBUzd7EluhPXqRP8U2buOCuQ2rMrl3u
	t/6I92X4ajfx/1GZboZI9884LngGv651N9jJpsZi5NrKPtNoLvZhmDRSnSE4MDqG
	KgNOvBrrCmX6BcgfACDpIasA+lJiEJOpI7aYKGl13D4e2E9QbX/4YGCj6IGOMEUe
	MUew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670488900; x=1670575300; bh=Y4KCKXVaENSRV
	N00f2GbvWBH6oOhV6DuwIHsvQ+bvOk=; b=E6Ohn3LNjBaRpGxOEItJun2tLEIqX
	msDTduJpZ8JQLm2DsPlKuoZUF8DG+r+p9uGdJkRWuD8t3gbQlUseR4AGFxdG4uYP
	egDRnXiWt1j7AaI8SbA86uXEelX6+vzIYjVKG0T0P0CyVPMdkfxqMUDBiYZioso/
	bfvsGmIIkASQBnWD4gN7ppT72ehHmXKPLMek4YpaCreWlpXHMdJ5RWllQ8thso7w
	5SE2hpH+Ks+KqfEUJ1/EFmXW9+fSaaoyW4kij69ym9ev1TzOUCboai0kgrLnoGKJ
	HTYhe0TxOAKAg6m8TMbIkhBvMochlZrmGedPnjavRM/RRjqvIRk5IPUlA==
X-ME-Sender: <xms:RKORYzDgsGIfbA6ZE1MMm92i3eISWz2fB1LTMB5z_5TeM7RsCeklWA>
    <xme:RKORY5iw8ILIZaZEHVZZm1UnqYoUsNByoiYQqp0v5ULRioFp8SI4181ro5eKdG7Af
    B3jpQs3Zblkc2iFtw>
X-ME-Received: <xmr:RKORY-kYpJKIaMKR_SpVbV6ut00UTr6_VGgkZHmXKsjEaPP8sr72WRovZRy9FuL7sn1NVkgI8ECkgGTN5xeM7vMe4ugZOtHE4f8POlr1HdHozM4eRaifDH9bmG2gn28WCaq2wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:RKORY1xd7yfYF66YtBOIQgzivj_gIiN-4pX4gFFTeh5MTUp1zKrwew>
    <xmx:RKORY4Qs3yMJY7FvCrhcM1yyOwxHNHm8WL5cr4VsmrSMY0RdU89LcA>
    <xmx:RKORY4Yom8rs_KPA1uEL4_x2TcTfVjwyIjzYR-j5AHXTPbqnE26E4w>
    <xmx:RKORY0r2KUcS19hhNJcqcCfikrYW5jMHhUu0tBhzzZ1_U1YbykFb5g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:41:39 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/4] dt-bindings: sram: sunxi-sram: Add regulators child
Date: Thu,  8 Dec 2022 02:41:26 -0600
Message-Id: <20221208084127.17443-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208084127.17443-1-samuel@sholland.org>
References: <20221208084127.17443-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sunxi SoCs have in-package regulators controlled by a register in
the system control MMIO block. Allow a child node for this regulator
device in addition to SRAM child nodes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v4)

Changes in v4:
 - Remove unevaluatedProperties from regulators schema reference

Changes in v3:
 - Require the regulators node to have a unit address
 - Reference the regulator schema from the SRAM controller schema
 - Move the system LDOs example to the SRAM controller schema
 - Reorder the patches so the example passes validation

Changes in v2:
 - New patch for v2

 .../allwinner,sun4i-a10-system-control.yaml   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index 98a7dc7f467d..c487ac9521e9 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -56,6 +56,9 @@ properties:
   ranges: true
 
 patternProperties:
+  "^regulators@[0-9a-f]+$":
+    $ref: /schemas/regulator/allwinner,sun20i-d1-system-ldos.yaml#
+
   "^sram@[a-z0-9]+":
     type: object
 
@@ -130,3 +133,28 @@ examples:
         };
       };
     };
+
+  - |
+    syscon@3000000 {
+      compatible = "allwinner,sun20i-d1-system-control";
+      reg = <0x3000000 0x1000>;
+      ranges;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      regulators@3000150 {
+        compatible = "allwinner,sun20i-d1-system-ldos";
+        reg = <0x3000150 0x4>;
+
+        reg_ldoa: ldoa {
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+        };
+
+        reg_ldob: ldob {
+          regulator-name = "vcc-dram";
+          regulator-min-microvolt = <1500000>;
+          regulator-max-microvolt = <1500000>;
+        };
+      };
+    };
-- 
2.37.4

