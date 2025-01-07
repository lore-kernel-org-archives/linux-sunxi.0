Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB81F63D3
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736277777; cv=none; b=gcglMUmvBDvTlu1A/E+rOos2z1HGtivM8tG6qkamrQhsaCwkifLOujtu/swegiV38B5Y3yTfRAjZFoUWUdg/oXy21TjcLNN8QVGIbckJcX3rdqI6+OmtHvRTik2CNq6Cv+5fTL5KK1HU6VSMHPomdwbhW6yzBaYSh1kdyq2bqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736277777; c=relaxed/simple;
	bh=eWI2w4kZIKItWJFqtABsMZBReAEf/IfcxbXkswKKkBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdI+7yAvA+QgPjfYmQ0P2PBcB+23r36D7aJY2qwkUs8R0u4HAOeV9UEMhnl7JwxWY1VNSKXs8xDVvdwf9yrNW/Ealt5vv6fU/R3KbEYqrgT8cJePaG2cm9JilR4P8pbdHD1zpb1Vc0W4Jlv4Xs4KFL3NAXPiH26Oq52/skePAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=GSGSnNIB; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="GSGSnNIB"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=g+7UfoPF3qmmcXZAVXeXLOUoflzmC+w8EwZzm4k7Dco=;
	b=GSGSnNIBtCGwMqx9vRCuvnOY+SuMK4j0TTAzFaRGir2hI29tOuwKSnHNce1RVJeNQhGCuHwfFBYpAUk2B3NxM/QM1elj+JjGygzzf/OjHMVm3anIlXjwTKofK/2Kny1u00IW1y60ZGmeV5jfK3tPog3py/LvnFw4HJuFg4OXbVw=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Tue, 7 Jan 2025 20:22:15 +0100
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
Subject: [PATCH v6 2/4] dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
Date: Tue,  7 Jan 2025 19:18:40 +0000
Message-Id: <20250107191844.4151-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107191844.4151-1-lukas.schmid@netcube.li>
References: <20250107191844.4151-1-lukas.schmid@netcube.li>
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


