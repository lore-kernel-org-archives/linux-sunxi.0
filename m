Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9F715CD6C
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713437389; cv=none; b=cLdG3749/btElnRKuqEbVor1bZ8/vP7XWD79BiEeEDaZXAhgszTN0NkURI07j99A59kP4HfKEkY/hL6e2nc62VExBPY+xpdJHAgccQIEAS6FSsABnSpfDT3dknCTXGVP3/OYSDhGD2Dj1GnuJQxxQNAH8ldEdhXDnKM7RICe1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713437389; c=relaxed/simple;
	bh=opLM3QcKdXQUrzPJMiT/HboRpdIvBiZ3xNW1cxbTDnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e5wkV5qIoh6B6cQ+ysoUeXa6Iw86sPVJe9N5daGY+cuhWKpRSvFse2QfIezEn/i4+BoF5BCpvtvmOY7KKkVOoB9EiZ+jYl6xgx3B5oVOJHh0GP5kIRU+pRSPMY7eMing7QI6qGKvVKS09tK32kPydx2rQZOPv0LUWplqiwS0s9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44EE4339;
	Thu, 18 Apr 2024 03:50:15 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 354923F792;
	Thu, 18 Apr 2024 03:49:46 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: Add Tanix TX1 support
Date: Thu, 18 Apr 2024 11:49:40 +0100
Message-Id: <20240418104942.1556914-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 just removes the premature OPP header inclusion, and adds tags,
otherwise it's the same as the previous post. Based on sunxi/for-next.

==================
Tanix TX1 is a tiny TV box (60% of a credit card) with an Allwinner
H313 SoC. This seems to be the same as the H616, just the "bad bin"
version, limited to 1.3 GHz.
The box has no Ethernet or SD card slot, which makes booting from it
somewhat interesting: Pressing the hidden FEL button and using a USB-A
to USB-A cable to upload code from a host PC is one way to run mainline.
The box features a minimal set of peripherals: one USB port, 8 or 16GB
of eMMC, an HDMI port and an (unsupported) SCI S9082H WiFi chip.

Patch 1 adds the DT binding for the board compatible, I refrained from
using the H313 name here, since it seems to be functionally identical to
the H616.
Patch 2 adds the devicetree.

There is a blue and a red LED, both connected to the same GPIO pin, but
with different polarities, so it's only either one of them enabled.
I did not find a way to describe this in DT, so I omitted the red LED.

Please have a look!

Cheers,
Andre

Changelog v1 .. v2:
- add tags
- remove premature opp.dtsi inclusion

Andre Przywara (2):
  dt-bindings: arm: sunxi: document Tanix TX1 name
  arm64: dts: allwinner: Add Tanix TX1 support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 183 ++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts

-- 
2.25.1

