Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067DF2D03D
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167679; cv=none; b=CKPHc8TM/k5nZhN2G91En5SP53KOfxVlP8glh6nT/1DkXUSiJ28b5kcck3EU4Gdk6Qc0GWL4PtP00HvOVJiIIigE8hwDAh6Mi4AYMqmh0rgtVsrx1Cw7bF38Tvk5poPSpsB42MZaqctd3ohr5bo6D/wTZbdyI1PAsG4A56NgYdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167679; c=relaxed/simple;
	bh=CysdE3EhypL7GVo8RuquCABJ2inZOTRjeRyMjAhRqGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecjM9qOz/LM13zSPP8FPAxgYsBcWTTq2VTtCQC+q4wwp6CDh15BtAejfXLdeiUSQfxtqhADvt7HtC3cdEqhTKwUfmHH1ZBiLnfdtgpbcvHYOMSzYdhXkZfg5eiaLxO6NZZHOXA8SIRVJpDPlaSvoUTZ9Si3AEKnV9HyDKfVwjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=HXmtHP1n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YGb43tBn; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="HXmtHP1n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YGb43tBn"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3674E11400C7;
	Fri, 26 Apr 2024 17:41:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 26 Apr 2024 17:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714167676; x=
	1714254076; bh=zxB2kH+kdXdfo6Gn/8m+vqnDdwmgorJPCP5uSjnxdas=; b=H
	XmtHP1noah4be61e9N4Vb4mEGrGBQiM9OR9WUgFizun7nCaG1ATiMmfmBqYRehaS
	Z9OAQSDJfcYnCSuFLKMebw6qC41d7F6IGmkCQBUatwNkzfywAii9FuOJk6mcbC6p
	3ECSDiKNXhjm0kGGqGc0bp8S2bqPq1NmisjkAry9qdqF1SaDTu2GpYc51loQnp4C
	WPqDzWwdxcQI5NtoJ/RqRfeQw3Yc7KVj38pbycGzqL2pLcwdLYvx7dFYdbHEIH57
	ZHqEBm286lp5ePtqgWVg3L0eM/+sAnIIrUTKe3CB4lrGH/xb+sqYFgPjTKTEh7UW
	Trigy6CVsnRgNwrAhPpJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714167676; x=
	1714254076; bh=zxB2kH+kdXdfo6Gn/8m+vqnDdwmgorJPCP5uSjnxdas=; b=Y
	Gb43tBnGIPefJp8LlUzqBuK+Z61Q0odcnOb2/QPBrSVQ+MyR8/PwyvhpmvhwMb2E
	sMop9R961pewSE0WlEsKh3K1wKwuPJ/AuIhLTATGBa5th3M+kdCHYDMa/z2c4rAT
	IWV3Z/1wTI2Hgm0BlicXtenHbF5dfTJ+W/4XOGMSaXeuWkXUlmreSpbcBum7lIXN
	1WBP1eQf4NAkB5bwNRkX/w+Ne8UfQoRuHqOfk58ulWAR5+Uc1GUQoEYNepLDJGLn
	I8PF5ThcIaUCfMoY4uCHiehkibgU5U8SIZReo+nSGXi5qtmG3OuNaQDcZfl93lvl
	dDAe9ilUKZaX6NL+x/dNQ==
X-ME-Sender: <xms:ex8sZnapaaVSc7tZt7Woe1Rh5GiazpQ93GbqggQ1MBNVT4G3Aj6_Kw>
    <xme:ex8sZmZH-zAMSEiQ8Yjr9vXYWhA-b0Md8s-3uuvoeUg55IGBVnCEFP6zHOAZONY7y
    pl5toFZb3b19EKf-g>
X-ME-Received: <xmr:ex8sZp9ii9pbFHU3_lVMvqGlbDwavZUjshNDpFMYv0V-09eBNeCYVIro7hlmxr84AvO8srMEVx9mDOQ--2HGa6rMlekE3d5wIE4rM2u30Dv83GnL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddttddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:fB8sZtpDa1lR-8pJlDtioN7ijgqu3GynFg6FyXLp473AOx_NDQtmVg>
    <xmx:fB8sZiqE3UbUwV7m-d_8h0A01oIbonomxk5z4w6zwHqqOQN6SRVXdw>
    <xmx:fB8sZjSerfRY7RH3kQu28wIpnSxvnu5kbBYOgyTdyJ_Brehg1LIJzA>
    <xmx:fB8sZqqlnIyskF7VKqRGnuPrqIZvb6yZahROkbuj613vO0L-gXwEjg>
    <xmx:fB8sZohkxWQa9_pDSvpQ8ukRwDncXe-Bc0EXubnqhaIhzjTQn3pVtpvH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 17:41:12 -0400 (EDT)
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
Subject: [PATCH v5 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming device variants
Date: Sat, 27 Apr 2024 09:35:07 +1200
Message-ID: <20240426213505.69273-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426213505.69273-5-ryan@testtoast.com>
References: <20240426213505.69273-5-ryan@testtoast.com>
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

