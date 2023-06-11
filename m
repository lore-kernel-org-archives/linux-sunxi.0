Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8F6FBD
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 09:02:06 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Qf82g1C9jz9sb8;
	Sun, 11 Jun 2023 11:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1686474123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yxavVTkiMowdP7zQF1qUAVlWmfkvPV68RHvZhsPS3g=;
	b=lQavwJ2wTt1AaLWwl3wPuVfxFeYPMInwxrXJwQd39ugE/gaa+DhLCxh+r7yczbCKkcP3K0
	cIZYpYzUDluSmD5eNwQAoDRpeb9QcV27//CfeMdkmRPvmY4xSc6ZeDimBXPuSO9IiVVilV
	OncUnzYoQ2dmmDRENiunTthW9DZNbmEoxO9Kn2rDIUopGPCAiHQU7ljlH3Suh5MaXACNJ3
	upBsRq9rYVfjLwLUlDKNF22pGg/EYtJzzqqwrnacUNVhoPjEydVtz7WZtopgoKId/rREok
	p1vmz0YpPQ4+xYB6yh71sY/dDUmcc5WlRgdqGjJHTnK899GyoNU2fnfGV1PQiA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Beranek <me@crly.cz>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/2] clk: sunxi-ng: a64: allow pll-mipi to set parent's rate
Date: Sun, 11 Jun 2023 11:01:43 +0200
Message-ID: <20230611090143.132257-3-frank@oltmanns.dev>
In-Reply-To: <20230611090143.132257-1-frank@oltmanns.dev>
References: <20230611090143.132257-1-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nkm clock now supports setting the parent's rate. Utilize this
option to find the optimal rate for pll-mipi.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index eb36f8f77d55..125ae097d96c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -179,7 +179,8 @@ static struct ccu_nkm pll_mipi_clk = {
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
-					      &ccu_nkm_ops, CLK_SET_RATE_UNGATE),
+					      &ccu_nkm_ops,
+					      CLK_SET_RATE_UNGATE | CLK_SET_RATE_PARENT),
 	},
 };
 
-- 
2.41.0

