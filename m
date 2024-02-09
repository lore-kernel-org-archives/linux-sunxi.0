Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3245F28DC1
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707478830; cv=none; b=tWhZQtFHv5rMdogwuqtzcwZFviWwSyYeWBeCH1p2WVi5LYOp8m+X/nufRE8lT3+k43K/DltROEurHhXLpfaCjYj0kc/qyRrL1UCEtQhSN+QmhMLCR3HftiPgNmwtoQRxmGtANv4SAIL1/Cu7pOW6KFGI9L7Pf1CK3ZoEeDdpAxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707478830; c=relaxed/simple;
	bh=MKkksoSz++8AyGEWBZGmZg/byQan5McQu7YXzJzcMQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=spGRoQHlDw1R80lI/G1xzHCOh3zVfSHgbSODMGoeihDnS3TbCmWr5c6LQo+sMe/34bByLGW4O62h8/do21LkiwBFMxxQLCz70w7vgNvR9Bk9qnIw70owToqqTSbfClIUmKCkw2rtggeHhd/z5ZkOKhOGEegd5z9AntrqI4Eyczs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D27BC1570;
	Fri,  9 Feb 2024 03:41:09 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B9163F762;
	Fri,  9 Feb 2024 03:40:26 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: document Remix Mini PC name
Date: Fri,  9 Feb 2024 11:40:17 +0000
Message-Id: <20240209114018.3580370-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240209114018.3580370-1-andre.przywara@arm.com>
References: <20240209114018.3580370-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Jide Remix Mini PC is a mini computer that ships with the Remix OS
Android based system. The SoC is an Allwinner H64, which is very close,
if not identical to the Allwinner A64.

Add the board/SoC compatible string pair to the list of known boards.
There are some drivers that look explicitly for the A64 compatible name,
so retain this name to increase compatibility.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index a9d8e85565b89..dab7a248c88da 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -815,6 +815,12 @@ properties:
           - const: allwinner,r7-tv-dongle
           - const: allwinner,sun5i-a10s
 
+      - description: Remix Mini PC
+        items:
+          - const: jide,remix-mini-pc
+          - const: allwinner,sun50i-h64
+          - const: allwinner,sun50i-a64
+
       - description: RerVision H3-DVK
         items:
           - const: rervision,h3-dvk
-- 
2.25.1

