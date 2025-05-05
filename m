Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09381A255C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 May 2025 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463685; cv=none; b=HaYlNy0Z3u3yZbkq+9y4HtrXTDDl2Bw4YdVWf0U0BL1161l499dAwi7VkGq9AKaUxwCyKU64UZ+Hch+PExajMmStXRTeAEgOZMSyHlCXQ9iPixjQWk6whLcRUWjFMIqn3Pml7YEtB8Q4+KJlTg0YlYcTioNf/14d5UewFCBxCqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463685; c=relaxed/simple;
	bh=GYiUqu9W+RNyJTt9zqndg5EmsRnLvNotMFXCCJHlIJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ot318RQxtvbwTxBBGhVIJft5c+fx2/VY2tX1DOMwDhw3pP23K3cTPCUDdkjdcExEwD2Hrur/eIWFVH76Y21+nyGkcccmxaaP98cOV0bv6Jh9F/HZlvQTewqyX9JLmWVAv8h8l39o/xhUL2dSfvMUstT8N+ISaOBGKnsZNzFdTOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF0AF1063;
	Mon,  5 May 2025 09:47:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90B0E3F673;
	Mon,  5 May 2025 09:48:01 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add Liontron H-A133L board name
Date: Mon,  5 May 2025 17:47:28 +0100
Message-ID: <20250505164729.18175-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250505164729.18175-1-andre.przywara@arm.com>
References: <20250505164729.18175-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Liontron H-A133L is an industrial development board using the
Allwinner A133 SoC.

Add its compatible name to the list of valid board names.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index cb354c2c61b26..7807ea6132589 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -492,6 +492,11 @@ properties:
           - const: lamobo,lamobo-r1
           - const: allwinner,sun7i-a20
 
+      - description: Liontron H-A133L
+        items:
+          - const: liontron,h-a133l
+          - const: allwinner,sun50i-a100
+
       - description: HAOYU Electronics Marsboard A10
         items:
           - const: haoyu,a10-marsboard
-- 
2.46.3

