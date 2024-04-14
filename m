Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31421A02
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713083784; cv=none; b=dki3qJY4CFTikeN82Wk3wxEVk1elPzR3Xr1axqTt+fe9RfjWIY4pZrY2aAWLgjHLgfazjaPqjDKIXg739nnuavlkayPsDQ1u1wcyc6JoAsKnoFGXCFAIJ/9l8BPxYBwj0e5I8VH4vrcv7X8jUtXDVpVudCbdh5G9p2S6rxqHxc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713083784; c=relaxed/simple;
	bh=tR0rAHU9Ax/ZKMiDOXRZd2iNsa6a/nusyMjfuatnidY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZMub6RiiweMN3Z00o+mYfCJmUTi1fIDtPQLAigEkvd3otmvOz1yLnRhyyYkLhFCZQZj+l29AXSWMVgASyhkMm0rGYhhR0khC2pG7f33VJ5UX7EFqugdH0U/0/py5xZcK1YNLlVi4DAtgogLDw0wuoqMkM4oJvGFFGzQWBGUeFFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=HhvOVq0t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dKcRDWfo; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="HhvOVq0t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dKcRDWfo"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 54BDF11400FD;
	Sun, 14 Apr 2024 04:36:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 14 Apr 2024 04:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1713083781; x=1713170181; bh=QZBmqAotOO
	cma7MOBOwouaAJ5DkzYSBJfuTxvx4nDlA=; b=HhvOVq0t2NdR8Ub9YjiEWKZw5E
	WdhfiFnaapMdjV2KYjMSXTw70tWdUXxV1emRoxbG/M9Oac+8Po0gr3xIs/8/ZNJs
	4CQJ8vr/C7DTAZlkLM263ND9tRJnJSehCWpX8KqXapI95Edd2m7awYRFhoUJD66N
	pwaTArLhnUWRbV+iB8LUubq5SxSqSwFRPWfkyo4xUhL92rT9nF1V7kfhHNJ1ESnI
	Y0btxCBv8y2mLULxtiaDY5SnokDAdhCAz+KxjijfTbgccGiRGi74qUvzFevKSEzC
	5U1cQ3M5GZo5KVWiNRn73b4Ywxo9k6uFgeUkeTvcoVb4q5M6CcS5G6x6F9VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713083781; x=1713170181; bh=QZBmqAotOOcma7MOBOwouaAJ5Dkz
	YSBJfuTxvx4nDlA=; b=dKcRDWfomTWe1vjO0B1avfh+lmGVAmKxCfA2qtN+qQpV
	/9bsw2kcSNhvCydA+qiDsao2O/SPA0xqd6B/ug4giuEXsqNc93j5M8WxZatXqkrx
	kLqabBlp1kE775OFmmPdvMxdPM2lONCscc+ntGNMcfMRmUtHpAA3sjqa6VMlr50k
	f9TEPwMElFkXODhHdTPB8/v7ZALP7xNvya+cqsof/3xlSp6Rh9DHRrzMVEIZFqjM
	gXgqwCHrFvatprnaXiAxclRItYh4e6vrIcVMKLEkVWWNYtZ057sN7tGk1CRt2p95
	ueKyZIoFLh7nwUqi0kAkLTfR5Q73qHsmmr6cUyhJTg==
X-ME-Sender: <xms:hJUbZucJgvkR6nfsQQdw3BCW7RBHnl5e1slCTbhOJuWz-0ZMlRvyYQ>
    <xme:hJUbZoPdLcy2uN8HLUNHrvayhbaC0aoF1iCsxC363VTj3pJV-0m5gDKPp0lf34fCk
    ydR-E5TAr2NAUS0DQ>
X-ME-Received: <xmr:hJUbZvhar-rwORUWUgeOs9IaeivH8S-P8gA4qZPe7HMo7UNbORNm5Ch1AcaYR1eyySgxlfKWP7NqobfxLEJmEToz3JxEIvfxpiSsA7tbBHiqU4qX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiledgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeffjeetfefgkeeukeeihfeuhefguddvtdekjeeffedtjeeuieefvdfhgeffleeh
    leenucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
    shhtrdgtohhm
X-ME-Proxy: <xmx:hJUbZr_356mT8kWCBfxaTCjPrPKXTqK09mf_OfWSxMWoue-3kETqGg>
    <xmx:hJUbZqvasQLXuZwxIXpmTJbdTPowCijNp27qimdk92lhmuoDKB5qBQ>
    <xmx:hJUbZiFZulDOn5muWuSOv6pvUQqW2rFnShVMKURFGRHFCnVVC1cCUQ>
    <xmx:hJUbZpMqdQYgWMPLvOKJr8cfOtoJcigTOvjz29Oyh40367I-vUiNmg>
    <xmx:hZUbZiH2jPX0vSfZacyflGBtFjdWYKPoFMIDcGeFW6ovByZ_pjnz8efV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Apr 2024 04:36:17 -0400 (EDT)
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
Subject: [PATCH 0/4] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024) support
Date: Sun, 14 Apr 2024 20:33:43 +1200
Message-ID: <20240414083347.131724-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan Walklin <ryan@testtoast.com>

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

Ryan Walklin (4):
  dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
    device variants
  arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
  arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
  arm64: dts: allwinner: h700: Add RG35XX-H DTS

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 405 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-h.dts         |  38 ++
 .../sun50i-h700-anbernic-rg35xx-plus.dts      |  63 +++
 4 files changed, 521 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

-- 
2.44.0

