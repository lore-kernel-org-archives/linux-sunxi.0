Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A5224F0;
	Mon, 25 Sep 2023 21:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955D5C433C7;
	Mon, 25 Sep 2023 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695677183;
	bh=1PB/pYP1liA58pkSr90IN5P1R7dQ0eEBwcs0MZq2wKI=;
	h=From:To:Cc:Subject:Date:From;
	b=aWOVKf74D/+9i6FAzCEu4Ko/aqpoIRb5K2HZCEc+9dbhXlMfAWCAxvkvWdcvCCUvt
	 okgUSr6sC1B9XgQ6HMREHhFNnNhxaZLdcWV2EtlMBswYnUMK1jjSGAev2l8hi5tW5q
	 ApUuxPb+2NSqs2Eg7Ky7yQG6NbDu4/Tnhb40QeBZxxkEhsq2dbibhctiqYgv6LmbX4
	 7mUqnZSOC/TgIR6TVollDXugCNm0fa1Qw2rkEf1UuEkv+xBpIAXG7dQLwWf7WH3lUe
	 f4oBOqFFBv7CYZBtjbNCPte72Nm0Wk/LE+Ri9aHyYL8I4LRB0O2Nb5DxhJIpkmfgSR
	 rIW2a/dVvX0Iw==
Received: (nullmailer pid 1974640 invoked by uid 1000);
	Mon, 25 Sep 2023 21:26:18 -0000
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Serge Semin <fancer.lancer@gmail.com>, Maxime Ripard <mripard@kernel.org>, Chris Morgan <macromorgan@hotmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] spi: dt-bindings: Make "additionalProperties: true" explicit
Date: Mon, 25 Sep 2023 16:26:00 -0500
Message-Id: <20230925212614.1974243-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it explicit that child nodes have additional properties and the
child node schema is not complete. The complete schemas are applied
separately based the compatible strings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml        | 2 ++
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
 Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml | 1 +
 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml         | 2 ++
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml      | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
index a6f34bdd1d3c..e1ab3f523ad6 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
@@ -46,6 +46,8 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+":
     type: object
+    additionalProperties: true
+
     properties:
       reg:
         items:
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 28b8ace63044..3b47b68b92cb 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -68,6 +68,8 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+":
     type: object
+    additionalProperties: true
+
     properties:
       reg:
         items:
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
index 9ae1611175f2..48e97e240265 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
@@ -50,6 +50,7 @@ properties:
 patternProperties:
   "@[0-9a-f]+$":
     type: object
+    additionalProperties: true
 
     properties:
       spi-rx-bus-width:
diff --git a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
index 339fb39529f3..ac1503de0478 100644
--- a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
+++ b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
@@ -47,6 +47,8 @@ properties:
 patternProperties:
   "^flash@[0-3]$":
     type: object
+    additionalProperties: true
+
     properties:
       reg:
         minimum: 0
diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index a47cb144b09f..6348a387a21c 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -160,6 +160,8 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       reg:
         minimum: 0
-- 
2.40.1

