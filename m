Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54EB1FB0
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 09:53:01 +0000 (UTC)
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
	(Authenticated sender: petr@true.cz)
	by smtp-out.xnet.cz (Postfix) with ESMTPSA id 943B218B19;
	Tue, 15 Mar 2022 10:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=true.cz; s=xnet;
	t=1647337979; bh=lxa537pBCjy7aFFmg6cgXQt1WGC8VIKt+cw8JKVK3cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b50Xk3blPN5MJYEGQFQwStNXKPj8VX4PAj++bU1yzDQIhg6FffLdTuyPPoG/Cn5lu
	 FE+EjzntjKu0Xpjv32bvbYotE12Z0kVqoKnyoMcTEMgVxO+23qagJWL4hpR2R0w59A
	 zoYILpQwZMj80D2zfsF5ruvyRNb9KSMT+o4vTeKA=
Received: 
	by meh.true.cz (OpenSMTPD) with ESMTP id 93d67bdf;
	Tue, 15 Mar 2022 10:52:35 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: arm: sunxi: add A20-olinuxino-lime2 Revisions G/G1/G2
Date: Tue, 15 Mar 2022 10:52:44 +0100
Message-Id: <20220315095244.29718-4-ynezz@true.cz>
In-Reply-To: <20220315095244.29718-1-ynezz@true.cz>
References: <20220315095244.29718-1-ynezz@true.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add DT bindings for A20-olinuxino-lime2 Revisions G/G1/G2 boards.

Cc: stable@vger.kernel.org
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c8a3102c0fde..d142209e76a4 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -610,11 +610,21 @@ properties:
           - const: olimex,a20-olinuxino-lime2
           - const: allwinner,sun7i-a20
 
+      - description: Olimex A20-OlinuXino LIME2 Revisions G/G1/G2
+        items:
+          - const: olimex,a20-olinuxino-lime2-revG
+          - const: allwinner,sun7i-a20
+
       - description: Olimex A20-OlinuXino LIME2 (with eMMC)
         items:
           - const: olimex,a20-olinuxino-lime2-emmc
           - const: allwinner,sun7i-a20
 
+      - description: Olimex A20-OlinuXino LIME2 Revisions G/G1/G2 (with eMMC)
+        items:
+          - const: olimex,a20-olinuxino-lime2-emmc-revG
+          - const: allwinner,sun7i-a20
+
       - description: Olimex A20-OlinuXino Micro
         items:
           - const: olimex,a20-olinuxino-micro
