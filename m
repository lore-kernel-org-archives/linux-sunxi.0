Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19F17D1
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 06:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1650780010; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G89X2QBmE4EgM05XnfpsouYFoZIwMCV4C80WgFtSCHEqtJ1USTKQNGd75ZfgyKFfA/VR+4LaG2l90nRU4ptZDPGbIquuaCq/gh0yYuzFtkuQyQCQ8Xpz8j5aPQkm0PUpx0kmj00glUINx4wBOK4zo/NXy2Psfri2kL3itnB1IHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650780010; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=pq60l/Yh375tVKL8zIdox/f7EvRbMx2DWdqcnGIxLow=; 
	b=my5c5RvIj2i2qc6kQ8YLW6odsXvMl+pdBiN+aPMZdcg21ecrA9g5Mnac3ZSAWWd+wF6k6kWEgyPnKPp0wVtLbAXfQJLzODPIg9HKk7f2yERMXQ+6Xm7s1d9QfxFTXSAnCMxzBwJK2YACb/qXYJ1ZRl2SolMk3MgNQLv0qE3MLgM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650780010;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=pq60l/Yh375tVKL8zIdox/f7EvRbMx2DWdqcnGIxLow=;
	b=JpEonNAv7xyTDgfxMVHzMV1Qf9VYuiUBA09QEAYdS5WfHIpAKRMHGKWVaHvYHRKO
	0FZo3Cter02dJQMXBir09R/RCF4bDvYK5a1wcfEpKZ1y0zaZdCotmkgIbqB3unYXgxT
	EEC+lp18e3PfzcsLeHx+q1kzin2W8zWCaEHGYKNc=
Received: from petra.. (64.225.114.122 [64.225.114.122]) by mx.zohomail.com
	with SMTPS id 1650780009289608.5266651606395; Sat, 23 Apr 2022 23:00:09 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] clk: sunxi-ng: ccu-sun6i-rtc: set rtc-32k to critical
Date: Sun, 24 Apr 2022 13:59:59 +0800
Message-Id: <20220424055959.109286-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

RTC itself is the one and only consumer of rtc-32k clock. As the rtc
should be always running, set rtc-32k clock to critical, to prevent it
from being gated by the kernel.

Fixes: d91612d7f01a ("clk: sunxi-ng: Add support for the sun6i RTC clocks")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 8a10bade7e0d..3d9c9ce5a3db 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -241,6 +241,7 @@ static struct clk_init_data rtc_32k_init_data = {
 	.ops		= &ccu_mux_ops,
 	.parent_hws	= rtc_32k_parents,
 	.num_parents	= ARRAY_SIZE(rtc_32k_parents), /* updated during probe */
+	.flags		= CLK_IS_CRITICAL,
 };
 
 static struct ccu_mux rtc_32k_clk = {
-- 
2.35.1

