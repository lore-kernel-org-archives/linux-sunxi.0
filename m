Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EE115D5C1
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713437391; cv=none; b=C0SMV+0053+P4yIAA/rgzlrwIb66hl7PZxh01WClkECYKDSBuczXZm6RcYSu2vfQx/muH28ytFJNHZ/JX97Sw/2ItFjHs1GA34erc+et2+5vvgghfiMEjA2LZwxZ1cP31H9CnGdLxUMBq4Ox6an+lTt30ZGJaYa57+jV26qX+t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713437391; c=relaxed/simple;
	bh=aKk/3adrh9fdKymzNhDRhVj3c5JjQZZpEp65KoE5v0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GngUSQDuXGVqslECUdXgoWJoGH3uzHS+oHqzu1ABWAXdJ559Chi2OiRdt8LRWW3SFkyOQlv1ymm6WOOG1CruFk20nn7aNDPDfIp3INbMz/7K0+CJnivkfkGJcI00kjJIxtv9daYbFUJpFS+3Ta4/h12xpOgSy99of3I7NiwfBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1566DA7;
	Thu, 18 Apr 2024 03:50:16 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C39D83F792;
	Thu, 18 Apr 2024 03:49:47 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: document Tanix TX1 name
Date: Thu, 18 Apr 2024 11:49:41 +0100
Message-Id: <20240418104942.1556914-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418104942.1556914-1-andre.przywara@arm.com>
References: <20240418104942.1556914-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tanix TX1 is a tiny TV box with the Allwinner H313 SoC, a lower bin
version of the Allwinner H616. It comes with no SD card slot or Ethernet
port.

Add the board/SoC compatible string pair to the list of known boards.
Since the H313 does not look different from a software point of view,
we keep the H616 compatible string.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 43491e7f8a5e6..f465f3a59c806 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -865,6 +865,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: Tanix TX1
+        items:
+          - const: oranth,tanix-tx1
+          - const: allwinner,sun50i-h616
+
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6
-- 
2.25.1

