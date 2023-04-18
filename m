Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5251867
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Apr 2023 07:53:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 5204ED1B05
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Apr 2023 07:40:51 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id 39B58FF803;
	Tue, 18 Apr 2023 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1681803644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGdxm1MZfKiixTZRAK84Xihyd7IYkMPBrEsYiqEHj7g=;
	b=cvF9wZRMZo9QffL/EYafEymCRnRmfFhAqANyq0Uga3jWnhxlANUzXIma0oasCVdku8imLG
	tlyonZJHlrWzJo2n43gqZnR+mdaKosAu2UVqHLAZdWs9RNTWSa59+94amuxOukCxYvc1W9
	EfP354qSdQ31lO57wT8kAGb2lrBm59D2X27uBCBCpoBu8UfRAmG75JVCCCx0HT6w4RNRHk
	W3Q5UR7LocJKDqTqfV+sL8fZDVC9Et2s6jQ1m7zRAR/0qQ7NIZwbRQXo5rDqab+mUn7Ceh
	iGHnsIhBnVbyUTRLPI6zJTm2wYJkEGBz65ELKm6qNoifQv+D5JmZ/JV+iASlvQ==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Roman Beranek <me@crly.cz>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Icenowy Zheng <icenowy@aosp.io>,
	Ondrej Jirman <megi@xff.cz>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] clk: sunxi-ng: a64: propagate rate change from pll-mipi
Date: Tue, 18 Apr 2023 09:40:02 +0200
Message-Id: <20230418074008.69752-2-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230418074008.69752-1-me@crly.cz>
References: <20230418074008.69752-1-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagating rate change from tcon0 all the way to pll-video0 allows for
greater precision in matching requested display timing.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 41519185600a..dd6212286dcd 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -179,7 +179,8 @@ static struct ccu_nkm pll_mipi_clk = {
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
-					      &ccu_nkm_ops, CLK_SET_RATE_UNGATE),
+					      &ccu_nkm_ops, CLK_SET_RATE_UNGATE
+							  | CLK_SET_RATE_PARENT),
 	},
 };
 
-- 
2.34.1


