Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CD3B18A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Jun 2026 20:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779317; cv=none; b=mbDORoik+7Wro3l7t702rBuuiwU7wne4+kC2ZOEzNgiG6qLAmzz/aAQPoyOrHHxnBlEPFZjo9x2ueMLp+ZeYM1thrsfmxWTwK6b5+bew9fLocwBQ39fm/K9s2KsTnyo1AhJW/vBEbHfKPUEjdv/kmWfIESa0lAf9dy0qAodRaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779317; c=relaxed/simple;
	bh=MDFuXDEC0+TRcryVMmW9QZQjVy3dLKKLNjW031DPXHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivUZAbEwSAw16Ce7Sv5ifmG9IS138x/SYzi695v4UY48nor+ajDLCXqA4eQoXJ7Ik7vEfm5WCI5Fmtg7+wXL3258jtp/DBQbcDrC0c1fgttd4cIcfou4LgRQIof20WAREzOC+Xyv9eUXM0POojG4JCIlwFfYAjG+Cfxsblx4Pq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=r5zMAq45; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="r5zMAq45"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=zysp9UOZdYQfuJRmcjZPPdnKqn46r6J7N0CZfMxHtOA=;
	b=r5zMAq45/5Z11yp/G/J+9sop5mOoMLh6/SXq2vpDo5vPmSekLuvzNnFIKO03su98P6J7kiScr59CeEVPF9xU8zXzQtw514letH0xQi3lj3B6R3Bj8zNG0unV8et+fbqR8b6+yijgyIx7hz0jKXomvMaup+uHw53pPk8UWF2a8JA=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Sat, 6 Jun 2026 22:55:09 +0200
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
Subject: [PATCH v4 0/3] Add support for NetCube Systems OpenNMC (dobermann)
Date: Sat,  6 Jun 2026 22:54:40 +0200
Message-ID: <20260606205452.2386930-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the NetCube Systems OpenNMC.

Sorry for the quick resend. This v4 includes the corrected Makefile
target name.

Changes in v4:
 - fix the ARM Makefile target name for the new board

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

