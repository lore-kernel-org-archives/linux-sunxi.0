Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE413D8AF
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125195; cv=none; b=enlC2R7+Vfl/7Rqrsiz7x9sAI6Z/BNIQd+NsfqH8l0JTFS8hI1L7zvD5b8PiAUAVOavP7djzXUb9NpDN7JdvhtAQuvUqTC4QzOgQJRbI/2fSQdSNNSJBDm5nveSraOjg3P0GoLGPe3JQokg6Fp/qcap4x2J+8xWfSx/KWoL8EPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125195; c=relaxed/simple;
	bh=s55zad/5lDgw2oAM0YxXG5TD1miTGHaPtOR2uwN1KwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LAmzpl39MmoTEHFW2AOQY5ni9Zm8EBhniIMTtleLRRFu7gRu2WsOB3NvokPFAKsOnx9vuR3LimFhxz2qbwagE050xp/d4kyoW2Udj0lH42aEYbVTWhsKQdwxvXHybswB2RtEVWVe/9vFQdAOQbRWvnK+74gW87tbdcG7398N+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=dK3X5Qje; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ye3m14Z1; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="dK3X5Qje";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ye3m14Z1"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5D7FC1380095;
	Fri, 26 Apr 2024 05:53:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Apr 2024 05:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1714125192; x=1714211592; bh=29xy7Ut3Te
	XlQUH9Yfv8XfcYZml9CkO2wIe+miQzJWk=; b=dK3X5Qje52Ps1gwd5s4YrXdGKb
	V2d/38FuaStnTGy2na3KxIuOQeXUMV9L72uCRCdf3chbfTXMxIC8o8ufkxHMIpfy
	LExXyXR3raq7fVa3cUJRcssAj8dq8MWip0AtFn9dfwSSybphvOQcS1qWjw/sd8jB
	+4UoH8B2wJg77mrOFu6GEGOjilNGP9tai60lSLrIkUNcjsqO4Jh3Y/PuGLetgUoE
	WrZdykr4flz3TaRbTkwYnyPMzWVwtB5QMLN4rZVbc76grduDcrl9faRejwTQkWUV
	q7qAfSs+dyh+O6pVTmSq5/j5DfI4liUHJ64eP3ZcAeQoXUCE/uDt7xqmbfCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714125192; x=1714211592; bh=29xy7Ut3TeXlQUH9Yfv8XfcYZml9
	CkO2wIe+miQzJWk=; b=Ye3m14Z14U/WfzDL/EvqfZTzl1IDzpjtYw4zRvE5NJaA
	JnvkOodO/ihpKwB2Su1X721JaFQfYqHQdVKuKrafBLvCRtg0C+ri9Nq5LyrEFT/p
	Gf8H8jEqj8ofTFuEvx+UyUyq5cw9LyVdPmZ7Spz2q3sylC/P1+gTNoZm2pEKJxN1
	mZl0ZzTJMMftAN3eH30TiuCh9VeqpiBXvEeJ7uIF05AcutBAej7UBwHaP0TPQR8g
	YOHhyTCO0XHWRBQvVwA6uWKtGZwN0K//SFNnyWaU76wSv1HbqWIkATUP3JJ4IilB
	4o17hTJDBjS5uhmN7X50ccx17xdg9Ac6ed8hEgT6ng==
X-ME-Sender: <xms:h3krZpZiwzJQCy7pRM0rZUNWfAbvbBOE3gcqyF3OHSgK33D7GW2NOQ>
    <xme:h3krZgbaAWZzAw-x6jz1ZDejLVgeueQ4akZ6Y7DEgGDrZZzTP-B85ibz4HwFGwsR5
    7Bjo1CQ3XXmmA649A>
X-ME-Received: <xmr:h3krZr-Qk0GAvkbLNr1Mg8xRICKm-pypRczCSmSDby7tTF9cL7EhU9L5xTzchgbGGZVGAykXRsDAFbkprzJPct4pkgn6o-kg_YYi4W_gWKW9kJ03>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeffjeetfefgkeeukeeihfeuhefguddvtdekjeeffedtjeeuieefvdfhgeffleeh
    leenucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
    shhtrdgtohhm
X-ME-Proxy: <xmx:h3krZnqn19YRpVoAThOoAOqzntPRSDc877bk3X0B4Nla-AkoWJpOSQ>
    <xmx:h3krZkqvBaezWLyJYdv0OUZpBvFVFWfaRS8yq8-xdDA2PTRTRWinpg>
    <xmx:h3krZtS6Bn7rFDnN0JQQfGfHcHgyaE1SG6HvZqj1-7qovUoF_dF5xw>
    <xmx:h3krZsqVxTqhOpF-9jtdraN9o_bCfEy4Jwz39591DOYNG0QiuJrs6Q>
    <xmx:iHkrZpQq0XM6rxRRqNKCyoVuxNh6cM_F3HQc4hFAPuX8Xd-RmlyqFZxC>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 05:53:08 -0400 (EDT)
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
Subject: [PATCH v4 0/4] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024) support
Date: Fri, 26 Apr 2024 21:51:38 +1200
Message-ID: <20240426095141.13602-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Further revised patchset based on review with many more corrections to regulators and formatting. Thanks to all reviewers.
Changelog inline, original cover below.

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

[1]: https://kernel.googlesource.com/pub/scm/linux/kernel/git/lee/mfd/+/d2ac3df75c3a995064cfac0171e082a30d8c4c66

Ryan Walklin (4):
  dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
    device variants
  arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
  arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
  arm64: dts: allwinner: h700: Add RG35XX-H DTS

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 347 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-h.dts         |  37 ++
 .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
 5 files changed, 455 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

-- 
2.44.0

