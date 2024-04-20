Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073517C61
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610040; cv=none; b=OdVNN4tHxIBEA10UsITtFr0pFRqy9/Y2U8wchFKw+DlFG00Z/wqCNHIcrIimpwqRwKKG08MhksS+IpwjGS2SS2pk9Xv04MkAstKowxURYtdGBumlc+gVg14UC9aeC0KQDW1mH2Qu3RMa8V/KMNeZarNOSTSd6N3uR/uJFJ3Z0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610040; c=relaxed/simple;
	bh=z42e5QvSmGPYcLCtDQApfBg1azP5XCnV1Bm4rStCark=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7n/HKln5iCBZXbYftX8sPZje0NoMAB5EzSyUuW77s+hAw5qWjOTNZBVZGhZJRM5UadVx3dp6Bmiab0WRZFDXBTgpcsnGdIei27S0rqRsQEfezr8sMTMANtwMQbwptv9sTugxuJmiMRc4lh8TG+ScKKHb7KHug5JIG9Lr3WBM20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=BTDAKUag; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RrF08XZb; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="BTDAKUag";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RrF08XZb"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id C71D31C000F7;
	Sat, 20 Apr 2024 06:47:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 20 Apr 2024 06:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713610037; x=
	1713696437; bh=+hx1ropmez6l+G7i4Gsyuo2oZyHk0QTR7i+wltXfXNM=; b=B
	TDAKUag8JDSJRCYVw9nMBK/rsOJWQ7OhxlDUMXl0jryQhzsDI0lCvWL1NhFfb09D
	b0d9AO0fa4Vk6Mx/0K6MxZoixUxc2mlFmieQTeJ2lU+VhODJFnixd5dO8FepSZGo
	8X3Y7VeL5QKLkedKfcpaKSqIdxrLKBwZ7wAdr+ALwbQlsqLf/7WRY4ry5IZDmC23
	rZiDxZiYf5BEK+WjK5WR9uu8mSTUFbggjz8u4wTl8IcuGibjrpJawTzeuXLAl2UA
	weJ3hyZr8ImjqQ3SnXxNVKShd0Yw2LgLHuOQz37PnfZzT22gSS2zu1HNUqC2qDGx
	+T6kZzjiNcjo0iKCoQBZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713610037; x=
	1713696437; bh=+hx1ropmez6l+G7i4Gsyuo2oZyHk0QTR7i+wltXfXNM=; b=R
	rF08XZbeoNwU0LqtlfA6+mWH6cNavBnKQEHHDu7sjhjNU1qkY1cNdUigUSbq0mZQ
	Ojca8vCm/OlGjPE4xckpj0V70Yv1T+roHk/L81PlWSlVcvbwgkiR1fAbDlz5JcGk
	UuiYxeuVvhcbatDqxXMuNaliVkuE/ayFySuJHFek0+TLuk3UanHZvkPnrizpLQp7
	UbWT4kiwAw4ALA5pswTiTEP6yjv/0QpqWbLFlfS2M8FAiISg2VdKEXPutF2Wbgq3
	Kb2JBxW5ERTQxzpr/GMUWkO+1xTQM7Tk6C2vwRjtICOgbomEQ9K6uGvj/8AkeVkI
	sW6PU2etoG44TWkuKjZ7w==
X-ME-Sender: <xms:NZ0jZqk-KcoNG2A2abRBfLiAKepbK1MkC0EM52SWDmhsgvMSEIuoCw>
    <xme:NZ0jZh2gnbtm0Nnys-9I3_ReiHoGry0D4DGovzRzQjndQBJ5rJkYFkxr3zUWv0p-4
    l6PcQkHcujwgfOPTg>
X-ME-Received: <xmr:NZ0jZoqSEzjULaaDlp35SPrvP8SKheEq-kRWcyAxCF_HzUjFcTVnDJREMS4ZVud137jhoMQk-WULyldK1FTJo1sW0tZ78wgXTZFQTI3KaHpViKEy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:NZ0jZunMGH7-BykPhbd5pV_6dDPGuHrmRzw-71O6lPbaMraiVUdcOw>
    <xmx:NZ0jZo1ZuCmmF8np1cJNIflXzGEBcRVfHAayQoxgqxqTJYH9OtmgOA>
    <xmx:NZ0jZltr1bh_votjrBPUNLTd59a4D446mZB9D5g4mPedkchgu1xo_Q>
    <xmx:NZ0jZkUJ1MXMLyMqjm7nEsZI_7RJ91EAbNM5TRJdqducqqS9kdk8jA>
    <xmx:NZ0jZtsK2ZxIFklADQxl-pQ5Y6duURGt8J8bKYBBB2gazbRIfm6tEU84>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:47:13 -0400 (EDT)
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
Subject: [PATCH v2 5/5] arm64: dts: allwinner: h700: Add RG35XX DTBs to Makefile
Date: Sat, 20 Apr 2024 22:43:59 +1200
Message-ID: <20240420104354.334947-11-ryan@testtoast.com>
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

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 arch/arm64/boot/dts/allwinner/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 21149b346a60..c2c871d8b71e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -47,3 +47,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
-- 
2.44.0

