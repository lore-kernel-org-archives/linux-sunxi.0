Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34023BF
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 09:17:10 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id CA9521BF20A;
	Thu, 27 Apr 2023 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1682587029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXbaBNxkiTTV4hInjji5NkCrdDSarnLLhwu9cO3OfTc=;
	b=dQ4NDlSI58cJBb7iv0QJQowSzJODauNypp2m+QipibmpGjXssSEAgumLdAxs/1KE/x+dyW
	iZQki3PXi9o87QJvuzqpiZr+gCbfZUC7VaVLjLPDf78HsWOwgcIwc3cgr/vBCoyFaYKpC/
	a/RxZyyxDw8hNDyTvDrhMbfBWRoPBz4KRklb/EVp7vJBSA/wiyQT9LDhyDctFFLv8Sv4I8
	a8xlWsQY8Y691V4qkX9dXYKccZUpOGcdDFM5/DYylarPGuEl/t5Vs4wIM1v8mmXwVrsX1e
	bAKFe20aDWyhi/eHbtziQRQ1EYAGc/mbPCy6qCEdMD4hBMfM7oK2D77UtOQycw==
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
Subject: [PATCH v3 7/7] drm: sun4i: calculate proper DCLK rate for DSI
Date: Thu, 27 Apr 2023 11:16:11 +0200
Message-Id: <20230427091611.99044-8-me@crly.cz>
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

In DSI mode, TCON0's data clock is required to run at 1/4 the per-lane
bit rate.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index eec26b1faa4b..b263de7a8237 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -291,18 +291,6 @@ static int sun4i_tcon_get_clk_delay(const struct drm_display_mode *mode,
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
@@ -367,10 +355,18 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	u32 block_space, start_delay;
 	u32 tcon_div;
 
+	/*
+	 * dclk is required to run at 1/4 the DSI per-lane bit rate.
+	 */
 	tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
 	tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000 * (bpp / lanes)
+						  / SUN6I_DSI_TCON_DIV);
 
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
@@ -438,7 +434,12 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 
 	tcon->dclk_min_div = 7;
 	tcon->dclk_max_div = 7;
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
+
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
@@ -515,7 +516,12 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 
 	tcon->dclk_min_div = tcon->quirks->dclk_min_div;
 	tcon->dclk_max_div = 127;
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
+
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, connector);
-- 
2.34.1

