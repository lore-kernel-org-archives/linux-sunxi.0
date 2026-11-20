Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171543;
	b=XzBDZlCH+wnkr1qeO5svFEr8PAn2V4DIeMBkf8sxmjb/jfCsAu9aePvvQZQHF6INgyqj
	 uksPIXOLA18R399QuwOQIrUmMTqGyj/YDVV5gx73Vz2umewSZKfLlHuMBrixVukollLqf
	 SllLicjZMQThSAbo0n1ltbeMjrSWEf1s3XpVQZbDE0gycgSSgkXupCD/IF0ufBlqa2+tI
	 WAGV/XZOkwTD6/pq7PgUZfVhY5xYEwOvxuZcBWrTcP0f2J6KQp/Ll/5qSNnx/ffl9eWaV
	 f4Xzt6MRt0hir8Fy8kYqSvZ3HL46LLXsYzvqmIBCk3FBgryyUa5JXVs/b41SJq7TF3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171543;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HCnOio5twE8g6FJ/XOxF2JrhL6bncpp5B/Nc9hcKOVQ=;
	b=hkTAsuXhaDcd4N10s76EOqZHf63g3YnWzU6o7NmcT2FCCHUlYZC6OPv01FoQEdcm0pDf
	 m4FF4Vu5DXBWEQCBbsUEVW5gbDCg6dFG7dOBC+A7dUvUkpxlIWuOR2MvvlN6UodCKeBhb
	 DtxxW+Iu2MRMH1/ey7dkC7kj1ro7JYsSQg604SHva1YWc1kGMd9OrtwRWq3Osz0mW6usA
	 TIk5Fm4ezD/rcBBKp3SlBiN/RVq66UclpULtQ5U623YU1ll6giqm7Lb0zXMxZ1tClhtUt
	 alr1DPHVabWgNZRgqDNSVDXn3TPHym4ljkC5O4zMcwAHVZ2v8DKQckG7zVRsZQvTRCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClgDnMVa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334AD606A337;
	Fri, 20 Nov 2026 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClgDnMVa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171542;
	b=DmZlSuZD5yXvSefFlXWTaTh1axkqqMhUB8DEhZR1Rik24foV78kgLcvpPjkKpBgIw5WG
	 s8TIhcGZmW1SHuKmOVtGhymudwa3ELBS5u86iFMY3HweifgazoV7+Cude5Klc7nSNVE0X
	 HfeLdHSo+5fQKrO0gMEF92HJi96+R+Sdei4ucmbFYxf6Zlj16AltmkXHEMjFMY69PIL92
	 Z/khUlOqu6u6LMcDe63Mvu+RzxPJeqxrmldxfmduojYG9xqLrJVUwCM7YSkBCvMzpjT1E
	 hSojc8667zHKKz/6D5YHlrDEz/5BcpOtSUmr83J058cZVxMTaF2pNCNmPVRkaMUa8yA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171542;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HCnOio5twE8g6FJ/XOxF2JrhL6bncpp5B/Nc9hcKOVQ=;
	b=vMx+/jnXJU4t2wSWr1sxIFySdv2z1k3C6gyGUh2Zb2ZQm8seq18lZeoQy1+FkCn6JFZJ
	 Md6F1wTr9cAQNsNNGwrlUeANUksW3K/buGfj/+0MCqh4NYEgMo4/dah+2sJf6bmoOzbBe
	 U+HYhsbkgJidmdQNxd8mVUZi5o9qPzi5oAC5yHFx5vEd9OGRgITqjt944SFwA6S1z3qGi
	 KWCTTQzibxYSmp2L0n+g0qhZ8G2/X+EVkDGR8NsYGCPYeZuplbESLh1aoyF02MTKd/qiu
	 Qv9G1bQfP9jowXNDsPdLN8DnyZBW8dTbH9V6ISI/GN0cYBw4qcFHwMideRa6Tma42XQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 043951F000C4;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171542;
	bh=HCnOio5twE8g6FJ/XOxF2JrhL6bncpp5B/Nc9hcKOVQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ClgDnMVaw+dIITxY9YzX260RAqAyyXUQIOKknzPm7NoubBTLAZgRu9ElVceQizlkP
	 +1wP0j1we6mMO+u7pubRslQo+z8QQQmFZRu2Zes/Xnh/DRsU+RSu74ZEg42I2HrMhF
	 D8wDKv/hHXDbayMUfajIxwYlJhADGs3CL8HqEntil3wp+tKCg//w6Ig9uCfXp58IAi
	 3TNXcUNhW3zggj6UW5uyK8muy5qZuSGHKbZmOBCKYUJaLoi4InQUYPvnIDZbgI8k+f
	 v8tNRD6931ifvS52QeY9THPnAQFqUHfioyXrI/ZcFxRzhxgZlczayUsAZn7/jBV5Dr
	 bwc9uNO0bIaRw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 76F3949808;
	Fri, 20 Nov 2026 10:45:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH net-next v4 0/5] net: stmmac: dwmac-sun8i: Fix the EPHY and
 MDIO mux ordering
Date: Fri, 20 Nov 2026 10:45:31 +0000
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrh3DTKUWV97DuChlqjVSDAWCM
 dzdihtijMufmf/+U0RuPUexXz1Fy4OPvgkpbNcrYS8mnBl8lbKgjBQiEsQ+aA9cGwt1P0JvHGB
 ptM4JC8csUvHesvPjjB5F4A4Cj504fS6xL69su7f5/r342DXtY94fcG78mxoQEGSmDe9YOevoc
 K6Nv21sU88DAy0J+ZOgRCjKpFKqJKV334RcEvlPQibCqqLaoi5yWVRLYpqmF0tVMYlWAQAA
X-Change-ID: 20261112-sun8i-emac-mux-uaf-1ba885219fee
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=3022;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=WJ/5m93RaYcJ6kzFBxoH9WTbOEaZuKI4g+7TKGt/avg=;
 b=lphcq+u8z/ZxON+fh+Je8MmEEU451tWNsOlrfS7Mk2eY45sEODdRt+4YaH9+pMVJZmTiH5fWs
 dloagX31biNDj3qaemOvPjfjzabavGjar5sDI060W354zN3TNI1IZvV
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Chen-Yu Tsai pointed out that the probe error path and remove() put the
EPHY clock and reset before sun8i_dwmac_exit() uses them (patch 1).
Sashiko and Maxime Chevallier pointed out that the EPHY lookup and the
mux registration run after register_netdev(), and Maxime suggested
registering the mux in the MDIO setup (patches 2, 4 and 5). Patch 2
replaces "Defer probe when the EPHY clock is not ready" [1]. Patch 3
balances runtime PM on the stmmac probe error path, which a mux failure
now takes.

Tested on QEMU orangepi-pc (H3, internal PHY) with KASAN; I have no H3,
H5 or V3s board. On net-next, a test-only mdio_mux_init() failure gives
a KASAN use-after-free in clk_disable() from sun8i_dwmac_exit(), and
unbinding with the link up oopses in phy_stop(). With the series both
are clean, a test device tree whose EPHY clock has no provider
(fw_devlink=permissive) defers before the netdev exists, and three
unbind/bind cycles with the link up pass. Without patch 3, after the
failed probe and a rebind the MAC stays runtime active with usage count
1; with it the MAC runtime-suspends (usage 0).

Developed with Claude (Anthropic); I reviewed it.

[1] https://lore.kernel.org/r/20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com

---
Changes in v4:
- Put the EPHY clock and reset after stmmac_pltfr_remove() (Chen-Yu Tsai)
- Get the EPHY clock and reset before the MAC probe, defer on the clock (Sashiko, Maxime Chevallier)
- Balance runtime PM when the stmmac probe fails (new patch 3)
- Register the mux through new stmmac mdio_init()/mdio_exit() hooks (Maxime Chevallier)
- Now a series, new cover subject
- Link to v3: https://patch.msgid.link/20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com

Changes in v3:
- Drop the Fixes tag (Andrew Lunn)
- Shorter commit message
- Link to v2: https://patch.msgid.link/20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com

Changes in v2:
- Target net-next instead of net, drop Cc: stable (Andrew Lunn)
- Shorter commit message
- Rebased onto net-next
- Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com

---
Arun Iyengar (5):
      net: stmmac: dwmac-sun8i: Put the EPHY clock and reset after the MAC
      net: stmmac: dwmac-sun8i: Get the EPHY clock and reset before the MAC probe
      net: stmmac: Balance runtime PM when the probe fails
      net: stmmac: Add MDIO init and exit platform hooks
      net: stmmac: dwmac-sun8i: Register the MDIO mux in the MDIO setup

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 82 +++++++++--------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++
 include/linux/stmmac.h                            |  2 +
 4 files changed, 48 insertions(+), 49 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


