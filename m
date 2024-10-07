Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD633FC2
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Oct 2024 00:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728260094; cv=none; b=qHKp8e/N8oi5CtoHIxsTuY0SwAbYhdJMpSFCXCsV6eZZzBpYM7phyzqKNL323oZRs06W4gIhZKvm5t6rx4TOhmA+4tpFzdFa5J7IFXKC19jmzkDLjA38evTAaiLc7vEglh3+fV6Y+a3QzkpIZXBVbW9oXaE4sc7ekE2p/aEToBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728260094; c=relaxed/simple;
	bh=F3MvYsqwn0fo9JQlrrxZFS9dBzp6tOLz4f0HKJr7jCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXu272NBpTvXeCxmDIK4xNL43mAUrj0/z3A/ANlmtadspZ796o1lhTr0lpCUnQa3txnEj2dT9pjbUdLr73YXXDsrq7syXPjzaJyWKSF+Ypte5Frq95MLpFO8nRokw23myzXp7Ps03Ozm4vKnKtGDlSN7vvHWW+gdv5iF8EBwz+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 303081007;
	Sun,  6 Oct 2024 17:15:22 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECDA23F640;
	Sun,  6 Oct 2024 17:14:50 -0700 (PDT)
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
Subject: [PATCH v2 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP323
Date: Mon,  7 Oct 2024 01:14:04 +0100
Message-ID: <20241007001408.27249-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007001408.27249-1-andre.przywara@arm.com>
References: <20241007001408.27249-1-andre.przywara@arm.com>
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 14ab367fc8871..3f7661bdd2020 100644
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
2.46.2

