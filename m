Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16676809
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 10:52:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 231191063;
	Fri,  8 Jul 2022 03:52:52 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334623F70D;
	Fri,  8 Jul 2022 03:52:50 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>
Subject: [PATCH v13 4/7] dt-bindings: pinctrl: sunxi: allow vcc-pi-supply
Date: Fri,  8 Jul 2022 11:52:32 +0100
Message-Id: <20220708105235.3983266-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708105235.3983266-1-andre.przywara@arm.com>
References: <20220708105235.3983266-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 SoC contains a VCC_PI pin, which supplies the voltage
for GPIO port I.
Extend the range of supply port names to include vcc-pi-supply to cover
that.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Samuel Holland <samuel@sholland.org>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 360dcd757e9da..0681b9a3965f0 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -127,7 +127,7 @@ patternProperties:
 
     additionalProperties: false
 
-  "^vcc-p[a-hlm]-supply$":
+  "^vcc-p[a-ilm]-supply$":
     description:
       Power supplies for pin banks.
 
-- 
2.25.1

