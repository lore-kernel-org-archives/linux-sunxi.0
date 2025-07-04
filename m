Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053774501A
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643658; cv=none; b=YLmzH5InsMiRGSVDzPUHWdF5DZO52Cy2Y+sx2NTPoCdEQHuhWxiIdcwTvKzh7gy/xLdCFv6YilczDt3JRePcb+vg6H697/7FnSLe1lB7jfqowx5y65WsTaiLY0sfgqofYDHK21bTiYquIZYdcRCjTgKxVpGv6vUrBWlTrx6mcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643658; c=relaxed/simple;
	bh=vUycECx1FAV46dVJKyg/ExNOgR1wMXGEYVNv3Op+fLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ewe2+iRrr6UcrGzrR9WbayevsbwzbwBQ6UKNGfIcbKaEPPVmgwxeYUjHiQHhD9muobrFPXedN+7eboWMOYWS/NTroRUNz4Z9PpjL0YRwWFUsNE7NLPdLqNLSZt4cHH5I7VCwU1cJfmwpP+NrlCrjrAZPFDtJLNWUqSzqCmge0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 76FF71F0004B
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 15:40:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B1CC8ACA64E; Fri,  4 Jul 2025 15:40:45 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0F26AACA59D;
	Fri,  4 Jul 2025 15:40:12 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/2] clk: sunxi-ng: v3s: Fix de clock definition
Date: Fri,  4 Jul 2025 17:40:07 +0200
Message-ID: <20250704154008.3463257-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The de clock is marked with CLK_SET_RATE_PARENT, which is really not
necessary (as confirmed from experimentation) and significantly
restricts flexibility for other clocks using the same parent.

In addition the source selection (parent) field is marked as using
2 bits, when it the documentation reports that it uses 3.

Fix both issues in the de clock definition.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 52e4369664c5..df345a620d8d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -347,8 +347,7 @@ static SUNXI_CCU_GATE(dram_ohci_clk,	"dram-ohci",	"dram",
 
 static const char * const de_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
-				 0x104, 0, 4, 24, 2, BIT(31),
-				 CLK_SET_RATE_PARENT);
+				 0x104, 0, 4, 24, 3, BIT(31), 0);
 
 static const char * const tcon_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
-- 
2.49.0

