Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC123BF
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 09:17:03 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id 866121BF209;
	Thu, 27 Apr 2023 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1682587015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBZh9CI93O6+fbjia0d6/4ywzhm2KDiLVkNXCWUzpXE=;
	b=EA7hqnKVxzellkcxsNKV3u/L4x2qcNVjbkn42IpcuWUoVlSSpg8kbYUXwbwti2l/YkCjCb
	jKmNW+qXgYfdZd4Y0YMVi7V3IxOJu9234sxTAyR+mvW1ToVwbGOUE8WQ4SDi7emQdr10Ki
	zj+vbWy0ahNpL8K+q9W35c+QUxtNbb/feB6Llh3129YA5CQA6icFAsaeIKLWeVNmDcOFaZ
	pU6Fbh8MHvf4ZoTI0Y/ygwNDrGCubbQ6hQ473Kps4UFSjhKWyoUPQkNA5Nq3LbqVi6UM7d
	UzmmOTCRX7ScGrYABS+MXo+qUpTuJ5kvuZMNabsGjswx+MygAyiH5SyCuSFgDw==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Roman Beranek <me@crly.cz>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Icenowy Zheng <icenowy@aosc.io>,
	Ondrej Jirman <megi@xff.cz>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] clk: sunxi-ng: a64: prevent CLK_TCON0 being reparented
Date: Thu, 27 Apr 2023 11:16:06 +0200
Message-Id: <20230427091611.99044-3-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230427091611.99044-1-me@crly.cz>
References: <20230427091611.99044-1-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCON0's source clock can be fed from either pll-mipi, or pll-video0-2x,
however MIPI DSI output only seem to work when pll-mipi is selected and
thus some restriction have to be put on reparenting CLK_TCON0.

Functionally, there's no harm to other TCON0 users (LVDS, parallel RGB)
in also forcing them to settle on pll-mipi. The parent will be assigned
during boot based off of tcon0's DT node.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 41519185600a..044f301a8c61 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -532,7 +532,8 @@ static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,
 				     tcon0_table, 0x118, 24, 3, BIT(31),
-				     CLK_SET_RATE_PARENT);
+				     CLK_SET_RATE_PARENT |
+				     CLK_SET_RATE_NO_REPARENT);
 
 static const char * const tcon1_parents[] = { "pll-video0", "pll-video1" };
 static const u8 tcon1_table[] = { 0, 2, };
-- 
2.34.1

