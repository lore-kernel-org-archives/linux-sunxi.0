Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611981;
	b=Xd48GXtWfOFYDJ/lPYPkkL3IXmXt9xvWfwYx8lJ32VaZjMxBi31hFBsVMKh85DatBlAB
	 VgNwvpO+CKHrYSfcvIhtKNG0Uo5N8afcekrtGrlr4yKDXEBTU4a09mQ5+1UX4s8YOzNvm
	 nUhfTdwPPDsdIQ3xhKGL+wW/OEL7gkbyBWhGBvsjuHq7tvK7OBoClGpJWuWhQmw0zmPbk
	 ZP7yPG/Eee6dXPUD8ZJE5NhuAyR4GBlkxpOI0/xJllsMq08ebR5GBhqNmZXTnCo+fxzkF
	 OUSHd4olUqZ8ou+XBDcp9m9JUyNQqVS+FNIvAbEGPLnJKmdbE8C/L5GSXBMzAwfYm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611981;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Jg8loi+2ynL/HcVXNJPBCeevVszZXfU1/mqjlIfP4CE=;
	b=LcJeXlh3V4ZBQXT47zZA22k6KvW0KLhbfxblqmB1L8ux1qaUtRskffZ7T33advgza3gZ
	 u8EyMwFK/Ls8fGE6ENaOcLTVVmH+d9ufFbtq8FT/zMCpXrt6XjDHgS6fWsgbeeAjuycTi
	 +yI0tPAooQ2krqhGSpKBx+ImoVKIeUgtlwvdxfl4wy/Sfe0BGpPWk/dfsCh8BkZkV1BZo
	 dmxk4vERtYXAsB9PC1BtwTjs9GNPaEbtE7SXcgCY6eLmQRRlLh7wpBZ+pOSsG3pZQf7wp
	 C8e8rU8+W9IcQRWIWsXX6un/pco1KBdkIR52WKcEfrNw2585HomlfHCFnTYuW/bBIOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=aJG9kLhb;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5C606A31E
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 13:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=aJG9kLhb
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2DBA44C949;
	Thu, 26 Nov 2026 00:06:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795611973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jg8loi+2ynL/HcVXNJPBCeevVszZXfU1/mqjlIfP4CE=;
	b=aJG9kLhbOziqz4bHnYF2bLyHdddoNAiSKiwgOQ/hl3XP8VBht5YenAHPpYdyiGbVo2taBp
	wEDmLsbvwhlxgISuVfSQ6z87enxMx8f3SOydnAa+9zzN/ZbK5sWNJoKaLE4V81ta/bI7yx
	wtvv83HJWSqie1ASTCGiRGeY4+htKeHoXQ6ZRBJVwHSIT/VQ6c4Yj6zG1OI5jW1h4UlrfR
	5TourmIwfpT3sTskmj4WggaQRjDx8MuZeC5Pfh7m+TZR7KP5bW9QpdWF4QyPb7XEmcOzJl
	v8yoaT36DA+WI29jul6LW1F3dJtjWrOVJsPyL2VP/YK3cYgXBB3oojTiTIapLQ==
X-GPT-Reason: legitimate; this is a technical software patch notification
	(Linux kernel style) that perfectly aligns with the recipient's
	personal/professional domain; the From domain (d-silva.org) matches
	the recipient's known mailbox (alastair@d-silva.org); the content
	is purely technical (stmmac, GMAC210, SoC support) with no marketing,
	urgency, or suspicious links; and there are no authentication failures
	or mismatched Reply-To headers.
From: Alastair D'Silva <alastair@d-silva.org>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/5] net: stmmac: dwmac-sun55i: Add Allwinner A733 GMAC210 support
Date: Thu, 26 Nov 2026 00:06:08 +1100
Message-ID: <20261125130613.4191841-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables Gigabit Ethernet (GMAC0) on the Allwinner A733 SoC
and the Xunlong Orange Pi 4 Pro board.

The goal is working 1000BASE-T RGMII Ethernet with mainline drivers and
bindings. Tested on the Orange Pi 4 Pro with a YT8531 PHY (DHCP, ping,
and iperf3 at 1Gbps/Full).

Dependencies:
This series depends on the Allwinner A733 SoC and OrangePi 4 Pro core
bring-up series:
  Based-on: <20261125124407.4098345-1-alastair@d-silva.org>

Alastair D'Silva (5):
  dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner A733
    GMAC210
  net: stmmac: dwmac-sun55i: Add per-compatible match data
  net: stmmac: dwmac-sun55i: Add Allwinner A733 GMAC210 support
  arm64: dts: allwinner: sun60i-a733: Add GMAC0 node
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable GMAC0
    Ethernet

 .../net/allwinner,sun8i-a83t-emac.yaml        | 136 ++++++++++-
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  |  28 +++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  41 ++++
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 230 +++++++++++++++---
 4 files changed, 389 insertions(+), 46 deletions(-)

-- 
2.53.0

