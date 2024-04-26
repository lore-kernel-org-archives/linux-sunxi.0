Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E241422C8
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125210; cv=none; b=L6T1JaLc9u0B4C+Tmf2vcKAe3ci3w2Rss3GOD7tQ8lbwHBfK9IGM4dQD52SA7dIzX0ptpS5b0AO1KSRJvB5tk2CB7AAhr5tYk6LdVoBU1Mjxu1iJvb2a62QoQU/AddC+MgFutM40CxpOlNj+UeJkwDTsw9drcKTz2z8uRfr9rNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125210; c=relaxed/simple;
	bh=CysdE3EhypL7GVo8RuquCABJ2inZOTRjeRyMjAhRqGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrtZNBW29YJqUBZJj9ANhFHs9mxBNDLunhdqCc9NsqBmphOVae5NDhWLLmarZajdFKIrPg4eDbOoR5Bn/98gDEfdxEYRChqFtJ0INamna81XERCG7ZctcVUi5yEM4cUUSMcANSBkqU0cIcRDvflUkwR6PzSe10nSG5kCnTpu5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=jrkWqmpj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Msh1Ztm1; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="jrkWqmpj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Msh1Ztm1"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7DB4B11400DB;
	Fri, 26 Apr 2024 05:53:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 26 Apr 2024 05:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714125207; x=
	1714211607; bh=zxB2kH+kdXdfo6Gn/8m+vqnDdwmgorJPCP5uSjnxdas=; b=j
	rkWqmpjjaTpJOXkesHgHIGNVZSNxY/uCvjnu/y/JDAG7c5m2J/3BuHH9/lBbHN2W
	Ip1beqPkUNs+mN6liBrRnCaCuAIKS1jaAWqel+psMvBCB7H4c+Qq/3C9hCtIu1qA
	6It0Hfy22WzpdHgvR2782JfodSRA7seu6+aXUrJFw2+2cMhEPsIHVVuIUE5FC97C
	r2ZWjNAhFMvVyD5956skhLb/5kDVAa1lEAI9TUFYFtLZaDsuhiyzkBJXCu6RQQeP
	IUKfLNjPANdTRl/YfHjqoDMv5akWjrPiQeuNDQzJAfW1tzkWqgrte858SKCyNimg
	fWgiE8iArz4jbEWt09JeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714125207; x=
	1714211607; bh=zxB2kH+kdXdfo6Gn/8m+vqnDdwmgorJPCP5uSjnxdas=; b=M
	sh1Ztm1XxSANzm/77lnnsULFizek9ypriTK2cOt75PVNgRMeur6Bvx7CqcC2DdSC
	krYXXJQiHeH8jnMLyL+wPWoa/Em4OIY92cA9SmSqwF0xxGLtilkVcWzsgoWk7/c3
	jcWtqwWsh2TnzRqSbSdyJkPLAEIf8iwWRfvUBkvFzjN67JprhkI5UKB+zyhFAWip
	3sq4/BVbpo2Ci5gLx6kdqyubMucqNSPVHc1Jh/IT1FmO++zQFmoXf/aXx4b59L2B
	MKXgBfBk/0Wdce1wyYvG6cuazsPk/dBf9PAD+RTK5MGcQ+4h0qRV5jf4e9aQtbSV
	qDCv67o1B8gzSABUUX6ew==
X-ME-Sender: <xms:l3krZvsOJHs_vZeIEoYElEUVK5A6Mu5JFUWZKGH2pKYq07CLDxccKw>
    <xme:l3krZgf_KZVY1vNcgSmHb9LyAuYwRbX1oHJWBffQ1gdShwnQTsynGhbP_UqGvGAlc
    goNbfoTQs_l-tqq4g>
X-ME-Received: <xmr:l3krZiw41mEGBSm4PDFrqpn13iqAn8HszNoN-77O0zn6-hNwrHHvhozQX6kNwvDkJ8nYJazZJb17wMVG4xPV343ls7J0cWJ745Drsd_D1NgteKs_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:l3krZuPeIFSWCgbij-i-2ww_2oFOU_mie963oUJ4fLM9hCR9C---3A>
    <xmx:l3krZv-cxukNSsH0soVt-Rwc7RT2_x0idP02KgfRvvako0AlTmXPXw>
    <xmx:l3krZuWOmFg9YDfIuOFHDXaj4rsSvUdrwP2Z05ZCkq8ynNV6J_VVTA>
    <xmx:l3krZgcnEI1fidpRvw0atQ-pqPVZLFF200rDu_E0rgbvqOX5P08vVg>
    <xmx:l3krZiX3P-dT1jpR2ajwWIe05tnKjGnuaQ2hPDg8Vz8PIFMxIoulsQYz>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 05:53:23 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming device variants
Date: Fri, 26 Apr 2024 21:51:39 +1200
Message-ID: <20240426095141.13602-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426095141.13602-2-ryan@testtoast.com>
References: <20240426095141.13602-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RG35XX 2024: Base version with Allwinner H700
RG35XX Plus: Adds Wifi/BT
RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal form factor

Use three separate device descriptions rather than enum as per existing sunxi binding style.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 09d835db6db5..fc10f54561c9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -56,6 +56,21 @@ properties:
           - const: anbernic,rg-nano
           - const: allwinner,sun8i-v3s
 
+      - description: Anbernic RG35XX (2024)
+      - items:
+          - const: anbernic,rg35xx-2024
+          - const: allwinner,sun50i-h700
+
+      - description: Anbernic RG35XX Plus
+      - items:
+          - const: anbernic,rg35xx-plus
+          - const: allwinner,sun50i-h700
+
+      - description: Anbernic RG35XX H
+      - items:
+          - const: anbernic,rg35xx-h
+          - const: allwinner,sun50i-h700
+
       - description: Amarula A64 Relic
         items:
           - const: amarula,a64-relic
-- 
2.44.0

