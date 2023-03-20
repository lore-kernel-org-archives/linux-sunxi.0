Received: from pv50p00im-zteg10011401.me.com (pv50p00im-zteg10011401.me.com [17.58.6.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEB1FBF
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1679329003;
	bh=rh8fsgpj4qufqjt6unxdAU5GmU9fIG/olnJE9qASDBQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=MDjCnw68RSNePlpqFapchG/U5MgcpzRqhTGSQgLtZAVKhYLqwcQAc8908czQAXHDw
	 lTf/YWxugghqN+6MmUYdx/K23kYogtRwE7vssWLX0uNwvkVcnY+eLDQj0pIL8v4qKV
	 bTvfrqa+h5Gwz/lVMBxUaxxUTJqISHVVrcN1HxkvjAdG6iwKxf/LkMmXIu/OmS7kNJ
	 OPnm4llj4lhMrnoQe3ZtTd9PahxmBIwWR9BbY21el79aQO3Rhu0nz43uJwcqd1LzWn
	 2TTxlhckc2AIaAc6wm8zFKitvt9STyIbn7DUnXWpJ53V65YSBNqZvmu0yJe28+tj43
	 ha5Ww6kjJSxew==
Received: from localhost.localdomain (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id CA69BDC08E1;
	Mon, 20 Mar 2023 16:16:39 +0000 (UTC)
From: Roman Beranek <romanberanek@icloud.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: uncouple DSI dotclock divider from TCON0_DCLK_REG
Date: Mon, 20 Mar 2023 17:16:36 +0100
Message-Id: <20230320161636.24411-1-romanberanek@icloud.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kdl0OAMlASNejuphoXbv8xBp_Es7-AqJ
X-Proofpoint-GUID: kdl0OAMlASNejuphoXbv8xBp_Es7-AqJ
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303200138

In the case of DSI output, the value of SUN4I_TCON0_DCLK_DIV (4) does
not represent the actual dotclock divider, PLL_MIPI instead runs at
(bpp / lanes )-multiple [1] of the dotclock. [2] Setting 4 as dotclock
divder thus leads to reduced frame rate, specifically by 1/3 on 4-lane
panels, and by 2/3 on 2-lane panels respectively.

As sun4i_dotclock driver stores its calculated divider directly in
the register, conditional handling of the DSI output scenario is needed.
Instead of reading the divider from SUN4I_TCON0_DCLK_REG, retrieve
the value from tcon->dclk_min_div.

[1] bits per pixel / number of DSI lanes
[2] https://github.com/BPI-SINOVOIP/BPI-M64-bsp-4.4/blob/66bef0f2f30b367eb93b1cbad21ce85e0361f7ae/linux-sunxi/drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L322

Signed-off-by: Roman Beranek <romanberanek@icloud.com>
---
 drivers/gpu/drm/sun4i/sun4i_dotclock.c | 6 +++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 5 +++--
 drivers/gpu/drm/sun4i/sun4i_tcon.h     | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
index 417ade3d2565..26fa99aff590 100644
--- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
+++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
@@ -11,6 +11,7 @@
 
 #include "sun4i_tcon.h"
 #include "sun4i_dotclock.h"
+#include "sun6i_mipi_dsi.h"
 
 struct sun4i_dclk {
 	struct clk_hw		hw;
@@ -56,6 +57,9 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	u32 val;
 
+	if (dclk->tcon->is_dsi)
+		return parent_rate / dclk->tcon->dclk_min_div;
+
 	regmap_read(dclk->regmap, SUN4I_TCON0_DCLK_REG, &val);
 
 	val >>= SUN4I_TCON0_DCLK_DIV_SHIFT;
@@ -116,7 +120,7 @@ static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long parent_rate)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
-	u8 div = parent_rate / rate;
+	u8 div = dclk->tcon->is_dsi ? SUN6I_DSI_TCON_DIV : parent_rate / rate;
 
 	return regmap_update_bits(dclk->regmap, SUN4I_TCON0_DCLK_REG,
 				  GENMASK(6, 0), div);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 523a6d787921..7f5d3c135058 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -367,8 +367,9 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	u32 block_space, start_delay;
 	u32 tcon_div;
 
-	tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
-	tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
+	tcon->is_dsi = true;
+	tcon->dclk_min_div = bpp / lanes;
+	tcon->dclk_max_div = bpp / lanes;
 
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a..d8150ba2f319 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -271,6 +271,7 @@ struct sun4i_tcon {
 	struct clk			*dclk;
 	u8				dclk_max_div;
 	u8				dclk_min_div;
+	bool				is_dsi;
 
 	/* Reset control */
 	struct reset_control		*lcd_rst;
-- 
2.32.0 (Apple Git-132)

