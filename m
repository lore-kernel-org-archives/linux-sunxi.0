Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B24D515
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610019; cv=none; b=nqCNrZu6kRTGHFeEGJgUuEzxZTNbLwZx8RUI2VmrepQ/Mv//KomsE4+b1ZZ064OV7v02d8iMmh1Fd68HMaUiWr5ADCnNp53g2UCQf/9DJCYkDnrLnpunGTysfvDddgrQYdYleFiyZEKx9yBFTrLpcYD7OJ3q8TMET9PL7/YX/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610019; c=relaxed/simple;
	bh=Rg99nujlyHQch9LKsYsC/MyyBJwuTQ6lLokvdrnFCpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOOpCEeSvQidyv4xEUtOCsy1CopCLCUF/PgwlKBQeoqiBgClj4TFhqD8KuzVp1vLDmWESBw5k4qGE+5W4xR35rrUhPo1XJ8jYVcz1c6tJvjaaFRHP6qFkD7ovQBnRaSKb57NRu73VQ/VTgbE7jBagqsWzYq8qtL6+aKKs8x1KKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=hZ5gZTxw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M/ozQOjV; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="hZ5gZTxw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M/ozQOjV"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id EC4061C00081;
	Sat, 20 Apr 2024 06:46:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 20 Apr 2024 06:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713610015; x=
	1713696415; bh=vGCGI2SFB7J2QhdV8aabG8AgdxnFAS3BwvrWREA35Cs=; b=h
	Z5gZTxw/v5vl+x8pO7uwYSDsTNR/DFXrfGOaEdZPjiZzW5eImZzpYczc7plAVYwC
	nfftoRKCYr67WqtTvEQ50MyGFUFL+BRYNFkPeGp/y2GdxkBkQyiiCY9auX5lz9DW
	FVuUkqGMD7SRIV34AoBggW8iGRpsxwD+PnkvHehNsacpo1254K4CKC4eEMNPvO+I
	BPv+WEA5fEEJ8CRzT5rJ6/aNZniMLnLO9qIYbWRzJbFO6H/lud2I3jcFqOTX8N0P
	9RGyF7JOWoG5wCt9l2gkhvEX1uD5wV8PbmbMf5nQj5aDSk1DxAePwPSba5MWHieH
	tQcM5ESF2KkDJZQ0ZDsSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713610015; x=
	1713696415; bh=vGCGI2SFB7J2QhdV8aabG8AgdxnFAS3BwvrWREA35Cs=; b=M
	/ozQOjVT0D9OQQs6HHfluj7BfeMEjTDnZfjYNA24ip53F7aRMTkQqTm+pMp4ic2E
	vfEApy0CQTcXScHeR8r+/S4JACW46EQu++1poLlpvywez363yeBvzw5DylI9Rwhn
	cJZQvsr9BviP2wGHNbyf6xYNg39sme9m1GzLELnWfJ498coAWHG0Gdv+llOeCX8Q
	3Nd9m66BirMapb5Wa8XSK7h7O+ppQbvfLk4xRGobz94KawRKn8aAv8+7bSaSECuh
	0uc8ZXW19YpzcNch3YOylLKTC0Z8nVNTbWs+wGHi1lPtO7i4QfhhLI2Axe4NOzNi
	ZrPJ1Kiagj7+41SmQBpgQ==
X-ME-Sender: <xms:H50jZr6kHq_jyl6YPY7u-p9n6ZRZuuMWIF39whFHoclR-0Ap_FaaXA>
    <xme:H50jZg71LAP4W3JobHc85Frfg0ByHY5ZLkbLji1jmPWZ20W_mJbX2QmJ4doCSWF1R
    Bh6xTyGN0p_tdSQqg>
X-ME-Received: <xmr:H50jZidDl8JOU736-6g2iQLuqfLTsTBXswwhBjjeYpEN3fqM7RqQYAUigKZizdtfV9jKnB5wH3eMjwv8MmnEiBu6VtWUurS6ctquZq8o7xjmT-Tf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:H50jZsINlL8M7QV709ND72tpfVbi4VNK-bqYlPDTslHzjWsIyKIfxA>
    <xmx:H50jZvLrgb3HkoBSUvmVJrk2QuvvOC55xpg1XauTBT8-fsagR1aLBA>
    <xmx:H50jZlx-S0ql2Wz9B-euuE1fnubiHUZJjXSWzYdirLsWcZJ8nVGGaQ>
    <xmx:H50jZrIGGS3sRwgTIc7YUz2O3yMus5j5QBtxwDRPQjjJlvrI2I0aow>
    <xmx:H50jZpAXvBQDmm4LSckJxlGD8GihvVmd7aaU-SkgdgQa-CXKWXd15b0B>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:46:51 -0400 (EDT)
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
Subject: [PATCH v2 1/5] dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming device variants
Date: Sat, 20 Apr 2024 22:43:55 +1200
Message-ID: <20240420104354.334947-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420104354.334947-5-ryan@testtoast.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
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

