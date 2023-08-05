Received: from mail.croughan.sh (mail.croughan.sh [135.181.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AD15A6
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 04:50:17 +0000 (UTC)
From: Matthew Croughan <matthew.croughan@nix.how>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nix.how; s=mail;
	t=1691211015; bh=6dOEaEfP16oOvitY+UvPtUksmf4TSAu0+nGebF85QnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZanlooQ+ww290ogJo0KT7s4omEY+KwsastcmeeVZ+Xc39uZajOj0HYBpSk1zCMdBr
	 hXidERssyTwb6M+VSa5D8hskdjeK8P+gwWZda3EzhbxhpzlzUrJJqS1DIs8U6X4OFG
	 vX7I11URJWYR+eg8G7EliDr5LXucXu87QKx6bZAA=
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
Subject: [PATCH v5 1/2] dt-bindings: arm: sunxi: add Mango Pi MQ-Quad binding
Date: Sat,  5 Aug 2023 05:42:38 +0100
Message-ID: <20230805044558.279473-3-matthew.croughan@nix.how>
In-Reply-To: <20230805044558.279473-2-matthew.croughan@nix.how>
References: <20230805044558.279473-2-matthew.croughan@nix.how>
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

