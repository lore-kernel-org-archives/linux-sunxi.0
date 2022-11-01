Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720EC20F6
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Nov 2022 14:17:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EAA811FB;
	Tue,  1 Nov 2022 07:17:18 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AC443F703;
	Tue,  1 Nov 2022 07:17:10 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 3/9] dt-bindings: i2c: mv64xxx: Add F1C100s compatible string
Date: Tue,  1 Nov 2022 14:16:52 +0000
Message-Id: <20221101141658.3631342-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101141658.3631342-1-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C controller IP used in the Allwinner F1C100s series of SoCs is
compatible with the ones used in the other Allwinner SoCs.

Add an F1C100s specific compatible string to the list of existing names.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 93c164aa00daf..984fc1ed3ec6a 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -19,6 +19,7 @@ properties:
       - const: allwinner,sun6i-a31-i2c
       - items:
           - enum:
+              - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
-- 
2.25.1

