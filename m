Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F6815AC
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 00:56:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E941D139F;
	Sun,  6 Nov 2022 16:56:19 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C47793F703;
	Sun,  6 Nov 2022 16:56:11 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/10] dt-bindings: media: IR: Add F1C100s IR compatible string
Date: Mon,  7 Nov 2022 00:54:28 +0000
Message-Id: <20221107005433.11079-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CIR controller in the Allwinner F1C100s series of SoCs is compatible
to the ones used in other Allwinner SoCs.

Add the respective compatible name to the existing IR binding, and pair
it with the A31 fallback compatible string.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 704033e21ee8..53945c61325c 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -21,6 +21,7 @@ properties:
       - const: allwinner,sun6i-a31-ir
       - items:
           - enum:
+              - allwinner,suniv-f1c100s-ir
               - allwinner,sun8i-a83t-ir
               - allwinner,sun8i-r40-ir
               - allwinner,sun50i-a64-ir
-- 
2.35.5

