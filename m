Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934D62563
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713609815; cv=none; b=kxtbHYtcnW8ZsrXxbbDVefh6PhkxXltLxQ4n4QlSw2OeL7NY48OPmN0yITBoEa/NAIiWzoyp6x+DDvgC4HSmn10lM8LfX7m+wtpM8WgTW2DYGTRMse1YOFF/CQVMP2LGy5g192/2rgHzO3++8H4hscSa5RQt1kMLNNz8wuG0eoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713609815; c=relaxed/simple;
	bh=AL+/tOVJr0LIManyjh9wLnfwMcwYYMLA68W+dcUQvuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1eme3AhQE3FJXOlMM/yLOFrmBJeNM3YG2ePgdKZz6pNAzQW+djJyBmkaT8s62MUEut5Lf39ME/NdajZQkpkZZmqo1px3mwBTqphSnFaXYu8OST/OJQQ1+7LZQwx3WHWEp0VdG7aT4bRDziZiMhWCEQ4UnkDFDkQPWu7RQIVsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=jv8C1R9Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T431UlSk; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="jv8C1R9Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T431UlSk"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id D47CC1C000C1;
	Sat, 20 Apr 2024 06:43:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sat, 20 Apr 2024 06:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1713609811; x=1713696211; bh=92hzw2yJ8J
	N1p9dBELrZE4K4PO55lW1xwepgcYSmPEc=; b=jv8C1R9ZiZ83bsD1TTvn0jEZmh
	Dl0gQKFdMXuQWe5MbekPJ3o3mD7lyjj+1aK6Q3HNB282ImayYQSxngSqobz1CKwS
	u/wreim5BewpjA3GNMpNgR/9FS+IyCAtekbtJwCpMRYQJiOdpF/prQd+huY9fENI
	njYBLZAmGX6KoNlCkecm2/pNhM25CEqpL7pKlz7ZH4nbSAk5kO8St25LmjVZ59sc
	xi9T4p5oXpRqRfNyFqAt/hbTMG0qnQVD1FPs3HVJd6m1l1xie3gPFybMmzkLpl4U
	o8hVlwNv1KM/m6+zZjY5PNIyPhfU23l8jOGyZ71bM1UqnfEPncRV8gYekIUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713609811; x=1713696211; bh=92hzw2yJ8JN1p9dBELrZE4K4PO55
	lW1xwepgcYSmPEc=; b=T431UlSkypbP5ZVou7nujGiaFsRdsDn0rvO4fY4o1qt/
	wLW7TNWzhcG5bicEzdTEPNrq4oRulKsTBEYC5zGSaOBybLGVYBaMZua7py4IH2pc
	iKC42bAF+TRqFCVsJX+FemUn03PB1/0uTpaHu0IHq44ficze3hJuGEpK81BIBbJo
	DB5k0GoUOaGktaq+JG6VwpVkDBc8ZoEYi/ghSQr57hWz0cMH7sz9wswzVjgJOW1l
	C8z1Lxth3F0bAxjqir90z1k68Iehwm5w7Yy5JKSB1EmoEyZpYMRC+vc7SZseg5No
	2xUuFFCXSx/jRpJR0AwuKMkCgEtO32ZYnD4iLMmWpQ==
X-ME-Sender: <xms:UpwjZu4CuIw6_MYdsN_oLTci7-wlm4NugeoeGUcOY8jf5cNp5eKl-g>
    <xme:UpwjZn4vWZyZ6F6qOOhBNixJ1z_m-G09srxUaAvDsTc8tAeFnBg9VvI4gEh9KJIji
    52f_3PGsEVtcJZ1SA>
X-ME-Received: <xmr:UpwjZtfELLaIkUZBlYUCPgxCIqPWS3I7TGQrOC_vONJd1bgywQS_RcijfhVW5FHBjxUrYzoZtLz21WFkhkPs7h2uKwY4jHW7vetDFmOAvhBazGPp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
    grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:UpwjZrJlAPet1mEjR5YbHo4eWWvtEo5aVEUa6DEVaer5LJ-xdNeaBA>
    <xmx:UpwjZiL95N4RS7plLG31d8xzYO1jetZnw2I6YUIporMIAUbPTsm1yA>
    <xmx:UpwjZszvKvsVUT2SYUKJCbIZY3wphUjA0VcD4gbanvUNc609pDrtig>
    <xmx:UpwjZmLzZu9ivmcRL0R2ucidEp_GxTuabP3hO0PCAQ_sCuwa_Ef5Tw>
    <xmx:U5wjZoyNzILcmLnl8XcML_cxbI6hyFv49Rc01mfUYuuKV9S3LFB0CP9G>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:43:27 -0400 (EDT)
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
Subject: [PATCH v2 0/5] *** SUBJECT HERE ***
Date: Sat, 20 Apr 2024 22:40:37 +1200
Message-ID: <20240420104042.334259-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Ryan Walklin (5):
  dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
    device variants
  arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
  arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
  arm64: dts: allwinner: h700: Add RG35XX-H DTS
  arm64: dts: allwinner: h700: Add RG35XX DTBs to Makefile

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 375 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 126 ++++++
 .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
 5 files changed, 572 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

-- 
2.44.0

