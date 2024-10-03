Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6241552EE
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954106; cv=none; b=cMnerJGgYUKFKXYHymYu2yytpyIHXWqyBkGz0+QnC136rSls+jItUmyolXla3rtaBMgw38KtEJlmk9igUJ4aFzlLD2XCgVjdubs47fmb0kIkHuULhdNFSZVLu9ti692LL7klMKdYdWhu4ahZRn+R0bzyKBB5cP/Y92OXjl51boA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954106; c=relaxed/simple;
	bh=3v6BWUEr5bFFLRShtA8lbJG5VpVmcDRdGnW1qFqpO7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DhTjyR9BnALS4YQSF3D3UTt3c6AzI6rFVdlfGgiAbrcELHJ+jYJ0E9JWveefixwQSFAsnUvEmnOXVg7LQ9uOzwmMH5XQ5CWb3apUvk8/G2gpLM8C/4DDyNmljuJKfSXMMFGf05FxyaOlhxFyZo0aeB3MOej/ER3fVkNPqK9MPXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71A84497;
	Thu,  3 Oct 2024 04:15:33 -0700 (PDT)
Received: from e110479.arm.com (unknown [10.57.55.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF03F3F640;
	Thu,  3 Oct 2024 04:15:00 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP323
Date: Thu,  3 Oct 2024 12:14:40 +0100
Message-Id: <20241003111444.543964-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111444.543964-1-andre.przywara@arm.com>
References: <20241003111444.543964-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP323 is a PMIC used on some newer Allwinner devices.
It is almost the same as the AXP313, but supports dual-phasing the first
two DC/DC converters. A pure AXP313 driver wouldn't know about this, and
might turn the linked DCDC2 regulator off, as it does not seem to be
used. This makes the AXP323 incompatible to the AXP313a.

Add the new compatible string, and treat it like the AXP313a.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 14ab367fc887..3f7661bdd202 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -71,6 +71,7 @@ allOf:
                 - x-powers,axp15060
                 - x-powers,axp305
                 - x-powers,axp313a
+                - x-powers,axp323
 
     then:
       required:
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
 
@@ -100,6 +102,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
           - x-powers,axp806
-- 
2.25.1

