Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22440F8E3
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686858; cv=none; b=f7PG+cgIOziC+l4jTnciU8lmFMunSTCvHwC9EHCFyoPEyZiArnd9RxAmxd1VzC8NUetMtL1c8i8bG7GacdS/cA/of8sKqxmyUCzK5UiAFhcEuiDDSmFr+vXuoZM/ZGkQxCnReyDgvbYKYYhlWKnf0NmGZlgIBNJ8uD21dZxLVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686858; c=relaxed/simple;
	bh=TafPgOcc2nTv/YH22/7uV9Egh8UNKJUA9qoHLND7WSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ss0F4EHfubr4+yQTEjfpcEfsZY+Febkn8Ay4ft9wucfKULN0YmxbhIsJ2eWhcs/FZ5D5PmSKdIo1ajmUcAT2o60sH481HouVwtnKun2Czo5YxuXEdhheWUOkk4LI/hw7EXZyNuElV4RwhCspaQJMK0ublGfjn9xzx1VGJkAFeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=ClNMai8z; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="ClNMai8z"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=BLaO+2WZkkM7w1NO3/wdLuY450WAdapOcCJC30b+bKA=;
	b=ClNMai8zqREczTPIudag91svjIONF5SL4q55QzqeT1UMj8lMS98L3vEIio3AyxWxd3rogld3t49umCi+BT/DCi7lSXa3upBMJDWTqEnJ+wHKdLhyRJ3IJ2cFerUxKprYRRNyajxXpdiWMQ0W4IVIfaGFWNcx3ndpitdtrh2f5tE=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Fri, 5 Jun 2026 21:13:59 +0200
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
Subject: [PATCH v2 0/3] Add support for NetCube Systems OpenNMC (dobermann)
Date: Fri,  5 Jun 2026 21:13:12 +0200
Message-ID: <20260605191322.1920944-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the NetCube Systems OpenNMC

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
 .../sun8i-t113s-netcube-dobermann.dts         | 149 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   6 +
 3 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

-- 
2.47.3


