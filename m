Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44851B598
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707041473; cv=none; b=aSnjrFsRgzywkVczICfi43Ec3g0u1+bD7RiTp/4VVJRSXG/pPKstRVmZ8QVy3rA31sIgVU7aMLoaTptK8DnKcNVFpBtadNyjFUIVFnPMt+iwKmXpzwBzbWoGKb6/fLBOXsWa/lHfYaNB8l3ntTCuYxrKosG6sSX4QqHMXhQ4jz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707041473; c=relaxed/simple;
	bh=R6ocsFXVhG8At7szUf+PZC5kGJa3p2yevGq8BPKr3+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QzYpymIgzw79g6l17kwuBcmipUhWeoyr6aQ+EciaIDo/YhT19KAoudUS1ASUXHk6K6iAz6ZQXwSPe0XLGLoAnnnntX1QW0p9LS2ayIUzfY0HnOsdcfvfh0wxXV1XM+2mMqAsaYhUQ81eYaQIgAKIv6821aipZ+jsYCfFpuWSkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45BA1DA7;
	Sun,  4 Feb 2024 02:11:52 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CA023F762;
	Sun,  4 Feb 2024 02:11:07 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: document BananaPi M4 Berry board name
Date: Sun,  4 Feb 2024 11:10:53 +0100
Message-Id: <20240204101054.152012-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240204101054.152012-1-andre.przywara@arm.com>
References: <20240204101054.152012-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Bananapi M4 Berry is a development board with the Allwinner H618 SoC.

Add the board/SoC compatible string pair to the list of known boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index dab7a248c88d..aa87c83124e2 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -136,6 +136,11 @@ properties:
           - const: sinovoip,bpi-m3
           - const: allwinner,sun8i-a83t
 
+      - description: BananaPi M4 Berry
+        items:
+          - const: sinovoip,bananapi-m4-berry
+          - const: allwinner,sun50i-h618
+
       - description: BananaPi M64
         items:
           - const: sinovoip,bananapi-m64
-- 
2.25.1

