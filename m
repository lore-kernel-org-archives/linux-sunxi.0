Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2D1CB9E2
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Dec 2024 04:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733114992; cv=none; b=qcthbK/DjuatdMPuiBFNRsP72TUQ6piqmnAZnxxXL/KE2E5zuxVwa18O82013quMtrgsDFrFgEwmwf1X3PGg/XguDd3Kgmd2XR/DzxfYybjZpiGwopPzq4QPXM0QZOdQXYzoqlLSvYosSFtZPp2lVKNfzNCteZeGfzRuuqwToVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733114992; c=relaxed/simple;
	bh=Uc4cUQX10gCThUVCN/Dj7IXiMDW/TpvvOgV47ajb33Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xr3scxTEOPDUjB0fMKUcM6Nd1Buol5BNmE0/h0GL5mBSUbZ3UIhnhJPAs4p4INIlRIHLt+98F4KjLzcI4vhRIGxP+t92T3AhwGUsfb1yzwKm4nw3mDCxVXR/ASwc+gXjPUZGmasF/20KBmTZSQVhmS5JNT6hcBb0E+sFIuoUQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=PTMdjBRo; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="PTMdjBRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1733114627;
	bh=Uc4cUQX10gCThUVCN/Dj7IXiMDW/TpvvOgV47ajb33Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PTMdjBRotFtICZaNdmndcnzbIhiLtpEWFvCC7jbPmvJBu34rFeJ8lxtPyMpGoTwA/
	 KN9RJx0iTOzonEYidXZ5miPIeg/rnDZLSTv6afBOryGnJ9kspdXqd2T4hDJib2lgcq
	 Br1E/GbjiW1KCPzUg0dHxiNULFq/lQ8l+cLEjF8GAMKKmOoEeKwXY8umAe8Ce2wWGC
	 NEX3ZEOJeL5RHHrsUYdGhQc5AZP/6sb8pDcIBLyOJ9a9p0NxdQPKLLAye5/QdbpnTu
	 Vrelprdp2ZdOEBjkFiNwhUVjvP7afLYmULpiWCGmCBhmEcG2+yr+zgfvlEZrIhMjvh
	 0L97VeDbd3Hzw==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Mon, 02 Dec 2024 00:43:26 -0400
Subject: [PATCH 1/2] dt-bindings: sram: sunxi-sram: Add A100 compatible
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-a100-syscon-v1-1-86c6524f24d7@epochal.quest>
References: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
In-Reply-To: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
X-Mailer: b4 0.14.2

The Allwinner A100 has a system configuration block similar to that of
the A64 and H6. Add a compatible for it.

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

