Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A202641C3
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Jul 2025 21:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751611; cv=none; b=ZBEwwTV7ngf3iLwxccSxK8C+dPlI28+uWDdVUlz4q56Lx3AytxB0d9lQWNT3w2ofdl3tKCZVFsyuOSLmlwD5c/RQYlgsMAa5MrWCIegaJVzsrnWhzgcKt/k+P9tW/11MSWASecj+yWZGpCAo+z7GCObMjF8sbG2e2OLbA68vLp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751611; c=relaxed/simple;
	bh=5rMU69zl32GrAuVFDzOQs5fWjUfRXPaabv7nstRxqK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B6zp2EFuF1dLDVYczb5co1I/qrfWfZrbGlJOH/DYjWUT+pCB2MKKyZlodzqqs/x/jEFRLJpPOQmGvhy9tyPAxeq1YmQfMiK+flfK9f8jw6GBdVEIBi+4dDgn0bjFO+Zg7K8Y6q0AMkg0um1DRFHEEA608GtkixcmeHHCMabDg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=1kDYTZCn; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="1kDYTZCn"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=df4UGlSJHH3MRIWMNdqjwJSZcGeME7Nid8QsZBlv91Q=;
	b=1kDYTZCn5TE087KJuPw584m33VL7NvMbJoPB8aGtSWPMuxgXp7wt5EYGFugkQpICt7TN8hkBBl/zoCU9D+jfZ/J1Jq4RjTfVt+k9vGuEy1zwDYqJeRCB35HRuCutScBvBYu/UQPUGcTKm+sqyynkd4cHB5+KWVBljs3Y1K8HtBE=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:48 +0200
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad Carrier Board
Date: Sat,  5 Jul 2025 23:38:54 +0200
Message-Id: <20250705213900.3614963-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705213900.3614963-1-lukas.schmid@netcube.li>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetCube Systems Nagami Keypad Carrier is a custom board intended to
fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
and Status-LED all controllable over Ethernet with PoE support.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7919b5bf5..a2f16d064 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -610,6 +610,12 @@ properties:
           - const: netcube,nagami
           - const: allwinner,sun8i-t113s
 
+      - description: NetCube Systems Nagami Keypad Carrier Board
+        items:
+          - const: netcube,nagami-keypad-carrier
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5


