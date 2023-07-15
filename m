Received: from out-25.mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FE1854
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 11:25:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689420347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwGDE3yVIxPwsfY7daqG3Fg4YYN3E6U2TSbdOoNGr2c=;
	b=qij1kjnFwoJdPsm8qHKTlc+hKlEqw0z6iH0/AKScKt/SNRm2MnIEdugATrTQV7XEoY5Tyu
	awM9uAT0Ja7GYNRqt0zuQlHylvACAggWDBFPsJIwUrUZbxOQ9vc9SdXq3ujOjIHN9Bo9DI
	M/myL22XbVD07cjWzndjI7gDUjVTO9fTWwWey3fzAhsKK0TxLAYBGnlQ1sMxnE7Gk/MNUZ
	quj/oLQsJH/RdpMIxzLy46NJAzzMZNvN9QnKf+hzKzBD5ZG+hoIO7zwvKfR6SB0yYY+tBh
	pH8hqw5zSR7xDca8eOIBM8nKZM4TOe8upoWE5Qw7HYXyJbZGxN7tJ7KhITGS4A==
From: Jookia <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: John Watts <contact@jookia.org>,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/4] dt-bindings: net: can: Add support for Allwinner D1 CAN controller
Date: Sat, 15 Jul 2023 21:25:19 +1000
Message-ID: <20230715112523.2533742-2-contact@jookia.org>
In-Reply-To: <20230715112523.2533742-1-contact@jookia.org>
References: <20230715112523.2533742-1-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: John Watts <contact@jookia.org>

The Allwinner D1 has two CAN controllers, both a variant of the R40
controller. Unfortunately the registers for the D1 controllers are
moved around enough to be incompatible and require a new compatible.

Introduce the "allwinner,sun20i-d1-can" compatible to support this.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../bindings/net/can/allwinner,sun4i-a10-can.yaml           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
index 9c494957a07a..e42ea28d6ab4 100644
--- a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
@@ -21,6 +21,7 @@ properties:
           - const: allwinner,sun4i-a10-can
       - const: allwinner,sun4i-a10-can
       - const: allwinner,sun8i-r40-can
+      - const: allwinner,sun20i-d1-can
 
   reg:
     maxItems: 1
@@ -37,8 +38,9 @@ properties:
 if:
   properties:
     compatible:
-      contains:
-        const: allwinner,sun8i-r40-can
+      enum:
+        - allwinner,sun8i-r40-can
+        - allwinner,sun20i-d1-can
 
 then:
   required:
-- 
2.41.0

