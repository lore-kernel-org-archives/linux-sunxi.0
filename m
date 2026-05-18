Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD38A282F08
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118476; cv=none; b=RcdCp0ufTfrgd9V2+lPFGKRMw4641ZJRdbQTH8cR4Oz+KoGu5SWdgmVArpEtUOreJbnz7a2OOHfB80Om5wj+dCHDrXVV3O2bxvMjOeS6pSWlrK+DCF1p1cimiWHJhq94R9frG5LTI5m8kObVUL5EDjMiE/CHXvrXVG9v9Vq4Ihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118476; c=relaxed/simple;
	bh=UnprGw1QSyD6H/nTxjzCzCRRqSruFbZ3p+JP+L1Grao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmfTvhzlqlwmg4jLaHxoA6bEs0WK637CCLd2Ns/eOyT2BBQTaI2la+Hc+61wy2mcIUM1djW6a3iaaaKr9iOI7jHw3CMiRZh6odxbWo9BI6aftQZ36ifDgKjElc9XgLhjlGdsCY8g+pyyFsErAP72wyZifP8rohcblYJbNHe1eZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 0977D1F80041
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:34:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6DD75B40808; Mon, 18 May 2026 15:34:32 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 43B41B407FC;
	Mon, 18 May 2026 15:33:41 +0000 (UTC)
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
Subject: [PATCH v9 1/9] dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
Date: Mon, 18 May 2026 17:33:30 +0200
Message-ID: <20260518153339.619947-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An interconnect can be attached to the sun6i-a31-csi device, which is
useful to attach the dma memory offset. Add related properties.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index 1aa5775ba2bc..978ef2dc0ae7 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -40,6 +40,12 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dma-mem
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     description: Parallel input port, connect to a parallel sensor
-- 
2.54.0

