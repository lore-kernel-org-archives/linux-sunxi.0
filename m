Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524DB33EB01
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364460; cv=none; b=NfmuZczdlqfF5z/K0sieARHtUNFm1ymVCf/BJjCwirSzAgdWUg8rVF3BFxxgu/VpxQ/rUaLMj1xHxzNzWkaLqiNo1wHKeCTW/kQ/UShJAv7RjpYpEEEJUAtRT+EGbRfPv//kG2SzuM/DejC7uRUqxPh+RHDKALAmuc4KeFxEYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364460; c=relaxed/simple;
	bh=eBgXTDQqXUcLwMtmkeSXGHs4lmuVYm0cunSpPPBuHqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSFkONt/8w/mbI2dJKzQrGNkzGy1bOhR0+zy98w+XP5XE0/QzGJdP2oJtGUS0EjdQ3UQs2P1vRRTNTWWmw6kb6MaEWcFjVzW1RsdPg5RVVwbkBihm4wg6XRbkUovtQAgbJozTQskz2Q8u6YXgl8L+gS7/ktCyqI32WFNhdTcF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A17A637002DC
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:20 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 08AA5B45524; Sat, 13 Jun 2026 15:27:17 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 14C7EB45525;
	Sat, 13 Jun 2026 15:26:59 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC compatible entry
Date: Sat, 13 Jun 2026 17:26:53 +0200
Message-ID: <20260613152655.212490-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613152655.212490-1-paulk@sys-base.io>
References: <20260613152655.212490-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
controller. It is compatible with the D-PHY found on the A31.

Add an entry with a new compatible and the A31 compatible as fallback.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
index 6a4fd4929959..3ca1a1c47032 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
@@ -21,6 +21,9 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-mipi-dphy
           - const: allwinner,sun6i-a31-mipi-dphy
+      - items:
+          - const: allwinner,sun8i-v3s-mipi-dphy
+          - const: allwinner,sun6i-a31-mipi-dphy
       - items:
           - const: allwinner,sun20i-d1-mipi-dphy
           - const: allwinner,sun50i-a100-mipi-dphy
-- 
2.54.0

