Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42191856
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 16:15:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PfjSM1Lf7z9sct;
	Sun, 19 Mar 2023 17:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1679242051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNjDvtMea1CQUVb5Rt+9MnBA3rnXcLU9MK13p0qx2Do=;
	b=Jup3N7ihTwLbPIkezF6FLR3PI5Yoz0u7MQ2Q8OHGbUcIYQ0lOtukuNVlufoA5v6Wf4TWEy
	1KAg3g7bQAHd3AsX3JaYMazu5eWjldWCJXQ4F07QAMKJ0QSw+jJ5zlwIBLdXs4e673zVEg
	VOeCxf6RJHFlvypvKdinjYzHGe8mIpINOB3PQWgzGM9D/kUlkGQT3f/UL6f6EjEh4axAtd
	FBaHflhpEa58acTzdDM1hVR2VbyD4TM0tOSHfMgClffdbY6dtwhipDebjm8yD49p0qu0+e
	2K/Zlrs64VSjolK2CngqgExO5NjQ1l/rETP6iE3nxUW3ezg+neK3FjgMWqiZWQ==
From: Frank Oltmanns <frank@oltmanns.dev>
To: jagan@amarulasolutions.com,
	michael@amarulasolutions.com,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Frank Oltmanns <frank@oltmanns.dev>
Subject: [PATCH 1/1] drm/sun4i: tcon: Fix setting PLL rate when using DSI
Date: Sun, 19 Mar 2023 17:07:04 +0100
Message-Id: <20230319160704.9858-2-frank@oltmanns.dev>
In-Reply-To: <20230319160704.9858-1-frank@oltmanns.dev>
References: <20230319160704.9858-1-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the required PLL rate by adjusting the dotclock rate when calling
clk_set_rate() when using DSI.

According to the Allwinners A64's BSP code, a TCON divider of 4 has to
be used and the PLL rate needs to be set to the following frequency when
using DSI:
    PLL rate = DCLK * bpp / lanes

After this change the common mode set function would only contain
setting the resolution. Therefore, dissolve the function and transfer
the functionality to the individual mode set functions.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 46 ++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 62b3538bd81f..02d52be42f06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -323,18 +323,6 @@ static int sun4i_tcon_get_clk_delay(const struct drm_display_mode *mode,
 	return delay;
 }
 
-static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
-					const struct drm_display_mode *mode)
-{
-	/* Configure the dot clock */
-	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
-
-	/* Set the resolution */
-	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
-		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
-		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
-}
-
 static void sun4i_tcon0_mode_set_dithering(struct sun4i_tcon *tcon,
 					   const struct drm_connector *connector)
 {
@@ -399,10 +387,24 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	u32 block_space, start_delay;
 	u32 tcon_div;
 
+	/*
+	 * Configure the dot clock:
+	 * For DSI the PLL rate has to respect the bits per pixel and
+	 * number of lanes.
+	 *
+	 * According to the BSP code:
+	 * TCON divider = 4
+	 * PLL rate = DCLK * bpp / lanes
+	 */
 	tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
 	tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000
+				 * bpp / (lanes * SUN6I_DSI_TCON_DIV));
 
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
@@ -470,7 +472,14 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 
 	tcon->dclk_min_div = 7;
 	tcon->dclk_max_div = 7;
-	sun4i_tcon0_mode_set_common(tcon, mode);
+
+	/* Configure the dot clock */
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
+
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
@@ -549,7 +558,14 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 
 	tcon->dclk_min_div = tcon->quirks->dclk_min_div;
 	tcon->dclk_max_div = 127;
-	sun4i_tcon0_mode_set_common(tcon, mode);
+
+	/* Configure the dot clock */
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
+
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, connector);
-- 
2.39.2

