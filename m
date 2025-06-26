Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503A25B677
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925436; cv=none; b=V/mcQFkGdBusQEsCmemftXNPoDAvb5WmorLTW95QXZsbP+yvoBx3ZOHNgRjZ8FwxT+AsYbk287Z4OOLD+TyUUNNyiSO3Ghb3Uafd3DeNmaVhJ1jOmDm6iy9yWJBbvKxr/RAwr8TTyv1YroTNGjLdEhx5x3Xh6Jpt7XtgRIuXPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925436; c=relaxed/simple;
	bh=5kPFPNPSF57v8asqh+vVTCyktQ+xIYKtEmLuOa6VCVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgoO6qZAdVVE/H9CtdEokn/NvkKI3EXWlEH2ZbaxX9hLrZ3qkyvc266cnYOBUkwgsugcOA7FuCBs6G3CB1Ky2YSBlo0Ru1n+Ehis2uE3gqY3WMbkGuz4kAytXNPUb0MnuwAmW6FEG+6w5rzbUrqk6deLAIcIK4sjPj8TkWQ8nd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 21BD21F00047
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:10:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 37A45AC7F7F; Thu, 26 Jun 2025 08:10:24 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id EA652AC7F75;
	Thu, 26 Jun 2025 08:09:37 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 0/5] Allwinner A100/A133 Ethernet MAC (EMAC) Support
Date: Thu, 26 Jun 2025 10:09:18 +0200
Message-ID: <20250626080923.632789-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC)
and uses it in the Liontron H-A133L board.

Paul Kocialkowski (5):
  pinctrl: sunxi: Fix a100 emac pin function name
  arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
  dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
  arm64: dts: allwinner: a100: Add EMAC support
  arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../net/allwinner,sun8i-a83t-emac.yaml        |  1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 35 +++++++++++++++++++
 .../sun50i-a133-liontron-h-a133l.dts          | 19 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   | 32 ++++++++---------
 4 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.49.0

