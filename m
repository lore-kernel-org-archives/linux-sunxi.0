Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A282D052
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777772; cv=none; b=uGkCeqrmFu5/9uV/vmcNFGT4JCiwbrafiBh1rAluE6RnFk40yyevKxziaPtsw7aQClBKI1mSxE+llj2g7/rOEqPm5sUeRV0hBDA8PPtGFWQDS9fblokgUTu8/oDAOU2iElFA0CUNhNapigLNl35KIbatILkUSvg0kVu76+WnwDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777772; c=relaxed/simple;
	bh=BzXXA/cI0W1sFyho2VjDgr9ILcR75btGyHtzelRuuB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rAxWJ/i86CJc1U02tZ59FtS5rlhZJA7znW10gIUt3Lfmrnh3cHf0NHQoOWgaDUPFrCoJK4YoxSrwyd9khWZiZllQNhcxwaLJeYsWkJLNqB9MI9zFMqjD3ZKr84w3WEAyg2gq1w4NkGKtHodgpI+RxsdrGZ5q8Cm/SoUXgCwWC90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=O7xWhQTY; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="O7xWhQTY"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=UWzy9f37TLLTSuTbfCAgfOB34y28JpT9kZ7G8h4yvw8=;
	b=O7xWhQTY+j6CDzuVj0bVlxJdGYjWrYYHy1bIpjot3z0OKBiZvA8+4A70qmAMbVmgiGWva+EQp5goWTKflZsZUgLvlfHkLZgC/VCDFQj//7euFFk5H/F5/dfCuGbSLSIs4twWsR2J8fGzUlqHHPTWavSkB5E8FTYBjj6f1vH0sOM=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Wed, 5 Feb 2025 17:48:06 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
Date: Wed,  5 Feb 2025 17:47:10 +0100
Message-Id: <20250205164716.2509650-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205164716.2509650-1-lukas.schmid@netcube.li>
References: <20250205164716.2509650-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT, or
Smart Home scenarios.

Website is still WIP, but the Links on it are active:
https://netcubesystems.at/

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..499ab972f9d2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1031,6 +1031,8 @@ patternProperties:
     description: Neofidelity Inc.
   "^neonode,.*":
     description: Neonode Inc.
+  "^netcube,.*":
+    description: NetCube Systems Austria
   "^netgear,.*":
     description: NETGEAR
   "^netlogic,.*":
-- 
2.39.5


