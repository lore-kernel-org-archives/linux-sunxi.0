Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3A3D8F
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Wi+mMNtvFAWEOiS2DSrULuVNQaQXpbi0WtKy5bdJNlQ=; b=XH1oquDm7zORQgjVwY695ZEals
	BPDJs1eOo9B0MGQglEDXBIMDByPNFfGv30lFRPZlkcGXdv3aryfiKVuPfCRQtwG3LOFCWj1vpKFB/
	GQ7QQldPYLPx293B0q6kARrIel6AOyKUe4bUETebGFLQ9VeW2OR0Ff45EuqhoaGQDFYLG/uhMmrzJ
	27d8w8LYvctSEW6ozXX3zwsDOldK05zZau3LXQmLzSU05Dre+f8vO8cuofkGE/B95CzehlRDZTtLU
	pYIIiWkdF4IxQE6S/kry+SwPC8qxdJZQXrtvr/0VcO1Qo6OY2NmDgbxe96sM5gXFP1eG8GDLmo9EW
	GjkqznWw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pSOWj-002j5f-Lm; Wed, 15 Feb 2023 20:37:17 +0000
From: Bastian Germann <bage@debian.org>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bastian Germann <bage@debian.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] dt-bindings: hwlock: sun6i: Add a64 compatible string
Date: Wed, 15 Feb 2023 21:37:09 +0100
Message-Id: <20230215203711.6293-5-bage@debian.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215203711.6293-1-bage@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

Add an allwinner,sun50i-a64-hwspinlock compatible string to the device
tree binding. The A31 and A64 have compatible hwspinlocks.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 6cdfe22deb3c..281c285282a1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    items:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - const: allwinner,sun50i-a64-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.39.1

