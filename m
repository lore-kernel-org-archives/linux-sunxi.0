Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6291B599
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707041469; cv=none; b=F3j9+3Ti7MOveiDh9WlDnOXgXu+gon8qxgUxPsNMp7/7hrMUIc7GE0Z5lTxU8iexOKmoPLd/YZJtlMZbEV52T1twsz+OMstLcBiK6YtUX9XxFOWUcpcbzbZIF0iVIRY2D7EXESZ81TwdDQmqPWwNaBDI/cmDBsfrciTVYiuozNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707041469; c=relaxed/simple;
	bh=W/7h9ojC69Bs5mBW6yAlmhJb3ygp8u+JdwKJN7IWVvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SgH80MIOQcwaAY1yVImibrpvO+POPkaELPFOy4hECVDNBbDxmHMqEswmjMOSQx/kdgB1VL+XFGkrUMBICqp2sJ6LhenBeFg9ihB0rC8lWuBEeKATwy+VBctdHPnOALh7wLsXiKYmv3cN+DG+ovrHszQsKB8VXDrCT3U075lB7PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D385B1FB;
	Sun,  4 Feb 2024 02:11:48 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A8C63F762;
	Sun,  4 Feb 2024 02:11:04 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: Add BananaPi M4 Berry
Date: Sun,  4 Feb 2024 11:10:52 +0100
Message-Id: <20240204101054.152012-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor update of the series, addressing the comments from Jernej and
Krzysztof (thanks for the review!), for a changelog see below.
==============================================

The BananaPi M4 Berry is a development board with the Allwinner H618
SoC. It comes with 2GB DRAM and 8GB eMMC flash, with the usual suspects
like HDMI, SD card, GPIO headers. There are four USB ports connected
via an on-board hub chip, and a Gigabit Ethernet socket. Also there is
a USB WiFi chip soldered on the board.
More details: https://linux-sunxi.org/Sinovoip_Banana_Pi_M4_Berry

I don't have this board, so this is a "call for testing".
One thing to consider:
- The USB WiFi chip has a CHIP_EN pin, which can turn the chip off.
  It is pulled up by a resistor, so works out of the box, but is also
  connected to a GPIO (PC2), so the chip can be disabled or reset via
  this pin. Since this is a USB device, we don't have a DT node to
  announce this pin. Any ideas how this should be handled? At the moment
  I ignore it, but it could also be modelled as a USB VBUS regulator for
  USB port 1, to which it is connected.

When testing this, please have a look at:
- Does the eMMC work in HS200 mode? The vendor DT described that as a
  3.3V controlled eMMC only, but clearly the schematic uses 1.8V, which
  allows faster transfer modes. "hdparm -t" should suffice for a quick
  test.
- Do USB full-speed (aka USB v1.1) peripherals like keyboard or mouse
  work on the USB ports? I disabled the OHCI node, since the hub should
  not need this, but it would be good to double check.
- Similarly the USB WiFi chip probably doesn't need USB 1.1 modes, so
  please check this still works.

Apart from the missing audio and video support (which are due to missing
bindings for the H616/H618 SoC), most of the peripherals are supported.

Patch 1/2 adds the board compatible string to the bindings, patch 2/2
adds the actual .dts file.

Please have a look!

Changelog v1 .. v2:
- rename 5V regulator node
- rename switch node
- remove unused USB2 port
- Add ACK on patch 1

Andre Przywara (2):
  dt-bindings: arm: sunxi: document BananaPi M4 Berry board name
  arm64: dts: allwinner: h618: add BananaPi M4 Berry board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h618-bananapi-m4-berry.dts         | 223 ++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts

-- 
2.25.1

