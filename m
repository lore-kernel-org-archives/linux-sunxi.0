Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6525317715
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756471135; cv=none; b=jh8YK3q3Nxwk+oKzQxhumj1X8cu0e2AOGGBg2KTDi0pIEf5kv01XygfiXXixeBCwawNymc3cIz2VikZcNq1f7ltVs89Jc/V4S0Gyq1tqLM1E8kHIRJmBbPjOsV/po9aImVfkctSMq9c21wTP1NCv3PZlurMasD3kn+PFdnLA1LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756471135; c=relaxed/simple;
	bh=LiItecIz2CKXaIRb8e9S2YFmXeiRt9ltTALDdhpunqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OYe+x1jzaO13BBTVyWC5CSqIMrhLjAyqiGOYIHOf2xN1JgMYsboEuigXXeqSDhVaZZ0r+vksAQKUaGl4cpq3s4aK9p2Z+eq+2XotfFTyvjohgyAs964ovogAFjJr6UrQkFmplez95Bno8ELfSsgxIgU3EK3HZhrb8mnnYK6rlrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=QC7y87gP; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="QC7y87gP"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=YDfXJU8fIVQMbHdyhBrUiSya/JtiQ768dcd2UAeGU6M=;
	b=QC7y87gPK+RdaNy/EIiC55kRqeHrb5YfGCDGnJ0kKx2PluSIHrxKrzBEo1MweLnBthVOSI9q5BDlSjXOsz4Sc8RymGuXR0KInVfb1as6pk3ocQJuk9Aq0YvceeYQfvBwRCN5Vri1ZEy09W0kff59K0wx5H/Qgv7Du+OE06LHQxE=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 29 Aug 2025 14:38:26 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 1/5] dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier board bindings
Date: Fri, 29 Aug 2025 14:37:54 +0200
Message-Id: <20250829123800.1232645-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829123800.1232645-1-lukas.schmid@netcube.li>
References: <20250829123800.1232645-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetCube Systems Nagami is an System on Module base on the Allwinner
T113s SoC. It is intended to be used in low cost devices which require
simple layouts and low BOM cost.

The NetCube Systems Nagami Basic Carrier Board is a simple carrier for the
Nagami SoM. It is intended to serve as a simple reference design for a
custom implementation or just evaluating the module with other peripherals

The NetCube Systems Nagami Keypad Carrier is a custom board intended to
fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
and Status-LED all controllable over Ethernet with PoE support.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613..50f08d8d2 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -599,6 +599,14 @@ properties:
           - const: netcube,kumquat
           - const: allwinner,sun8i-v3s
 
+      - description: NetCube Systems Nagami SoM based boards
+        items:
+          - enum:
+              - netcube,nagami-basic-carrier
+              - netcube,nagami-keypad-carrier
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5


