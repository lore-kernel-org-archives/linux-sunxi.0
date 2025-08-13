Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D9B2FC887
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 23:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755129391; cv=none; b=Q6VcUjAO00vWZ2FncF4/dYhwlavGWM8wHC4xYAfuPDvNlYXs1fx604yMpLGlbswUJXHdvAShLZOHAyeh26cfH1jyBNmtD3pXF6z8sZrYnNHymJkWHe3Rcvx7ls8RCGVhwU20P0EU2sdOoteYNmiZPywp7+YpK/fHtuLPX7ED3w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755129391; c=relaxed/simple;
	bh=czgDoxE8MWp+D4Qgka0WRrJB8A0y0+f8TdCiAmRGW8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDvRXstvPF/Zn1q3wpOpDpU9FmkMnb6TWn9swNsD5V+lT0bQLC2NuO9+ot5uSTzIfurfAHwd6WNYSYD3xCRXTx+O10LjJmqh2c89PGuw9YMt9cYKJ0h1vhp1+u1tPgJ5u3CJ9crRhbAIwDMUipTR5gtX6hRhWaZjML1J6xQlZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82E8616A3;
	Wed, 13 Aug 2025 16:56:21 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 142393F738;
	Wed, 13 Aug 2025 16:56:27 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Date: Thu, 14 Aug 2025 00:53:28 +0100
Message-ID: <20250813235330.24263-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250813235330.24263-1-andre.przywara@arm.com>
References: <20250813235330.24263-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
Among a large number of both DCDC and LDO regulators it features the usual
ADC/IRQ/power key parts.
Like other recent PMICs, it lacks the DC/DC converter PWM frequency control
register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).

Add the new compatible string, and add that to the list of PMICs without
the PWM frequency property.
Also add more input supply properties, for the two more DCDC convertes,
and also for the split ALDO supply.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/mfd/x-powers,axp152.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df16..35f01a6cc440a 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -83,6 +83,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +103,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -180,6 +182,14 @@ properties:
     description: >
       DCDC7 power supply node, if present.
 
+  vin8-supply:
+    description: >
+      DCDC7 power supply node, if present.
+
+  vin9-supply:
+    description: >
+      DCDC7 power supply node, if present.
+
   vina-supply:
     description: >
       DCDCA power supply node, if present.
@@ -220,6 +230,14 @@ properties:
     description: >
       ALDO* power supply node, if present.
 
+  aldo156in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
+  aldo234in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
   bldoin-supply:
     description: >
       BLDO* power supply node, if present.
-- 
2.46.3

