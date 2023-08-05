Received: from mail.croughan.sh (mail.croughan.sh [135.181.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477910EA
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 23:38:15 +0000 (UTC)
From: Matthew Croughan <matthew.croughan@nix.how>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nix.how; s=mail;
	t=1691278693; bh=2DZlbwxyrwSkLVnCD2OL6/PMldNs7f5UNXEqVfXqL9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jei7ru5cIC4KLZ2F4SLtJA7heuAZ8vIQ2IKn+APPfjCPioB7LOnin8nERbGBJlbZl
	 qoLaSMWncxCBOykY1I6szZs1/LAjT2uc3koYohSIAAgGuO483d4/izqoMHXH9O2PQN
	 Zh7fIusMRhLonHzKLo7uu7xfCyeRT9Evnl/JZTX0=
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Matthew Croughan <matthew.croughan@nix.how>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: arm: sunxi: add Mango Pi MQ-Quad binding
Date: Sun,  6 Aug 2023 00:34:55 +0100
Message-ID: <20230805233715.1216456-2-matthew.croughan@nix.how>
In-Reply-To: <20230805233715.1216456-1-matthew.croughan@nix.how>
References: <20230805233715.1216456-1-matthew.croughan@nix.how>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document board compatible names for Mango Pi MQ-Quad

Signed-off-by: Matthew Croughan <matthew.croughan@nix.how>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index ee8fdd2da869..2dee815fd45e 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -862,6 +862,11 @@ properties:
           - const: wexler,tab7200
           - const: allwinner,sun7i-a20
 
+      - description: MangoPi MQ-Quad
+        items:
+          - const: widora,mangopi-mq-quad
+          - const: allwinner,sun50i-h616
+
       - description: MangoPi MQ-R board
         items:
           - const: widora,mangopi-mq-r-t113
-- 
2.41.0

