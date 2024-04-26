Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E1364A0
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167665; cv=none; b=fCW03uZWZc8vq0/2+oBEvWCvFzKF+U5ZKHGHfI7xP4fA+6/38SVi+DEYk1EqLiJMHPLJFXVePh8jbgdrE/vijMzpXInfGoTO0gwQ0wgaBzzvLs35+afzpi4VOK+ATvvIsszQa2iot+ZeqZubOTDS0p/YGkl9eJPgh+H3ZQ00RPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167665; c=relaxed/simple;
	bh=BYAn1+upc72Kzq6ZYL/g16tJ+pXOZMq/28+IH2qS4uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOl9+CLOn1FdCA8S69KQqjCPID3BjgskhoyRi7089QV0iVAAK9IGFwf3F+hDBi+DkWbJldXCG84smOTHVPvbMPsvbOgNAqC2j1HazhHYkws2IbDGGQVohRbas0pJIZsTkkvoEcX8hZDNoccblDVrr3MVRkMREl5iYf3jLupr/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=V8J3aoOC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VY0bHUN+; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="V8J3aoOC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VY0bHUN+"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1C14211400C7;
	Fri, 26 Apr 2024 17:41:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 26 Apr 2024 17:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1714167663; x=1714254063; bh=Ox7f6qTqrJ
	IAkOnrlwDKrIkNTRswfvTwANeL0iZjMWE=; b=V8J3aoOCFHViApWdtIqT/i8GiA
	CSXV8Z3HOerY/JHTzpYPrejZSIPy8nosEroN2UvYTC8fGry0T1M1L+LmykKjjuxM
	pSZlc1Bg5VjjCng3UOmgUe5kAkmr+e1m4l/mYt1/hYWjqsVu746TzaXrRv5PXF5q
	lV5RKknphfRYSvpNJKTIKTT0SbB4d/SCiSCjjaX7ev+rT4Gk6W6zhzOXRNBj8vv9
	L/UBrN+mQXoLotyymBhmJcpN/Z0yE+N8GfkFePPyLk8fCVCmq68ejT/xBO1lrV+D
	ypEoeClObcXMbeDRylr3dmmh7nhhIsyDtWJiUmOFv6LkpZOHZ3tNXuGybgfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714167663; x=1714254063; bh=Ox7f6qTqrJIAkOnrlwDKrIkNTRsw
	fvTwANeL0iZjMWE=; b=VY0bHUN+MkuMZZubC43KEeVKuPjdHPFsUFCjM/PAslLW
	CXbDd1UV50v0jCHpP4o+31UFV+FbVw6vjB8FHDvDhgO62wS0oak8shvntFzP2L17
	bk5HbdVrJUawLKGjXv8uahH4Xxchehb8fTzncDZaDTJl2vjuuoDQwVQH3gcm1Py9
	L6zn2wGUKA6MfElE8ry326E/3GLE9NboRYBXyed6OylcQy5XmNVO1PnsyW5wJK2m
	Z8YJvWVTjx4rm+I8QKkO81e4Kps8BnZT9tQlvuBLR3JpGCBWpiT1hBgWP2fO6V+m
	iiYfuMvSPyj+B0G+Oa0pc6c/VY+MK8eUON23Hwj4Fw==
X-ME-Sender: <xms:bh8sZtpUWWgmqZ44ExDk3tG5R1Aye3aUH-gTaJP_pMlsiJT6jtU9CA>
    <xme:bh8sZvoYMz2338fKN4xFXTcY0_Iv7PMCJ22EQRGeCZFolUGFjVB_UNoxP8YptKS_m
    Q9530RLMulba94rHg>
X-ME-Received: <xmr:bh8sZqOWCsEaBITXXd7M8sduwX8X4e0GdeNHgvdRSCZT2xt281sC7wPshn7nJ3VrZLWpv8uJP9KDMrJj7n1joiBTkxsurLvkkGd_mCrhiEaDNyiN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddttddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
    grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:bh8sZo4BADL_H5kkIM9ktGQUT0AkVMrGrrJV5MpEDRgG6WSGvSougw>
    <xmx:bh8sZs4BkhpwblTYudITcfwwkRbDcpw0y1LL-Al4ANwEJyXD9yrzGw>
    <xmx:bh8sZgh1mEzLIPCeoDLXvm77PFNhQVFqaUCMY6K9v8kXM_8MGkgQng>
    <xmx:bh8sZu6VDNzInJUeDw3rN8fOfFw9mLk0_fdpm_HU2StNLgEkJjLaTA>
    <xmx:bx8sZsjZ1emh4JP4Tq0QfmWVBtpDc1AZ-kHJqQlDRSi46rBLkjFRigf8>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 17:40:59 -0400 (EDT)
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
Subject: [PATCH v5 0/4] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024) support
Date: Sat, 27 Apr 2024 09:35:05 +1200
Message-ID: <20240426213505.69273-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks again for additional reviews. Have made the requested changes, and added some commentary about the SD2 low-voltage signalling, which will require a GPIO-switched regulator for the 3.3v->1.8v transition. This is not yet implemented/modeled, so for now a fixed 3.3v supply is used, and noted that an additional regulator define is required for SD2 operation and stable Bluetooth. However SD2, Wifi and BT are all working with the current state.

Original cover below.
--

The Anbernic RG35XX is a family of handheld gaming devices. There are 4 variants, of which 3 using the Allwinner H700 chip are covered by this patchset. The fourth (released first and named simply RG35XX) uses an Actions Semiconductor ATM7039s which is a 32-bit Cortex-A9 chip with no mainline support and is not covered.

Common features (RG35XX-2024):
- Allwinner H700 @ 1.5GHz (H616 variant exposing RGB LCD and NMI pins, with 4x Cortex-A53 Cores and a Mali G31 GPU)
- 1 GB LPDDR4 DRAM
- AXP717 PMIC (patches accepted in mfd-next [1])
- 3.5" 640x480 RGB LCD
- Mini-HDMI, 3.5mm audio jack, mono speaker, two microSD slots and USB-C (USB 2.0) for power.

RG35XX-Plus adds:
- RTL8821CS SDIO Wifi/BT chip

RG35XX-H (Horizontal form-factor) adds:
- RTL8821CS SDIO Wifi/BT chip
- Two analog thumbsticks
- Second USB-C port
- Stereo speaker

Patch 1 adds the DT bindings for the board names, Patch 2 adds the -2024 device as a common base, Patch 3 adds Wifi/BT support for the -Plus (and -H), and Patch 3 adds the second USB and thumbsticks for the -H. The -H is a strict superset of the -Plus, which is in turn a strict superset of the -2024, so this translates quite neatly.

LCD, HDMI, audio, and GPU support are not yet ready and relying on out-of-tree patches currently, so will be added once these drivers are mainlined.

Ryan

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Ryan Walklin (4):
  dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
    device variants
  arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
  arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
  arm64: dts: allwinner: h700: Add RG35XX-H DTS

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 346 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-h.dts         |  36 ++
 .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
 5 files changed, 453 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

-- 
2.44.0

