Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536EC2F691F
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Jun 2026 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773445; cv=none; b=H7hLgZvXl3wC+LXtmc0Zaleqo2J38TY168VWZ1iPbbKBqG2RQun69grLonGLVYB+Auo3esdUe52hDFDYdeB9ofcZ94Qz6Sb+NZPn7tK8Xt9g33A3uwqnyencd1+BJEgCDD97drLtZihHpiQgZU7GacZboraD24Bk+uW+ajj17xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773445; c=relaxed/simple;
	bh=aHFs9+yKrc6F6MP+eBXZV3bWGP6ZzEYoxbFHKtnNWUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sDOSSM5TswRZRTfLlq6Cm6yjqUSzA5Yko87s3cl31qi6fq0yNMuDMHpkaf6l94sCDKKkgR2pHRh4tdVqrhVX1hpaU2PtcympADg7hfZLwartDppseMI8Ju4l2iklIX1GhTXh2q2OeV7vrAcvMTHmo6pVjP+evVPrYPjJQ0n2Ldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=gf+kDDP/; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="gf+kDDP/"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=WbCTOBAz0hMs5qLKWoWlLYd4WkBDo6+l7gdm17WIIAA=;
	b=gf+kDDP/p5tBNakn8jZPJHzj9SJXxRCOolKH5/zQ3xwQTEv1lpr1w/ReWDppj4Qd5MO+geftEOCGP0stTFsE4Gl4qgpFDkagSTzycqiij6yIZwbSVAVoC+YBeBSdCmSNZeazOUb1qSy2GZT/570CGfSkq8mJw5X8f1APYVulOM4=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Sat, 6 Jun 2026 21:17:09 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for NetCube Systems OpenNMC (dobermann)
Date: Sat,  6 Jun 2026 21:16:38 +0200
Message-ID: <20260606191649.2347704-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the NetCube Systems OpenNMC

Changes in v3:
 - actually add the Makefile changes

Changes in v2:
 - fixed ordering of compatible enum
 - fixed gpio line names

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (3):
  dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
  riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCube
    Systems OpenNMC
  ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)

 .../devicetree/bindings/arm/sunxi.yaml        |   1 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../sun8i-t113s-netcube-dobermann.dts         | 149 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   6 +
 4 files changed, 158 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

-- 
2.47.3


