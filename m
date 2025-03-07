Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2EB197A67
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Mar 2025 00:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309069; cv=none; b=C9Iph6g6gZeMsVrijeaWfk3qE42sLAgMoiuIUT8NegIuKgSrQQ0xHiUZzEabff261rSF1rT5PuBiYuQzz1aQektjKi/hUGf0RBRUV4fD9rKEnjCTZNopRBGGCRlCLqKw9vH77BxwTe84Ph50hG9c1AZ/EQhKYsbBe5kb28XqE88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309069; c=relaxed/simple;
	bh=Nrub3qkRA+TgomjJTI2MZjvgOCSj3Qk4NBzAijrfWTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3sIeqCLRz7zNDIfHK1TI7+WghVzo3cZqSjbeFeVHNaZdgmvGvkx8KlLH5JwL/8ziSNVRovIktiHgKeDNAvBvfXodlJccmOVGbOOmFgK6ZZHycAwzdXpPKmhGy7/x2c3A2yZ26lvIXc1DPEACvHRwmzknd4ffbVxl9IeehHztOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07C4D1BC0;
	Thu,  6 Mar 2025 16:58:01 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CADB33F5A1;
	Thu,  6 Mar 2025 16:57:46 -0800 (PST)
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
Subject: [PATCH v3 14/15] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
Date: Fri,  7 Mar 2025 00:57:11 +0000
Message-ID: <20250307005712.16828-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chameleon is an Open Source hardware board designed by YuzkuiHD,
using the Allwinner H618 SoC: https://github.com/YuzukiHD/YuzukiChameleon

Add its compatible name to the list of valid board name.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 80096819fda91..cce31492b0f11 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1091,4 +1091,9 @@ properties:
           - const: yuzukihd,avaota-a1
           - const: allwinner,sun55i-t527
 
+      - description: YuzukiHD Chameleon
+        items:
+          - const: yuzukihd,chameleon
+          - const: allwinner,sun50i-h618
+
 additionalProperties: true
-- 
2.46.3

