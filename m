Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7EC27EC76
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127160; cv=none; b=ePfs7rR+HKNlxQ/CN0SoF4ofUTeT/7N6LFW83jzgjNrJ5hl0LYWT56NIt9J6EPBnB1zXYa5+6NC/SleKm0IW9hn2gzxN1gsu+hSiKtYcCJ5+7BHxwBCmIC6986+jXWw9Mp6VCMULLJbFX/+TXvUZhQVEfOAISETUR0PYU6I+Ow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127160; c=relaxed/simple;
	bh=sPe0I+eLCQ0E6y5DzdJS/R/SLIP6E40N4CDeBE+qlrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBEAiWxX2IsXX8FTW92pp3bqhvCvMAbLkOtMTfY2p32YMLROOKRG87VsBf9gtB7Sco6KQkyIn31iroId0ha8wQKV3Qamzxo6gA1WFRTKAah53EvCMj6zHwyixMd9Ko18EbgCFC80qvdof1cH3T6clGyKEH3AUI6UY4dzq5kJt+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57618497;
	Tue,  4 Mar 2025 14:26:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E01D3F5A1;
	Tue,  4 Mar 2025 14:25:56 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/15] dt-bindings: arm: sunxi: Add new board names for A523 generation
Date: Tue,  4 Mar 2025 22:23:04 +0000
Message-ID: <20250304222309.29385-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304222309.29385-1-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new Allwinner A523 SoC family comes in different packages, though
they all share the same die, and so the devicetree bindings.

Add three board names that use a version from this SoC family:
- The Avaota A1: an Open Source hardware router board.
- The Radxa Cubie A5E: a typical development board
- The X96QPro+: a TV box

Add their compatible name to the list.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706f..80096819fda91 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -840,6 +840,11 @@ properties:
           - const: allwinner,r7-tv-dongle
           - const: allwinner,sun5i-a10s
 
+      - description: Radxa Cubie A5E
+        items:
+          - const: radxa,cubie-a5e
+          - const: allwinner,sun55i-a527
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
@@ -961,6 +966,11 @@ properties:
           - const: hechuang,x96-mate
           - const: allwinner,sun50i-h616
 
+      - description: X96Q Pro+
+        items:
+          - const: amediatech,x96q-pro-plus
+          - const: allwinner,sun55i-h728
+
       - description: Xunlong OrangePi
         items:
           - const: xunlong,orangepi
@@ -1076,4 +1086,9 @@ properties:
           - const: xunlong,orangepi-zero3
           - const: allwinner,sun50i-h618
 
+      - description: YuzukiHD Avaota A1
+        items:
+          - const: yuzukihd,avaota-a1
+          - const: allwinner,sun55i-t527
+
 additionalProperties: true
-- 
2.46.3

