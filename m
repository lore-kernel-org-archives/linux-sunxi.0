Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B57634
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 00:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917910; cv=none; b=pdqX5ZtgMX0r4HQrPgKsLMRN3oYO3b4r3hT8bBFMpsdg3Kh6mggF66oNganMOIM4jqRjkZTcUPTgknQimeW9SEGqCecQ5amzlgRADMDA2mQiepkh+iQ2BRKuSkVulhAzT0K/6qqqipjm0mz+xqVjKAIx8OXgY+2OnYFH3iDvL+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917910; c=relaxed/simple;
	bh=Kwxoqslf+5MDAcU18TovITR5A/HZvn4uDwX9E09Ey+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYi4kVxkNSRgKOWPcKPjDwyfWkOBxTFMuVlVaLJMeZWohLTTwlJ9ypo2yuP1dp4qACswRCYJQH7hnSzDWRHUYaOAQpc2s6gnSV8ljC0g1v0EE45pn5T5waPZSiB1sJo7ag7R0ZJwFU+DBGsATHTlup6FI5nVR6/elxespUJHL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D93339;
	Tue, 23 Apr 2024 17:18:54 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B38123F7BD;
	Tue, 23 Apr 2024 17:18:25 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 0/4] sunxi: devicetree updates plus new boards
Date: Wed, 24 Apr 2024 01:18:04 +0100
Message-Id: <20240424001808.14388-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the Allwinner related devicetree files from the Linux
kernel repository. The files were taken from Linux v6.9-rc4, and
adjusted to increase compatibility with older kernels.

This also adds board support for two new devices: the old Remix Mini PC,
a TV box like "Android desktop" device from 2015, and the Tanix TX1,
which is a tiny TV box with an H313 SoC.
The DT for the latter is preliminary for now, as it hasn't been merged
into Linus' tree yet - though that's supposed to happen in about a few
weeks time.

Please have a look!

Cheers,
Andre

Andre Przywara (4):
  sunxi: dts: arm/arm64: update devicetree files from Linux-v6.9-rc4
  sunxi: a64: Add Remix Mini PC support
  [DO NOT MERGE] sunxi: dts: arm64: add Tanix TX1 DT from Linux
  sunxi: H616: add Tanix TX1 support

 arch/arm/dts/Makefile                         |   4 +-
 arch/arm/dts/sun50i-h313-tanix-tx1.dts        | 183 +++++++++
 arch/arm/dts/sun50i-h6-beelink-gs1.dts        |   2 +
 arch/arm/dts/sun50i-h6-tanix.dtsi             |   2 +
 arch/arm/dts/sun50i-h6.dtsi                   |   7 +-
 .../dts/sun50i-h616-bigtreetech-cb1-manta.dts |   2 +-
 arch/arm/dts/sun50i-h616-bigtreetech-cb1.dtsi |   4 +-
 arch/arm/dts/sun50i-h616-bigtreetech-pi.dts   |   2 +-
 arch/arm/dts/sun50i-h616.dtsi                 | 155 ++++++++
 .../arm/dts/sun50i-h618-longan-module-3h.dtsi |  75 ++++
 arch/arm/dts/sun50i-h618-longanpi-3h.dts      | 144 +++++++
 .../arm/dts/sun50i-h618-transpeed-8k618-t.dts |  23 ++
 arch/arm/dts/sun50i-h64-remix-mini-pc.dts     | 356 ++++++++++++++++++
 arch/arm/dts/sun8i-r40-feta40i.dtsi           |   7 +
 configs/remix-mini-pc_defconfig               |  14 +
 configs/tanix_tx1_defconfig                   |  25 ++
 16 files changed, 996 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h313-tanix-tx1.dts
 create mode 100644 arch/arm/dts/sun50i-h618-longan-module-3h.dtsi
 create mode 100644 arch/arm/dts/sun50i-h618-longanpi-3h.dts
 create mode 100644 arch/arm/dts/sun50i-h64-remix-mini-pc.dts
 create mode 100644 configs/remix-mini-pc_defconfig
 create mode 100644 configs/tanix_tx1_defconfig

-- 
2.35.8

