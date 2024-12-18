Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD351F2C46
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Dec 2024 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734527407; cv=none; b=arc1qQH4nlyvCbPtWDcIzpS/IowJF5GgopueUBvNM4pYPZPLXtUVxonI+fvkxD0M5ILVzlKPb5ycWjgSiZQLREC14AEFI+XvroXCG/kZKVyxQTwWZY7CBGYYy0NCWtESSEYQzQH7fhsVHHpDZlOI4gkR/fvGfwLa+sYuuppSPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734527407; c=relaxed/simple;
	bh=dbRntCcysjyWQKNhElLiLOYa7JbXJ3OynAD/dcTgifo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChnmjNjCC1zx7JS6wXf4mfg8Xwtt3M6LbMyH+1egiBlE6izbu6xwoqdEHCVbQ4GZ1xMTGvWUe9R6JgrRgX2ZtRhDs0ek4uG6jeXozwZOexOoe0zirD2h2yiUMJHiclmna4yEuHpwzaPNxZwT87fqv2K6mvOeixHsQ3S5XMmxXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=RM2Wdl85; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="RM2Wdl85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1734526898;
	bh=dbRntCcysjyWQKNhElLiLOYa7JbXJ3OynAD/dcTgifo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RM2Wdl85WA2w8Ld1a9Y2a0V1odPL/fHAuVUo3YWRWNb0anN1phJ/eDGSto30l9+xU
	 HlPIRXFxMLhlO+TCu9u3fzd/0rVST9Vygt/T+X1qW6DMEBT/whcAtk+xV96iHJwMMG
	 Jnh6mqRr5IvXmcXeM4/a2FkqWQGkokcfLUX6cNE6zaEtAtu0mARUJhY+WbyglOzKRo
	 FOUTKJfIn1gp2ursceY6HRU27lsLt0caJQKPyGdyzgUFIMVRL8IhqfJ3YxH+vdGfCj
	 rj29yEzYY+63tdeOg62kenmJFTloD4d/enOIGiLnSrbYigHylI34BDd/FP2TMHbtXR
	 pd08WEbKodcfA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Wed, 18 Dec 2024 09:01:18 -0400
Subject: [PATCH v2 1/2] dt-bindings: sram: sunxi-sram: Add A100 compatible
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-a100-syscon-v2-1-dae60b9ce192@epochal.quest>
References: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
In-Reply-To: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The Allwinner A100 has a system configuration block similar to that of
the A64 and H6. Add a compatible for it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index d9322704f3588e036280d08deaf59972f1dfeb7f..a7236f7db4ec34d44c4e2268f76281ef8ed83189 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -47,7 +47,9 @@ properties:
           - const: allwinner,sun8i-v3s-system-control
           - const: allwinner,sun8i-h3-system-control
       - items:
-          - const: allwinner,sun50i-h6-system-control
+          - enum:
+              - allwinner,sun50i-a100-system-control
+              - allwinner,sun50i-h6-system-control
           - const: allwinner,sun50i-a64-system-control
 
   reg:

-- 
2.47.1

