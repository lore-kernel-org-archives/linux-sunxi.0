Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1761D52E
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78E13153B;
	Fri, 20 Oct 2023 07:57:54 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02D2F3F762;
	Fri, 20 Oct 2023 07:57:11 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: add Orange Pi Zero 2W
Date: Fri, 20 Oct 2023 15:57:05 +0100
Message-Id: <20231020145706.705420-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020145706.705420-1-andre.przywara@arm.com>
References: <20231020145706.705420-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi Zero 2W is a small board with an Allwinner H618 SoC.

Add the compatible string to the binding documents.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 11c5ce941dd7e..6f481e8bb4bf6 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1013,6 +1013,11 @@ properties:
           - const: xunlong,orangepi-zero2
           - const: allwinner,sun50i-h616
 
+      - description: Xunlong OrangePi Zero 2W
+        items:
+          - const: xunlong,orangepi-zero2w
+          - const: allwinner,sun50i-h618
+
       - description: Xunlong OrangePi Zero 3
         items:
           - const: xunlong,orangepi-zero3
-- 
2.25.1

