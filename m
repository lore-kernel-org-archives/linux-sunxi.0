Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2448653A0E
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 374AD2F4;
	Thu, 21 Dec 2023 06:07:09 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD8713F64C;
	Thu, 21 Dec 2023 06:06:22 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] dt-bindings: arm: sunxi: sort alphabetically
Date: Thu, 21 Dec 2023 14:06:14 +0000
Message-Id: <20231221140614.639697-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sunxi.yaml file, holding all known board compatible names for
devices with Allwinner SoCs, is apparently sorted alphabetically, by the
"description" entry. However there are a few outliers.

Re-order the entries to get a strict alphabetical ordering, so that:
$ grep description: sunxi.yaml | sort -fc
returns empty-handed. There is no change otherwise.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Based on sunxi/dt-for-6.8

 .../devicetree/bindings/arm/sunxi.yaml        | 172 +++++++++---------
 1 file changed, 86 insertions(+), 86 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index a9d8e85565b89..0bf24f4882240 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -51,16 +51,16 @@ properties:
           - const: allwinner,parrot
           - const: allwinner,sun8i-a33
 
-      - description: Anbernic RG-Nano
-        items:
-          - const: anbernic,rg-nano
-          - const: allwinner,sun8i-v3s
-
       - description: Amarula A64 Relic
         items:
           - const: amarula,a64-relic
           - const: allwinner,sun50i-a64
 
+      - description: Anbernic RG-Nano
+        items:
+          - const: anbernic,rg-nano
+          - const: allwinner,sun8i-v3s
+
       - description: Auxtek T003 A10s HDMI TV Stick
         items:
           - const: allwinner,auxtek-t003
@@ -96,6 +96,11 @@ properties:
           - const: sinovoip,bpi-m2-berry
           - const: allwinner,sun8i-r40
 
+      - description: BananaPi M2 Magic
+        items:
+          - const: sinovoip,bananapi-m2m
+          - const: allwinner,sun8i-a33
+
       - description: BananaPi M2 Plus
         items:
           - const: sinovoip,bpi-m2-plus
@@ -116,11 +121,6 @@ properties:
           - const: bananapi,bpi-m2-plus-v1.2
           - const: allwinner,sun50i-h5
 
-      - description: BananaPi M2 Magic
-        items:
-          - const: sinovoip,bananapi-m2m
-          - const: allwinner,sun8i-a33
-
       - description: BananaPi M2 Ultra
         items:
           - const: sinovoip,bpi-m2-ultra
@@ -230,6 +230,18 @@ properties:
           - const: sochip,s3
           - const: allwinner,sun8i-v3
 
+      - description: Emlid Neutis N5 Developer Board
+        items:
+          - const: emlid,neutis-n5-devboard
+          - const: emlid,neutis-n5
+          - const: allwinner,sun50i-h5
+
+      - description: Emlid Neutis N5H3 Developer Board
+        items:
+          - const: emlid,neutis-n5h3-devboard
+          - const: emlid,neutis-n5h3
+          - const: allwinner,sun8i-h3
+
       - description: Empire Electronix D709 Tablet
         items:
           - const: empire-electronix,d709
@@ -306,16 +318,26 @@ properties:
           - const: gemei,g9
           - const: allwinner,sun4i-a10
 
-      - description: Hyundai A7HD
+      - description: HAOYU Electronics Marsboard A10
         items:
-          - const: hyundai,a7hd
+          - const: haoyu,a10-marsboard
           - const: allwinner,sun4i-a10
 
+      - description: HAOYU Electronics Marsboard A20
+        items:
+          - const: haoyu,a20-marsboard
+          - const: allwinner,sun7i-a20
+
       - description: HSG H702
         items:
           - const: hsg,h702
           - const: allwinner,sun5i-a13
 
+      - description: Hyundai A7HD
+        items:
+          - const: hyundai,a7hd
+          - const: allwinner,sun4i-a10
+
       - description: I12 TV Box
         items:
           - const: allwinner,i12-tvbox
@@ -343,11 +365,6 @@ properties:
           - const: primux,inet86dz
           - const: allwinner,sun8i-a23
 
-      - description: iNet-9F Rev 03
-        items:
-          - const: inet-tek,inet9f-rev03
-          - const: allwinner,sun4i-a10
-
       - description: iNet-97F Rev 02
         items:
           - const: primux,inet97fv2
@@ -358,6 +375,11 @@ properties:
           - const: primux,inet98v-rev2
           - const: allwinner,sun5i-a13
 
+      - description: iNet-9F Rev 03
+        items:
+          - const: inet-tek,inet9f-rev03
+          - const: allwinner,sun4i-a10
+
       - description: iNet D978 Rev 02 Tablet
         items:
           - const: primux,inet-d978-rev2
@@ -472,15 +494,10 @@ properties:
           - const: lamobo,lamobo-r1
           - const: allwinner,sun7i-a20
 
-      - description: HAOYU Electronics Marsboard A10
-        items:
-          - const: haoyu,a10-marsboard
-          - const: allwinner,sun4i-a10
-
-      - description: HAOYU Electronics Marsboard A20
+      - description: MangoPi MQ-R board
         items:
-          - const: haoyu,a20-marsboard
-          - const: allwinner,sun7i-a20
+          - const: widora,mangopi-mq-r-t113
+          - const: allwinner,sun8i-t113s
 
       - description: MapleBoard MP130
         items:
@@ -557,18 +574,6 @@ properties:
           - const: msi,primo81
           - const: allwinner,sun6i-a31s
 
-      - description: Emlid Neutis N5 Developer Board
-        items:
-          - const: emlid,neutis-n5-devboard
-          - const: emlid,neutis-n5
-          - const: allwinner,sun50i-h5
-
-      - description: Emlid Neutis N5H3 Developer Board
-        items:
-          - const: emlid,neutis-n5h3-devboard
-          - const: emlid,neutis-n5h3
-          - const: allwinner,sun8i-h3
-
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
@@ -638,11 +643,6 @@ properties:
           - const: olimex,a20-olinuxino-lime
           - const: allwinner,sun7i-a20
 
-      - description: Olimex A20-OlinuXino LIME (with eMMC)
-        items:
-          - const: olimex,a20-olinuxino-lime-emmc
-          - const: allwinner,sun7i-a20
-
       - description: Olimex A20-OlinuXino LIME2
         items:
           - const: olimex,a20-olinuxino-lime2
@@ -653,6 +653,11 @@ properties:
           - const: olimex,a20-olinuxino-lime2-emmc
           - const: allwinner,sun7i-a20
 
+      - description: Olimex A20-OlinuXino LIME (with eMMC)
+        items:
+          - const: olimex,a20-olinuxino-lime-emmc
+          - const: allwinner,sun7i-a20
+
       - description: Olimex A20-OlinuXino Micro
         items:
           - const: olimex,a20-olinuxino-micro
@@ -703,6 +708,17 @@ properties:
           - const: pine64,pine64-plus
           - const: allwinner,sun50i-a64
 
+      - description: Pine64 LTS
+        items:
+          - const: pine64,pine64-lts
+          - const: allwinner,sun50i-r18
+          - const: allwinner,sun50i-a64
+
+      - description: Pine64 Pinebook
+        items:
+          - const: pine64,pinebook
+          - const: allwinner,sun50i-a64
+
       - description: Pine64 PineCube
         items:
           - const: pine64,pinecube
@@ -719,20 +735,9 @@ properties:
           - const: pine64,pine-h64-model-b
           - const: allwinner,sun50i-h6
 
-      - description: Pine64 LTS
-        items:
-          - const: pine64,pine64-lts
-          - const: allwinner,sun50i-r18
-          - const: allwinner,sun50i-a64
-
-      - description: Pine64 Pinebook
-        items:
-          - const: pine64,pinebook
-          - const: allwinner,sun50i-a64
-
-      - description: Pine64 PinePhone Developer Batch (1.0)
+      - description: Pine64 PinePhone (1.2)
         items:
-          - const: pine64,pinephone-1.0
+          - const: pine64,pinephone-1.2
           - const: pine64,pinephone
           - const: allwinner,sun50i-a64
 
@@ -742,9 +747,9 @@ properties:
           - const: pine64,pinephone
           - const: allwinner,sun50i-a64
 
-      - description: Pine64 PinePhone (1.2)
+      - description: Pine64 PinePhone Developer Batch (1.0)
         items:
-          - const: pine64,pinephone-1.2
+          - const: pine64,pinephone-1.0
           - const: pine64,pinephone
           - const: allwinner,sun50i-a64
 
@@ -835,6 +840,12 @@ properties:
           - const: sinlinx,sina33
           - const: allwinner,sun8i-a33
 
+      - description: SL631 Action Camera with IMX179
+        items:
+          - const: allwinner,sl631-imx179
+          - const: allwinner,sl631
+          - const: allwinner,sun8i-v3
+
       - description: SourceParts PopStick v1.1
         items:
           - const: sourceparts,popstick-v1.1
@@ -842,12 +853,6 @@ properties:
           - const: allwinner,suniv-f1c200s
           - const: allwinner,suniv-f1c100s
 
-      - description: SL631 Action Camera with IMX179
-        items:
-          - const: allwinner,sl631-imx179
-          - const: allwinner,sl631
-          - const: allwinner,sun8i-v3
-
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6
@@ -883,11 +888,6 @@ properties:
           - const: wexler,tab7200
           - const: allwinner,sun7i-a20
 
-      - description: MangoPi MQ-R board
-        items:
-          - const: widora,mangopi-mq-r-t113
-          - const: allwinner,sun8i-t113s
-
       - description: WITS A31 Colombus Evaluation Board
         items:
           - const: wits,colombus
@@ -903,11 +903,6 @@ properties:
           - const: wobo,a10s-wobo-i5
           - const: allwinner,sun5i-a10s
 
-      - description: Yones TopTech BS1078 v2 Tablet
-        items:
-          - const: yones-toptech,bs1078-v2
-          - const: allwinner,sun6i-a31s
-
       - description: X96 Mate TV box
         items:
           - const: hechuang,x96-mate
@@ -998,6 +993,21 @@ properties:
           - const: xunlong,orangepi-zero
           - const: allwinner,sun8i-h2-plus
 
+      - description: Xunlong OrangePi Zero 2
+        items:
+          - const: xunlong,orangepi-zero2
+          - const: allwinner,sun50i-h616
+
+      - description: Xunlong OrangePi Zero 2W
+        items:
+          - const: xunlong,orangepi-zero2w
+          - const: allwinner,sun50i-h618
+
+      - description: Xunlong OrangePi Zero 3
+        items:
+          - const: xunlong,orangepi-zero3
+          - const: allwinner,sun50i-h618
+
       - description: Xunlong OrangePi Zero Plus
         items:
           - const: xunlong,orangepi-zero-plus
@@ -1013,19 +1023,9 @@ properties:
           - const: xunlong,orangepi-zero-plus2-h3
           - const: allwinner,sun8i-h3
 
-      - description: Xunlong OrangePi Zero 2
-        items:
-          - const: xunlong,orangepi-zero2
-          - const: allwinner,sun50i-h616
-
-      - description: Xunlong OrangePi Zero 2W
-        items:
-          - const: xunlong,orangepi-zero2w
-          - const: allwinner,sun50i-h618
-
-      - description: Xunlong OrangePi Zero 3
+      - description: Yones TopTech BS1078 v2 Tablet
         items:
-          - const: xunlong,orangepi-zero3
-          - const: allwinner,sun50i-h618
+          - const: yones-toptech,bs1078-v2
+          - const: allwinner,sun6i-a31s
 
 additionalProperties: true

base-commit: a4aebe936554dac6a91e5d091179c934f8325708
prerequisite-patch-id: b72637774a9de3328cc561ae4bb3137bba25fafd
prerequisite-patch-id: 1a3327044ae61af705ffd79028687f3f6629edf4
-- 
2.25.1

