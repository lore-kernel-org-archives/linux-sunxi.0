Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3521AAD7
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713083797; cv=none; b=UVnzfV6p2Nx3svZyeRLmIDwEFjn/I9iLqTq8lPSOVd7GIPpBPbDp0V3rsr4iv67Ftd4YH3yIzbKLl4JmmO5IMbS2ZJ06Wvk3c0MiWJxq9xvOrRmuEATCIUiAHWTtarS4vAyi3sKdIn1Fsc1CjeuBCA00cAf7INmGuFIc3qV7Aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713083797; c=relaxed/simple;
	bh=kQ7H69RWMAR4Y8u0ogBWDFQBri7M8OEbZsh0pCTD4WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kluUei5zT63e01oPsVYD+HpA5P5BZ6JAKjCEOcepiSDJhg4KUNsFjb0VvE+bt13CtDkpqcKiUlsMsIUxrEEoQCj7CJUTO8gB96eMZB4Kvqyzqwka3ubpTgus7n4itjQxBt5lneJnGuF/rcZuGfSUzFMOegPyxRIHz9v/IyAiKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Z+kRk5Xs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=igAv3OgX; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Z+kRk5Xs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="igAv3OgX"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A55A111400FA;
	Sun, 14 Apr 2024 04:36:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 14 Apr 2024 04:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1713083795; x=
	1713170195; bh=no+18INyDRfIg+7c2ZdetO1w+Xy4IM7mXOahyLAHfMI=; b=Z
	+kRk5Xs8nujacGAHXv+Cx1pk4bJyedxl7zLd23eh37PRmp7TQ94uVP74XCAY2rkF
	Hm0p1toNgZlRVtGfrVMglUxJSoGlY0bt/cM2Zq85UC55Hezk0UMA9igY2BYap6zx
	4Eyrrgzv+8gVDaSm1wlB2GnZTtVADkmAK3v3udVbkD3GyCynwSZ/rmDY101tuT2t
	zGkBx4KUUZroFS4xYnXnKdycniP7IG/RLWYfWCjq+/k/Mgs4hVd7VqKywixP3k35
	Lyn4Fehv4Vy79FQorYmZChQhVbZIAmYWUV2CAuYtVD7z8UF32k4MaKxefA4vKCvM
	IY8GdcSIwe+AlOnJpor/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713083795; x=
	1713170195; bh=no+18INyDRfIg+7c2ZdetO1w+Xy4IM7mXOahyLAHfMI=; b=i
	gAv3OgXTZ35C0KQ+E3IJXsFeepjBjSPEmKOoegYVJ4K+Ok1CD/24DEHkOTnMPFE2
	yZ61o8NSEv+U/qWb5E6t72OLqacGLVkR6j1/ZryHQBgLKFCGL6uYybem4XYhHzB5
	51Joj8jJru0Oa0IhTo3b/VPM5l9ZgPYevCkOxLD2RrnrM77j41K58oytbpxGS0MY
	6OhQF2Em6Qxfh7xQkDG3AgzscYUeFelBTZrO5Wx/DScU2g7wDCdy0xnyBU4kiSjn
	f4BDgDAjydReQyQq3l8Wv82W8wg4EfKU9XXecgszPU8u9QcVAHFCxUNp+ildxh6v
	vhUzczHlr1eZ3j78TFRrw==
X-ME-Sender: <xms:k5UbZl5Bax_amp2-tPQArmpwmqcLxvALfo_Z-drTDvcTyfbIxUBvYg>
    <xme:k5UbZi5lA8xY-JDEz5-iwjAPCcPTamfyFyuX7ODfPoqRcraQEhURrTwj31wpRmVbf
    H1Ozc2cu8QUx8r4Lw>
X-ME-Received: <xmr:k5UbZsfAIQxe7XXCAj35vbyj1Sett394zUothdpRB1tofvLikvdioID7fmrDW_zZ05NEXA7f3dBae5pfTclU0COyfrkEm_XfVW_0zBt4RcfWGU2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiledgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:k5UbZuJK6QsVo3qS78mdMEiRBklIk7ZsfaWhdw0Kx9A3DU19I6G9Mg>
    <xmx:k5UbZpKyN-zw0_XAq4avHJC3ATH7kYVvVVIXLMdHNQNSI57x_dhq_Q>
    <xmx:k5UbZnzQpFkbZIQ_8qqUT6zQ8QpIfxPdldadzw5xoQGUQE0tOrtMMg>
    <xmx:k5UbZlK-aWtA3CxV9-57cEk_pG9dv5TiGXzI66HJmJyLbhd1YaUWFQ>
    <xmx:k5UbZjz6P0P84o1kGmuFm1WVVquX1almojR4MjaUZIU-qBaVBuybLVcT>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Apr 2024 04:36:32 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming device variants
Date: Sun, 14 Apr 2024 20:33:44 +1200
Message-ID: <20240414083347.131724-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240414083347.131724-2-ryan@testtoast.com>
References: <20240414083347.131724-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan Walklin <ryan@testtoast.com>

RG35XX 2024: Base version with Allwinner H700
RG35XX Plus: Adds Wifi/BT
RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal
          altered form factor,

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
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

