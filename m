Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D42356C0
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907167; cv=none; b=HOGMO0Q4n5WR6WdNxuZEX2OGzbxRhE9NdQzAU0UQthF5dviN7/oOJXJXlTKUe8glrYBAO9oxTuMTwsk3Z8xOQ+I/r8JxDyw6Rr1g8fmTuQRQW3axZhc0X6HB3EoowTmFNOru7J9sQVy6d5O3nCCFa2d7vhG64jL82kx58PU7Ujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907167; c=relaxed/simple;
	bh=Lizooeyd51qbmPIGSbyVqtfzNGJ1X/J8tOh/qkk5VbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKoL4+56I4JEzo2B6xLBAEoGrc+LXEiU3Vaw77c5wF4jmBwuVPAQHoHq7164cjyFqM4mRzNNk9l4LE09BcAV7r4oHu4bn+WJ1qKeCzIKbGJZJrzvXsCdYUt/WL4iQxyAxYhVG/nXtOzlEcW20Hlbdw9Ce8VHJifDMpt2l8wCYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 26E311F00047
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:52:43 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9447AACAEED; Mon,  7 Jul 2025 16:52:42 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 2C0B8ACAEE0;
	Mon,  7 Jul 2025 16:52:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] Allwinner A100/A133 Ethernet MAC (EMAC0) Support
Date: Mon,  7 Jul 2025 18:51:51 +0200
Message-ID: <20250707165155.581579-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC0)
and uses it in the Liontron H-A133L board.

Changes since v1:
- Reverted the emac0 to emac rename;
- Added collected tags.

Paul Kocialkowski (4):
  Revert "pinctrl: sunxi: Fix a100 emac pin function name"
  arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
  arm64: dts: allwinner: a100: Add EMAC support
  arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 35 +++++++++++++++++++
 .../sun50i-a133-liontron-h-a133l.dts          | 19 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   | 32 ++++++++---------
 3 files changed, 70 insertions(+), 16 deletions(-)

-- 
2.49.0

