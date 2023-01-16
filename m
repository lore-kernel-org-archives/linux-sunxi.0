Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EB723C7
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 14:25:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC2EE1570;
	Mon, 16 Jan 2023 06:26:08 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB68E3F67D;
	Mon, 16 Jan 2023 06:25:24 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Martin Botka <martin.botka@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	martin.botka1@gmail.com,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mfd: x-powers,axp152: Document the AXP313a variant
Date: Mon, 16 Jan 2023 14:24:59 +0000
Message-Id: <20230116142501.767142-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116142501.767142-1-andre.przywara@arm.com>
References: <20230116142501.767142-1-andre.przywara@arm.com>
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

Signed-off-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index b7a8747d5fa0e..d4f0a75a8c7ad 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -84,6 +84,7 @@ properties:
     oneOf:
       - enum:
           - x-powers,axp152
+          - x-powers,axp313a
           - x-powers,axp202
           - x-powers,axp209
           - x-powers,axp221
-- 
2.25.1

