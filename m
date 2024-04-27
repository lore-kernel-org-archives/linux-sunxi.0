Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E0C4AEF4
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714215966; cv=none; b=iHbEEgRAP2whHVFxR+kRLmtgkJgA2tZyXgY9BnmRCFV4NbHwi6xQgJpGC7y1j5lFdPGiFfMkSN8NKXmkQLsqs8npxhGxWsflQCwFz7hlLvmGnTGcTHoHLUa4AfiD+HjNNLjd09MwfonbUWjX1+eVbo3VSa46QbIVJK2e+fCOJDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714215966; c=relaxed/simple;
	bh=0WIsLHiOcqVF84HqvvxsDerfX2xR7P399LZdvJ+LvMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kpGmNJ/cZ2k93aXV0o9smIANEjvz9p3fLkZlBt9WggPkC/B73QmoGcxC4toZbG5vujijK/MUYVvlXaHEKk2raacaRCS8e0sTXgrcXMd3TASm+RPh/tmHc5V1ig+ZNVND/ZBz9zLnq4Mmvu0FZIu9luRJ9wjiNLP3Q5N27KuVw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=VkFqTkuX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=appwYFtV; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="VkFqTkuX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="appwYFtV"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2A2111380234;
	Sat, 27 Apr 2024 07:06:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 27 Apr 2024 07:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1714215963; x=1714302363; bh=XOhe84Yemf
	o172hmmyy3200OP2PXy1AwHTL2VyQHaBk=; b=VkFqTkuX1IBT8HGy0RKehzuwcA
	8n3W7IBmsQB08W6tP8PPYNUeGSQ1XKJy6HLuWFoydZf/nHcmqB6aQsrhqmSSc8wg
	jbETxzLXAJVBVsLFu67uDtRHMO+wioby/sqRgNj31k0WJSfSofUkD8uJxW+CExio
	4k/omM8drD33hOTdSFpyQCjnwxeDNhu1QzcGI9/Tjh7HOzynSNOXGIrGPkVlThvs
	2cSbPjTcebNhJGBKxv0BPfBu8xqrTQ0sYquSFUr5qsxpQAnfel76XOiMl+nzzUUZ
	qGKOcNvLbI+4VOJP9u/oVHkOEfWn1iDgAO0BLb4oSYY3sJXGucPkWBmXVDzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714215963; x=1714302363; bh=XOhe84Yemfo172hmmyy3200OP2PX
	y1AwHTL2VyQHaBk=; b=appwYFtVS+SsSiWoPrXXaWjOVggFajDFq1xNCIC0JaxQ
	0JhH8kRSVlYKWkuiK5lAxblthUEROGtHh+gFNuplemAi559gJgAsvhBHVdUZYjw5
	1nCoSPS/BmUKyyzKWAqyVHp0UfAEiOgryTT6kvy4oNG9VOp/Y0DJGacmXcAbtagA
	YR7wJUZa+kE/6AVPKll2Fp6SzTiEE04otBGTbobkOXQieQKn1aoYi9iPDWAZXo9R
	DtJgnFHeyOI1LnK8FwRiZeOSFHqP5S6Ymc4pZ2t4xAgkyHhc+e39d7EiXNLMu4q6
	ahkgIQJFXCBa0NdzL3KwI5gSFFuEZZhCZTJ6riXqjQ==
X-ME-Sender: <xms:GtwsZh4omE4IDIC7Kl7FOBRiLIlN4CLRCre4y4SHvUVV2-7SPntgpw>
    <xme:GtwsZu4kcnJOxZFmgDX-dTU8pJQukMFeVRSjvlYa53COVulvhZ1Ivq4HLNWo45eer
    0TzIncM6kquXpgM2g>
X-ME-Received: <xmr:GtwsZoflj66LHfB-hFkHeDH1bL4CU4UQxfrvJFXmo-HatUMt6J--OKCjW7DM_lrRljZOQE0boPb9dK0YqMwr-3_eBScwRlxCcLC218qA6AR-u2y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtuddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
    rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
    gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
    grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:GtwsZqJw04qo4b_GvwAODCW1rFKNUcinL4pnD1xhK4lxDRn7y8rNIg>
    <xmx:GtwsZlJF1KA0kHaeUaGIJWQpGviEJvukH3lro-QtJHNO86czYP35Cw>
    <xmx:GtwsZjzMJ7XiOUs-kxnZZYC394i7zTjltG9c8r50ruQR-uWWOEy0sA>
    <xmx:GtwsZhJvXaXdPojfN0iqm8kTktgMMb5LQh1EQv8BGYKUxU3zx5sX7A>
    <xmx:G9wsZvxleZj5yLKq0SZDMJsmbMNlpTGA4xo5_vuhIE0I2LLZPS1HL57p>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 07:05:59 -0400 (EDT)
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
Subject: [PATCH v6 0/4] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024) support
Date: Sat, 27 Apr 2024 23:02:22 +1200
Message-ID: <20240427110225.727472-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Further revision with a further few small formatting fixes. Major v5..v6 change is removal of the SD2 card node, given the requirements for low-voltage signalling are not fully elucidated and 3.3v operation, although working, was reliant on incorrect regulator node definitions.

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
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 327 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-h.dts         |  36 ++
 .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
 5 files changed, 434 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts

-- 
2.44.0

