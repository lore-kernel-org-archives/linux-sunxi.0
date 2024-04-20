Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ECB10A09
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713609998; cv=none; b=oO17S9DqAFPUf0RxPEl35Dmy2xeVl1cjS2LN6iqb41td/WTX6MsQWddY4t9PYh+v98EnkBpxZyo27+/DTTID9yF2N/AjYt2ExjNzbpOAmYumvGMB0WU/6T0pgdC+XZ0ax5fkxarilDbRkByfakXrIWVik8sNbdaUDOM4Ly0MnMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713609998; c=relaxed/simple;
	bh=+oydJ1P4VEg8KRwamEs73qUeFgR9pj011MyCpQDZkPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+BM/tPmYqGVydaR69eLjqYvZzSf8bkiLiK0xQcIGbHCZnP4ud0+kwBkBJFftbE50rtULnffkXB4BsN8fURpzx77LfOUKpRPlnsuPA0JtQF09+4d1CgNvqEu4oGV805CHQu1w/o3EbInhnlFCBEj7Pws86I3Cv4oXaXNsf8jQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=n/aS+rEc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P7mz4zja; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="n/aS+rEc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P7mz4zja"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id D33071C000C1;
	Sat, 20 Apr 2024 06:46:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 20 Apr 2024 06:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1713609994; x=1713696394; bh=dbRLtQQRMY
	qByze6gh7/BRYEmZm78OTT1L0HVRXo8QQ=; b=n/aS+rEcv4fBC64Xh/kgGMgOFQ
	Jb70iCYAZfRY3W3qpKX8M3iBWR5Ag6kzWWSpulwBSypR4iTdwJdcvQRf04aDlq3w
	PORjpZpBgzonE71LbAxcJHNMcPO9CWbLq/i90yItsw/0IQmPANbK7ZCjyrn/OMW5
	NUiR3CtbQEViN3lS5MfI5SmOO+u9TWNl8eKGUa1JSa6cCKmYgzsCRQKTM+x+MfYd
	r1yX6rtIBtPbQjAuPmPsTVKPm0N6HFfYaMq98352ppFpSJQIffU++K+n2/D+wRJU
	OP89rAtLn6PA7zxYObfYAAusNXCXQ9a/USiwlJnJoRTzwruYgPZQWoqk81HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713609994; x=1713696394; bh=dbRLtQQRMYqByze6gh7/BRYEmZm7
	8OTT1L0HVRXo8QQ=; b=P7mz4zjag/ns6mWSUl/4+EBIbbTXQHziUnN43dvaXsWz
	0BgK4k9ZlU6hTdPc/mQwyfCETSlcVzgahLhJpiwKF3pVn3G9YbhvKyx53100CkgV
	tw4Oj5geyrnfsspjO/F+H+mGy21bVkEI/1tlmV6ey4VDHUqJCgaTM0fdjz6Pj3HW
	2KqjU63WL+iQxTzcHWUvSojortcWXrD+M4/GUYn0AhF1EHVK3V1d8ixL2J5cqS9w
	o9hphthCwQxaidr764Vzbnh5GLPig4Y7JdcmwBaCZgFkCSPRBPfDbyN794G/gkDz
	THIkQdPC5F/PBRL1v81U+zSTVQs9sc6/9aAQ3hwUZw==
X-ME-Sender: <xms:Cp0jZh_xeBpc4gccilWMqwUX-YG-sSl2RTmDXJ2nyafl_97k2FBTzw>
    <xme:Cp0jZlugqmBMwBaEYZbFuWxhYITOHNdnWNVPt4a2ThiVH3nYOZBJ1ticuAewAgfii
    TI_6L67m-XgiD05WQ>
X-ME-Received: <xmr:Cp0jZvBg_CnMyzgvJi_u9_otK0hZiQOAylGaKYuojbru7YYVmJxEL2nNZ27n9GdyYn5YwM_hwP_jHhe4onkPTK3FgeZXYc4nEZmueRXgMWA9uwXl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeffjeetfefgkeeukeeihfeuhefguddvtdekjeeffedtjeeuieefvdfhgeffleeh
    leenucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
    shhtrdgtohhm
X-ME-Proxy: <xmx:Cp0jZldSsGG2oBq52naX3lr47hsSQLMXkHj0GWD4OVIx98WWl82OIA>
    <xmx:Cp0jZmP9hJihHkiFjbaBEntFOjQ-1OdANZSuDT5m-by81xUdZ4rp6Q>
    <xmx:Cp0jZnlxcV7r4SQ7bHWSIpJ9OsZ2JzgGsiunOUpE6hmn60oelabj0w>
    <xmx:Cp0jZguYaR7VQCsGLMCNwyb1G1m28pJLZ2HpBiMPXZtz__GQ9HDh-w>
    <xmx:Cp0jZnnUGufxoouuuOmmR26jnnNmsljB2v4tj_-LKCo7xAIw2UxE53Dk>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:46:30 -0400 (EDT)
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
Subject: [PATCH v2 0/5] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024) support
Date: Sat, 20 Apr 2024 22:43:53 +1200
Message-ID: <20240420104354.334947-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revised patchset based on review with many changes including improved regulators and formatting.
Changelog inline, original cover below.

--

The Anbernic RG35XX is a family of handheld gaming devices. There are 4 
variants, of which 3 using the Allwinner H700 chip are covered by this patchset.
The fourth (released first and named simply RG35XX) uses an Actions 
Semiconductor ATM7039s which is a 32-bit Cortex-A9 chip with no mainline support 
and is not covered.

Common features (RG35XX-2024):
- Allwinner H700 @ 1.5GHz (H616 variant exposing RGB LCD pins, with 4x 
  Cortex-A53 Cores and a Mali G31 GPU)
- 1 GB LPDDR4 DRAM
- AXP717 PMIC (patches accepted in mfd-next - 
  https://kernel.googlesource.com/pub/scm/linux/kernel/git/lee/mfd/+/d2ac3df75c3a995064cfac0171e082a30d8c4c66)
- 3.5" 640x480 RGB LCD
- Mini-HDMI, 3.5mm audio jack, mono speaker, two microSD slots and USB-C 
  (USB 2.0) for power.

RG35XX-Plus adds:
- RTL8821CS SDIO Wifi/BT chip

RG35XX-H (Horizontal form-factor) adds:
- RTL8821CS SDIO Wifi/BT chip
- Two analog thumbsticks
- Second USB-C port
- Stereo speaker

Patch 1 adds the DT bindings for the board names, Patch 2 adds the -2024 device
as a common base, Patch 3 adds Wifi/BT support for the -Plus (and -H), and Patch 
3 adds the second USB and thumbsticks for the -H. The -H is a strict superset of
the -Plus, which is in turn a strict superset of the -2024, so this translates 
quite neatly. Alternatively a single DTS for the three devices could be 
considered.

LCD, HDMI, audio and GPU support are not yet ready and relying on out-of-tree 
patches currently, so will be added once these drivers are mainlined.

Ryan

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

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

