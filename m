Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708CF23BF
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 09:17:01 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id 078B01BF20C;
	Thu, 27 Apr 2023 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1682587013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0sviRPbOQNgwuuHmcHgQR68LQiPFHckMJxw1tVvt8g=;
	b=Pf17FxEEPRebkXUxlzOXxIkaKI7YiBs3V+PgDb/I/c1/M2lwj+SkdFgu8ICG7sOYTQraAX
	L6eCwbx7ivmTWrBPdSpjvp62+wPJHwRynL05zNPxZ7D8+EaceG6UIzwVRq3zndJjCjjDtQ
	aV0SfgBLwJRoPoEV7DIh6e4KADCVcfF/9iIJ993Rbx8j9ODzqb2sXJ/1KLZ84ebRv/6dlg
	T1h0sKHn6Ytsf9NFMx+efjtWJxXla45Q/ukw7QUWDzi6wOGCQujQpp1t3Vbb0RYa6tzUh+
	gOcThqrm9HnIskv9YrLk09DKxWdt0hEMg/GKGN5MVl6pI6LDk3mlU3CbEtcPGQ==
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
Subject: [PATCH v3 1/7] clk: sunxi-ng: a64: export PLL_MIPI
Date: Thu, 27 Apr 2023 11:16:05 +0200
Message-Id: <20230427091611.99044-2-me@crly.cz>
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

PLL_MIPI will be referenced as assigned parent to TCON0

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 4 +++-
 include/dt-bindings/clock/sun50i-a64-ccu.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index a8c11c0b4e06..35ab84e03e77 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -32,7 +32,9 @@
 #define CLK_PLL_PERIPH1_2X		14
 #define CLK_PLL_VIDEO1			15
 #define CLK_PLL_GPU			16
-#define CLK_PLL_MIPI			17
+
+/* PLL_MIPI exported for TCON0 */
+
 #define CLK_PLL_HSIC			18
 #define CLK_PLL_DE			19
 #define CLK_PLL_DDR1			20
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index 175892189e9d..5ad769a29c4e 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -45,6 +45,7 @@
 
 #define CLK_PLL_VIDEO0		7
 #define CLK_PLL_PERIPH0		11
+#define CLK_PLL_MIPI		17
 
 #define CLK_CPUX		21
 #define CLK_BUS_MIPI_DSI	28
-- 
2.34.1

