Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67413DDD9
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957425; cv=none; b=iApUdGas0XAgorClsfhaeZ9ftjuKG/LY607NEm43Pczbx/zu7NRql4M7DE/TDZYINlvQ0RLv1ts/3ItCq107wzSs5Qh6yj3Abg89hcJV8faQQsTgrKLbOQl7ypDQ/i8zQm8wFCWPSbCZLuEDW8a6DK8LM4a99/8aGdp0ziiSX0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957425; c=relaxed/simple;
	bh=5QtpETQHfDqy4Njsq0/QoVngfLuPqIrRsUoNKQGGB6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6ZuHdvDEGT04k+eXAzcF0GX8JU9MIjBM3sxoEMwGuWWBZoFnbF4D7CFWFEZyOBL5/2bnLWc1cLZwQj7GuI/mfc6UUES8xyaeQS3dWX6CZX4LdKW/EFIt9UbMTh2Dg0kUDmcXPK8RWODuW2Si3COhExeyvTANfhriAhwhTyO9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=H2PnKWeO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MybpDjy2; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="H2PnKWeO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MybpDjy2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id A0BAF1380151;
	Wed, 24 Apr 2024 07:17:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 24 Apr 2024 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1713957422; x=1714043822; bh=QazeUXh9vO
	h+aFkUkwhC9G2kKZ94QlmnP+cxUtfTD0U=; b=H2PnKWeOGR9jsyHvhNYx9vGP0f
	yJdaWRK3UGB87kg4bRXGSmsbnIyCgZG8yAudRyWiBvS9uGH9fvRoBtLRbEx28Jbv
	iHfGfQj5bCMaua4ABv529r3vBjPRr8iLMMiZcql6xJS8JQNIdAQLbLBc3NBaQJbX
	pBpbfGwJv4NG/PlSroJVPLkAZvIe82N+dhCrxsu8A4SA05pfrzJnra5YZF5geLeZ
	FqgtgNDojNa5xt06O02e2yL0QU+awgaZN0lUxbVgJvhfqkVFtvzokH55OjZtU4qj
	2kc5ENQlb4COj17QTtwrtJCExB7xviZDwhLpGwsPwQLxwNcCwh3dHDsAkSZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713957422; x=1714043822; bh=QazeUXh9vOh+aFkUkwhC9G2kKZ94
	QlmnP+cxUtfTD0U=; b=MybpDjy23W0/PjBbRUvHh9F1i1g5JlulBwqasyLnowLJ
	tgNtp4QR3BwncFF1XjWK5GD3QCBKKciuJ+pGr7K0s67j39TwbLgtlT9WEhHOAFjJ
	o/R1fRapM+ifqCSpl1lgqCSe4SMHg0EcrYWYvbUAkXacgSD/DYHaKQntfJRq+Ql9
	L83Vnqjg/tnNTiost0bqyrlK59axlr1WPwpl29xbQblDwTorp6TWtzO3xx5Jv3xb
	mdWJNHQYvZQsemm9FQzLAzrzCA0TMpWsfymvcV9oNNWO5SbprIw72jhtZCgBId22
	dszTnJWmsSHzgoSg0tdX4TQzWSGtnMHr65W9jXQSlA==
X-ME-Sender: <xms:LuooZtI1fmYXNkMrGDWMqE8XJwst_W9zZ5uwzcsjVGRIrNRdZK0y3w>
    <xme:LuooZpKypQmDFs3qXgsJleUSAuffbSeLK_EkT47_QGRIAepsFEQU6lFnGVctVBLJi
    z8piDL6Ju2F9CaFmQ>
X-ME-Received: <xmr:LuooZluM9CuIbjgNX0OmL5G6q4bf5FeL1PLddZgbBNM3sbOiDODL55ChbwlyMFqTtedG9X3nRrpVmr25Jf8YxTxrI9TTDMRzeTaK3zXHAuBb6bhi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelgedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
    grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:LuooZubwAAC7wtGuPoDxssSrHmH4XvbHSgEp4VinufOAMzjxQgqUzg>
    <xmx:LuooZkb6IJ2qoIXah-nnGkRMQhZ-rFyX1Fbb0Jeh95mYc9m00p28wg>
    <xmx:LuooZiAQVHUrY_h8AXGI1K5OcFVibFN1_QZoJ8duXqxQFvKGYbSjrQ>
    <xmx:LuooZiYvZYvOxOZkUrOgzmNiZDHOQaQhMkuedTDxbE7PJPQKi2rWDw>
    <xmx:LuooZuBqjv9hR71iTnS9tGYQBYpqJAX9a2lUWcVY25SMiwBxb1vpb4De>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Apr 2024 07:16:59 -0400 (EDT)
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
Subject: [PATCH v3 0/4] *** SUBJECT HERE ***
Date: Wed, 24 Apr 2024 23:16:11 +1200
Message-ID: <20240424111615.10550-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Ryan Walklin (4):
  dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
    device variants
  arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
  arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
  arm64: dts: allwinner: h700: Add RG35XX-H DTS

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 347 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-h.dts         |  46 +++
 .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
 5 files changed, 464 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

-- 
2.44.0

