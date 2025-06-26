Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF725B675
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925594; cv=none; b=t954MeFs+6gHEZ4DiMdX78sYEWTzGBgRKDJqQQxYOXchy3OALw95UqH0XKajGqHmxkQrZKeLhV2tCDANt/RYpNsrQFvwr4i+tzN4B+h16f+ihCxQmAwzjgeT+zCzPcNOFFoH9sjZXJ/rPjjGlB79ETvSFmKC1ZpI3RKfa+hNM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925594; c=relaxed/simple;
	bh=9R+INZ8e/SyHHgxDz0lyFa2OoSq9ExLuFg+fW4krK0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdKHhF5V8j2TqDBfPOCXGEC9d4dnjdZ8hzD9WJDbVCLxRFSM6jjaPS+8ug094mJoNUntu9kZgKPxMpreSTxH3IkGQko/QzfOXUFwIYH0y26oLPdGPpJLg9Q8nq1v3w4qW8weWMFxv3Cw/E9CRddQl/ihckGgkbJaiBJ99Weaukw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2B51F1F0004F
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:13:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A733AAC7F86; Thu, 26 Jun 2025 08:13:10 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 3ACB4AC7F7B;
	Thu, 26 Jun 2025 08:09:41 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
Date: Thu, 26 Jun 2025 10:09:21 +0200
Message-ID: <20250626080923.632789-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 has an Ethernet MAC (EMAC) controller that is
compatible with the A64 one. It features the same syscon registers for
control of the top-level integration of the unit.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7b6a2fde8175..0ae415f1e69c 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
+              - allwinner,sun50i-a100-emac
               - allwinner,sun50i-h6-emac
               - allwinner,sun50i-h616-emac0
               - allwinner,sun55i-a523-emac0
-- 
2.49.0

