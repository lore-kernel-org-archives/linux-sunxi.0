Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A771DEFF4
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jan 2025 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184493; cv=none; b=Wzt6Ui3oPzCzg+QyARcG2dudpNphq2kNrBKbQAD+7qgPWDKKq4JnpsJvHXqWaipfw0C5yFJkiAQJLCOkDF8bB+DhpOdRT4LNL+1ukXTNpUPEYhROoijwhH17Qci28oRNOut1NLMgjXXoV5bxT+LJTSh31k4hGU+WRMcJDqy5h3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184493; c=relaxed/simple;
	bh=eWI2w4kZIKItWJFqtABsMZBReAEf/IfcxbXkswKKkBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jc/f3AbCgurJdRTRmHU3ATiZLMwE/+C4Esjg950mqOCT6K7vgXnpsTgjDyEb6zfN+y2rOA+gYI48dq7h6tLfZjZgFowMe3Ua5JCNOVo1pCsEHc7uEn81vKtjBIJMJfavokkwkDBC4hkf/V06a+qrvWFr/PJoOZUnQJ/j9H/2ctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=KuBX36hb; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="KuBX36hb"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=g+7UfoPF3qmmcXZAVXeXLOUoflzmC+w8EwZzm4k7Dco=;
	b=KuBX36hbcKX67F2+1fpHaWbr1L6mI8Gw5uko/9fsVfrN5m4trjbzipktvcgOAqYX6pd6WhDzAwwO7QTPnkjNtgnQ3nNoqdv7KLUw12TNMU1m7DvcRkjzNC8K6Kw6dthjJ6oczSQtGbS4JPZIiS4QaOWy+trki7XoxtyVzSyppcc=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Mon, 6 Jan 2025 18:28:10 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
Date: Mon,  6 Jan 2025 17:24:01 +0000
Message-Id: <20250106172405.3897-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106172405.3897-1-lukas.schmid@netcube.li>
References: <20250106172405.3897-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetCube Systems Kumquat is an Embedded Controller based
on the Allwinner V3s SoC. It is intended for Smart Home or
Industrial automation without the need for a traditional PLC

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706..f536cdd2c1a6 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -589,6 +589,11 @@ properties:
           - const: emlid,neutis-n5h3
           - const: allwinner,sun8i-h3
 
+      - description: NetCube Systems Kumquat
+        items:
+          - const: netcube,kumquat
+          - const: allwinner,sun8i-v3s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.47.1


