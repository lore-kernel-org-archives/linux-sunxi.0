Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A661A0B03
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Jun 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719271379; cv=none; b=dqCW4Z1n56xe5JvspsWVIacz3+WxjFKq1bU6PkY/AeIROCPN3wVs0+VKRBOmY8UfwOKtLvxE4eCalKaTys1J6GgHSi6HCh2GbSLB4xjn5N9w5HnGzOQafwJR5+5nlG20ajrT3NE5a+pdDgj0/W2dE/wyp4EaqH9D6ZdnxVijbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719271379; c=relaxed/simple;
	bh=ExKTPGb5Icxvjo9hD64VGIaiHKoy7FfLb11+DAbuQcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ArbAiIZS7fJMR0O2kn7GHVAAHYKsCuB/3DmFLTpXcTkCk1vcuTNK86kZ6DXPLOd9Glt7sBVklboE/OqT0kUUo7Igbw9VZY1rCzyA1PdycpVJRzHwB/MPtSPe6zvLSHM+d4IVtCovv1TvE9AnNoZ669VwRNcI6QsBBASQtTQGUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952A9DA7;
	Mon, 24 Jun 2024 16:23:22 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3F6B3F766;
	Mon, 24 Jun 2024 16:22:55 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: crypto: sun8i-ce: Add compatible for H616
Date: Tue, 25 Jun 2024 00:21:07 +0100
Message-Id: <20240624232110.9817-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240624232110.9817-1-andre.przywara@arm.com>
References: <20240624232110.9817-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 has a crypto engine very similar to the one in the
H6, although all addresses in the DMA descriptors are shifted by 2 bits,
to accommodate for the larger physical address space. That makes it
incompatible to the H6 variant, and thus requires a new compatible
string. Clock wise it relies on the internal oscillator for the TRNG,
so needs all four possible clocks specified.

Add the compatible string to the list of recognised names, and add the
H616 to list of devices requiring all four clocks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/crypto/allwinner,sun8i-ce.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
index 4287678aa79f4..da47b601c165e 100644
--- a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun50i-a64-crypto
       - allwinner,sun50i-h5-crypto
       - allwinner,sun50i-h6-crypto
+      - allwinner,sun50i-h616-crypto
 
   reg:
     maxItems: 1
@@ -49,6 +50,7 @@ if:
     compatible:
       enum:
         - allwinner,sun20i-d1-crypto
+        - allwinner,sun50i-h616-crypto
 then:
   properties:
     clocks:
-- 
2.39.4

